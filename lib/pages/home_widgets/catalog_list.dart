import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutterapp1/models/cart.dart';
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
        itemBuilder: (context, index) {
          final catalog = CatalogModel.items[index];
          return InkWell(
              onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomeDetailPage(catalog: catalog),
                    ),
                  ),
              child: CatalogItem(catalog: catalog));
        });
  }
}

class CatalogItem extends StatelessWidget {
  final Item catalog;
  const CatalogItem({Key? key, required this.catalog})
      : assert(catalog != null),
        super(key: key);
  @override
  Widget build(BuildContext context) {
    timeDilation = 2.0; // this helps to control the animations
    return VxBox(
        child: Row(
      children: [
        Hero(
            tag: Key(catalog.id.toString()),
            child: CatalogImage(
              image: catalog.image,
            )),
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            catalog.name.text.lg.bold.color(context.theme.accentColor ).make(),
            catalog.desc.text.textStyle(context.captionStyle).make(),
            //10.0.heightBox,
            ButtonBar(
              alignment: MainAxisAlignment.spaceBetween,
              buttonPadding: Vx.mH8,
              children: [
                "\$${catalog.price}"
                    .text
                    .bold
                    .color(context.theme.accentColor)
                    .xl
                    .make(),
                AddtoCart(catalog:catalog),
              ],
            ).p4()
          ],
        )),
      ],
    )).color(context.cardColor).rounded.square(140).make().py16();
  }
}

class AddtoCart extends StatefulWidget {
  final Item catalog;
  const AddtoCart({Key? key, required this.catalog, }) : super(key: key);

  @override
  State<AddtoCart> createState() => _AddtoCartState();
}

class _AddtoCartState extends State<AddtoCart> {
   bool isAdded=false;
  @override
  Widget build(BuildContext context) {
    return  ElevatedButton(

    style: ButtonStyle(
    backgroundColor:
    MaterialStateProperty.all(context.theme.buttonColor),
    shape: MaterialStateProperty.all(
    StadiumBorder(),
    )),
    onPressed: () {
      isAdded=isAdded.toggle();
      final _catalog=CatalogModel();
      final _cart=Cartmodel();
      _cart.catalog=_catalog;
      _cart.add(widget.catalog);
      

      setState(() {});

    },
    child: isAdded?Icon(Icons.done):"Add to Cart".text.sm.make(),
    );
  }
}

