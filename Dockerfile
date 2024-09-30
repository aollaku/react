FROM node:16-alpine as builder
WORKDIR /opt/app
COPY package.json ./
RUN npm install
COPY ./ ./
CMD ["npm", "run", "build"]


FROM nginx
# Expose command followed by nr "80" will be used on Elastic Beanstalk container
EXPOSE 80 
COPY --from=builder /opt/app/build /usr/share/nginx/html
