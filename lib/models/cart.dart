import 'dart:ffi';

import 'package:flutterapp1/models/catalogs.dart';

class Cartmodel{
   late CatalogModel _catalog;
  static final cartModel =Cartmodel._internal();
  Cartmodel._internal();
  factory Cartmodel()=>cartModel;


  //collection of ids of each item
  final List<int> _itemids=[];
// get catalog
  CatalogModel get catalog => _catalog;
//setting catalog
  set catalog(CatalogModel newcatalog){
    assert(newcatalog!=null);
    _catalog=newcatalog;
  }
  //get items in the cart
  List<Item> get items=>_itemids.map((id) => _catalog.getById(id)).toList();

  num get totalprice =>
      items.fold(0, (total, current) => total+current.price);
  // add item
void add(Item item){
  _itemids.add(item.id);
}
void remove(Item item){
  _itemids.remove(item.id);
}

}