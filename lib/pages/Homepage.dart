import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutterapp1/models/catalogs.dart';
import 'package:flutterapp1/widgets/MyDrawer.dart';
import 'package:flutterapp1/widgets/themes.dart';
import '../widgets/item_widget.dart';
import 'package:velocity_x/velocity_x.dart';

class Homepage extends StatefulWidget {
  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
//  final List dummylist=List.generate(12, (index) => CatalogModel.items[0]);
  final int days = 30;
  final String name = "Product Dekho";
  @override
  void initState() {
    super.initState();
    LoadData();
  }
  LoadData() async {
    await Future.delayed(Duration(seconds: 2));
    final catalogjson = await rootBundle.loadString(
        "assets/files/catalog.json");
    final decodeddata = jsonDecode(catalogjson);
    var productsdata=decodeddata["Products"];
    CatalogModel.items=List.from(productsdata).map<Item>((item) => Item.fromMap(item)).toList();
    setState(() {});

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mythemes.creamcolour,
      body: SafeArea(
        child: Container(
          padding: Vx.m32,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
             CatalogHeader(),
              if(CatalogModel.items !=null && CatalogModel.items.isNotEmpty)
                CatalogList().expand()
              else
                Center(child: CircularProgressIndicator(),)
            ],
          ),
        ),
      ),
    );
  }
}


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

class CatalogList extends StatelessWidget {
  const CatalogList({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: CatalogModel.items.length,
        itemBuilder :(context,index){
        final catalog=CatalogModel.items[index];
        return CatalogItem(catalog:catalog);
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
    return VxBox(
      child: Row(
        children: [
         CatalogImage(image:catalog.image),
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
                          onPressed:(){},
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

class CatalogImage extends StatelessWidget {
  final String image;
  const CatalogImage({Key? key,required this.image}) : assert(image!=null),
        super(key: key);

  @override
  Widget build(BuildContext context) {

    return  Image.network(
      image,
    ).box.p8.rounded.make().color(mythemes.creamcolour).p16().w40(context);
  }
}
