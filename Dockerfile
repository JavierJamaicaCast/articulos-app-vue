FROM node:18-alpine

# Establecer el directorio de trabajo
WORKDIR /app

# Copiar archivos del proyecto y instalar dependencias
COPY package*.json ./
RUN npm install

COPY . .

# Construir la aplicación para producción
RUN npm run build

# Instalar un servidor HTTP simple para servir contenido estático
RUN npm install -g http-server

# Exponer el puerto utilizado por el servidor HTTP
EXPOSE 8080

# Ejecutar el servidor HTTP
CMD ["http-server", "dist"]
