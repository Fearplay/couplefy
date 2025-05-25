import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:couplefy/utils/shared_preferences_utils.dart';

/// A widget that allows the user to pick and display an image from the gallery.
class LoveCounterImagePick extends StatefulWidget {
  /// Creates an instance of [LoveCounterImagePick].
  const LoveCounterImagePick({super.key});

  @override
  State<LoveCounterImagePick> createState() => _LoveCounterImagePickState();
}

class _LoveCounterImagePickState extends State<LoveCounterImagePick> {
  /// Holds the user-selected image file.
  File? _userImage;

  /// Provides an image provider used for caching/resizing.
  late ImageProvider _provider;

  @override
  void initState() {
    super.initState();
    // Load previously saved user image from SharedPreferences
    _userImage = SharedPreferencesUtils.userImage;
  }

  /// Opens the gallery and lets the user pick an image.
  ///
  /// The selected image is saved locally, resized, cached, and displayed.
  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final XFile? image = await picker.pickImage(
      source: ImageSource.gallery,
      maxWidth: 1080,
      maxHeight: 1080,
      imageQuality: 90,
    );

    if (image == null) return;

    final file = File(image.path);
    await SharedPreferencesUtils.saveUserImagePath(file.path);
    // Resize the image for better performance
    _provider = ResizeImage(FileImage(file), width: 800, height: 800);

    if (!mounted) return;
    await precacheImage(_provider, context);

    setState(() => _userImage = file);
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
            // Fallback image when user hasn't selected any
            : Image.asset(
                "assets/images/default_image.png",
                width: 400,
                fit: BoxFit.cover,
              ),
      ),
    );
  }
}
