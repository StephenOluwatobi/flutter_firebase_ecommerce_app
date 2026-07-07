import 'package:flutter/material.dart';
import 'package:flutter_firebase_ecommerce_app/data/repositories_authentication/product/product_repository.dart';
import 'package:flutter_firebase_ecommerce_app/features/personalization/ChangeUsername.dart';
import 'package:flutter_firebase_ecommerce_app/features/personalization/change_name.dart';
import 'package:flutter_firebase_ecommerce_app/features/personalization/change_phone_number.dart';
import 'package:flutter_firebase_ecommerce_app/utils/constants/product_dummy_data.dart';
import 'package:get/get.dart'; // Import GetX
import 'package:flutter_firebase_ecommerce_app/common/widgets/appbar/appbar.dart';
import 'package:flutter_firebase_ecommerce_app/common/widgets/images/t_circular_image.dart';
import 'package:flutter_firebase_ecommerce_app/common/widgets/texts/section_heading.dart';
import 'package:flutter_firebase_ecommerce_app/features/personalization/screens/profile/widgets/profile_menu.dart';
import 'package:flutter_firebase_ecommerce_app/utils/constants/image_strings.dart';
import 'package:flutter_firebase_ecommerce_app/utils/constants/sizes.dart';
import 'package:iconsax/iconsax.dart';
// Import the controllers and screens
import 'package:flutter_firebase_ecommerce_app/features/personalization/controllers/user_controller.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // 1. Get the instance of the UserController (it should already be initialized from the Home screen)
    final controller = UserController.instance;

    return Scaffold(
      appBar: const TAppBar(
        showBackArrow: true,
        title: Text('Profile'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              /// Profile Picture
              SizedBox(
                child: Column(
                  children: [
                    const TCircularImage(
                      image: TImages.user,
                      width: 80,
                      height: 80,
                      applyImageRadius: true,
                    ),
                    TextButton(
                      onPressed: () => controller
                          .uploadUserProfilePicture(), // We will implement the image picker later!
                      child: const Text('Change Profile Picture'),
                    ),
                  ],
                ),
              ),

              /// Details
              const SizedBox(height: TSizes.spaceBtwItems / 2),
              const Divider(),
              const SizedBox(height: TSizes.spaceBtwItems),

              /// Heading Profile Information
              const TSectionHeading(
                title: 'Profile Information',
                showActionButton: false,
              ),
              const SizedBox(height: TSizes.spaceBtwItems),

              // 2. Wrap the dynamic fields in Obx so they update automatically
              Obx(
                () => TProfileMenu(
                  // 3. Navigate to the Change Name screen when tapped
                  onPressed: () => Get.to(() => const ChangeName()),
                  icon: Iconsax.edit,
                  title: 'Name',
                  value: controller.user.value.fullName, // REAL DATA
                ),
              ),

              Obx(
                () => TProfileMenu(
                  onPressed: () =>
                      Get.to(() => const ChangeUsername()),
                  icon: Iconsax.edit,
                  title: 'Username',
                  value: controller.user.value.username, // REAL DATA
                ),
              ),

              const Divider(),
              const SizedBox(height: TSizes.spaceBtwItems),

              /// Heading Personal Information
              const TSectionHeading(
                title: 'Personal Information',
                showActionButton: false,
              ),
              const SizedBox(height: TSizes.spaceBtwItems),

              Obx(
                () => TProfileMenu(
                  onPressed:
                      () {}, // You could copy to clipboard here
                  title: 'User ID',
                  value: controller.user.value.id, // REAL DATA
                  icon: Iconsax.copy,
                ),
              ),

              Obx(
                () => TProfileMenu(
                  onPressed: () {},
                  title: 'E-mail',
                  value: controller.user.value.email, // REAL DATA
                ),
              ),

              Obx(
                () => TProfileMenu(
                  onPressed: () =>
                      Get.to(() => const ChangePhoneNumber()),
                  icon: Iconsax.edit,
                  title: 'Phone Number',
                  value:
                      controller.user.value.phoneNumber, // REAL DATA
                ),
              ),

              // Note: Gender and DOB aren't in your standard UserModel yet, so leave them static for now or add them to the model later.
              TProfileMenu(
                onPressed: () {},
                title: 'Gender',
                value: 'Male',
              ),
              TProfileMenu(
                onPressed: () {},
                title: 'Date of Birth',
                value: '12th Jan, 1998',
              ),
              const Divider(),
              const SizedBox(height: TSizes.spaceBtwItems),

              Center(
                child: TextButton(
                  onPressed: () => UserController.instance
                      .deleteAccountWarningPopup(), // We will wire this to the delete function next!
                  child: const Text(
                    'Delete Account',
                    style: TextStyle(color: Colors.red),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
