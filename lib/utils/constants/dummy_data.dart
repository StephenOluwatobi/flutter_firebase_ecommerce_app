import 'package:flutter_firebase_ecommerce_app/data/repositories_authentication/category/category_model.dart';

import 'package:flutter_firebase_ecommerce_app/utils/constants/image_strings.dart';

class TDummyData {
  /// -- List of all Categories
  static final List<CategoryModel> categories = [
    // ---------------------------------------------------------
    // MAIN CATEGORIES (parentId is empty)
    // ---------------------------------------------------------
    CategoryModel(id: '1', image: TImages.sportIcon, name: 'Sports', isFeatured: true),
    CategoryModel(id: '2', image: TImages.electronicsIcon, name: 'Electronics', isFeatured: true),
    CategoryModel(id: '3', image: TImages.clothIcon, name: 'Clothes', isFeatured: true),
    CategoryModel(id: '4', image: TImages.animalIcon, name: 'Animals', isFeatured: true),
    CategoryModel(id: '5', image: TImages.furnitureIcon, name: 'Furniture', isFeatured: true),
    CategoryModel(id: '6', image: TImages.shoeIcon, name: 'Shoes', isFeatured: true),
    CategoryModel(id: '7', image: TImages.cosmeticsIcon, name: 'Cosmetics', isFeatured: true),
    CategoryModel(id: '8', image: TImages.jeweleryIcon, name: 'Jewelry', isFeatured: true),

    // ---------------------------------------------------------
    // SUB-CATEGORIES (parentId matches a Main Category ID)
    // ---------------------------------------------------------
    // Sub-categories for Sports (Parent ID: 1)
    CategoryModel(id: '9', image: TImages.sportIcon, name: 'Sport Shoes', parentId: '1', isFeatured: false),
    CategoryModel(id: '10', image: TImages.sportIcon, name: 'Track suits', parentId: '1', isFeatured: false),
    CategoryModel(id: '11', image: TImages.sportIcon, name: 'Sports Equipment', parentId: '1', isFeatured: false),

    // Sub-categories for Electronics (Parent ID: 2)
    CategoryModel(id: '12', image: TImages.electronicsIcon, name: 'Laptops', parentId: '2', isFeatured: false),
    CategoryModel(id: '13', image: TImages.electronicsIcon, name: 'Mobiles', parentId: '2', isFeatured: false),

    // Sub-categories for Clothes (Parent ID: 3)
    CategoryModel(id: '14', image: TImages.clothIcon, name: 'Shirts', parentId: '3', isFeatured: false),
  ];
}