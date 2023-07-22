# Use the official Node.js image
FROM node:16-slim

# Set the working directory inside the container
WORKDIR /starter

# Copy package.json and package-lock.json
COPY package*.json ./

# Install pm2 globally
RUN npm install pm2 -g

# Install the project dependencies (including development dependencies)
RUN npm install

# Copy the rest of the application files
COPY . .

# Expose the port that your application listens on (if necessary)
# EXPOSE 3000

# Start your application using pm2
CMD ["pm2-runtime", "app.js"]

EXPOSE 8080
