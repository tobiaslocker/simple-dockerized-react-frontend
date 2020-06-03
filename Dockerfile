# build environment
FROM node:13.12.0-alpine as build
WORKDIR /app
ENV PATH /app/node_modules/.bin:$PATH
COPY package.json ./
COPY package-lock.json ./
RUN npm ci --silent
RUN npm install react-scripts@3.4.1 -g --silent
COPY . ./
RUN npm run build

# production environment
FROM nginx:stable-alpine
COPY --from=build /app/build /usr/share/nginx/html

# nginx configuration
COPY nginx/nginx.conf /etc/nginx/conf.d/default.conf

# certificates
COPY www_decent_sh_chain.crt /etc/ssl/certs/decent.sh.chained.crt
COPY decent.sh.key /etc/ssl/private/decent.sh.key

EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
