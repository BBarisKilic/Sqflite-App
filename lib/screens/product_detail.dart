import 'package:flutter/material.dart';
import 'package:sqflite_demo/data/dbHelper.dart';
import 'package:sqflite_demo/models/product.dart';

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

  var dbHelper = DbHelper();

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
    );
  }

  void selectedPopMenuButton(Options value) async {
    switch (value) {
      case Options.delete:
        await dbHelper.delete(product.id);
        Navigator.pop(context, true);
        break;
      default:
    }
  }
}
