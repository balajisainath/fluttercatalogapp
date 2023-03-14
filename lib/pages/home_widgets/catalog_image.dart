import 'package:flutter/material.dart';
import 'package:flutterapp1/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

class CatalogImage extends StatelessWidget {
  final String image;
  const CatalogImage({Key? key,required this.image}) : assert(image!=null),
        super(key: key);

  @override
  Widget build(BuildContext context) {

    return  Card(
      elevation: 0.0,

      shape: Vx.rounded,
      color: context.canvasColor,
      child: Image.network(
        image,
      ),
    ).p8();
  }
}
