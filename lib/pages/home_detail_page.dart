import 'package:flutter/material.dart';
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
      appBar: AppBar(),
      backgroundColor: mythemes.creamcolour,
      bottomNavigationBar: Container(
        color: Colors.white,
        child: ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
          buttonPadding: Vx.mH8,
          children: [

            "\$${catalog.price}".text.bold.color(Vx.orange800).xl4.make(),
            ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(mythemes.darkBlueColour),
                  shape: MaterialStateProperty.all(StadiumBorder(),)
              ),
              onPressed:(){
                print(catalog.name);
              },
              child:"Buy".text.make(),
            ).wh(100,45)
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
                  color: Colors.white,
                  width: context.screenWidth,
                  child: Column(
                    children: [
                      catalog.name.text.lg.bold.color(mythemes.darkBlueColour).xl4.make(),
                      catalog.desc.text.textStyle(context.captionStyle).lg.make(),
                    ],
                  ).py64(),
                ),
              ))
          ],
          ),
      )
    );
  }
}
