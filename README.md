### 需要的环境
```
rails -v
Rails 4.2.8
```

```
ruby -v
ruby 2.6.9p207 (2021-11-24 revision 67954) [x86_64-linux]
```
postgres 9.5.25


### 启动

创建数据库
```
bundle exec rake db:create
```

创建表
```
bundle exec rake db:migrate
```

启动server，默认启动在3000端口
```
bundle exec rails server
```

登录:
用户名： admin
密码: my_password_admin
