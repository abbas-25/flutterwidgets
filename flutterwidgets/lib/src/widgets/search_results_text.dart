import 'package:flutter/material.dart';

import 'package:flutterwidgets/src/core/typography.dart';
import 'package:flutterwidgets/src/notifiers/search_notifier.dart';

class SearchResultsForText extends StatelessWidget {
  final SearchNotifier searchNotifier;
  const SearchResultsForText({
    Key? key,
    required this.searchNotifier,
    required this.searchController,
  }) : super(key: key);

  final TextEditingController searchController;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: searchNotifier.isLoadingItems,
      builder: (context, _ , __) {
        return AnimatedCrossFade(
          crossFadeState: searchController.text.isEmpty
              ? CrossFadeState.showFirst
              : CrossFadeState.showSecond,
          duration: Duration(milliseconds: 200),
          firstChild: Container(),
          secondChild: Padding(
            padding: EdgeInsets.only(top: 20),
            child: Text("Search Results for - ${searchController.text}",
                style: AppTypography.poppins(color: Colors.white)),
          ),
        );
      }
    );
  }
}
