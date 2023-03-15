/**
 * 和Jave一样，dart也有接口，但是和Jave还是有区别的
 * 
 *  1、首先，dart的接口没有interface关键字定义接口，而是普通类或抽象类都可以作为接口被实现，
 *     同样使用implements关键字进行实现。
 * 
 *  2、但是dart的接口有点奇怪，如果实现的类是普通类，会将普通类和抽象中的属性的方法全部需要复写一遍。
 * 
 *  3、而因为抽象类可以定义抽象方法，普通类不可以，所以一般如果要实现像Java接口那模样的方式，一般会使用抽象类。
 * 
 *  4、建议使用抽象类定义接口。
 * 
 */

// 定义一个DB库 支持 mysql  mssql  mongodb 三个类里面都有同样的方法

void main(List<String> args) {
  Mysql impMySql = new Mysql('xxxxx');
  impMySql.add('data');
}

// 这是接口
abstract class Db {
  late String uri; // 数据库的链接地址
  // 当做接口用 接口：就是约定，规范
  add(String data);
  save();
  delete();
}

// 这是实现的类
class Mysql implements Db {
  @override
  String uri;

  Mysql(this.uri);

  @override
  add(data) {
    // TODO: implement add
    print('这是mysql的add方法${data}');
  }

  @override
  delete() {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  save() {
    // TODO: implement save
    throw UnimplementedError();
  }
}
