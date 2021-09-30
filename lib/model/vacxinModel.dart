class ProductDataModel{
  int? id;
  String? name;
  String? company;
  String? imageURL;
  String? description;
  String? price;

  ProductDataModel(
      {
        this.id,
        this.name,
        this.company,
        this.imageURL,
        this.description,
        this.price
      });

  ProductDataModel.fromJson(Map<String,dynamic> json)
  {
    id = json['id'];
    name =json['name'];
    company = json['company'];
    imageURL = json['imageUrl'];
    description = json['description'];
    price = json['price'];
  }
}