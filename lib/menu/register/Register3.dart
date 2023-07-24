import 'dart:io';
import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:loyalty_app/colors.dart';
import 'package:signature/signature.dart';

class register3 extends StatefulWidget {
  const register3({Key? key}) : super(key: key);

  @override
  State<register3> createState() => _register3State();
}

class _register3State extends State<register3> {
  final formKey = GlobalKey<FormState>();
  File? image;
  File? image1;
  String dropdownvalue1 = 'Kebele ID';
  Uint8List? exportedImage;
  SignatureController controller = SignatureController(
      penStrokeWidth: 4,
      exportBackgroundColor: Colors_selector.secondaryColor,
      penColor: Colors_selector.grey);
  // ImagePicker image = ImagePicker();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors_selector.primaryColor,
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors_selector.primaryColor,
          title: Text("Register".tr),
          automaticallyImplyLeading: true,
          centerTitle: true,
          actions: [
            IconButton(
              icon: const Icon(Icons.monetization_on_sharp,
                  color: Colors.yellowAccent),
              tooltip: 'Conis',
              onPressed: () {},
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Center(child: Text("data")),
            )
          ],
        ),
        body: SingleChildScrollView(
          child: SizedBox(
              height: MediaQuery.of(context).size.height * 1.2,
              child: Container(
                  width: MediaQuery.of(context).size.height * 1,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [Colors_selector.pair1, Colors_selector.pair2],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight),
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30)),
                  ),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "Welcome to your bank!",
                                style: TextStyle(
                                    color: Colors_selector.secondaryColor,
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                        Form(
                          key: formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 20,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "You'r almost there",
                                  style: TextStyle(
                                      color: Colors_selector.secondaryColor,
                                      fontSize: 17,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.fromLTRB(20, 0, 20, 10),
                                child: Text(
                                  "Upload your photograph",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                              image != null
                                  ? Image.file(
                                      image!,
                                      width: 90,
                                      height: 90,
                                      fit: BoxFit.cover,
                                    )
                                  : const FlutterLogo(
                                      size: 90,
                                    ),
                              Row(
                                children: [
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          20, 20, 20, 20),
                                      child: buildButton(
                                          title: "Gallery",
                                          icon: Icons.image_outlined,
                                          onClicked: () {
                                            pickImage(ImageSource.gallery);
                                          }),
                                    ),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          20, 0, 20, 0),
                                      child: buildButton(
                                          title: "Camera",
                                          icon: Icons.camera_alt,
                                          onClicked: () {
                                            pickImage(ImageSource.camera);
                                          }),
                                    ),
                                  ),
                                ],
                              ),
                              const Padding(
                                padding: EdgeInsets.fromLTRB(20, 0, 20, 10),
                                child: Text(
                                  "Upload your ID",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(20, 0, 20, 0),
                                child: DropdownButton<String>(
                                  // Step 3.
                                  value: dropdownvalue1,
                                  // Step 4.
                                  items: <String>[
                                    'Kebele ID',
                                    'Passport',
                                    'Driver license',
                                    'Student ID',
                                    'Employee ID',
                                    'Tax ID',
                                  ].map<DropdownMenuItem<String>>(
                                      (String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(
                                        value,
                                        // style: TextStyle(fontSize: 30),
                                      ),
                                    );
                                  }).toList(),
                                  // Step 5.
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      dropdownvalue1 = newValue!;
                                    });
                                  },
                                ),
                              ),
                              image1 != null
                                  ? Image.file(
                                      image1!,
                                      width: 90,
                                      height: 90,
                                      fit: BoxFit.cover,
                                    )
                                  : const FlutterLogo(
                                      size: 90,
                                    ),
                              Row(
                                children: [
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          20, 20, 20, 20),
                                      child: buildButton(
                                          title: "Gallery",
                                          icon: Icons.image_outlined,
                                          onClicked: () {
                                            pickImage1(ImageSource.gallery);
                                          }),
                                    ),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          20, 0, 20, 0),
                                      child: buildButton(
                                          title: "Camera",
                                          icon: Icons.camera_alt,
                                          onClicked: () {
                                            pickImage1(ImageSource.camera);
                                          }),
                                    ),
                                  ),
                                ],
                              ),
                              Signature(
                                controller: controller,
                                width: 320,
                                height: 150,
                                backgroundColor: Colors_selector.secondaryColor,
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          20, 10, 20, 0),
                                      child: buildButton(
                                          title: "save",
                                          icon: Icons.save_alt,
                                          onClicked: () async {
                                            exportedImage =
                                                await controller.toPngBytes();
                                            setState(() {});
                                          }),
                                    ),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          20, 10, 20, 0),
                                      child: buildButton(
                                          title: "clear",
                                          icon: Icons.clear_all_outlined,
                                          onClicked: () {
                                            controller.clear();
                                          }),
                                    ),
                                  )
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  const Text(
                                    "Finish",
                                    style: TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        30, 20, 10, 10),
                                    child: FloatingActionButton(
                                      onPressed: () {},
                                      child: Icon(Icons.navigate_next_rounded),
                                      backgroundColor:
                                          Colors_selector.secondaryColor,
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                          // child: Column(children: [Text("data")]),
                        ),
                      ]))),
        ));
  }

  // _getFromGallery() async {
  //   var imageFile = await ImagePicker().pickImage(source: ImageSource.camera);
  //   setState(() {
  //     image = File(imageFile!.path);
  //   });
  // }

  Widget buildButton({
    required String title,
    required IconData icon,
    required VoidCallback onClicked,
  }) =>
      ElevatedButton(
        style: ElevatedButton.styleFrom(
            minimumSize: Size.fromHeight(40),
            primary: Colors_selector.secondaryColor,
            onPrimary: Colors_selector.primaryColor,
            textStyle: const TextStyle(fontSize: 15)),
        onPressed: onClicked,
        child: Row(
          children: [
            Icon(
              icon,
              size: 28,
            ),
            const SizedBox(width: 16),
            Text(
              title,
              style: TextStyle(color: Colors_selector.tertiaryColor),
            )
          ],
        ),
      );

  Future pickImage(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) {
        return;
      }
      final imageTempo = File(image.path);
      setState(() {
        this.image = imageTempo;
      });
    } on PlatformException catch (e) {
      print("Failed to pick image:$e");
    }
  }

  Future pickImage1(ImageSource source) async {
    try {
      final image1 = await ImagePicker().pickImage(source: source);
      if (image1 == null) {
        return;
      }
      final imageTempo = File(image1.path);
      setState(() {
        this.image1 = imageTempo;
      });
    } on PlatformException catch (e) {
      print("Failed to pick image:$e");
    }
  }
}
