import 'package:be_safe/widgets/common_widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import '../../../../../../constant/color_string.dart';
import '../../../../../../constant/image_string.dart';
import '../../../../../../constant/text_string.dart';
import '../../create_new_password/create_new_password_screen.dart';
import '../widgets/header_section.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
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
    final isKeyboardOpen = MediaQuery.of(context).viewInsets.bottom > 0;

    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: device.height * 0.35,
            width: device.width,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(forgetPasswordBg),
                fit: BoxFit.fitHeight,
              ),
            ),
          ),
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: device.width * 0.05),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Gap(isKeyboardOpen?device.height * 0.15:device.height * 0.20),
                    const HeaderSection(
                      title: passwordRecovery,
                      subtitle: otpScreenSubtitle,
                    ),
                    Gap(device.height * 0.03),
                    Text('${exampleMobileNo.substring(0,4)}********${exampleMobileNo.substring(12,14)}',style: textTheme.bodyLarge,),
                    Gap(device.height * 0.02),
                    GestureDetector(
                      onTap: () {
                        FocusScope.of(context).requestFocus(_focusNode);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(6, (index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 4.0),
                            child: CircleAvatar(
                              radius: 10.0,
                              backgroundColor: index < _controller.text.length
                                  ? AppColors.passwordFilledFieldColor
                                  : AppColors.passwordBlankFieldColor,
                            ),
                          );
                        }),
                      ),
                    ),
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
                        },
                        onEditingComplete: () {
                          _focusNode.unfocus();
                        },
                      ),
                    ),
                    Gap(isKeyboardOpen ? device.height * 0.07 : device.height * 0.25),
                    InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>CreateNewPasswordScreen()));
                        },
                        child: ButtonWidget(text: sendAgain, buttonColor: Colors.red)),
                    Gap(device.height * 0.02),
                    InkWell(
                      onTap: () => Navigator.pop(context),
                      child: Center(
                        child: Text(
                          cancel,
                          style: textTheme.bodyLarge,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
