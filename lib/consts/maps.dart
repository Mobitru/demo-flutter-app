import 'package:flutter_demo_app/state/products_state.dart';

const sortingMap = {
  Sorting.ascendingPrice: 'Price ascending',
  Sorting.descendingPrice: 'Price descending',
  Sorting.ascendingAZ: 'Product name A-Z',
  Sorting.descendingAZ: 'Product name Z-A',
};

extension SortExt on Sorting {
  bool get isAsc => this == Sorting.ascendingPrice || this == Sorting.ascendingAZ;

  bool get isPrice => this == Sorting.ascendingPrice || this == Sorting.descendingPrice;
}