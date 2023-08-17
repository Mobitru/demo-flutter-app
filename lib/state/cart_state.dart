import 'package:flutter/material.dart';
import 'package:flutter_demo_app/consts/values.dart';
import 'package:flutter_demo_app/model/order.dart';
import 'package:flutter_demo_app/model/payment_details.dart';
import 'package:flutter_demo_app/model/product.dart';
import 'package:flutter_demo_app/model/product_info.dart';
import 'package:flutter_demo_app/repository/users_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class CartState with ChangeNotifier {
  final UsersRepository _usersRepository;
  final products = <Product, int>{};
  var discountCode = '';

  ProductOrder? order;

  ProductOrder generateOrder() {
    var sum = 0.0;
    var subtotal = 0.0;
    var discount = 0.0;
    const packagingFee = 0.29;
    const deliveryFee = 11.50;
    for (final e in products.entries) {
      sum += (discountCode.isNotEmpty
                  ? (e.key.price * (100 - qrCodeDiscount) / 100)
                  : (e.key.discountPrice ?? e.key.price)) *
              e.value +
          packagingFee +
          deliveryFee;
      subtotal += e.key.price * e.value;
      discount += (discountCode.isNotEmpty
              ? (e.key.price * qrCodeDiscount) / 100
              : e.key.price - (e.key.discountPrice ?? 0)) *
          e.value;
    }

    return ProductOrder(
        id: '3429900234',
        products:
            products.keys.map((e) => ProductInfo(product: e, quantity: products[e]!)).toList(),
        user: _usersRepository.currentUser!,
        paymentDetails: PaymentDetails(
            packagingFee: packagingFee,
            subtotal: subtotal,
            deliveryFee: deliveryFee,
            total: sum,
            discount: discount),
        state: 'IN PROGRESS');
  }

  CartState(this._usersRepository);

  void addOrRemoveToCart(MapEntry<Product, int> product) {
    if (products.keys.contains(product.key)) {
      if (product.value < 1) {
        products.remove(product.key);
      } else {
        products[product.key] = product.value;
      }
    } else {
      products[product.key] = 1;
    }
    notifyListeners();
  }

  void updateDiscount([String code = '']) {
    discountCode = code;
    notifyListeners();
  }

  void processOrder(ProductOrder order) {
    this.order = order;
    products.clear();
    notifyListeners();
  }

  void logout() {
    order = null;
    products.clear();
    notifyListeners();
  }
}
