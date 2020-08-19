FROM node:alpine

WORKDIR /app

COPY /app/package.json ./

RUN npm install

COPY ./app ./

RUN npm run build

FROM nginx
EXPOSE 80
COPY --from=0 /app/build /usr/share/nginx/html