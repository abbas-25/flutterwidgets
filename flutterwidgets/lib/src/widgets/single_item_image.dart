import 'package:flutter/material.dart';
import 'package:image_network/image_network.dart';

class ItemImage extends StatelessWidget {
  final String image;
  const ItemImage({
    Key? key,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ImageNetwork(
      duration: 1500,
      borderRadius: BorderRadius.circular(16),
      fullScreen: true,
      // fitWeb: .contain,
      image: image,
      height: 500,
      width: 500,
    );
  }
}
