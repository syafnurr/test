# Menggunakan image Node.js sebagai base image
FROM node:20 AS build-stage

# Menetapkan working directory dalam container
WORKDIR /app

# Menyalin file package.json dan package-lock.json untuk menginstal dependensi
COPY package*.json ./

# Menginstal dependensi aplikasi
RUN npm install

# Menyalin seluruh file aplikasi ke dalam container
COPY . .

# Membangun aplikasi Vue.js untuk produksi
RUN npm run build

# Menggunakan image Nginx untuk melayani aplikasi Vue.js
FROM nginx:alpine

# Menyalin hasil build ke dalam direktori default Nginx
COPY --from=build-stage /app/dist /usr/share/nginx/html

# Mengekspos port 80 untuk akses web
EXPOSE 80

# Menjalankan Nginx di container
CMD ["nginx", "-g", "daemon off;"]