/**
 * dart 中一个类实现多个接口：
 */
void main(List<String> args) {
  // D dData = new D('asdfas');
  // print(dData.name);
}

abstract class A {
  late String name;
  printA();
}

abstract class B {
  printB();
}

class C implements A, B {
  @override
  late String name;

  @override
  printA() {
    // TODO: implement printA
    throw UnimplementedError();
  }

  @override
  printB() {
    // TODO: implement printB
    throw UnimplementedError();
  }
}

// class D extends A {
//   String name;

//   D(this.name);
//   @override
//   printA() {
//     // TODO: implement printA
//     throw UnimplementedError();
//   }
// }
