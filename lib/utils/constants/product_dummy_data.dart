import 'package:flutter_firebase_ecommerce_app/features/shop/models/product_model.dart';
import 'package:flutter_firebase_ecommerce_app/utils/constants/image_strings.dart';

class TProductDummyData {
  static final List<ProductModel> products = [
    // Sports Category (Assuming ID is '1')
    ProductModel(
      id: 'prod001',
      title: 'Nike Air Max Running Shoes',
      price: 135.0,
      thumbnail: TImages.productImage43, // Local asset path
      categoryId: '1', 
      brandName: 'Nike',
      description: 'Comfortable running shoes with premium cushioning.',
    ),
    ProductModel(
      id: 'prod002',
      title: 'Adidas Predator Football Boots',
      price: 150.0,
      thumbnail: TImages.productImage6,
      categoryId: '1',
      brandName: 'Adidas',
    ),

    // Electronics Category (Assuming ID is '2')
    ProductModel(
      id: 'prod003',
      title: 'iPhone 15 Pro Max 256GB',
      price: 1199.0,
      thumbnail: TImages.productImage68,
      categoryId: '2',
      brandName: 'Apple',
    ),
  ];
}