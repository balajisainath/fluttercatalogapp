import 'package:flutter/material.dart';
import 'package:flutterapp1/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

class CatalogHeader extends StatelessWidget {
  const CatalogHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        "Product Dekho".text.xl5.bold.color(mythemes.darkBlueColour).make(),
        "Trending Products".text.xl2.color(mythemes.darkBlueColour).make(),
      ],
    );
  }
}