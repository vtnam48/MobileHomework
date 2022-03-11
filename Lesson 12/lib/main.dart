import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'INT3120 20',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Lesson 12'),
    );
  }
}

class ProductPage extends StatelessWidget {
  const ProductPage({Key? key, required this.item}) : super(key: key);
  final Product item;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(item.name),
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Image.asset(
                "assets/" + item.image,
                height: 100.0,
                width: MediaQuery.of(context).size.width,
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(5),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text(
                        item.name,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(item.description),
                      Text("Price: " + item.price.toString()),
                      const Padding(
                        padding: EdgeInsets.only(left: 130),
                        child: RatingBox(),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  final items = Product.getProducts();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            child: ProductBox(item: items[index]),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProductPage(item: items[index]),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class RatingBox extends StatefulWidget {
  const RatingBox({Key? key}) : super(key: key);

  @override
  _RatingBoxState createState() => _RatingBoxState();
}

class _RatingBoxState extends State<RatingBox> {
  int _rating = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [1, 2, 3]
          .map(
            (i) => IconButton(
              onPressed: () {
                setState(() {
                  _rating = i;
                });
              },
              icon: _rating >= i
                  ? const Icon(Icons.star)
                  : const Icon(Icons.star_border),
              color: Colors.amber,
            ),
          )
          .toList(),
    );
  }
}

class ProductBox extends StatelessWidget {
  const ProductBox({Key? key, required this.item}) : super(key: key);

  final Product item;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(2),
      height: 140,
      child: Card(
          child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Image.asset(
            "assets/" + item.image,
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(item.name,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      )),
                  Text(item.description),
                  Text("Price: " + item.price.toString()),
                  const Padding(
                    padding: EdgeInsets.only(left: 35),
                    child: RatingBox(),
                  )
                ],
              ),
            ),
          )
        ],
      )),
    );
  }
}

class Product {
  final String name;
  final String description;
  final int price;
  final String image;
  Product(this.name, this.description, this.price, this.image);

  static List<Product> getProducts() {
    List<Product> items = <Product>[];
    items.add(Product(
      "Pixel",
      "Pixel is the most featureful phone ever",
      800,
      "pixel.jpg",
    ));
    items.add(Product(
      "Laptop",
      "Laptop is most productive development tool",
      2000,
      "laptop.jpg",
    ));
    items.add(Product(
      "Tablet",
      "Tablet is the most useful device ever for meeting",
      1500,
      "tablet.jpg",
    ));
    items.add(Product(
      "Pendrive",
      "iPhone is the stylist phone ever",
      100,
      "pendrive.jpg",
    ));
    items.add(Product(
      "Floppy Drive",
      "iPhone is the stylist phone ever",
      20,
      "floppydisk.jpg",
    ));
    items.add(Product(
      "iPhone",
      "iPhone is the stylist phone ever",
      1000,
      "iphone.jpg",
    ));
    return items;
  }
}
