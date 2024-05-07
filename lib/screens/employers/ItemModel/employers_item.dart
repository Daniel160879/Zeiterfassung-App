import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meine_zeiterfassungs_app/screens/employers/data/employers.dart';

class EmployersItemModel extends StatefulWidget {
  const EmployersItemModel({super.key, required this.employer});

  final Employer employer;

  @override
  State<EmployersItemModel> createState() => _EmployersItemModelState();
}

class _EmployersItemModelState extends State<EmployersItemModel> {
  File? _profileImage;

  Future<void> _changeProfileImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        _profileImage = File(image.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InkWell(
                  onTap: _changeProfileImage,
                  child: CircleAvatar(
                    radius: 60,
                    backgroundImage: _profileImage != null
                        ? FileImage(_profileImage!) as ImageProvider
                        : const NetworkImage("https://via.placeholder.com/150"),
                    backgroundColor: Colors.grey[200],
                  ),
                ),
                Container(
                  height: 100,
                  width: 200,
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 80, 73, 72),
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        height: 15,
                        width: 150,
                        decoration: const BoxDecoration(color: Colors.transparent),
                        child: Text(widget.employer.firstName),
                      ),
                      Container(
                        height: 15,
                        width: 150,
                        decoration: const BoxDecoration(color: Colors.transparent),
                        child: Text(widget.employer.lastName),
                      ),
                      Container(
                        height: 15,
                        width: 150,
                        decoration: const BoxDecoration(color: Colors.transparent),
                        child: Text(
                          widget.employer.age,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
