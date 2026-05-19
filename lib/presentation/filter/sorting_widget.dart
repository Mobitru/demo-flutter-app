import 'package:flutter/material.dart';
import 'package:flutter_demo_app/consts/accessibility.dart';
import 'package:flutter_demo_app/consts/colors.dart';
import 'package:flutter_demo_app/consts/maps.dart';
import 'package:flutter_demo_app/consts/sizes.dart';
import 'package:flutter_demo_app/l10n/app_localizations.dart';
import 'package:flutter_demo_app/presentation/common/app_bar.dart';
import 'package:flutter_demo_app/presentation/common/button_widget.dart';

class SortingWidget extends StatefulWidget {
  final SortingType sorting;
  final ValueChanged<SortingType> update;

  const SortingWidget({
    required this.sorting,
    required this.update,
    super.key,
  });

  @override
  SortingState createState() => SortingState();
}

class SortingState extends State<SortingWidget> {
  late SortingType _sorting;

  @override
  void initState() {
    super.initState();
    _sorting = widget.sorting;
  }

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (_, orientation) => SafeArea(
        child: SafeArea(
          child: Scaffold(
            appBar: getAppBar(context, AppLocalizations.of(context)!.sortingLabel),
            body: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: primaryPadding,
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 224,
                    child: ListView(
                        physics: const NeverScrollableScrollPhysics(),
                        children: ListTile.divideTiles(
                          context: context,
                          tiles: SortingType.values.map(
                            (key) => InkWell(
                              onTap: () => setState(() {
                                _sorting = key;
                              }),
                              child: Semantics(
                                excludeSemantics: true,
                                label: '$accessibilitySortingOption ${key.localizedName(context)}',
                                child: ListTile(
                                  title: Text(
                                    key.localizedName(context),
                                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                                          height: 1.2,
                                          fontWeight: FontWeight.w300,
                                          color: key == _sorting ? sortingColor : Colors.black,
                                        ),
                                  ),
                                  trailing: key == _sorting
                                      ? const Icon(
                                          Icons.check,
                                          color: sortingColor,
                                        )
                                      : null,
                                ),
                              ),
                            ),
                          ),
                        ).toList()),
                  ),
                  Expanded(
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: ButtonWidget(
                        padding: const EdgeInsets.symmetric(vertical: primaryPadding),
                        color: primaryColor,
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge
                            ?.copyWith(height: 1.5, color: Colors.white),
                        size: const Size(double.infinity, primaryPadding * 3),
                        callback: () => widget.update(_sorting),
                        title: AppLocalizations.of(context)!.applyButtonTitle,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
