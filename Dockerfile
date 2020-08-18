FROM node:alpine as builder

WORKDIR '/app'

COPY '/app/package.json' .

RUN npm install

COPY './app' .

CMD npm run build

FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html