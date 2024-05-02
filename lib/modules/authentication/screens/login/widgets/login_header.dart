import 'package:app_mobile/utils/constants/image_strings.dart';
import 'package:app_mobile/utils/constants/sizes.dart';
import 'package:app_mobile/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class LoginHeader extends StatelessWidget {
  const LoginHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SvgPicture.asset(
          AppImage.onLogo,
          height: 150,
        ),
        const SizedBox(height: AppSizes.spaceBtwSections),
        Text(
          AppText.loginTitle,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        const SizedBox(height: AppSizes.sm),
        Text(
          AppText.loginSubTitle,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ],
    );
  }
}
