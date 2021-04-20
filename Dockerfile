FROM node:15.14.0-alpine3.10

RUN mkdir -p /root/.node-red
WORKDIR /root/.node-red
 
# download latest stable node-red
RUN npm install -g --save node-red
RUN npm install -g --save node-red-dashboard 

# use external storage for the user directory
VOLUME /root/.node-red

# expose port
EXPOSE 1880
 
# Set the default command to execute
# when creating a new container
CMD ["node-red","--max-old-space-size=512","flow.json"]
# flow.json is now created in /root/.node-red/flow.json


# docker build --rm=true --tag=node-red .
# docker run -it -p 1880:1880 --name mynodered node-red 
# docker run -it -p 1880:1880 -v ~/data:/root/.node-red --name mynodered node-red