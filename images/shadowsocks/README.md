# Quick Start

> Please make sure docker & docker-compose are ready on your machine.


* Change the VPN password.

> runtime/shadowsocks.json

```
{
    "server":"0.0.0.0",
    "server_port":6187,
    "local_address": "127.0.0.1",
    "local_port":1080,
    "password":"Change_me",
    "timeout":600,
    "method":"aes-256-cfb",
    "fast_open": false,
    "workers": 1
}
```

* Very simple to start the VPN: 

```
docker-compose up -d
```