## ~/.zprofile
```sh
export GOPROXY=socks5://127.0.0.1:7890
export https_proxy=http://127.0.0.1:7890
export http_proxy=http://127.0.0.1:7890
export all_proxy=socks5://127.0.0.1:7890
```

## ~/.gitconfig

```
[http]
  proxy = socks5://127.0.0.1:7890
[https]
  proxy = socks5://127.0.0.1:7890
```

## ~/.cargo/config

```
[http]
proxy = "socks://localhost:7890"
[https]
proxy = "socks://localhost:7890"
```
