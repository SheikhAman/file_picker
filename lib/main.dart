import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

void main() {
runApp(MyApp());
}

class MyApp extends StatefulWidget {


  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
String? filePath;

void _pickFile() async {
	
	// opens storage to pick files and the picked file or files
	// are assigned into result and if no file is chosen result is null.
	// you can also toggle "allowMultiple" true or false depending on your need
	final result = await FilePicker.platform.pickFiles(allowMultiple: false);

	// if no file is picked
	if (result == null) return;

	// we will log the name, size and path of the
	// first picked file (if multiple are selected)
	print(result.files.first.name);
	print(result.files.first.size);
	print(result.files.first.path);
  filePath  = result.files.first.path;
  setState(() {
    
  });
  
}

@override
Widget build(BuildContext context) {
	return MaterialApp(
	debugShowCheckedModeBanner: false,
	home: Scaffold(
		backgroundColor: Colors.green[100],
		body: Center(
		child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
		  children: [
		    MaterialButton(
		    	onPressed: () {
		    	_pickFile();
		    	},
		    	
		    	color: Colors.green,
          child: const Text(
		    	'Pick and open file',
		    	style: TextStyle(color: Colors.white),
		    	),
		    ),
        if(filePath != null)
        SizedBox(height: 200,width: 200,
        child: Image.file(File(filePath!),),
        )
		  ],
		),
		),
	),
	);
}
}
