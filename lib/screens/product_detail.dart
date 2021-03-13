import 'package:flutter/material.dart';
import 'package:sqflite_app/data/dbHelper.dart';
import 'package:sqflite_app/models/product.dart';

class ProductDetail extends StatefulWidget {
  Product product;
  ProductDetail(this.product);

  @override
  State<StatefulWidget> createState() {
    return ProductDetailState(product);
  }
}

enum Options { delete, update }

class ProductDetailState extends State {
  Product product;
  ProductDetailState(this.product);

  var textNameController = TextEditingController();
  var textDescController = TextEditingController();
  var textPriceController = TextEditingController();

  var dbHelper = DbHelper();

  @override
  void initState() {
    textNameController.text = product.name;
    textDescController.text = product.description;
    textPriceController.text = product.unitPrice.toString();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ürün detayı: ${product.name}"),
        actions: <Widget>[
          PopupMenuButton<Options>(
              onSelected: selectedPopMenuButton,
              itemBuilder: (BuildContext context) => <PopupMenuEntry<Options>>[
                    PopupMenuItem<Options>(
                        value: Options.delete, child: Text("Sil")),
                    PopupMenuItem<Options>(
                        value: Options.update, child: Text("Güncelle"))
                  ])
        ],
      ),
      body: buildProductDetail(),
    );
  }

  void selectedPopMenuButton(Options value) async {
    switch (value) {
      case Options.delete:
        await dbHelper.delete(product.id);
        Navigator.pop(context, true);
        break;
      case Options.update:
        await dbHelper.update(Product.withId(
            product.id,
            textNameController.text,
            textDescController.text,
            double.tryParse(textPriceController.text)));
        Navigator.pop(context, true);
        break;
      default:
    }
  }

  Widget buildProductDetail() {
    return Padding(
      padding: EdgeInsets.all(30.0),
      child: Column(
        children: <Widget>[
          buildNameField(),
          buildDescriptionField(),
          buildUnitPriceFeld(),
        ],
      ),
    );
  }

  Widget buildNameField() {
    return TextField(
      decoration: InputDecoration(labelText: "Ürün adı"),
      controller: textNameController,
    );
  }

  Widget buildDescriptionField() {
    return TextField(
      decoration: InputDecoration(labelText: "Ürün açıklaması"),
      controller: textDescController,
    );
  }

  Widget buildUnitPriceFeld() {
    return TextField(
      decoration: InputDecoration(labelText: "Birim fiyatı"),
      controller: textPriceController,
    );
  }
}
