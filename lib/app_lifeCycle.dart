import 'package:flutter/material.dart';

/// 如何获取Flutter应用维度生命周期
/// WidgetsBindingObserver: 是一个Widgets绑定观察器，通过它我们可以监听应用的生命周期、语言等的变化
class AppLifeCycle extends StatefulWidget {
  const AppLifeCycle({Key? key}) : super(key: key);

  @override
  State<AppLifeCycle> createState() => _AppLifeCycleState();
}

class _AppLifeCycleState extends State<AppLifeCycle> with WidgetsBindingObserver {

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter应用生命周期'),
        leading: const BackButton(),
      ),
      body: Container(
        child: const Text('Flutter应用生命周期'),
      ),
    );
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    print('state = $state');
    if(state == AppLifecycleState.paused) {
      print('APP进入后台');
    }else if (state==AppLifecycleState.resumed) {
      print('APP进入前台');
    }else if(state == AppLifecycleState.inactive) {
      ///不常用：应用程序处于非活动状态，并且未接收用户输入时调用，比如：来了个电话
    }
    // else if(state==AppLifecycleState.suspending) {
    //   ///不常用：应用程序被挂起时调用，它不会在IOS上触发
    // }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }
}
