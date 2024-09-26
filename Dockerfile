# Step 1: Build the React application
FROM node:18-alpine AS build

# Set the working directory inside the container
WORKDIR /app

# Copy package.json and package-lock.json
COPY package*.json ./

# Install the dependencies
RUN npm install --legacy-peer-deps

# Copy the entire application into the container
COPY . .

# Build the React application for production
RUN npm run build

# Step 2: Serve the React app with NGINX
FROM nginx:stable-alpine

WORKDIR /usr/share/nginx/html
RUN rm -rf ./*
# Copy the built React files from the previous build stage
COPY --from=build /app/build .

# Copy a custom NGINX configuration file - optional
#COPY nginx.conf /etc/nginx/nginx.conf

# Expose port 80 to access the app
EXPOSE 80

# Start NGINX
CMD ["nginx", "-g", "daemon off;"]
