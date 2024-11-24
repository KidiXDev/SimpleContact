import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

class ImagePickerWidget extends StatelessWidget {
  final File? currentImage;
  final Function(File) onImageSelected;
  final double radius;

  const ImagePickerWidget({
    super.key,
    this.currentImage,
    required this.onImageSelected,
    this.radius = 50,
  });

  Future<void> _pickImage(ImageSource source, BuildContext context) async {
    if (source == ImageSource.camera) {
      await Permission.camera.request();
    }
    await Permission.storage.request();

    final pickedFile = await ImagePicker().pickImage(source: source);
    if (pickedFile != null) {
      final directory = await getApplicationDocumentsDirectory();
      if (!directory.existsSync()) {
        directory.createSync();
      }
      final fileName = pickedFile.name;
      final File savedImage =
          await File(pickedFile.path).copy('${directory.path}/$fileName');
      onImageSelected(savedImage);
    }
    if (context.mounted) {
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => showModalBottomSheet(
        context: context,
        builder: (context) => SizedBox(
          height: 120,
          child: Column(
            children: [
              ListTile(
                leading: const Icon(Icons.camera_alt),
                title: const Text('Camera'),
                onTap: () => _pickImage(ImageSource.camera, context),
              ),
              ListTile(
                leading: const Icon(Icons.photo_library),
                title: const Text('Gallery'),
                onTap: () => _pickImage(ImageSource.gallery, context),
              ),
            ],
          ),
        ),
      ),
      child: CircleAvatar(
        radius: radius,
        backgroundImage: currentImage != null ? FileImage(currentImage!) : null,
        child: currentImage == null
            ? const Icon(Icons.camera_alt, size: 50)
            : null,
      ),
    );
  }
}
