import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_demo_app/consts/assets.dart';
import 'package:flutter_demo_app/model/product.dart';
import 'package:injectable/injectable.dart';

@injectable
class ProductsRepository {
  final List<Product> products;

  ProductsRepository(this.products);

  @FactoryMethod(preResolve: true)
  static Future<ProductsRepository> init() async {
    var data = await rootBundle.loadString(productsUri);
    final products = List<Product>.from(
      json.decode(data).map((model) => Product.fromJson(model)),
    );
    return ProductsRepository(products);
  }
}
