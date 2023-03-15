import 'package:flutter/material.dart';

// StatelessWidget 与基础组件
class LessGroupPage extends StatelessWidget {
  const LessGroupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'StatelessWidget与基础组件',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(title: const Text('StatelessWidget 与基础组件'),
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back),
          ),
        ),
        body: Container(
          decoration: const BoxDecoration(color: Colors.white),
          alignment: Alignment.center,
          child: Column(
            children: [
              const Text('i am Text', style: TextStyle(fontSize: 20)),
              const Icon(Icons.android, size: 50, color: Colors.red),
              const CloseButton(),
              const BackButton(),
              const Chip(
                label: Text('小七'),
                avatar: Icon(Icons.photo),
              ),
              const Divider(
                height: 10,
                indent: 10,
                color: Colors.orange,
              ),
              Card(
                color: Colors.blue,
                elevation: 5,
                margin: const EdgeInsets.all(10),
                child: Container(
                  padding: const EdgeInsets.all(10),
                  child: const Text("I am Card", style: TextStyle(fontSize: 20)),
                ),
              ),
              const AlertDialog(
                title: Text('title'),
                content: Text('描述'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
