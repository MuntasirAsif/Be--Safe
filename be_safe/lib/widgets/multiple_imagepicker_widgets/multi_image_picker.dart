import 'dart:io';
import 'package:be_safe/constant/color_string.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class MultipleImagePickerWidget extends StatefulWidget {
  List<String> imageLink;
  final String userID;
  final String collection;
  MultipleImagePickerWidget(
      {super.key,
      required this.imageLink,
      required this.userID,
      required this.collection});

  @override
  _MultipleImagePickerWidgetState createState() =>
      _MultipleImagePickerWidgetState();
}

class _MultipleImagePickerWidgetState extends State<MultipleImagePickerWidget> {
  final ImagePicker _picker = ImagePicker();
  final List<XFile> _imageFiles = [];
  final Set<String> _imageFilePaths = {};

  static const int maxImageCount = 10;
  bool _isUploading = false;

  Future<void> _pickImages() async {
    try {
      final List<XFile>? selectedImages = await _picker.pickMultiImage();
      if (selectedImages == null) return; // Handle no selection

      final List<XFile> newImages = [];
      for (var image in selectedImages) {
        if (_imageFiles.length < maxImageCount &&
            !_imageFilePaths.contains(image.path)) {
          newImages.add(image);
          _imageFilePaths.add(image.path);
        }
      }

      if (newImages.isNotEmpty) {
        setState(() {
          _imageFiles.addAll(newImages);
        });

        await _uploadImages(); // Call upload images here
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error picking images: $e');
      }
    }
  }

  Future<void> _uploadImages() async {
    setState(() {
      _isUploading = true;
    });

    for (var image in _imageFiles) {
      try {
        String link = await uploadImageFile(File(image.path));
        if (!widget.imageLink.contains(link)) {
          widget.imageLink.add(link);
        }
      } catch (e) {
        if (kDebugMode) {
          print('Error uploading image: $e');
        }
      }
    }

    setState(() {
      _isUploading = false; // Reset uploading state
    });
  }

  Future<String> uploadImageFile(File imageFile) async {
    try {
      // Set the storage reference path as "Hotel/UserID/filename"
      String fileName = imageFile.path.split('/').last;
      final Reference storageRef = FirebaseStorage.instance
          .ref()
          .child('${widget.collection}/${widget.userID}/$fileName');

      // Upload the file to Firebase Storage
      UploadTask uploadTask = storageRef.putFile(imageFile);
      TaskSnapshot snapshot = await uploadTask;

      // Get the download URL once uploaded
      String downloadUrl = await snapshot.ref.getDownloadURL();
      return downloadUrl;
    } catch (e) {
      throw Exception('Failed to upload image: $e');
    }
  }

  Future<void> _deleteImage(String imagePath) async {
    try {
      String fileName = imagePath.split('/').last;
      final Reference storageRef = FirebaseStorage.instance
          .ref()
          .child('Hotel/${widget.userID}/$fileName');
      await storageRef.delete();
      if (kDebugMode) {
        print('Image deleted from Firebase Storage: $fileName');
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error deleting image: $e');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _imageFiles.isEmpty
                  ? GestureDetector(
                      onTap: _pickImages,
                      child: Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                          color: AppColors.bgGray,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: Colors.grey),
                        ),
                        child: const Center(
                          child: Icon(
                            Icons.add,
                            size: 40,
                            color: AppColors.baseColor,
                          ),
                        ),
                      ),
                    )
                  : Container(),
              const SizedBox(height: 20),
              _imageFiles.isNotEmpty
                  ? GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: _imageFiles.length +
                          (_imageFiles.length < maxImageCount ? 1 : 0),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                      ),
                      itemBuilder: (context, index) {
                        if (index == _imageFiles.length) {
                          return GestureDetector(
                            onTap: _pickImages,
                            child: Container(
                              decoration: BoxDecoration(
                                color: AppColors.bgGray,
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(color: Colors.grey),
                              ),
                              child: const Center(
                                child: Icon(
                                  Icons.add,
                                  size: 40,
                                  color: AppColors.baseColor,
                                ),
                              ),
                            ),
                          );
                        }
                        return Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: Image.file(
                                File(_imageFiles[index]
                                    .path), // Show the local image
                                width: double.infinity,
                                height: double.infinity,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Positioned(
                              top: 5,
                              right: 5,
                              child: GestureDetector(
                                onTap: () async {
                                  String path = _imageFiles[index].path;
                                  await _deleteImage(
                                      path); // Delete from Firebase
                                  setState(() {
                                    _imageFilePaths.remove(path);
                                    _imageFiles.removeAt(index);
                                    widget.imageLink.removeAt(index);
                                  });
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.red.withOpacity(0.8),
                                    shape: BoxShape.circle,
                                  ),
                                  child: const Icon(
                                    Icons.close,
                                    color: Colors.white,
                                    size: 20,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    )
                  : const SizedBox(),
              const SizedBox(height: 20),
            ],
          ),
          if (_isUploading)
            Container(
              color: Colors.black.withOpacity(0.5),
              child: const Center(
                child: LinearProgressIndicator(),
              ),
            ),
        ],
      ),
    );
  }
}
