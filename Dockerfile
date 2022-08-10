# build environment
FROM node:12.22.11-alpine as build
WORKDIR /app
ENV PATH /app/node_modules/.bin:$PATH
COPY package.json ./
#RUN npm install --silent
#RUN npm install react-scripts@3.4.1 -g --silent
COPY . ./
#RUN npm run build
RUN yarn install
RUN yarn build
EXPOSE 3000
CMD ["yarn", "start"]
