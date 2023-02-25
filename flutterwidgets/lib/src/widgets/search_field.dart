import 'package:container_gradient_border/container_gradient_border.dart';
import 'package:flutter/material.dart';
import 'package:flutterwidgets/src/core/typography.dart';

class SearchField extends StatelessWidget {
  final Function(String value) onSubmit;
  const SearchField({
    Key? key,
    required this.onSubmit,
    required this.size,
    required this.searchController,
  }) : super(key: key);

  final Size size;
  final TextEditingController searchController;

  @override
  Widget build(BuildContext context) {
    bool showLessHorizontalPadding = MediaQuery.of(context).size.width < 400;
    return SizedBox(
        width: showLessHorizontalPadding ? size.width * 0.60 : size.width * 0.80,
        child: ContainerGradientBorder(
          width: showLessHorizontalPadding ? size.width * 0.60 : size.width * 0.80,
          borderRadius: 30,
          borderWidth: 5,
          height: 60,
          colorList: [Colors.deepPurple, Colors.deepOrange, Colors.pink],
          child: Center(
            child: TextField(
              cursorColor: Colors.white,
              controller: searchController,
              style: AppTypography.poppins(),
              onSubmitted: onSubmit,
              decoration: InputDecoration(
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 40, vertical: 16),
                border: InputBorder.none,
                suffixIcon: Icon(
                  Icons.search,
                  color: Colors.white,
                ),
                hintStyle: AppTypography.poppins(
                  color: Colors.white.withOpacity(0.5),
                ),
                hintText:
                    "Type here... (Examples - login page, carousel, instagram post)",
              ),
            ),
          ),
        ));
  }
}
