import 'package:flutter/material.dart';
import 'package:flutter_demo_app/consts/maps.dart';
import 'package:flutter_demo_app/consts/sizes.dart';
import 'package:flutter_demo_app/consts/strings.dart';
import 'package:flutter_demo_app/model/product.dart';
import 'package:flutter_demo_app/presentation/products/product_card.dart';
import 'package:flutter_demo_app/presentation/products/sorting_icon.dart';
import 'package:flutter_demo_app/state/products_state.dart';
import 'package:flutter_demo_app/types.dart';
import 'package:go_router/go_router.dart';

class ProductsPage extends StatelessWidget {
  final List<Product> products;
  final Sorting sorting;
  final ValueChanged<MapEntry<Product, int>> add;
  final IsValueChanged<Product> check;

  const ProductsPage({
    required this.products,
    super.key,
    required this.add,
    required this.check,
    required this.sorting,
  });

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Padding(
        padding:
            const EdgeInsets.symmetric(horizontal: primaryPadding, vertical: primaryPadding / 2),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text(
            '$mobilePhonesLabel (${products.length})',
            semanticsLabel: 'category',
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600, height: 1.3),
          ),
          Semantics(
            label: sortingMap[sorting],
            excludeSemantics: true,
            child: InkWell(
              onTap: () => context.go('/$appNavigationSort'),
              child: SortingIcon(
                sorting: sorting,
              ),
            ),
          ),
        ]),
      ),
      Expanded(
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverGrid(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount:
                    (MediaQuery.of(context).orientation == Orientation.portrait) ? 2 : 4,
                childAspectRatio: 0.7,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              delegate: SliverChildBuilderDelegate(
                addSemanticIndexes: false,
                (context, index) => ProductCard(
                  products[index],
                  semanticsIndex: index,
                  isBooked: check(products[index]),
                  onTap: () => add(MapEntry(products[index], check(products[index]) ? 0 : 1)),
                ),
                childCount: products.length,
              ),
            ),
          ],
        ),
      )
    ]);
  }
}
