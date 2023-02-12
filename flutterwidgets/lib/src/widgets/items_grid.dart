import 'package:flutter/material.dart';
import 'package:flutterwidgets/src/core/typography.dart';

import 'package:flutterwidgets/src/notifiers/search_notifier.dart';
import 'package:flutterwidgets/src/widgets/single_grid_item.dart';

class ItemsGrid extends StatelessWidget {
  final SearchNotifier searchNotifier;
  const ItemsGrid({
    Key? key,
    required this.searchNotifier,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: searchNotifier.itemsToShow,
        builder: ((context, value, child) =>
            searchNotifier.itemsToShow.value.isEmpty && !searchNotifier.isInitialising.value
                ? Center(
                    child: Text(
                        "No results found :( \n\nWe're constantly adding new widgets and UIs, stay tuned!",
                        textAlign: TextAlign.center,
                        style: AppTypography.poppins(
                            color: Colors.yellowAccent, size: 15)),
                  )
                : GridView.builder(
                    shrinkWrap: true,
                    physics: ScrollPhysics(),
                    padding: EdgeInsets.fromLTRB(40, 0, 40, 100),
                    itemCount: searchNotifier.itemsToShow.value.length,
                    itemBuilder: (_, i) {
                      final item = searchNotifier.itemsToShow.value[i];
                      return SingleGridItem(item: item);
                    },
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount:
                          _getGridViewRowCount(MediaQuery.of(context).size),
                      childAspectRatio: 1,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20,
                    ),
                  )));
  }

  _getGridViewRowCount(Size size) {
    if (size.width > 1800)
      return 6;
    else if (size.width > 1500)
      return 5;
    else if (size.width > 1200)
      return 4;
    else if (size.width > 600) return 3;
    return 1;
  }
}
