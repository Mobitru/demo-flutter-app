import 'package:flutter/material.dart';
import 'package:flutter_demo_app/l10n/app_localizations.dart';

enum SortingType {
  ascendingPrice,
  descendingPrice,
  ascendingAZ,
  descendingAZ,
}

extension SortExt on SortingType {
  bool get isAsc => this == SortingType.ascendingPrice || this == SortingType.ascendingAZ;

  bool get isPrice => this == SortingType.ascendingPrice || this == SortingType.descendingPrice;

  String localizedName(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    switch (this) {
      case SortingType.ascendingPrice:
        return l10n.sortPriceAscending;
      case SortingType.descendingPrice:
        return l10n.sortPriceDescending;
      case SortingType.ascendingAZ:
        return l10n.sortNameAZ;
      case SortingType.descendingAZ:
        return l10n.sortNameZA;
    }
  }
}