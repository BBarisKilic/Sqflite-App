import 'package:flutter/material.dart';

class ProductAdd extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ProductAddState();
  }
}

class ProductAddState extends State {
  TextEditingController textNameController = TextEditingController();
  TextEditingController textDescController = TextEditingController();
  TextEditingController textPriceController = TextEditingController();

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
}
