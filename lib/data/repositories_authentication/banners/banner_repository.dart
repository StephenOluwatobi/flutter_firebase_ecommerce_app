import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:flutter_firebase_ecommerce_app/features/shop/models/banner_model.dart';

class BannerRepository extends GetxController {
  static BannerRepository get instance => Get.find();

  // Variables
  final _db = FirebaseFirestore.instance;

  /// Get all active banners
  Future<List<BannerModel>> fetchBanners() async {
    try {
      // Notice the .where() clause! We only want banners where active is true.
      final result = await _db.collection('Banners').where('active', isEqualTo: true).get();
      return result.docs.map((documentSnapshot) => BannerModel.fromSnapshot(documentSnapshot)).toList();
      
    } on FirebaseException catch (e) {
      throw 'Firebase Error: ${e.message}';
    } catch (e) {
      throw 'Something went wrong while fetching banners.';
    }
  }
}