import 'package:flutter/material.dart';
import 'package:flutter_firebase_ecommerce_app/common/widgets/appbar/appbar.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen ({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /// AppBar
      appBar: TAppBar(
        title: Text('My Orders'),
      ),
    );
  }
  
  
}