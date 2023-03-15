import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

// [实战尝鲜] 拍照App开发
class PhotoApp extends StatefulWidget {
  const PhotoApp({Key? key}) : super(key: key);

  @override
  State<PhotoApp> createState() => _PhotoAppState();
}

class _PhotoAppState extends State<PhotoApp> {
  final List<XFile> _imageFileList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('[实战尝鲜] 拍照App开发'),
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(Icons.arrow_back),
        ),
      ),
      body: Center(
        child: Wrap(
          spacing: 5,
          runSpacing: 5,
          children: _genImages(),
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
      floatingActionButton: FloatingActionButton(
        onPressed: _pickImages,
        tooltip: '选择图片',
        child: const Icon(Icons.add_a_photo),
      ),
    );
  }

  void _getImage(bool isTakePhoto) async{
    Navigator.pop(context);

    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(
        source: isTakePhoto ? ImageSource.camera : ImageSource.gallery);
    // final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    // final XFile? photo = await _picker.pickImage(source: ImageSource.camera);
    // final XFile? image = await _picker.pickVideo(source: ImageSource.gallery);
    // final XFile? video = await _picker.pickVideo(source: ImageSource.camera);

    setState(() {
      if(image!=null) {
        _imageFileList.add(image);
      }
    });
  }

  void _pickImages() {
    showModalBottomSheet(context: context, builder: (context) => SizedBox(
      height: 160,
      child: Column(
        children: [
          _item('拍照', true),
          _item('从相册选择', false)
        ],
      ),
    ));
  }

  _item(String title, bool isTakePhoto) {
    return GestureDetector(
      child: ListTile(
        leading: Icon(isTakePhoto ? Icons.camera_alt : Icons.photo_library),
        title: Text(title),
        onTap: () => _getImage(isTakePhoto),
      ),
    );
  }

  _genImages() {
    return _imageFileList.map((file) {
      return Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: Image.file(File(file.path), width: 120, height: 90, fit: BoxFit.fill,),
          ),
          Positioned(
            right: 5,
            top: 5,
            child: GestureDetector(
              onTap: () {
                setState(() {
                  _imageFileList.remove(file);
                });
              },
              child: ClipOval(
                child: Container(
                  padding: const EdgeInsets.all(3),
                  decoration: const BoxDecoration(color: Colors.black54),
                  child: const Icon(Icons.close, size: 18, color: Colors.white),
                ),
              ),
            )
          )
        ],
      );
    }).toList();
  }
}