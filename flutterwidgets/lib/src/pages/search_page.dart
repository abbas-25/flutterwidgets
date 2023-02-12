import 'package:flutter/material.dart';
import 'package:flutterwidgets/src/core/typography.dart';

import 'package:flutterwidgets/src/notifiers/search_notifier.dart';
import 'package:flutterwidgets/src/widgets/items_grid.dart';
import 'package:flutterwidgets/src/widgets/navbar.dart';
import 'package:flutterwidgets/src/widgets/search_field.dart';
import 'package:flutterwidgets/src/widgets/search_page_heading.dart';
import 'package:flutterwidgets/src/widgets/search_results_text.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class SearchPage extends StatefulWidget {
  final SearchNotifier searchNotifier;
  const SearchPage({
    Key? key,
    required this.searchNotifier,
  }) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    widget.searchNotifier.init();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppNavBar(width: size.width),
      backgroundColor: Color(0xff0A0A0A),
      body: ValueListenableBuilder(
          valueListenable: widget.searchNotifier.isLoadingItems,
          builder: (context, _, __) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 40),
                  SearchPageHeading(),
                  SizedBox(height: 40),
                  SearchField(
                    size: size,
                    searchController: searchController,
                    onSubmit: (value) {
                      if (value.isNotEmpty) {
                        widget.searchNotifier.loadSearchResults(value);
                        // perform search
                      } else {
                        widget.searchNotifier.resetSearch();
                      }
                    },
                  ),
                  SearchResultsForText(
                      searchController: searchController,
                      searchNotifier: widget.searchNotifier),
                  SizedBox(height: 50),
                  ItemsGrid(searchNotifier: widget.searchNotifier),
                  SizedBox(height: 50),
                  Center(
                    child: Text(
                      "Made with 💙 by Abbas",
                      style:
                          AppTypography.poppins(size: 12, color: Colors.white),
                    ),
                  ),
                  SizedBox(height: 50),
                ],
              ),
            );
          }),
    );
  }
}
