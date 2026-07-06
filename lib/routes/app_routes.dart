import 'package:get/get.dart';
import 'package:flutter_firebase_ecommerce_app/features/shop/screens/home/home.dart';
import 'package:flutter_firebase_ecommerce_app/features/shop/screens/store/store.dart';
// Import your other screens...
import 'routes.dart';

class AppRoutes {
  static final pages = [
    GetPage(name: TRoutes.home, page: () => const HomeScreen()),
    GetPage(name: TRoutes.store, page: () => const StoreScreen()),
    // GetPage(name: TRoutes.favorites, page: () => const FavouriteScreen()),
    // GetPage(name: TRoutes.settings, page: () => const SettingsScreen()),
  ];
}