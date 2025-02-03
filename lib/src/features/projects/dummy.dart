import 'dart:convert';
import 'dart:io';
import 'package:crm_system/src/services/api_service.dart';
import 'package:crm_system/src/utilities/const.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

class TestUploadPage extends StatefulWidget {
  const TestUploadPage({super.key});

  @override
  _TestUploadPageState createState() => _TestUploadPageState();
}

class _TestUploadPageState extends State<TestUploadPage> {
  final ImagePicker _picker = ImagePicker();
  final List<String> _uploadedImages = [];

  final ApiServices _apiServices = ApiServices();  // Instance of ApiServices

  // Pick and upload an image
  Future<void> _pickAndUploadImage() async {
    final XFile? pickedFile =
        await _picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      // Upload the selected image to the backend
      await _apiServices.uploadIcon(pickedFile.path);  // Call uploadIcon from ApiServices

      setState(() {
        // Simulate adding the uploaded image to a list of "uploaded" images
        _uploadedImages.add(pickedFile.path);
      });
    }
  }

  // Fetch icons from the backend
  Future<void> _fetchIcons() async {
    try {
      List<String> icons = await _apiServices.fetchIcons(); // Call fetchIcons from ApiServices
      print("Fetched icons: $icons");
    } catch (e) {
      print("Error fetching icons: $e");
    }
  }

  @override
  void initState() {
    super.initState();
    _fetchIcons();  // Fetch icons when the page loads
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Test Upload and Display Icons'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Select or upload an avatar for the project (formats: jpg, png)",
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
            const SizedBox(height: 10),
            GestureDetector(
              onTap: _pickAndUploadImage,
              child: SizedBox(
                height: 80,
                width: 80,
                child: SvgPicture.asset(uploadImageSvg),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  crossAxisSpacing: 8.0,
                  mainAxisSpacing: 8.0,
                  childAspectRatio: 1,
                ),
                itemCount: _uploadedImages.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      print("Selected: ${_uploadedImages[index]}");
                    },
                    child: SizedBox(
                      height: 80,
                      width: 80,
                      child: Image.file(
                        File(_uploadedImages[index]),
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
