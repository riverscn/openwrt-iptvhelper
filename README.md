# openwrt-iptvhelper

使用前必读：[单线融合IPTV到家庭局域网最简单的方法：路由+桥接混合模式](https://blog.lishun.me/iptvhelper-guide)

这个项目的目标是通过 openwrt 方便地设置家庭网络的IPTV。

可以实现桥接Internet的情况下，融合IPTV组播和应用数据到家庭局域网中，最终效果和光猫路由模式一致。

目前是根据北京联通的情况进行开发的。

目前的主要功能是：

* 通过侦听机顶盒的连接请求，生成 ipset，以便进行策略路由
* 劫持机顶盒的DNS请求

项目中用到的方法是受[这个帖子](http://www.jinghuasoft.com/smthview.jsp?board=DigiHome&id=583709)的启发，并进行了改良。通过iptables增加ipset匹配，减少日志输出。原帖的方法也有些过时了。

# TODO

* 欢迎提供你所在地区的IPTV的情况，考虑给本项目增加更多功能。
* 写wiki收集各地IPTV的用法。