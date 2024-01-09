# Build Stage
FROM node:14-alpine AS build
WORKDIR /app
COPY . /app/
RUN npm install
RUN npm run build

# Runtime Stage
FROM node:14-alpine
WORKDIR /app
COPY --from=build /app/ /app/
EXPOSE 3000
CMD ["npm", "start"]

