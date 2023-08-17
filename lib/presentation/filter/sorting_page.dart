import 'package:flutter/material.dart';
import 'package:flutter_demo_app/presentation/filter/sorting_widget.dart';
import 'package:flutter_demo_app/state/products_state.dart';
import 'package:provider/provider.dart';

class SortingPage extends StatelessWidget {
  const SortingPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<ProductsState>(
        builder: (_, state, __) => SortingWidget(
              sorting: state.sorting,
              update: (sorting) {
                state.applySorting(sorting);
                Navigator.of(context).pop();
              },
            ));
  }
}
