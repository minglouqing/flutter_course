import 'package:flutter/material.dart';

/// 动画的几个类
/// Animation：是flutter动画库中的一个核心类，它生成指导动画的值；
///   1、Animation<double>, 2、Animation<Color>, 3、Animation<Size>...
/// CurvedAnimation：Animation的一个子类，将过程抽象为一个非线性曲线
/// AnimationController：Animation的一个子类，用来管理Animation；
/// Tween：在正在执行动画的对象所使用的数据范围之间生成值，例如：Tween可生成从红到蓝之间的色值，或者从0到255；
///
/// 如何为动画添加监听器
///   有时我们需要知道动画执行的进度和状态，在Flutter中我们可以通过

/// flutter 动画Animation开发指南
class AnimationPage extends StatefulWidget {
  const AnimationPage({Key? key}) : super(key: key);

  @override
  State<AnimationPage> createState() => _AnimationPageState();
}

class _AnimationPageState extends State<AnimationPage>
    with SingleTickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController controller;
  AnimationStatus? animationStatus;
  double? animationValue;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
    animation = Tween<double>(begin: 0, end: 300).animate(controller)
      ..addListener(() {
        setState(() {
          animationValue = animation.value;
        });
      })
      ..addStatusListener((AnimationStatus state) {
        setState(() {
          animationStatus = state;
        });
      });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('flutter 动画Animation开发指南'),
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(Icons.arrow_back),
        ),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            GestureDetector(
              onTap: () {
                controller.reset();
                controller.forward();
              },
              child: const Text(
                'Start',
                textDirection: TextDirection.ltr,
              ),
            ),
            Text(
              'State:$animationStatus',
              textDirection: TextDirection.ltr,
            ),
            Text(
              'Value:$animationValue',
              textDirection: TextDirection.ltr,
            ),
            SizedBox(
              height: animationValue,
              width: animationValue,
              child: const FlutterLogo(),
            )
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
