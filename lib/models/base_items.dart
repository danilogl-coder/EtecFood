class BaseItems
{
  String? image;
  String? product;

  BaseItems.fromMap(Map<String, dynamic> map)
  {
  image = map['image'] as String;
  product = map['product'];
  } 

  @override
  String toString()
  {
  return "BaseItems{image: $image, product: $product}";
  }
}