class Product {
  int id;
  String name;
  String description;
  double unitPrice;

  Product(this.name, this.description, this.unitPrice);

  Product.withId(this.id, this.name, this.description, this.unitPrice);
}
