import 'package:cloud_firestore/cloud_firestore.dart';

class ProductModel {
  String id;
  String title;
  double price;
  String thumbnail;
  String categoryId;
  String brandName;
  String description;

  ProductModel({
    required this.id,
    required this.title,
    required this.price,
    required this.thumbnail,
    required this.categoryId,
    required this.brandName,
    this.description = '',
  });

  static ProductModel empty() => ProductModel(
    id: '',
    title: '',
    price: 0.0,
    thumbnail: '',
    categoryId: '',
    brandName: '',
  );

  // Factory to create from Firestore
  factory ProductModel.fromSnapshot(DocumentSnapshot document) {
    final data = document.data() as Map<String, dynamic>;
    return ProductModel(
      id: document.id,
      title: data['Title'] ?? '',
      price: double.parse((data['Price'] ?? 0.0).toString()),
      thumbnail: data['Thumbnail'] ?? '',
      categoryId: data['CategoryId'] ?? '',
      brandName: data['Brand'] ?? '',
    );
  }
}
