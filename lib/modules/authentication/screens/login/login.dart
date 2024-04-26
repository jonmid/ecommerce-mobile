import 'package:app_mobile/generated/app_localizations.dart';
import 'package:app_mobile/modules/common/controllers/general_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final GeneralController generalController = Get.put(GeneralController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          title: const Text('Login'),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        body: Center(
          child: Column(
            children: [
              Text(
                AppLocalizations.of(context).onboarding('onBoardingTitle1'),
              ),
              Text(generalController.language.value),
              TextButton(
                onPressed: () => generalController.changeLanguage(
                    generalController.language.value == 'es' ? 'en' : 'es'),
                child: const Text('Click here'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
