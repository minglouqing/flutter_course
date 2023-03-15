/**
 * mixins的中文意思是混入，就是在类中混入其他功能。
 * 
 * 在dart中可以使用mixins实现类似多继承的功能
 * 
 * 因为mixins使用的条件，随着dart版本一直在变，这里讲的是dart2.x中使用mixins的条件：
 *  1、作为mixins的类只能继承自Object，不能继承其他类
 *  2、作为mixins的类不能有构造函数
 *  3、一个类可以mixins多个mixins类
 *  4、mixins绝不是继承，也不是接口，而是一种全新的特性
 */

void main() {
  C list = new C();
  list.printD();
}

class D {
  void printD() {
    print("d");
  }
}

class A {
  void printA() {
    print('a');
  }
}

class B {
  void printB() {
    print('b');
  }
}

class C extends D with A, B {
  // C(String name) : super(name);
}
