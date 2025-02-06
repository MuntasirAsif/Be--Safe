import 'dart:io';
import 'package:be_safe/model/user_model.dart';
import 'package:be_safe/widgets/bottom_bar/bottom_bar_widget.dart';
import 'package:be_safe/widgets/common_widgets/button.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../../constant/color_string.dart';
import '../../../controller/user_controller.dart';

class EditProfileScreen extends ConsumerStatefulWidget {
  final String imageUrl;
  final String name;
  final String email;
  final String phoneNo;
  final String address;
  final String sellerStatus;
  final String profession;
  final String dateOfBirth;
  const EditProfileScreen({
    super.key,
    required this.imageUrl,
    required this.name,
    required this.email,
    required this.phoneNo,
    required this.address,
    required this.profession,
    required this.dateOfBirth,
    required this.sellerStatus,
  });

  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends ConsumerState<EditProfileScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();
  final TextEditingController _professionController = TextEditingController();
  final TextEditingController _dotController = TextEditingController();

  File? _imageFile;
  String? _uploadedImageUrl;
  final firebase_auth.User? user =
      firebase_auth.FirebaseAuth.instance.currentUser; // Use firebase_auth.User
  bool isUploadingImage = false;

  @override
  void initState() {
    super.initState();
    // Initialize the text fields with the current user data
    _initializeTextFields();
  }

  void _initializeTextFields() {
    if (user != null) {
      _uploadedImageUrl = widget.imageUrl;
      _nameController.text = widget.name;
      _emailController.text = user!.email ?? "";
      _phoneController.text = widget.phoneNo;
      _locationController.text = widget.address;
      _professionController.text = widget.profession;
      _dotController.text = widget.dateOfBirth;
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _locationController.dispose();
    super.dispose();
  }

  Future<void> _pickImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
        isUploadingImage = true;
      });
      await _uploadImageToFirebase();
    }
  }

  Future<void> _uploadImageToFirebase() async {
    if (_imageFile == null) return;
    if (kDebugMode) {
      print(_imageFile);
    }
    try {
      // Upload the image to Firebase Storage
      final storageRef = FirebaseStorage.instance.ref();
      final imageRef = storageRef.child("profile_images/${user!.uid}.jpg");
      await imageRef.putFile(_imageFile!);

      // Get the download URL
      final downloadUrl = await imageRef.getDownloadURL();
      setState(() {
        _uploadedImageUrl = downloadUrl;
        isUploadingImage = false;
      });

      if (kDebugMode) {
        print("Image uploaded: $_uploadedImageUrl");
      }
    } catch (e) {
      if (kDebugMode) {
        print("Error uploading image: $e");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final userControllerProvider =
        ChangeNotifierProvider<UserController>((ref) {
      return UserController();
    });
    final userController = ref.watch(userControllerProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit Profile"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Stack(
                  children: [
                    CircleAvatar(
                      radius: 60,
                      backgroundColor: AppColors.bgGray,
                      backgroundImage: _imageFile != null
                          ? FileImage(_imageFile!) as ImageProvider
                          : NetworkImage(_uploadedImageUrl!),
                      child: _uploadedImageUrl == ""
                          ? Center(
                              child: Text(
                              widget.name.substring(0, 1),
                              style: const TextStyle(
                                  fontSize: 32, fontWeight: FontWeight.bold),
                            ))
                          : const SizedBox(),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: InkWell(
                        onTap: _pickImage, // Pick an image
                        child: CircleAvatar(
                          backgroundColor: AppColors.bgGray.withOpacity(0.4),
                          child: const Icon(
                            Icons.camera_alt,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              _buildTextField("Full Name", _nameController, Icons.person),
              _buildTextField("Email", _emailController, Icons.email,
                  inputType: TextInputType.emailAddress),
              _buildTextField("Phone", _phoneController, Icons.phone,
                  inputType: TextInputType.phone),
              _buildTextField(
                  "Location", _locationController, Icons.location_city),
              _buildTextField("Profession", _professionController,
                  Icons.business_center_outlined),
              _buildTextField(
                  "Date of Birth", _dotController, Icons.calendar_month),
              const SizedBox(height: 30),
              isUploadingImage
                  ? const Center(
                      child: SizedBox(
                          width: 100, child: LinearProgressIndicator()))
                  : InkWell(
                      onTap: () async {
                        if (_formKey.currentState!.validate()) {
                          await userController.updateUser(
                            UserModel(
                              userID: user!.uid,
                              name: _nameController.text.trim(),
                              email: user!.email ?? "",
                              role: 'User',
                              sellerStatus: widget.sellerStatus,
                              mobileNumber: _phoneController.text.trim(),
                              address: _locationController.text.trim(),
                              profileImageUrl: _uploadedImageUrl!,
                              profession: _professionController.text.trim(),
                              dateOfBirth: _dotController.text
                                  .trim(), // This is safe now
                            ),
                            context,
                          );
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const BottomBarWidget()));
                        }
                      },
                      child: ButtonWidget(
                        text: 'Save',
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }

  // Helper method to create a TextFormField with validation
  Widget _buildTextField(
      String label, TextEditingController controller, IconData icon,
      {TextInputType inputType = TextInputType.text}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: TextFormField(
        enabled: controller != _emailController,
        controller: controller,
        keyboardType: inputType,
        decoration: InputDecoration(
          labelText: label,
          prefixIcon: Icon(icon, color: AppColors.iconColor),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter $label';
          }
          return null;
        },
      ),
    );
  }
}
