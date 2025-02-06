import 'package:be_safe/widgets/bottom_bar/bottom_bar_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import '../../../controller/login_controller.dart';

class EnterPasswordScreen extends ConsumerStatefulWidget {
  final String email;

  const EnterPasswordScreen({super.key, required this.email});

  @override
  ConsumerState<EnterPasswordScreen> createState() =>
      _EnterPasswordScreenState();
}

class _EnterPasswordScreenState extends ConsumerState<EnterPasswordScreen> {
  final FocusNode _focusNode = FocusNode();
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _focusNode.dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final device = MediaQuery.of(context).size;
    final textTheme = Theme.of(context).textTheme;
    final brightness = Theme.of(context).brightness;
    final isKeyboardOpen = MediaQuery.of(context).viewInsets.bottom > 0;
    final gapHeight = isKeyboardOpen ? device.height * 0.03 : device.height * 0.3;

    final loginState = ref.watch(loginProvider);
    ref.read(loginProvider.notifier);

    Future<void> loginAccount(BuildContext context) async {
      try {
        // Attempt to sign in with email and password
        final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: widget.email,
          password: _controller.text.trim(),
        );

        // If login is successful, navigate to BottomBar
        if (credential.user != null) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const BottomBarWidget(),
            ),
          );
        }
      } on FirebaseAuthException catch (e) {
        String errorMessage;

        switch (e.code) {
          case 'invalid-email':
            errorMessage = 'The email address is not valid.';
            break;
          case 'user-disabled':
            errorMessage = 'This user has been disabled.';
            break;
          case 'user-not-found':
            errorMessage = 'No user found for that email.';
            break;
          case 'wrong-password':
            errorMessage = 'Wrong password provided for that user.';
            break;
          case 'too-many-requests':
            errorMessage = 'Too many requests. Please try again later.';
            break;
          case 'operation-not-allowed':
            errorMessage = 'Email/password sign-in is not enabled.';
            break;
          default:
            errorMessage = 'An undefined error occurred. Please try again.';
            break;
        }

        // Show error message using Snackbar
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(errorMessage)),
        );
      } catch (e) {
        // Handle general errors
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('An unexpected error occurred. Please try again.')),
        );
      }
    }


    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: device.width * 0.05),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Gap(device.height * 0.25),
                  const CircleAvatar(
                    radius: 60,
                    backgroundColor: Colors.white,
                    child: CircleAvatar(
                      radius: 55,
                      child: Icon(
                        Icons.person,
                        size: 60,
                      ),
                    ),
                  ),
                  Text(
                    'Hello, ${widget.email}!',
                    style: textTheme.headlineMedium!.copyWith(
                      fontWeight: FontWeight.bold,
                      color: brightness == Brightness.dark
                          ? Colors.white
                          : Colors.black,
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  Text(
                    'Type your password to continue',
                    style: textTheme.bodyLarge,
                  ),
                  const SizedBox(height: 20.0),
                  GestureDetector(
                    onTap: () => FocusScope.of(context).requestFocus(_focusNode),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(6, (index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4.0),
                          child: CircleAvatar(
                            radius: 10.0,
                            backgroundColor: index < _controller.text.length
                                ? Colors.blue
                                : Colors.grey,
                          ),
                        );
                      }),
                    ),
                  ),
                  Gap(gapHeight),
                  Offstage(
                    offstage: true,
                    child: TextField(
                      focusNode: _focusNode,
                      controller: _controller,
                      obscureText: true,
                      keyboardType: TextInputType.number,
                      maxLength: 6,
                      textInputAction: TextInputAction.done,
                      onChanged: (value) {
                        setState(() {});
                        if (value.length == 6) {
                          loginAccount(context);
                        }
                      },
                    ),
                  ),
                  if (loginState.errorMessage.isNotEmpty)
                    Text(
                      loginState.errorMessage,
                      style: const TextStyle(color: Colors.red),
                    ),
                  InkWell(
                    onTap: _controller.text.isEmpty
                        ? () => Navigator.pop(context)
                        : () {
                      // Handle forget password navigation
                    },
                    child: Text(
                      _controller.text.isEmpty ? 'Not you?' : 'Forget your password?',
                      style: textTheme.bodyLarge,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
