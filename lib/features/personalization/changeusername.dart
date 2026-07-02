import 'package:flutter/material.dart';
import 'package:flutter_firebase_ecommerce_app/features/personalization/controllers/UpdateNameController.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:flutter_firebase_ecommerce_app/common/widgets/appbar/appbar.dart';
import 'package:flutter_firebase_ecommerce_app/utils/constants/sizes.dart';

import 'package:flutter_firebase_ecommerce_app/utils/validators/validation.dart';

class ChangeUsername extends StatelessWidget {
  const ChangeUsername({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UpdateNameController());

    return Scaffold(
      appBar: const TAppBar(showBackArrow: true, title: Text('Change Username')),
      body: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          children: [
            Form(
              key: controller.updateUserNameFormKey,
              child: TextFormField(
                controller: controller.username, // Only using the username controller
                validator: (value) => TValidator.validateEmptyText('Username', value),
                decoration: const InputDecoration(labelText: 'Username', prefixIcon: Icon(Iconsax.user_edit)),
              ),
            ),
            const SizedBox(height: TSizes.spaceBtwSections),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => controller.updateUserName(),
                child: const Text('Save'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}