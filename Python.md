### Scrapy
```
## 获取所有元素
tables = response.xpath("//div[@class = 'qbck']/div[@id = 'trm_data']/div[@id = 'newcar']/table[@class = 'b jsq' and @cellspacing = '0' and @cellpadding = '0' and @border = '0']")
### 获取子元素
t_head = table_selector.xpath("thead/tr/th[@class = 'l2']/text()").get()

```
###Flask-Mail
 配置如下
 
```
	MAIL_SERVER = 'smtp.163.com'
	MAIL_PORT = 465 # 默认开启ssl，端口配置为465
	MAIL_USE_TLS = False
	MAIL_USE_SSL = True
	MAIL_USERNAME = 'lieoncx@163.com'
	MAIL_PASSWORD = 'auth1992316'
	FLASKY_MAIL_SUBJECT_PREFIX = '[Lieon]'
	FLASKY_MAIL_SENDER = 'lieoncx@163.com'
	
def send_async_email(app, msg):
    with app.app_context():
        mail.send(msg)


def send_email(to, subject, template, **kwargs):
    app = current_app._get_current_object()
    msg = Message(str(app.config['FLASKY_MAIL_SUBJECT_PREFIX']) + ' ' + subject, 
                  sender=app.config['FLASKY_MAIL_SENDER'], 
                  recipients=[to])
    template = render_template(template + '.html', **kwargs)
    msg.html = template
    thr = Thread(target=send_async_email, args=[app, msg])
    thr.start()
    return thr

```
### websocket
####WS与HTTP协议
#####相同点
- 都是基于TCP的应用层协议
- 都使用request、response模型进行连接的建立
- 在连接的建立过程中对错误的处理方式相同，在这个阶段可能返回和HTTP相同的返回码

#####不同点
- WS使用HTTP建立连接，定义了一系列新的header域
- WS的链接不能通过中间人来转发，它必须是一个直连接
- WS建立连接之后，是一个全双工通信的方式
- WS建立连接之后，数据的传输使用帧来传递，不需要Request消息

#### 握手协议
ws的握手采用的是HTTP，主要通过Update request HTTP包来建立起连接，之后采用websocket自己协议
请求： TCP连接建立之后，客户端发送websocket的握手请求，请求报文如下:

```
GET /chat HTTP/1.1
HOST: server.example.com
**Upgrade: websocket **
Connection: Upgrade
Sec-WebSocket-Key: dGhlIHNhbXBsZSBub25jZQ== # 记录握手过程中不可少的键值
Origin: https://example.com # 起安全使用，防止跨站攻击
Sec-WebSocket-Protocol: chat, superchat
Sec-WebSocket-Version: 13

```
响应：服务器接受到请求后，返回状态码101 Switching Protocols的响应

```
HTTP/1.1 101 Switching Protocols
Upgrade: websocket
Connection: Upgrade
Sec-WebSocket-Accept: s3pPLMBiTxaQ9kYGzzhZRbK+xOo=
Sec-WebSocket-Protocol: chat

```