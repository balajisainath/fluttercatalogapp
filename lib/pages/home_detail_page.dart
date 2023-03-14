import 'package:flutter/material.dart';
import 'package:flutterapp1/pages/home_widgets/add_to_cart.dart';
import 'package:flutterapp1/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

import '../models/catalogs.dart';

class HomeDetailPage extends StatelessWidget {
  final Item catalog;
  const HomeDetailPage({Key? key,required this.catalog}) :assert(catalog!=null),
        super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: context.canvasColor,
      bottomNavigationBar: Container(
        color: context.cardColor,
        child: ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
          buttonPadding: Vx.mH8,
          children: [

            "\$${catalog.price}".text.bold.color(Vx.orange800).xl4.make(),
            AddtoCart(catalog: catalog).wh(100,45),
          ],
        ).p16(),
      ),
      body: SafeArea(
        bottom: false,
        child: Column(children: [
            Hero(
              tag: Key(catalog.id.toString()),
                child: Image.network(catalog.image,)
            ).h32(context),
          Expanded(
              child:VxArc(
                height: 30.0,
                arcType: VxArcType.CONVEY,
                edge: VxEdge.TOP,
                child: Container(
                  color: context.cardColor,
                  width: context.screenWidth,
                  child: Column(
                    children: [
                      catalog.name.text.lg.bold.color(context.accentColor).xl4.make(),
                      catalog.desc.text.textStyle(context.captionStyle).lg.make(),
                      10.heightBox,
                      "As I and feel a sense of calmness wash over me. In moments like these, I am reminded of the beauty and wonder of the world around us".
                      text.textStyle(context.captionStyle).make().p12(),


                    ],
                  ).py64(),
                ),
              ))
          ],
          ),
      )//.color(mythemes.darkBlueColour)
    );
  }
}
