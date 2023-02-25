import 'dart:convert';
import 'dart:html' as html;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutterwidgets/src/core/constants.dart';
import 'package:flutterwidgets/src/core/typography.dart';
import 'package:flutterwidgets/src/models/widget_item.dart';
import 'package:http/http.dart';
import 'package:oktoast/oktoast.dart';

class ItemFooter extends StatelessWidget {
  final WidgetItem item;
  const ItemFooter({
    Key? key,
    required this.item,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.8),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12),
        child: Row(
          children: [
            Flexible(
                fit: FlexFit.tight,
                flex: 5,
                child: Text(
                  "${item.title}",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppTypography.poppins(size: 12, color: Colors.black),
                )),
            Spacer(),
            Flexible(
                child: IconButton(
                    icon: Icon(Icons.code),
                    onPressed: () async {
                      get(Uri.parse(
                              "${endpoint}copy_code?path_to_file=${item.filePath}"))
                          .then((content) {
                        final decoded = jsonDecode(content.body);

                        Clipboard.setData(ClipboardData(
                          text: decoded["content"],
                        ));
                        showToast('Code Copied!',
                            position: ToastPosition.bottom,
                            backgroundColor: Colors.white,
                            radius: 8,
                            textPadding: EdgeInsets.all(12),
                            textStyle: AppTypography.poppins(
                                color: Colors.black87, size: 16));
                      }).catchError((_) {});
                    },
                    color: Colors.black)),
            SizedBox(width: 10),
            Flexible(
                child: IconButton(
                    icon: Icon(Icons.download),
                    onPressed: () async {
                      try {
                        html.window.open(
                            "${endpoint}download_file?path_to_file=${item.filePath}&file_name=${item.title.replaceAll(" ", "_")}",
                            '${item.title}');
                      } catch (exception) {
                        print(exception.toString());
                      }
                    },
                    color: Colors.black)),
          ],
        ),
      ),
    );
  }
}
