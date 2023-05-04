# Base image
FROM node:14-alpine

# Set the working directory to /app
WORKDIR /app

# Copy package.json and package-lock.json to the container
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the application files to the container
COPY . .

# Expose port 80 for the application
EXPOSE 80

# Start the Node.js server
CMD ["node", "server.js"]
