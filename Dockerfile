FROM node:18-alpine

# Set working directory
WORKDIR /app

# Copy package.json and package-lock.json
COPY package*.json ./

# Install dependencies
RUN npm ci --only=production

# Copy the rest of the application code
COPY . .

# Expose the port specified in the k8s service file
EXPOSE 8089

# Command to run the application
CMD ["node", "--experimental-json-modules", "src/index.js"]
