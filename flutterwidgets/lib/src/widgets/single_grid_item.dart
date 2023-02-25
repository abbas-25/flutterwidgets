import 'package:flutter/material.dart';

import 'package:flutterwidgets/src/models/widget_item.dart';
import 'package:flutterwidgets/src/widgets/item_header.dart';
import 'package:flutterwidgets/src/widgets/single_item_footer.dart';
import 'package:flutterwidgets/src/widgets/single_item_image.dart';

class SingleGridItem extends StatelessWidget {
  final WidgetItem item;
  const SingleGridItem({
    Key? key,
    required this.item,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Stack(
          children: [
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: Colors.white, width: 2),
                ),
                child: ItemImage(image: item.thumbnailPath),
              ),
            ),
            Positioned.fill(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ItemFooter(item: item),
              ],
            )),
            Positioned(top: 2, right: 2, child: ItemHeader(item: item)),
          ],
        ));
  }
}
