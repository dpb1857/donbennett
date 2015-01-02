
server {
  server_name www.mimidye.com;
  listen 80;
  root /home/web-sites/mimi/mimidye.com/;
  autoindex on;
}
