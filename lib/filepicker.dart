import 'package:file_picker/file_picker.dart';
import 'package:open_app_file/open_app_file.dart';
import 'package:flutter/material.dart';

class Singlefilepicker extends StatefulWidget {
  const Singlefilepicker({super.key});

  @override
  State<Singlefilepicker> createState() => _SinglefilepickerState();
}

class _SinglefilepickerState extends State<Singlefilepicker> {
  PlatformFile? file;

  Future<void> picksinglefile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
        allowMultiple: false,
        dialogTitle: 'Select a File you would like to Compress',
        type: FileType.custom,
        allowedExtensions: [
          'jpg',
          'png',
          'pdf',
          'txt',
          'mp4',
          'mov',
          'docx',
          'heif',
          'jpeg'
        ]);
    if (result != null) {
      file = result.files.first;
      file == null ? false : OpenAppFile.open(file!.path.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            flexibleSpace: Container(
              decoration: const BoxDecoration(
                  gradient: LinearGradient(colors: [
                Color.fromARGB(255, 41, 197, 184),
                Color.fromARGB(255, 22, 166, 233)
              ])),
            ),
            title: const Text(
              'Choose file to Compress',
              style: TextStyle(
                  color: Color.fromARGB(255, 59, 54, 54),
                  fontWeight: FontWeight.bold,
                  fontSize: 25),
            )),
        body: SingleChildScrollView(
          child: Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                ElevatedButton.icon(
                    onPressed: picksinglefile,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      foregroundColor: Colors.amber,
                      elevation: 20, // Elevation
                      shadowColor: Colors.amber, // Shadow Color
                    ),
                    icon: const Icon(Icons.insert_drive_file_sharp),
                    label: const Text(
                      'Pick File',
                      style: TextStyle(fontSize: 25),
                    )),
              ])),
        ));
  }
}
