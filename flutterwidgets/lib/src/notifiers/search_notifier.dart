import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutterwidgets/src/models/widget_item.dart';

class SearchNotifier {
  List<WidgetItem> _searchResults = [];

  List<WidgetItem> _preSearchItems = [];

  List<WidgetItem> _allItems = [];

  ValueNotifier<bool> isInitialising = ValueNotifier(true);

  ValueNotifier<List<WidgetItem>> itemsToShow = ValueNotifier([]);

  ValueNotifier<bool> isLoadingItems = ValueNotifier(false);

  init() async {
    // load pre search items
    isLoadingItems.value = true;

    final json = await rootBundle.loadString("assets/entries.json");

    final decoded = jsonDecode(json);

    List<WidgetItem> items = [];
    decoded.forEach((map) {
      items.add(WidgetItem.fromMap(map));
    });

    _allItems = items;

    _preSearchItems = _allItems;

    itemsToShow.value = _preSearchItems;
    isInitialising.value = false;
    isLoadingItems.value = false;
  }

  loadSearchResults(String search) async {
    isLoadingItems.value = true;
    _searchResults = _allItems
        .where((element) =>
            element.searchKeywords.toLowerCase().contains(search.toLowerCase()))
        .toList();
    itemsToShow.value = _searchResults;
    isLoadingItems.value = false;
  }

  resetSearch() {
    isLoadingItems.value = false;
    itemsToShow.value = _preSearchItems;
    isLoadingItems.value = true;
  }
}
