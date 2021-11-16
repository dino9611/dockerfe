# build environment 
# build ini jika ingin reactnya dibuild di dalam docker container
FROM node:13.12.0-alpine as build 
WORKDIR /app

COPY package.json ./
COPY package-lock.json ./
RUN npm ci --silent
RUN npm install react-scripts@4.0.3 -g --silent
COPY . ./
RUN npm run build

# production environment
FROM nginx
COPY --from=build  /app/build /usr/share/nginx/html
COPY nginx.conf /etc/nginx/conf.d/default.conf
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]