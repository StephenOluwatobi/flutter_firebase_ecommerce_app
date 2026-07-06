import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:flutter_firebase_ecommerce_app/features/shop/models/product_model.dart';
import 'package:flutter_firebase_ecommerce_app/utils/helpers/cloudinary_service.dart';
import 'package:flutter_firebase_ecommerce_app/utils/popups/full_screen_loader.dart';
import 'package:flutter_firebase_ecommerce_app/utils/popups/loaders.dart';

class ProductRepository extends GetxController {
  static ProductRepository get instance => Get.find();
  
  final _db = FirebaseFirestore.instance;

  /// Fetch products based on category
  Future<List<ProductModel>> getProductsForCategory(String categoryId) async {
    try {
      final snapshot = await _db.collection('Products')
          .where('CategoryId', isEqualTo: categoryId)
          .limit(4) // Limiting for the "You Might Like" section
          .get();
      
      return snapshot.docs.map((doc) => ProductModel.fromSnapshot(doc)).toList();
    } catch (e) {
      throw 'Error fetching products: $e';
    }
  }

  /// Upload Dummy Products to Cloudinary and Cloud Firestore
  Future<void> uploadProductDummyData(List<ProductModel> products) async {
    try {
      // 1. Start Loader (Pass your Lottie animation string if needed, or leave empty)
      TFullScreenLoader.openLoadingDialog('Uploading Products to Cloud...', '');

      // 2. Loop through all products
      for (var product in products) {
        final localImage = product.thumbnail;

        // 3. Upload the asset thumbnail to Cloudinary
        final imageUrl = await CloudinaryService.uploadAssetImage(localImage);

        if (imageUrl != null) {
          // 4. Update the thumbnail with the Cloudinary URL
          product.thumbnail = imageUrl;

          // 5. Save product to Firestore
          await _db.collection('Products').doc(product.id).set({
            'Title': product.title,
            'Price': product.price,
            'Thumbnail': product.thumbnail,
            'CategoryId': product.categoryId,
            'Brand': product.brandName,
            'Description': product.description,
          });
        } else {
          print('Failed to upload image for product: ${product.title}');
        }
      }

      TFullScreenLoader.stopLoading();
      TLoaders.successSnackBar(title: 'Success', message: 'All products uploaded perfectly!');
      
    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
    }
  }
}