import 'package:flutter/material.dart';

// Flutter手势教程页面
class GesturePage extends StatefulWidget {
  const GesturePage({Key? key}) : super(key: key);

  @override
  State<GesturePage> createState() => _GesturePageState();
}

class _GesturePageState extends State<GesturePage> {
  String printString = '';
  double moveX=0,moveY=0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('如何检测用户手势以及处理点击事件?'),
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(Icons.arrow_back),
          ),
        ),
        body: FractionallySizedBox(
          widthFactor: 1,
          child: Stack(
            children: [
              Column(
                children: [
                  GestureDetector(
                    onTap: () => _print('点击'),
                    onDoubleTap: () => _print('双击'),
                    onLongPress: () => _print('长按'),
                    onTapCancel: () => _print('取消'),
                    onTapUp: (e) => _print('松开'),
                    onTapDown: (e) => _print('按下'),
                    child: Container(
                      padding: const EdgeInsets.all(60),
                      decoration: const BoxDecoration(color: Colors.blueAccent),
                      child: const Text(
                        '点我',
                        style: TextStyle(fontSize: 36, color: Colors.white),
                      ),
                    ),
                  ),
                  Text(printString)
                ],
              ),
              Positioned(
                // 跟着手指滑动的小球
                left: moveX,
                top: moveY,
                child: GestureDetector(
                  onPanUpdate: _doMove,
                  child: Container(
                    width: 72,
                    height: 72,
                    decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(36)
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  _print(String msg) {
    setState(() {
      printString += ' ,${msg}';
    });
  }

  void _doMove(DragUpdateDetails e) {
    print('mingou ${e}');
    setState(() {
      moveY += e.delta.dy;
      moveX += e.delta.dx;
    });
  }
}
