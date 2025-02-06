import 'package:be_safe/feature/User/view/notifications/notification_screen.dart';
import 'package:be_safe/feature/User/view/profile/payement_method/payment_method_screen.dart';
import 'package:be_safe/feature/User/view/profile/personal_information/personal_information.dart';
import 'package:be_safe/feature/User/view/profile/settings/settings.dart';
import 'package:be_safe/feature/User/view/profile/widgets/image_name_section.dart';
import 'package:be_safe/feature/User/view/profile/widgets/user_mode.dart';
import 'package:be_safe/feature/admin/view/admin_dash_board/admin_dash_board_screen.dart';
import 'package:be_safe/feature/authentication/auth_repository/user_sign_out.dart';
import 'package:be_safe/widgets/Card/profile_options.dart';
import 'package:be_safe/constant/text_string.dart';
import 'package:be_safe/widgets/common_widgets/login_ad_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import '../../controller/user_controller.dart';

final userControllerProvider = ChangeNotifierProvider<UserController>((ref) {
  return UserController();
});

class ProfileScreen extends ConsumerStatefulWidget {
  const ProfileScreen({super.key});

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends ConsumerState<ProfileScreen> {
  late final UserController userController;
  User? firebaseUser;
  bool isLoading = true; // Add loading state

  @override
  void initState() {
    super.initState();
    firebaseUser = FirebaseAuth.instance.currentUser;
    userController = ref.read(userControllerProvider);

    if (firebaseUser != null) {
      userController.fetchUserById(firebaseUser!.uid).then((_) {
        // Set loading to false once data is fetched
        setState(() {
          isLoading = false;
        });
      });
    } else {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final firebaseAuth = FirebaseAuth.instance;
    final textTheme = Theme.of(context).textTheme;
    final userSignOut = UserSignOut(firebaseAuth);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          profile,
          style: textTheme.titleLarge!.copyWith(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: isLoading
          ? const Center(
              child: SizedBox(
                  width: 200,
                  child: LinearProgressIndicator())) // Show loading indicator
          : SingleChildScrollView(
              child: Column(
                children: [
                  const Gap(30),
                  firebaseUser == null
                      ? const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Gap(100),
                              LoginAdWidget(),
                              Gap(100),
                            ],
                          ),
                        )
                      : _buildUserProfile(context, textTheme),
                  InkWell(
                    onTap: () {
                      if (kDebugMode) {
                        print(userController.currentUser?.name);
                      }
                    },
                    child: ProfileOptions(
                      icon: Icons.info_outline,
                      title: support,
                    ),
                  ),
                  if (firebaseUser != null)
                    InkWell(
                      onTap: () {
                        userSignOut.signOut();
                      },
                      child: ProfileOptions(
                        icon: Icons.logout_rounded,
                        title: logout,
                      ),
                    ),
                ],
              ),
            ),
    );
  }

  // Build the user profile section
  Widget _buildUserProfile(BuildContext context, TextTheme textTheme) {
    return Column(
      children: [
        ImageNameSection(
          textTheme: textTheme,
          name: userController.currentUser?.name ?? 'User Name',
          imageUrl: userController.currentUser?.profileImageUrl ?? "",
        ),
        const Gap(30),
        UserMode(
          textTheme: textTheme,
          sellerStatus:
              userController.currentUser?.sellerStatus ?? 'deactivate',
        ),
        _buildProfileOption(
          context,
          Icons.person_4_outlined,
          personalInformation,
          PersonalInformationScreen(
            imageUrl: userController.currentUser?.profileImageUrl ?? "",
            name: userController.currentUser?.name ?? 'User Name',
            email: userController.currentUser?.email ?? "",
            phoneNo: userController.currentUser?.mobileNumber ?? "",
            address: userController.currentUser?.address ?? "",
            profession: userController.currentUser?.profession ?? "",
            dateOfBirth: userController.currentUser?.dateOfBirth ?? "",
            sellerStatus: userController.currentUser?.sellerStatus ?? "",
          ),
        ),
        _buildProfileOption(
          context,
          Icons.settings,
          settings,
          Settings(
            imageUrl: userController.currentUser?.profileImageUrl ?? "",
            name: userController.currentUser?.name ?? 'User Name',
            email: userController.currentUser?.email ?? "",
            phoneNo: userController.currentUser?.mobileNumber ?? "",
            address: userController.currentUser?.address ?? "",
            profession: userController.currentUser?.profession ?? "",
            dateOfBirth: userController.currentUser?.dateOfBirth ?? "",
          ),
        ),
        _buildProfileOption(
          context,
          Icons.notifications_none,
          notifications,
          const NotificationScreen(),
        ),
        _buildProfileOption(
          context,
          Icons.payment_rounded,
          payments,
          const PaymentMethodsScreen(),
        ),
        userController.currentUser?.role == 'Admin'
            ? _buildProfileOption(
                context,
                Icons.security,
                'Admin panel',
                const AdminDashboardScreen(),
              )
            : const SizedBox(),
      ],
    );
  }

  // A method to build profile options
  Widget _buildProfileOption(
    BuildContext context,
    IconData icon,
    String title,
    Widget destination,
  ) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => destination),
        );
      },
      child: ProfileOptions(
        icon: icon,
        title: title,
      ),
    );
  }
}
