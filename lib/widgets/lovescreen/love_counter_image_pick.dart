import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:couplefy/utils/shared_preferences_utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoveCounterImagePick extends StatefulWidget {
  const LoveCounterImagePick({super.key});

  @override
  State<LoveCounterImagePick> createState() => _LoveCounterImagePickState();
}

class _LoveCounterImagePickState extends State<LoveCounterImagePick> {
  File? _userImage;
  late ImageProvider _provider;

  @override
  void initState() {
    super.initState();
    _userImage = SharedPreferencesUtils.userImage;
  }

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      final file = File(image.path);

      await SharedPreferencesUtils.saveUserImagePath(file.path);
      if (!mounted) return;
      _provider = FileImage(file);

      await precacheImage(_provider, context);
      if (!mounted) return;
      setState(() {
        _userImage = file;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _pickImage,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(25),
        child: _userImage != null
            ? Image.file(
                _userImage!,
                width: 400,
                height: 400,
                fit: BoxFit.cover,
              )
            : Image.asset(
                "assets/images/default_image.png",
                width: 400,
                fit: BoxFit.cover,
              ),
      ),
    );
  }
}
