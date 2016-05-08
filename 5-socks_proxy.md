假设您有一个远端服务器可以通过ssh登录，在你的本地电脑上实现一个简单的socks代理服务，可以在断网或重起的情况下重新建立连接。（提示：ssh tunnel）
答：
  sshtunnel.sh 判断是否连接vpn，若没有连接，则会调用 ssh1.exp 连接vpn

