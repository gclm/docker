docker run -di --name openresty \
    -p 20000:80 \
    -v /Users/gclm/Service/Docker/openresty/test/conf:/etc/nginx/conf.d/ \
    -v /Users/gclm/Service/Docker/openresty/test/web:/tmp/web/ \
    openresty:1.21.4.1