class Product {
  int id;
  String name;
  String description;
  double unitPrice;

  Product(this.name, this.description, this.unitPrice);

  Product.withId(this.id, this.name, this.description, this.unitPrice);

  Map<String, dynamic> toMap() {
    var dbMap = Map<String, dynamic>();
    dbMap["name"] = name;
    dbMap["description"] = description;
    dbMap["unitPrice"] = unitPrice;
    if (this.id != null) {
      dbMap["id"] = id;
    }

    return dbMap;
  }

  Product.fromObject(dynamic o) {
    this.id = o["id"];
    this.name = o["name"];
    this.description = o["description"];
    this.unitPrice = double.tryParse(o["unitPrice"].toString());
  }
}
