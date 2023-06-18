import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_file_picker/form_builder_file_picker.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FormBuilder FilePicker Example'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: FormBuilderFilePicker(
  name: "attachments",
  previewImages: false,
  allowMultiple: true,
  withData: true,
  typeSelectors: [
    TypeSelector(
      type: FileType.any,
      selector: Row(
        children: <Widget>[
          Icon(Icons.add_circle),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text("Add documents"),
          ),
        ],
      ),
    ),
    if (!kIsWeb)
      TypeSelector(
        type: FileType.image,
        selector: Row(
          children: <Widget>[
            Icon(Icons.add_photo_alternate),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text("Add images"),
            ),
          ],
        ),
      ),
    ],
  )
      ),
    );
  }

  Widget customFileViewerBuilder(
    List<PlatformFile> files,
    FormFieldSetter<List<PlatformFile>> setter,
  ) {
    return files.isEmpty
        ? const Center(child: Text('No files'))
        : ListView.separated(
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(files[index].name),
                trailing: IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () {
                    files.removeAt(index);
                    setter.call([...files]);
                  },
                ),
              );
            },
            separatorBuilder: (context, index) =>
                const Divider(color: Colors.blueAccent),
            itemCount: files.length,
          );
  }
}