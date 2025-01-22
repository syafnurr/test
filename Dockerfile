# Gunakan Node.js sebagai base image
FROM node:16-alpine

# Set working directory
WORKDIR /app

# Salin file package.json dan package-lock.json untuk instalasi dependencies
COPY package*.json ./

# Install dependencies
RUN npm install

# Salin semua kode aplikasi
COPY . .

CMD [ "npm", "run", "serve" ]