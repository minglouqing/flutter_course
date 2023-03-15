import 'package:flutter/material.dart';

import 'package:transparent_image/transparent_image.dart';

/// 如何加载本地图片：就是加载存在我们手机SD卡里面的本地图片。
/// Import 'dart:io';
/// 这是加载绝对路径的图片资源的路径
/// Image.file(File('/sdcard/Download/Stack.png'));
///
/// 加载相对路径的手机SD卡的本地图片
///   在pubspec.yaml中添加 path_provider 插件;
///   示例代码：
///   import 'dart:io';
///   import 'package:path_provider/path_provider.dart';
///
///   // Image.file(File('/sdcard/Download/Stack.png'));
///   FutureBuilder(
///     future: _getLocalFile('Download/Stack.png'),
///     builder: (BuildContext context, AsyncSnapshot<File> snapshot) {
///       return snapshot.data != null ? Image.file(snapshot.data) : Container();
///     }
///   )
///   // 获取SD Card的路径：
///   Future<File> _getLocalFile(String filename) async {
///     String dir = (await getExternalStorageDirectory()).path;
///     File f = new File('$dir/$filename');
///     return f;
///   }

/// 为了设置Placeholder我们需要借助fadeInImage,它能够从内存，本地资源中加载placeholder
/// 安装transparent_image插件
///
/// 加载本地资源图片为placeholder
/// FadeInImage.memoryNetwork(
///   placeholder: 'assets/loading.gif',
///   image: 'http://www.devio.org/img/avatar.png',
/// ),
///
/// 在flutter中可以借助 cached_network_image插件，来从网络上加载图片，并且将其缓存到本地，以供下次使用。
///
/// 加载图标
/// Icon(Icons.android, size: 100)
/// 自定义Icon

/// 如何导入和使用Flutter的资源文件，图片
class ResPage extends StatefulWidget {
  const ResPage({Key? key}) : super(key: key);

  @override
  State<ResPage> createState() => _ResPageState();
}

class _ResPageState extends State<ResPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('如何导入和使用Flutter的资源文件'),
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(Icons.arrow_back),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Image(
              width: 200,
              height: 100,
              image: AssetImage('images/GONGZHU.JPG'),
            ),
            FadeInImage.memoryNetwork(
              placeholder: kTransparentImage,
              image: 'http://www.devio.org/img/avatar.png',
            ),
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
