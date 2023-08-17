import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_demo_app/consts/assets.dart';
import 'package:flutter_demo_app/model/order.dart';
import 'package:injectable/injectable.dart';

@injectable
class OrdersRepository {
  final List<ProductOrder> orders;

  OrdersRepository(this.orders);

  @FactoryMethod(preResolve: true)
  static Future<OrdersRepository> init() async {
    var data = await rootBundle.loadString(ordersUri);
    final orders = List<ProductOrder>.from(
      json.decode(data).map((model) => ProductOrder.fromJson(model)),
    );
    return OrdersRepository(orders);
  }
}
