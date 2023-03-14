import 'package:flutter/material.dart';
import 'package:flutterapp1/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';


class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.canvasColor,

      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: "Cart".text.color(context.accentColor).bold.make(),
        iconTheme: context.theme.iconTheme,
      ),
      body:Column(
        children: [
          CartList(
          ).p32().expand(),
          Divider(),
          CartTotal(),
        ],
      ),

    );
  }
}
class CartTotal extends StatelessWidget {
  const CartTotal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      height: 200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          "\$${"9999"}".text.xl5.color(context.theme.accentColor).make(),
          30.widthBox,
          ElevatedButton(
              onPressed: (){},
              child: "Buy".text.color(Colors.white).make()
          ).w24(context)
        ],
      ),
    );
  }
}

class CartList extends StatefulWidget {
  const CartList({Key? key}) : super(key: key);

  @override
  State<CartList> createState() => _CartListState();
}

class _CartListState extends State<CartList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 6,
        itemBuilder: (context,index)=>ListTile(
          leading: Icon(Icons.done),
          trailing: IconButton(
            icon: Icon(Icons.remove_circle_outline),
            onPressed: () {  },
          ),
          title: "Item 1 ".text.make(),

        )
    );
  }
}

