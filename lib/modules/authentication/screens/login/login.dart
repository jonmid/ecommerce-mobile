import 'package:app_mobile/common/styles/spacing_styles.dart';
import 'package:app_mobile/common/widgets/login_sign_up/form_divider.dart';
import 'package:app_mobile/common/widgets/login_sign_up/social_buttons.dart';
import 'package:app_mobile/modules/authentication/screens/login/widgets/login_form.dart';
import 'package:app_mobile/modules/authentication/screens/login/widgets/login_header.dart';
import 'package:app_mobile/utils/constants/sizes.dart';
import 'package:app_mobile/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

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
              const LoginForm(),

              /// Divider
              FormDivider(dividerText: AppText.orSignInWith.capitalize!),
              const SizedBox(height: AppSizes.spaceBtwSections),

              /// Footer
              const SocialButtons(),
            ],
          ),
        ),
      ),
    );
  }
}
