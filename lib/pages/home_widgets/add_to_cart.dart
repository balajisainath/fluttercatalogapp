
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp1/models/cart.dart';
import 'package:flutterapp1/models/catalogs.dart';
import 'package:velocity_x/velocity_x.dart';

class AddtoCart extends StatefulWidget {
  final Item catalog;
  const AddtoCart({Key? key, required this.catalog}) : super(key: key);

  @override
  State<AddtoCart> createState() => _AddtoCartState();
}

class _AddtoCartState extends State<AddtoCart> {
  final _cart=Cartmodel();
  @override
  Widget build(BuildContext context) {
    bool isInCart=_cart.items.contains(widget.catalog) ?? false ;
    return ElevatedButton(

      style: ButtonStyle(
          backgroundColor:
          MaterialStateProperty.all(context.theme.buttonColor),
          shape: MaterialStateProperty.all(
            StadiumBorder(),
          )),
      onPressed: () {
        if(!isInCart){
          isInCart=isInCart.toggle();
          final _catalog=CatalogModel();

          _cart.catalog=_catalog;
          _cart.add(widget.catalog);
          setState(() {});
        }
      },
      child: isInCart?Icon(Icons.done):Icon(CupertinoIcons.cart_badge_plus),
    );
  }
}
