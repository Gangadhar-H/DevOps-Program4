# Build stage
FROM node:20 AS build

# set working directory
WORKDIR /app

# copy package and package-lock.json
COPY package*.json .

# Install packages
RUN npm install 

# copy other files
COPY . .

FROM node:20
WORKDIR /app
# copy from builder 
COPY --from=build /app /app 
# Expose port
EXPOSE 3000

# start the app
CMD ["node", "index.js"]
