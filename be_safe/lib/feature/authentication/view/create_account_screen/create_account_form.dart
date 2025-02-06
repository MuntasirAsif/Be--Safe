import 'package:be_safe/model/user_model.dart';
import 'package:be_safe/widgets/common_widgets/button.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import '../../controller/signUpController.dart';

class CreateAccountForm extends ConsumerStatefulWidget {
  const CreateAccountForm({super.key});

  @override
  _CreateAccountFormState createState() => _CreateAccountFormState();
}

class _CreateAccountFormState extends ConsumerState<CreateAccountForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  String? _verificationId;
  bool isCodeSent = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _phoneNumberController.dispose();
    super.dispose();
  }

  void _submitForm() {
    if (_formKey.currentState?.validate() ?? false) {
      ref
          .read(signUpControllerProvider.notifier)
          .signUpWithEmail(
            email: _emailController.text,
            password: _passwordController.text,
          )
          .then((_) => _storeID());
    }
  }

  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  void _storeID() async {
    User? firebaseUser = FirebaseAuth.instance.currentUser;
    UserModel userModel = UserModel(userID: firebaseUser!.uid, name: 'Name', email: _emailController.text.toString(), role: 'User', sellerStatus: '', mobileNumber: _phoneNumberController.text.toString(), address: '', profileImageUrl: '', profession: '', dateOfBirth: '');
    await firestore.collection('users').doc(firebaseUser.uid).set(userModel.toMap());
  }

  void _verifyPhoneNumber() {
    ref.read(signUpControllerProvider.notifier).verifyPhoneNumber(
          phoneNumber: _phoneNumberController.text,
          verificationCompleted: (PhoneAuthCredential credential) {
            ref.read(signUpControllerProvider.notifier).linkPhoneWithCode(
                verificationId: _verificationId!, smsCode: '');
          },
          codeSent: (verificationId, resendToken) {
            setState(() {
              _verificationId = verificationId;
              isCodeSent = true;
            });
          },
          verificationFailed: (error) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text('Verification failed: ${error.message}'),
            ));
          },
          codeAutoRetrievalTimeout: (verificationId) {
            _verificationId = verificationId;
          },
        );
  }

  void _submitSmsCode(String smsCode) {
    if (_verificationId != null) {
      ref.read(signUpControllerProvider.notifier).linkPhoneWithCode(
            verificationId: _verificationId!,
            smsCode: smsCode,
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    final device = MediaQuery.of(context).size;
    final signUpState = ref.watch(signUpControllerProvider);

    return Form(
      key: _formKey,
      child: Column(
        children: [
          Gap(device.height * 0.05),

          TextFormField(
            controller: _emailController,
            decoration: const InputDecoration(labelText: 'Email'),
            keyboardType: TextInputType.emailAddress,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter an email';
              }
              if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                return 'Please enter a valid email';
              }
              return null;
            },
          ),
          Gap(device.height * 0.01),
          // Password Field
          TextFormField(
            controller: _passwordController,
            decoration: const InputDecoration(labelText: 'Password'),
            obscureText: true,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a password';
              }
              if (value.length != 6) {
                return 'Password must be 6 characters';
              }
              return null;
            },
          ),
          Gap(device.height * 0.01),
          // Phone Number Field
          IntlPhoneField(
            flagsButtonPadding: const EdgeInsets.only(left: 15),
            dropdownIcon: const Icon(Icons.keyboard_arrow_down),
            dropdownIconPosition: IconPosition.trailing,
            initialCountryCode: 'BD',
            autovalidateMode: AutovalidateMode.onUserInteraction,
            decoration: const InputDecoration(labelText: 'Phone Number'),

            // Use onChanged to update the controller with the full number
            onChanged: (phone) {
              _phoneNumberController.text = phone
                  .completeNumber; // Update with complete number (including country code)
            },

            validator: (phone) {
              if (phone == null || phone.completeNumber.isEmpty) {
                return 'Please enter a valid phone number';
              }
              return null;
            },
          ),

          Gap(device.height * 0.05),
          // Show loading spinner during signup
          if (signUpState is AsyncLoading) const CircularProgressIndicator(),
          // Submit button
          InkWell(
            onTap: () {
              print(_phoneNumberController);
              signUpState is AsyncLoading ? null : _submitForm();
            },
            child: ButtonWidget(
              text: 'Sign Up',
            ),
          )
        ],
      ),
    );
  }
}
