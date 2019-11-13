# url rewrite

### frp转发域名

- match: .*
- redirect: {HTTP_HOST}:7000{REQUEST_URI}
- 有点坑爹，必须要新建一个空站点供反向代理用，否则重写规则不会生效的
    > 所以 match 变成了 .* ，否则应该是：ftp\.gantongpinggu\.com(?!:)
    > 详见：[IIS论坛](https://forums.iis.net/t/1234125.aspx?Arr+reverse+proxy+does+not+work+at+server+level)
    > ARR is an IIS out of band module. Being a module requires a worker process which requires at least one web site. In any scenario, if you delete your only site, you will lose your ARR reverse proxy.
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