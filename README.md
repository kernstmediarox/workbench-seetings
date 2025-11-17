#### TODO after clone

* mkdir /home/data/www
* sudo nano /etc/nginx.conf
  
    user kernst kernst;
    worker_processes  1;
    events { 
        worker_connections  1024;
    }
    http {
        include       mime.types;
        default_type  application/octet-stream;
        sendfile        on;
        keepalive_timeout  65;
        server {
            listen       80;
            server_name  localhost;

            location / {
                root   /home/data/www;
                index  index.html index.htm;
            }

            error_page   500 502 503 504  /50x.html;
            location = /50x.html {
                root   /usr/share/nginx/html;
            }
        }
        include nginx-config/*.conf;
    }

* openssl > sudo ln -s /home/settings/etc/ssl/private /etc/ssl/private

