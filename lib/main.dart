import 'package:flutter/material.dart';
import 'package:flutter_course/animation_page.dart';
import 'package:flutter_course/app_lifeCycle.dart';
import 'package:flutter_course/flutter_layout_page.dart';
import 'package:flutter_course/flutter_widget_lifeCycle.dart';
import 'package:flutter_course/gesture_page.dart';
import 'package:flutter_course/launch_page.dart';
import 'package:flutter_course/less_group_page.dart';
import 'package:flutter_course/photo_app_page.dart';
import 'package:flutter_course/plugin_use.dart';
import 'package:flutter_course/res_page.dart';
import 'package:flutter_course/statefull_group_page.dart';

void main() {
  runApp(const DynamicTheme());
}

///修改字体：字体下载地址：https://fonts.google.com/specimen/Rubik+Mono+One?selection.family=rubik+Mono+One
///更多参考：https://flutter.dev/docs/cookbook/design/fonts
///
/// 可用于学习的实例项目
/// https://github.com/flutter/flutter/tree/master/examples
/// https://github.com/flutter/samples
/// https://github.com/nisrulz/flutter-examples
/// https://github.com/iampawan/FlutterExampleApps

///修改主题
class DynamicTheme extends StatefulWidget {
  const DynamicTheme({Key? key}) : super(key: key);

  @override
  State<DynamicTheme> createState() => _DynamicThemeState();
}

class _DynamicThemeState extends State<DynamicTheme> {
  Brightness _brightness = Brightness.light;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // fontFamily: 'RubikMonoOne',
        brightness: _brightness,
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter Demo'),
        ),
        body: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                setState(() {
                  if (_brightness == Brightness.dark) {
                    _brightness = Brightness.light;
                  } else {
                    _brightness = Brightness.dark;
                  }
                });
              },
              child: const Text(
                '切换主题abc',
                style: TextStyle(fontFamily: 'RubikMonoOne'),
              ),
            ),
            const RouteNavigator()
          ],
        ),
      ),
      routes: <String, WidgetBuilder>{
        'plugin': (BuildContext context) => const PluginUse(),
        'less': (BuildContext context) => const LessGroupPage(),
        'ful': (BuildContext context) => const StatefulGroupPage(),
        'layout': (BuildContext context) => const FlutterLayoutPage(),
        'gesture': (BuildContext context) => const GesturePage(),
        'res': (BuildContext context) => const ResPage(),
        'launch': (BuildContext context) => const LaunchPage(),
        'widgetLifeCycle': (BuildContext context) => const WidgetLifeCycle(),
        'appLifeCycle': (BuildContext context) => const AppLifeCycle(),
        'photoApp': (BuildContext context) => const PhotoApp(),
        'animationPage': (BuildContext context) => const AnimationPage(),
      },
    );
  }
}

class RouteNavigator extends StatefulWidget {
  const RouteNavigator({super.key});

  @override
  State<RouteNavigator> createState() => _RouteNavigatorState();
}

class _RouteNavigatorState extends State<RouteNavigator> {
  bool byName = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SwitchListTile(
              title: Text(this.byName ? '不' : '通过路由名跳转'),
              value: byName,
              onChanged: (value) {
                setState(() {
                  byName = value;
                });
              }),
          _item('plugin使用', const PluginUse(), 'plugin'),
          _item('StatelessWidget与基础组件', const LessGroupPage(), 'less'),
          _item('StatefulWidget与基础组件', const StatefulGroupPage(), 'ful'),
          _item('如何进行Flutter布局开发', const FlutterLayoutPage(), 'layout'),
          _item('Flutter手势教程页面', const GesturePage(), 'gesture'),
          _item('如何导入和使用Flutter的资源文件', const ResPage(), 'res'),
          _item('如何打开第三方应用', const LaunchPage(), 'launch'),
          _item('Flutter页面生命周期', const WidgetLifeCycle(), 'widgetLifeCycle'),
          _item('Flutter应用生命周期', const AppLifeCycle(), 'appLifeCycle'),
          _item('[实战尝鲜] 拍照App开发', const PhotoApp(), 'photoApp'),
          _item('flutter 动画Animation开发指南', const AnimationPage(),
              'animationPage'),
        ],
      ),
    );
  }

  _item(String title, page, String routeName) {
    return Container(
      child: TextButton(
        onPressed: () {
          if (byName) {
            Navigator.pushNamed(context, routeName);
          } else {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => page));
          }
        },
        child: Text(title),
      ),
    );
  }
}
