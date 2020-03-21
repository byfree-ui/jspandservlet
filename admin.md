## 项目名称
> 后台管理系统
## 项目需求
> 1. 实现用户登陆  
> 2. 实现用户退出  
> 3. 实现用户注册  
## 功能分析
> 1. 用户登陆：
> > 根据用户名和密码查询用户信息。查到登陆成功，查不到则登陆失败。
> 2. 用户退出：
> > 销毁session
> 3. 用户注册
> > 将用户注册信息插入数据库
## 数据库设计
> ### 用户表：   t_user
> 1. 用户id uid
> 2. 用户名 uname
> 3. 用户密码 pwd  
> 4. 用户性别 sex
> 5. 用户年龄 age
> 6. 出生日期 birthday
> ### SQL语句设计
> 用户登陆：
> select * from t_user where uname= ? and pwd = ?
> 用户注册：
> insert into t_user values(default,?,?,?,?,?)
## 代码实现
> 参照源码