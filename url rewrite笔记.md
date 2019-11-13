# url rewrite

### frp转发域名

- match: ftp\.gantongpinggu\.com(?!:)
- redirect: {HTTP_HOST}:7000{REQUEST_URI}
- server配置：
    ``` bash
    [common]
    bind_addr = 0.0.0.0
    bind_port = 7000
    kcp_bind_port = 7000
    vhost_http_port = 80
    vhost_https_port = 443
    dashboard_addr = 0.0.0.0
    dashboard_port = 7500
    dashboard_user = admin
    dashboard_pwd = admin(your pwd)
    authentication_timeout = 0
    subdomain_host = frp.thyiad.top(your sub host)
    token = token
    ```
- client配置：
    ``` bash
    [common]
    server_addr = your ip
    server_port = 7000
    log_file = ./frpc.log
    token = token

    [web01]
    type = http
    local_port = 5000
    subdomain = test
    use_compression = true
    ```