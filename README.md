
## 说明

根据网友的代码基础上去掉了重复的短连接，以及增加了短连接长度自由调节等功能

#### 配置 `nginx.conf`

```shell
http {
    ...
    ...

    server {
        listen 80;
        server_name  shrot.yufei.com; 
        location / {
            lua_socket_keepalive_timeout 30s;
            content_by_lua_file /data/html/file_lua/short/index.lua;
        }

        location /short {
            lua_socket_keepalive_timeout 30s;
            content_by_lua_file /data/html/file_lua/short/shorten.lua;
        }
    }

}
```

#### 效果

* 请求创建短连接:

```
curl -s -v "http://short.yufei.com/short?url=http://www.10000.com/1/1/1"
```

* 输出

```
{"status":1,"shorturl":"http://short.yufei.com/00KvZ"}
```

* 如果对你有帮助, 或有有问题请联系我吧 :)
```
1600364422
```


