void main() {
  int a = 13;
  int b = 5;

  // 算数运算符
  // print(a + b);
  // print(a - b);
  // print(a * b);
  // print(a / b);
  // print(a % b); //取余
  // print(a ~/ b); // 取整

  // 关系运算符
  print(a == b);
  print(a != b);
  print(a > b);
  print(a < b);
  print(a >= b);
  print(!(a <= b));

  // &&
  var c = true;
  var d = false;
  print(c && d);
  print('------');
  print(c || d);

  // = ??=如果为空便赋值
  int e = 10;
  // e ??= 23;
  print(e);

  // 复合赋值运算符 += -= *= /= %= ~/=

  // 条件运算符 if else  switch  case
  // 三元运算符
  // ?? 运算符
  var text;
  var text22 = text ?? 1888;
  print(text22);

  // 用try块拦截错误
  String price = '';
  try {
    var myNum = double.parse(price);
    print(myNum);
  } catch (err) {
    print(err);
  }

  // a++  a--
  var anumber = 10;
  var cnumber = anumber++;
  var bnumber = ++anumber;

  print(anumber);
  print(bnumber);
  print(cnumber);
}
