import 'package:flutter/material.dart';
import 'package:flutter_demo_app/model/order.dart';
import 'package:flutter_demo_app/repository/orders_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class OrdersState with ChangeNotifier {
  final OrdersRepository _ordersRepository;

  List<ProductOrder> get orders => _ordersRepository.orders;

  OrdersState(this._ordersRepository);
}
