import 'package:cloud_firestore/cloud_firestore.dart';

class ProductModel {
  String id;
  String title;
  double price;
  String thumbnail;
  String categoryId;
  String brandName;
  String description;
  bool isFeatured; // Added to match repository filter query

  ProductModel({
    required this.id,
    required this.title,
    required this.price,
    required this.thumbnail,
    required this.categoryId,
    required this.brandName,
    this.description = '',
    this.isFeatured = false,
  });

  static ProductModel empty() => ProductModel(
        id: '',
        title: '',
        price: 0.0,
        thumbnail: '',
        categoryId: '',
        brandName: '',
        description: '',
        isFeatured: false,
      );

  // Factory to create from Firestore
  factory ProductModel.fromSnapshot(DocumentSnapshot document) {
    if (document.data() == null) return ProductModel.empty();
    
    final data = document.data() as Map<String, dynamic>;
    return ProductModel(
      id: document.id,
      title: data['Title'] ?? '',
      price: double.tryParse((data['Price'] ?? 0.0).toString()) ?? 0.0, // Using tryParse is safer against corrupt database values
      thumbnail: data['Thumbnail'] ?? '',
      categoryId: data['CategoryId'] ?? '',
      brandName: data['Brand'] ?? '',
      description: data['Description'] ?? '', // Added description mapping
      isFeatured: data['isFeatured'] ?? false, // Added isFeatured mapping
    );
  }
}