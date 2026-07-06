import 'package:get/get.dart';
import 'package:flutter_firebase_ecommerce_app/data/repositories_authentication/banners/banner_repository.dart';
import 'package:flutter_firebase_ecommerce_app/features/shop/models/banner_model.dart';


class BannerController extends GetxController {
  static BannerController get instance => Get.find();

  // Variables
  final isLoading = false.obs;
  final carousalCurrentIndex = 0.obs;
  final RxList<BannerModel> banners = <BannerModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    // We just call the function here. No print statements inside the parentheses!
    fetchBanners(); 
  }

  // Update Page Nav Dots
  void updatePageIndicator(index) {
    carousalCurrentIndex.value = index;
  }

  // Fetch Banners
  // Notice we removed "void print" from the parameters here.
  Future<void> fetchBanners() async { 
    try {
      // Show loader while fetching
      isLoading.value = true;

      // Fetch Banners from Repository
      final bannerRepo = Get.put(BannerRepository());
      final fetchedBanners = await bannerRepo.fetchBanners();

      // Assign Banners
      banners.assignAll(fetchedBanners);

      // --- DIAGNOSTIC PRINT STATEMENT ---
      // We safely check the data AFTER it arrives from Firebase.
      if (banners.isNotEmpty) {
        print('--- FETCHED BANNER URL: ${banners.first.imageUrl} ---');
      } else {
        print('--- FETCHED BANNER URL: LIST IS EMPTY ---');
      }

    } catch (e) {
      // You can replace this with your custom error snackbar (e.g., TLoaders.errorSnackBar)
      print(e.toString());
    } finally {
      // Stop loader
      isLoading.value = false;
    }
  }
}