import 'package:adaptive_navbar/adaptive_navbar.dart';
import 'package:flutter/material.dart';
import 'package:flutterwidgets/src/core/typography.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class AppNavBar extends StatelessWidget implements PreferredSizeWidget {
  const AppNavBar({
    Key? key,
    required this.width,
  }) : super(key: key);

  final double width;

  @override
  Widget build(BuildContext context) {
    return AdaptiveNavBar(
      screenWidth: width,
      title: Padding(
        padding: EdgeInsets.only(top: 20),
        child: GradientText("FlutterWidgets.live",
            colors: [Colors.deepPurple, Colors.deepOrange, Colors.pink],
            style: AppTypography.poppins(
              size: 24,
              weight: FontWeight.bold,
            )),
      ),
      backgroundColor: Color(0xff0A0A0A),
      elevation: 0,
      centerTitle: false,
      navBarItems: [
        NavBarItem(
          text: "Contributors",
          onTap: () {
            // Navigator.pushNamed(context, "routeName");
          },
        ),
        // NavBarItem(
        //   text: "All Widgets",
        //   onTap: () {
        //     // Navigator.pushNamed(context, "routeName");
        //   },
        // ),
        NavBarItem(
          text: "Contribute",
          onTap: () {
            // Navigator.pushNamed(context, "routeName");
          },
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height);
}
