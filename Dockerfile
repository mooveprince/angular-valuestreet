FROM node:12.2.0 as builder
WORKDIR '/app'
COPY ./package.json ./
RUN npm install
RUN npm install -g @angular/cli
RUN ng update --all --force
COPY . .
RUN ng build

FROM nginx
EXPOSE 80
COPY --from=builder /app/dist /usr/share/nginx/html