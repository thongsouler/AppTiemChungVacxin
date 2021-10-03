class ProductDataModel{
  final String id;
  final String name;
  final String company;
  final String imageURL;
  final String description;
  final String price;

  ProductDataModel(
      {
        this.id,
        this.name,
        this.company,
        this.imageURL,
        this.description,
        this.price
      });

  factory ProductDataModel.fromJson(Map<String, dynamic> json) {
    return ProductDataModel(
      id: json['id'],
      name: json['name'],
      company: json['company'],
      imageURL: json['imageURL'],
      description: json['description'],
      price: json['price']
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'company': company,
      'imageURL': imageURL,
      'description': description,
      'price': price,
    };
  }
}