class Album {
  String status;
  int results;
  Data data;
  String message;

  Album(
      {required this.status,
      required this.results,
      required this.data,
      required this.message});

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      status: json['status'],
      results: json['results'],
      data: (json['data'] != null ? Data.fromJson(json['data']) : null)!,
      message: json['message'],
    );
  }
}

class Data {
  List<Product>? product;

  Data({this.product});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['product'] != null) {
      product = <Product>[];
      json['product'].forEach((v) {
        product!.add(Product.fromJson(v));
      });
    }
  }
}

class Product {
  int id;
  String name;
  String image;
  String price;
  int stock;
  int createDate;
  List<String> category;

  Product(
      {required this.id,
      required this.name,
      required this.image,
      required this.price,
      required this.stock,
      required this.createDate,
      required this.category});

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      name: json['name'],
      image: json['image'],
      price: json['price'],
      stock: json['stock'],
      createDate: json['createDate'],
      category: json['category'].cast<String>(),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['image'] = this.image;
    data['price'] = this.price;
    data['stock'] = this.stock;
    data['createDate'] = this.createDate;
    data['category'] = this.category;
    return data;
  }
}
