import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String fileExt = "";
  String selectedFileName = "";
  TextEditingController keyController = TextEditingController();
  String submittedKey = "";

  void _openFilePicker() async {
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
      setState(() {
        selectedFileName = result.files.first.name ?? "";
        fileExt = result.files.first.extension ?? "";
      });
    }
  }

  void _submitKey() {
    setState(() {
      submittedKey = keyController.text;
    });
  }

  @override
  void dispose() {
    keyController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GPGPU Based File Encryption'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: _openFilePicker,
              child: Text('Choose File'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                foregroundColor: Colors.amber,
                elevation: 20, // Elevation
                shadowColor: Colors.amber, // Shadow Color
              ),
            ),
            SizedBox(height: 20),
            Text(
              selectedFileName,
              style: TextStyle(fontSize: 18),
            ),
            Text(
              "Extension: " + fileExt,
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            Text(
              'Enter your key:',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: TextField(
                controller: keyController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Enter your key:',
                  counterText: '', // To remove the character counter
                ),
                maxLength: 16, // Maximum length
                minLines: 1, // Minimum length
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                _submitKey();
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Key submitted'),
                  ),
                );
              },
              child: const Text('Submit Key'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                foregroundColor: Colors.amber,
                elevation: 20, // Elevation
                shadowColor: Colors.amber, // Shadow Color
              ),
            ),
            SizedBox(height: 20),
            Text(
              submittedKey,
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}




// import 'package:file_picker/file_picker.dart';
// import 'package:open_app_file/open_app_file.dart';
// import 'package:flutter/material.dart';

// class Singlefilepicker extends StatefulWidget {
//   const Singlefilepicker({super.key});

//   @override
//   State<Singlefilepicker> createState() => _SinglefilepickerState();
// }

// class _SinglefilepickerState extends State<Singlefilepicker> {
//   PlatformFile? file;

//   Future<void> picksinglefile() async {
//     FilePickerResult? result = await FilePicker.platform.pickFiles(
//         allowMultiple: false,
//         dialogTitle: 'Select a File you would like to Compress',
//         type: FileType.custom,
//         allowedExtensions: [
//           'jpg',
//           'png',
//           'pdf',
//           'txt',
//           'mp4',
//           'mov',
//           'docx',
//           'heif',
//           'jpeg'
//         ]);
//     if (result != null) {
//       file = result.files.first;
//       file == null ? false : OpenAppFile.open(file!.path.toString());
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//             flexibleSpace: Container(
//               decoration: const BoxDecoration(
//                   gradient: LinearGradient(colors: [
//                 Color.fromARGB(255, 41, 197, 184),
//                 Color.fromARGB(255, 22, 166, 233)
//               ])),
//             ),
//             title: const Text(
//               'Choose file to Compress',
//               style: TextStyle(
//                   color: Color.fromARGB(255, 59, 54, 54),
//                   fontWeight: FontWeight.bold,
//                   fontSize: 25),
//             )),
//         body: SingleChildScrollView(
//           child: Center(
//               child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                 ElevatedButton.icon(
//                     onPressed: picksinglefile,
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: Colors.black,
//                       foregroundColor: Colors.amber,
//                       elevation: 20, // Elevation
//                       shadowColor: Colors.amber, // Shadow Color
//                     ),
//                     icon: const Icon(Icons.insert_drive_file_sharp),
//                     label: const Text(
//                       'Pick File',
//                       style: TextStyle(fontSize: 25),
//                     )),
//               ])),
//         ));
//   }
// }
// TODO Implement this library.