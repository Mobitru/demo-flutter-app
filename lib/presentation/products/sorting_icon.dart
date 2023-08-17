import 'package:flutter/cupertino.dart';
import 'package:flutter_demo_app/consts/colors.dart';
import 'package:flutter_demo_app/consts/maps.dart';
import 'package:flutter_demo_app/consts/strings.dart';
import 'package:flutter_demo_app/state/products_state.dart';

class SortingIcon extends StatelessWidget {
  const SortingIcon({
    super.key,
    required this.sorting,
  });

  final Sorting sorting;

  @override
  Widget build(BuildContext context) {
    return Wrap(crossAxisAlignment: WrapCrossAlignment.center, children: [
      Icon(
        sorting.isAsc ? CupertinoIcons.sort_up : CupertinoIcons.sort_down,
        color: sortingColor,
      ),
      Text(
        sorting.isPrice ? priceLabel : azLabel,
        style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w300, color: sortingColor),
      )
    ]);
  }
}
