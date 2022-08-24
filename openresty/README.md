# Openresty

## 编译指令

```shell
docker build . -t gclmit/openresty:1.21.4.1
docker build . -t gclmit/openresty:latest
docker push gclmit/openresty:latest
docker push gclmit/openresty:1.21.4.1
```

## 测试指令

```shell
docker run -di --name openresty \
    -p 20000:80 \
    -v /Users/gclm/Service/Docker/openresty/test/conf:/etc/nginx/conf.d/ \
    -v /Users/gclm/Service/Docker/openresty/test/web:/tmp/web/ \
    gclmit/openresty:latest
```