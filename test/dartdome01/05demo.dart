void main() {
  List list1 = ['sdfa', 344, 'sf'];
  List list2 = List.filled(2, null);
  print(list2);

  // set
  // var setdata = new Set();
  // setdata.add('香蕉');
  // setdata.add('苹果');
  // setdata.add('苹果');

  // print(setdata.toList());
  List myList = ['香蕉', '香蕉', '香蕉', '苹果', '苹果'];
  var setData = new Set();
  setData.addAll(myList);
  print(setData);

  // Map映射 对象就是Map
  var person = {'name': "张三", 'age': 20};
  var mapData = new Map();
  mapData["name"] = "李四";

  person.addAll({
    "chang": ['dfa', 23]
  });
  print(person);
}
