问题：运维操作在很多情况下需要访问不同的服务器，运维人员可能会频繁的输入自己的账号和密码。
是否可以通过一个简单方式只需要输入一遍密码，然后余下的操作都可以不再重复的输入密码。
密码应该存储在什么地方会比较隐蔽，让有这台机器sudo权限的其他人看不到。
答：配置ssh互信，将客户端机器的ssh public key添加到服务器的~/.ssh/authorized_keys 文件中，可实现ssh的免密码登录。
   ssh-copy-id -i .ssh/id_rsa.pub remote_ip:~
   密码文件一般使用系统默认的位置即可，尽量不要改动。要想让具有sudo权限的用户看不到，需要在/etc/sudoers限制sudo权限，不要使用ALL

