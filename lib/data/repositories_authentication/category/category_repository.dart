import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:flutter_firebase_ecommerce_app/data/repositories_authentication/category/category_model.dart';
import 'package:flutter_firebase_ecommerce_app/utils/helpers/cloudinary_service.dart';
import 'package:flutter_firebase_ecommerce_app/utils/popups/full_screen_loader.dart';
import 'package:flutter_firebase_ecommerce_app/utils/popups/loaders.dart';

class CategoryRepository extends GetxController {
  static CategoryRepository get instance => Get.find();

  /// Variables
  final _db = FirebaseFirestore.instance;

  /// Get all categories
  Future<List<CategoryModel>> getAllCategories() async {
    try {
      // 1. Fetch data from Firestore 'Categories' collection
      final snapshot = await _db.collection('Categories').get();
      
      // 2. Map the JSON data to our CategoryModel
      final list = snapshot.docs.map((document) => CategoryModel.fromSnapshot(document)).toList();
      
      return list;
      
    } on FirebaseException catch (e) {
      throw 'Firebase Error: ${e.message}';
    } on PlatformException catch (e) {
      throw 'Platform Error: ${e.message}';
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  /// Upload Dummy Data to Cloudinary and Cloud Firestore
  Future<void> uploadDummyData(List<CategoryModel> categories) async {
    try {
      // 1. Show loader (Make sure you pass the correct animation string if needed, or an empty string)
      TFullScreenLoader.openLoadingDialog('Uploading Categories...', '');

      // 2. Loop through all the categories in your Dummy Data
      for (var category in categories) {
        // Grab the local asset path (e.g., 'assets/icons/categories/sportIcon.png')
        final localImage = category.image;

        // 3. Upload the asset to Cloudinary
        final imageUrl = await CloudinaryService.uploadAssetImage(localImage);

        if (imageUrl != null) {
          // 4. Replace the local asset path with the new Cloudinary web URL
          category.image = imageUrl;

          // 5. Save this updated category to Firebase Firestore
          await _db.collection('Categories').doc(category.id).set(category.toJson());
        } else {
          print('Failed to upload image for category: ${category.name}');
        }
      }

      TFullScreenLoader.stopLoading();
      TLoaders.successSnackBar(title: 'Success', message: 'All categories uploaded securely!');
      
    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
    }
  }
}