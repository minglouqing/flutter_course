import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

// 如何打开第三方应用
class LaunchPage extends StatefulWidget {
  const LaunchPage({Key? key}) : super(key: key);

  @override
  State<LaunchPage> createState() => _LaunchPageState();
}

class _LaunchPageState extends State<LaunchPage> {
  final Uri _url = Uri.parse('https://flutter.dev');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('如何打开第三方应用'),
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
            ElevatedButton(
                onPressed: _launchUrl,
                child: const Text('打开浏览器')
            ),
            ElevatedButton(
                onPressed: _openMap,
                child: const Text('打开地图')
            )
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Future<void> _launchUrl() async {
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }

  _openMap() async{
    // android
    final Uri urlAndroid = Uri.parse('geo:52.32, 4.917'); //APP提供者提供的 schema
    if(await canLaunchUrl(urlAndroid)) {
      await launchUrl(urlAndroid);
    } else {
      final Uri urlIos = Uri.parse('http://maps.apple.com/?ll=52.32,4.917');
      if(await canLaunchUrl(urlIos)){
        await launchUrl(urlIos);
      } else {
        throw 'Could not launch $_url';
      }
    }
  }
}

