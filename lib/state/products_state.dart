import 'package:flutter/material.dart';
import 'package:flutter_demo_app/consts/maps.dart';
import 'package:flutter_demo_app/model/product.dart';
import 'package:flutter_demo_app/repository/products_repository.dart';
import 'package:injectable/injectable.dart';

enum Sorting {
  ascendingPrice,
  descendingPrice,
  ascendingAZ,
  descendingAZ,
}

@injectable
class ProductsState with ChangeNotifier {
  final ProductsRepository _productsRepository;

  var sorting = Sorting.ascendingPrice;

  List<Product> get products => _productsRepository.products;

  ProductsState(this._productsRepository) {
    _productsRepository.products.sort((A, B) => _comparePrice(A, B, sorting.isAsc));
  }

  void applySorting(Sorting sorting) {
    this.sorting = sorting;
    products.sort(sorting.isPrice
        ? (A, B) => _comparePrice(A, B, sorting.isAsc)
        : (A, B) => _compareName(A, B, sorting.isAsc));
    notifyListeners();
  }

  int _comparePrice(Product A, Product B, bool isAsc) =>
      isAsc ? ((A.discountPrice??A.price) - (B.discountPrice??B.price)).round() : ((B.discountPrice??B.price) - (A.discountPrice??A.price)).round();
  int _compareName(Product A, Product B, bool isAsc) =>
      isAsc ? A.name.compareTo(B.name) : B.name.compareTo(A.name);

  void logout() {
    sorting = Sorting.ascendingPrice;
    notifyListeners();
  }
}
