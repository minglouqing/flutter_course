class Person {
  late String name;
  late int age;

  // 静态属性或者静态方法
  static String work = 'work';
  static void show() {
    print(work);
  }
  /** 1、非静态方法可以访问静态成员以及非静态成员
   *  2、静态方法无法访问非静态成员
   */
  /** dart 中的对象操作符
   *    ?: 条件运算符
   *        Person p;
   *        p?.getInfo();
   *    as: 类型转换
   *    is: 类型判断
   *    ..: 级联操作（连缀）
   *        var p = new Person();
   *        p..name = "李四"
   *         ..age = 30
   *         ..getInfo();
   */

  // 默认构造函数
  // Person()
  //     : name = 'sdafsdf',
  //       age = 20 {
  //   print('实例化时触发');
  // }
  Person(this.name, this.age) {
    print('实例化时触发');
  }
  // 命名构造函数
  Person.now(String name, int age) {
    this.name = name;
    this.age = age;
    print('命名构造函数');
  }

  void getInfo() {
    print("${this.name} ---- ${this.age}");
  }

  void setInfo(int newAge) {
    this.age = newAge;
  }

  get changeInfo {
    return this.name;
  }
}

class Web extends Person {
  Web(String name, int age) : super(name, age) {}

  @override
  void getInfo() {
    // ignore: todo
    // TODO: implement getInfo
    super.getInfo();
  }
}

void main() {
  print('函数');
  List list1 = [1, 2, 3, 5, 6, 5];

  list1.map((element) {
    print(element);
    return element * 2;
  });
  print("类");

  // Person.show();
  // Person p1 = new Person();
  // p1.getInfo();
}
