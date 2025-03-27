FROM node:16-alpine AS build
WORKDIR /app
COPY package.json yarn.lock .
RUN npm install
COPY . .
RUN yarn build


FROM nginx:alpine
WORKDIR /usr/share/nginx/html

RUN rm -rf ./*


COPY --from=build /app/build .

EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]]