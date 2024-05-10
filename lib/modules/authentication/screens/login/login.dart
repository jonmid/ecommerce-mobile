import 'package:app_mobile/common/styles/spacing_styles.dart';
import 'package:app_mobile/common/widgets/login_sign_up/form_divider.dart';
// import 'package:app_mobile/common/widgets/login_sign_up/social_buttons.dart';
// import 'package:app_mobile/modules/authentication/screens/login/widgets/login_form.dart';
import 'package:app_mobile/modules/authentication/screens/login/widgets/login_header.dart';
import 'package:app_mobile/modules/products/screens/list_product.dart';
import 'package:app_mobile/utils/constants/colors.dart';
import 'package:app_mobile/utils/constants/image_strings.dart';
import 'package:app_mobile/utils/constants/sizes.dart';
import 'package:app_mobile/utils/constants/text_strings.dart';
import 'package:app_mobile/utils/services/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final FirebaseAuthService _auth = FirebaseAuthService(); // 👈👀
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Future<void> signIn(BuildContext context) async {
    String email = _emailController.text.trim();
    String pass = _passwordController.text.trim();

    final user = await _auth.signInWithEmailAndPassword(email, pass);

    if (user != null) {
      print('Usuario si existe');
      Get.to(const ListProduct());
    } else {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('The user / password incorrect'),
          duration: Duration(seconds: 3),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: TSpacingStyles.paddingWithAppBarHeight,
          child: Column(
            children: [
              /// Logo, Title and Subtitle
              const LoginHeader(),

              /// Form
              Form(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: AppSizes.spaceBtwSections,
                  ),
                  child: Column(
                    children: [
                      /// Email
                      TextFormField(
                        controller: _emailController,
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Iconsax.direct_right),
                          labelText: AppText.email,
                        ),
                      ),
                      const SizedBox(height: AppSizes.spaceBtwInputFields),

                      /// Password
                      TextFormField(
                        obscureText: true,
                        controller: _passwordController,
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Iconsax.password_check),
                          labelText: AppText.password,
                          suffixIcon: const Icon(Iconsax.eye_slash),
                        ),
                      ),
                      const SizedBox(height: AppSizes.spaceBtwInputFields / 2),

                      /// Remember Me and Forget Password
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          /// Remember me
                          Row(
                            children: [
                              Checkbox(value: false, onChanged: (value) {}),
                              Text(AppText.rememberMe),
                            ],
                          ),

                          /// Forget Password
                          TextButton(
                            onPressed: () {},
                            child: Text(AppText.forgetPassword),
                          ),
                        ],
                      ),
                      const SizedBox(height: AppSizes.spaceBtwSections),

                      /// Sign In Button
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            signIn(context);
                          },
                          child: Text(AppText.signIn),
                        ),
                      ),
                      const SizedBox(height: AppSizes.spaceBtwItems),

                      /// Create Account Button
                      SizedBox(
                        width: double.infinity,
                        child: OutlinedButton(
                          onPressed: () {},
                          child: Text(AppText.createAccount),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              /// Divider
              FormDivider(dividerText: AppText.orSignInWith.capitalize!),
              const SizedBox(height: AppSizes.spaceBtwSections),

              /// Footer
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColors.grey),
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: IconButton(
                      onPressed: () {},
                      icon: const Image(
                        width: AppSizes.iconMd,
                        height: AppSizes.iconMd,
                        image: AssetImage(AppImage.google),
                      ),
                    ),
                  ),
                  const SizedBox(width: AppSizes.spaceBtwItems),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColors.grey),
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: IconButton(
                      onPressed: () {},
                      icon: const Image(
                        width: AppSizes.iconMd,
                        height: AppSizes.iconMd,
                        image: AssetImage(AppImage.facebook),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
