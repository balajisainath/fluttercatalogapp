class Item{
  final String id;
  final String name;
  final String desc;
  final num price;
  final String color;
  final String image;

Item({required this.id, required this.name, required this.desc, required this.price, required this.color, required this.image});

final products=[Item(
    id: "s001",
    name:" iphone 12 pro",
    desc: "apple iphone 12th generation",
    price: 999, color: "#33505",
    image: "https://www.apple.com/newsroom/images/product/availability/geo/Apple_iphone12mini-iphone12max-homepodmini-availability_iphone12promax-geo_110520_inline.jpg.large_2x.jpg"
)];

}