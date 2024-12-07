# Step 1: Use a lightweight Node.js base image
FROM node:18-alpine AS build

# Step 2: Set the working directory inside the container
WORKDIR /app

# Step 3: Copy package.json and package-lock.json to the working directory
COPY package.json package-lock.json ./

# Step 4: Install dependencies
RUN npm install

# Step 5: Copy the rest of the application code
COPY . .

# Step 6: Build the application
RUN npm run build
# # Step 7: Use a lightweight web server to serve the static files
FROM nginx:stable-alpine

# # Step 8: Copy the built files to the nginx server's default directory
COPY --from=build /app/dist /usr/share/nginx/html

# Step 9: Configure Nginx to listen on the dynamic PORT environment variable
# Replace the default Nginx configuration
COPY ./nginx.conf /etc/nginx/conf.d/default.conf

# Step 10: Expose the default port used by Cloud Run
EXPOSE 8080

# Step 11: Start nginx
CMD ["nginx", "-g", "daemon off;"]
