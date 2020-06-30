#Specfiy a base Image
from node:alpine as builder
workdir '/app'
# install some dependencies
copy package.json .
run npm install
copy . .

#Default Command
cmd npm run build

#2nd Step or Container
From nginx
copy --from=builder /app/build /usr/share/nginx/html
# in nginx documnetation it says that html is placed in above directory
# we can ignore "cmd" option as default command for nginx is run nginx
