
import 'package:flutter/material.dart';
import 'package:flutter_userapp/filepicker.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(debugShowCheckedModeBanner:
                    false, home:Singlefilepicker());
  }
}






// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:file_picker/file_picker.dart';

// void main() {
//   runApp(const OpenFileApp());
// }

// class OpenFileApp extends StatelessWidget {
//   const OpenFileApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       home: OpenFileAppHome(),
//     );
//   }
// }

// void _pickFile() async {
//   FilePickerResult? result = await FilePicker.platform.pickFiles(
//       allowMultiple: false,
//       dialogTitle: 'Select a File you would like to Compress',
//       type: FileType.custom,
//       allowedExtensions: [
//         'jpg',
//         'png',
//         'pdf',
//         'txt',
//         'mp4',
//         'mov',
//         'docx',
//         'heif',
//         'jpeg'
//       ]);

//   if (result == null) {
//     print("Choose proper file");
//     return;
//   } else {
//     PlatformFile f = result.files.single;
    
//     print(f.extension);
   
//   }
// }

// class OpenFileAppHome extends StatelessWidget {
//   const OpenFileAppHome({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: ElevatedButton(
//             child: const Text('Choose File...'),
//             style: ElevatedButton.styleFrom(
//               backgroundColor: Colors.black,
//               foregroundColor: Colors.amber,
//               elevation: 20, // Elevation
//               shadowColor: Colors.amber, // Shadow Color
              
//             ),
//             onPressed: () {
//               _pickFile();
//             }),
//       ),
//     );
//   }
// }
