/**
 * 通俗理解：泛型就是解决 类 接口 方法的复用性，以及对不特定数据类型的支持(类型校验)
 * 
 */
void main() {
  T getDate<T>(T value) {
    return value;
  }

  getDate<String>('sdafsad');
  // 类泛型
  MyList list1 = new MyList<String>();
  list1.add('张三');
  // list1.add(134);
  print(list1.getList());

  // 接口实现泛型
  FlieCache flie = new FlieCache<String>();
  flie.setByKey('key', 'sdfas');
}

class MyList<T> {
  List<T> list = [];
  void add(T value) {
    this.list.add(value);
  }

  List getList() {
    return this.list;
  }
}

// 定义接口
abstract class Cache<T> {
  getByKey(String key);
  void setByKey(String key, T value);
}

// 实现接口
class FlieCache<T> implements Cache<T> {
  @override
  getByKey(String key) {
    return null;
  }

  @override
  void setByKey(String key, T value) {
    print('setByKey key=${key} value=${value}');
  }
}
