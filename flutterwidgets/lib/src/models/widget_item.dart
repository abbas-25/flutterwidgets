import 'dart:convert';

import 'package:flutter/foundation.dart';

class WidgetItem {
  final String filePath;
  final String thumbnailPath;
  final List<String> assetPaths;
  final String title;
  final String searchKeywords;
  WidgetItem({
    required this.filePath,
    required this.thumbnailPath,
    required this.assetPaths,
    required this.title,
    required this.searchKeywords,
  });

  WidgetItem copyWith({
    String? filePath,
    String? thumbnailPath,
    List<String>? assetPaths,
    String? title,
    String? searchKeywords,
  }) {
    return WidgetItem(
      filePath: filePath ?? this.filePath,
      thumbnailPath: thumbnailPath ?? this.thumbnailPath,
      assetPaths: assetPaths ?? this.assetPaths,
      title: title ?? this.title,
      searchKeywords: searchKeywords ?? this.searchKeywords,
    );
  }

  // Map<String, dynamic> toMap() {
  //   return {
  //     'filePath': filePath,
  //     'thumbnailPath': thumbnailPath,
  //     'assetPaths': assetPaths,
  //     'title': title,
  //     'searchKeywords': searchKeywords,
  //   };
  // }

  factory WidgetItem.fromMap(Map<String, dynamic> map) {
    return WidgetItem(
      filePath: map['file_path'] ?? '',
      thumbnailPath: map['thumbnail_path'] ?? '',
      assetPaths: List<String>.from(map['asset_paths']),
      title: map['title'] ?? '',
      searchKeywords: map['search_keyword'] ?? '',
    );
  }

  // String toJson() => json.encode(toMap());

  factory WidgetItem.fromJson(String source) => WidgetItem.fromMap(json.decode(source));

  @override
  String toString() {
    return 'WidgetItem(file_path: $filePath, thumbnail_path: $thumbnailPath, asset_paths: $assetPaths, title: $title, search_keyword: $searchKeywords)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is WidgetItem &&
      other.filePath == filePath &&
      other.thumbnailPath == thumbnailPath &&
      listEquals(other.assetPaths, assetPaths) &&
      other.title == title &&
      other.searchKeywords == searchKeywords;
  }

  @override
  int get hashCode {
    return filePath.hashCode ^
      thumbnailPath.hashCode ^
      assetPaths.hashCode ^
      title.hashCode ^
      searchKeywords.hashCode;
  }
}