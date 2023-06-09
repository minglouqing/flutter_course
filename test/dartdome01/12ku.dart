/**
 * 在Dart中，库的使用是通过import关键字引入的。
 * 
 * library指令可以创建一个库，每个Dart文件都是一个库，即使没有使用library指令来指定。
 * 
 * 
 * Dart中的库主要有三种：
 *  1、我们自定义的库
 *      import 'lib/xxx.dart';
 *  2、系统内置库
 *      import 'dart:math';
 *      import 'dart:io';
 *      import 'dart:convert';
 *  3、Pub包管理系统中的库
 *      https://pub.dev/packages
 *      https://pub.flutter-io.cn/packages
 *      https://pub.dartlang.org/flutter/
 *      1、需要自己在项目根目录新建一个pubspec.yaml
 *      2、在pubspec.yaml文件 然后配置名称、描述、依赖等信息
 *      3、然后运行 pub get 获取包下载到本地
 *      4、项目中引入库 import 'package:http/http.dart' as http;
 */

/**
 * 当引入两个库中有相同名称标识符的时候
 *    import 'package:lib1/lib1.dart';
 *    import 'package:lib2/lib2.dart' as lib2;
 *    
 *    Element element1 = new Element();// uses Element from lib1.
 *    lib2.Element element2 = new lib2.Element(); // uses element from lib2.
 */

/**
 * 如果只需要导入库的一部分，有两种模式：
 *  模式一：只导入需要的部分，使用show关键字，如下例子所示：
 *      import 'package:lib1/lib1.dart' show foo;
 *  模式二：隐藏不需要的部分，使用hide关键字，如下例子所示：
 *      import 'package:lib2/lib2.dart' hide fool1
 * 
 */

/**
 * 延迟加载
 *  也称为懒加载，可以在需要的时候再进行加载。
 *  懒加载的最大好处是可以减少APP的启动时间。
 *  
 *  懒加载使用deferred as 关键字来指定，如下例子所示：
 *  import 'package:deferred/hello.dart' deferred as hello;
 *  当需要使用的时候，需要使用loadLibrary()方法来加载：
 *  
 *  greet() async {
 *    await hello.loadLibrary();
 *    hello.printGreeting();
 *  }
 */

void main() {
  // convert.utf8.decode();
}
