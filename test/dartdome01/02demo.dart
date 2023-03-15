void main() {
  // int a = 13.3;
  double b = 25;
  print(b);

  bool flag = true;
  print(flag);

  var list1 = ['lisi', 12, true];
  print(list1.length);
  print(list1[0]);

  List<String> list2 = ['sdfsa', '34'];
  print(list2);
  list2.add('张三');
  print(list2);
  //创建一个固定长度的集合
  // var list3 = List.filled(2, String);
  // print(list3);

  // Map 类似于js的json对象一样
  var person = {
    "name": '张三',
    "age": 23,
  };
  print(person['name']);

  var person2 = new Map();
  person2['age'] = 123;
  print(person2);

  String str = '23445';
  if (str is String) {
    print('111');
  } else if (str is int) {
    print('2222');
  } else if (str is double) {
    print('333');
  } else if (str is List) {
    print('555');
  } else {
    print('6666');
  }
}
