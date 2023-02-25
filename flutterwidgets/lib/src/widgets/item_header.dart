import 'package:flutter/material.dart';
import 'package:flutterwidgets/src/core/typography.dart';
import 'package:flutterwidgets/src/models/widget_item.dart';
import 'dart:html' as html;

class ItemHeader extends StatelessWidget {
  final WidgetItem item;
  const ItemHeader({
    Key? key,
    required this.item,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (item.contributorGithubUsername == null) return Container(height: 0);
    return InkWell(
      onTap: () {
        try {
          html.window.open(
              "https://github.com/${item.contributorGithubUsername}/",
              "${item.contributorGithubUsername}");
        } catch (exception) {
          print(exception.toString());
        }
      },
      child: Container(
        decoration: BoxDecoration(
            color: Colors.purple.withOpacity(0.56),
            borderRadius: BorderRadius.only(topRight: Radius.circular(12))),
        padding: EdgeInsets.all(5),
        child: Row(
          children: [
            Text(
              "Added by  ",
              style: AppTypography.poppins(color: Colors.grey, size: 10),
            ),
            Text(
              "${item.contributorGithubUsername}",
              style: AppTypography.poppins(color: Colors.white, size: 10),
            ),
          ],
        ),
      ),
    );
  }
}
