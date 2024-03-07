import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: imagepicker(),
    );
  }
}

class imagepicker extends StatefulWidget {
  const imagepicker({super.key});

  @override
  State<imagepicker> createState() => _imagepickerState();
}

class _imagepickerState extends State<imagepicker> {
  File? _selectedImage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
              height: 550,
              color: Colors.blueAccent,
              child: _selectedImage != null?Image.file(_selectedImage!)
                  :const Center(child: Text("please select the image"))),
          const Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FloatingActionButton(
                onPressed: () {
                  _pickImageFromCamera();
                },
                child: const Icon(Icons.camera),
              ),
              const SizedBox(
                width: 20,
              ),
              FloatingActionButton(
                onPressed: () {
                  _pickImageFromGallery();
                },
                child: const Icon(Icons.photo_library),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Future _pickImageFromGallery() async {
    final returnImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    setState(() {
      _selectedImage = File(returnImage!.path);
    });
  }

  Future _pickImageFromCamera() async {
    final returnImage =
        await ImagePicker().pickImage(source: ImageSource.camera);

    setState(() {
      _selectedImage = File(returnImage!.path);
    });
  }
}
