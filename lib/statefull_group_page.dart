import 'package:flutter/material.dart';

//StatefullWidget group page 组件
class StatefulGroupPage extends StatefulWidget {
  const StatefulGroupPage({super.key});

  @override
  State<StatefulGroupPage> createState() => _StatefulGroupPage();
}

class _StatefulGroupPage extends State<StatefulGroupPage> {
  int _currentIndex = 0;

  Future<void> _handleRefresh() async{
    print('下拉');
    await Future.delayed(const Duration(milliseconds: 200));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'StatefulWidget与基础组件',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(title: const Text('StatefulWidget与基础组件'),
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back),
          ),
        ),
        floatingActionButton: FloatingActionButton(onPressed: () {
          print('initio');
        }, child: const Text('点击'),),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home, color: Colors.grey,),
              activeIcon: Icon(Icons.home, color: Colors.blue,),
              label: '首页'
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.list, color: Colors.grey,),
              activeIcon: Icon(Icons.list, color: Colors.blue,),
                label: '列表'
            )
          ],
        ),
        body: _currentIndex == 0 ? RefreshIndicator(onRefresh: _handleRefresh, child: ListView(
          children: [
            Container(
              decoration: const BoxDecoration(color: Colors.white),
              alignment: Alignment.center,
              child: Column(
                children: [
                  Image.network('http://www.devio.org/img/avatar.png', width: 100, height: 100,),
                  const TextField(
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                      hintText: '请输入',
                      hintStyle: TextStyle(fontSize: 15)
                    ),
                  ),
                  Container(
                    height: 100,
                    margin: const EdgeInsets.only(top: 10),
                    decoration: const BoxDecoration(color: Colors.lightBlueAccent),
                    child: PageView(
                      children: [
                        _item('Page1', Colors.deepOrange),
                        _item('Page2', Colors.green),
                        _item('Page3', Colors.red),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        )) : const Text('列表'),
      ),
    );
  }

  Widget _item(String title, Color color) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(color: color),
      child: Text(title, style: const TextStyle(fontSize: 20, color: Colors.white),),
    );
  }
}
