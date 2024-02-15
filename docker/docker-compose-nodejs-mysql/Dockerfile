# Use a base image with NodeJS 18
FROM node:18

# Install all the dependencies in the container using the package.json file
COPY package.json .
RUN npm install

# Copy the remaining project files to the container
COPY . .

# Expose the application port
EXPOSE 3000

# Run the App
CMD npm start
