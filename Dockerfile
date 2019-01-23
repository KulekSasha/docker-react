FROM node:alpine AS builder
WORKDIR '/app'
COPY package.json .
RUN npm install --registry http://10.10.82.155:8787/repository/npm-group/
COPY . .
RUN npm run build

FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html
