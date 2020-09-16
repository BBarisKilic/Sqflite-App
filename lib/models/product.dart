class Product {
  int id;
  String name;
  String description;
  double unitPrice;

  Product(this.name, this.description, this.unitPrice);

  Product.withId(this.id, this.name, this.description, this.unitPrice);

  Map<String, dynamic> toMap() {
    var dbMap = Map<String, dynamic>();
    dbMap["name"] = this.name;
    dbMap["description"] = this.description;
    dbMap["unitPrice"] = this.unitPrice;
    if (this.id != null) {
      dbMap["id"] = this.id;
    }

    return dbMap;
  }

  Product.fromObject(dynamic o) {
    this.id = int.tryParse(o[id]);
    this.name = o[name];
    this.description = o[description];
    this.unitPrice = double.tryParse(o[unitPrice].toString());
  }
}
