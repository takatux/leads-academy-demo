FROM node:12.22.11-alpine as build-react

# set working directory
WORKDIR /app

# add `/app/node_modules/.bin` to $PATH
ENV PATH /app/node_modules/.bin:$PATH
COPY package.json ./

# install app dependencies
COPY . .
RUN yarn install
RUN yarn build


#STAGE nginx

FROM nginx:1.21.5-alpine
COPY --from=build-react /app/build /usr/share/nginx/html
RUN rm /etc/nginx/conf.d/default.conf
COPY nginx.conf /etc/nginx/conf.d
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]

