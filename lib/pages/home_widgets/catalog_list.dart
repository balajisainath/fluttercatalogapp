import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutterapp1/models/catalogs.dart';
import 'package:flutterapp1/pages/home_detail_page.dart';
import 'package:flutterapp1/pages/home_widgets/catalog_image.dart';
import 'package:flutterapp1/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';
import '';

class CatalogList extends StatelessWidget {
  const CatalogList({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: CatalogModel.items.length,
        itemBuilder :(context,index){
          final catalog=CatalogModel.items[index];
          return InkWell(
            onTap: ()=> Navigator.push(context, MaterialPageRoute(builder:(context)=>HomeDetailPage(catalog: catalog),
            ),
            ),
              child: CatalogItem(catalog:catalog));
        }
    );
  }
}

class CatalogItem extends StatelessWidget {
  final Item catalog;
  const CatalogItem({Key? key,required this.catalog}) :assert(catalog!=null) ,
        super(key: key);
  @override
  Widget build(BuildContext context) {
    timeDilation=2.5;  // this helps to control the animations
    return VxBox(
        child: Row(
          children: [

            Hero(
              tag: Key(catalog.id.toString()),
                child: CatalogImage(image:catalog.image)),
            Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    catalog.name.text.lg.bold.color(mythemes.darkBlueColour).make(),
                    catalog.desc.text.textStyle(context.captionStyle).make(),
                    //10.0.heightBox,
                    ButtonBar(
                      alignment: MainAxisAlignment.spaceBetween,
                      buttonPadding: Vx.mH8,
                      children: [

                        "\$${catalog.price}".text.bold.color(mythemes.darkBlueColour).xl.make(),
                        ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(mythemes.darkBlueColour),
                              shape: MaterialStateProperty.all(StadiumBorder(),)
                          ),
                          onPressed:(){
                            print(catalog.name);
                          },
                          child:"Buy".text.make(),
                        )
                      ],
                    )
                  ],

                )
            ),
          ],
        )
    ).white.square(140).rounded.make().py12();
  }
}
