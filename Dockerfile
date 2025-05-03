# Use official Node.js image
FROM node:14-alpine

# Create app directory
WORKDIR /usr/src/app

# Copy package files
COPY package*.json ./

# Install dependencies
RUN npm install

# Bundle app source
COPY . .

# Run tests
RUN npm test

# Expose port
EXPOSE 8080

# Start command
CMD ["npm", "start"]
