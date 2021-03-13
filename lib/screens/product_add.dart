import 'package:flutter/material.dart';
import 'package:sqflite_app/data/dbHelper.dart';
import 'package:sqflite_app/models/product.dart';

class ProductAdd extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ProductAddState();
  }
}

class ProductAddState extends State {
  var textNameController = TextEditingController();
  var textDescController = TextEditingController();
  var textPriceController = TextEditingController();

  var dbHelper = DbHelper();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Yeni ürün ekle"),
      ),
      body: Padding(
        padding: EdgeInsets.all(30.0),
        child: Column(
          children: <Widget>[
            buildNameField(),
            buildDescriptionField(),
            buildUnitPriceFeld(),
            buildFlatButton(),
          ],
        ),
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

  Widget buildFlatButton() {
    return FlatButton(onPressed: () => addProduct(), child: Text("Kaydet"));
  }

  addProduct() async {
    await dbHelper.insert(Product(textNameController.text,
        textDescController.text, double.tryParse(textPriceController.text)));
    Navigator.pop(context, true);
  }
}
