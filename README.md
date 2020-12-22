# ares-design

JavaEE Course Design using Spring Boot

## 各工具版本

java1.8
springboot 2.4.1
maven 3.6.3



## 关键词

Springboot
Spring MVC
MyBatis
Freemaker
RESTful风格

## 选择各工具的理由

JSP性能太致命了，前后端分离基本都不用他了。JSP动态资源和静态资源全部耦合在一起，服务器压力大，因为服务器会收到各种http请求，例如css的http请求，js的，图片的等等。一旦服务器出现状况，前后台一起玩完，用户体验极差。jsp必须要在支持java的web服务器里运行（例如tomcat，jetty，resin等），无法使用nginx等（nginx据说单实例http并发高达5w，这个优势要用上），性能提不上来