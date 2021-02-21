
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class Nedjm extends StatefulWidget {
  @override
  _NedjmState createState() => _NedjmState();
}

class _NedjmState extends State<Nedjm> {

String nameFile = "NONE";

  void fun()async{
    FilePickerResult result = await FilePicker.platform.pickFiles();

    if(result != null) {
      File file1 = File(result.files.single.path);
      PlatformFile file = result.files.first;

      print(file.name);
     setState(() {
       nameFile = file.name;
     });

      print(file.bytes);
      print(file.size);
      print(file.extension);
      print(file.path);
    } else {
      // User canceled the picker
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text("picker"),
      ),
      body: Center(
        child: Container(
          color: Colors.green,
          width: double.infinity,
          height: 200,
          child: FlatButton(
            child: Text(nameFile),
            
            onPressed: fun,
          ),
        ),
      ),
    );
  }
}
