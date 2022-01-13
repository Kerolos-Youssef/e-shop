class FavoritesModel {
  late bool status;
  dynamic message;
  late Data data;
  FavoritesModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = Data.fromJson(json['data']);
  }
}

class Data {
  late int currentPage;
  List<FavoritesData> favoritesDetailsList = [];
  late String firstPageUrl;
  late int from;
  late int lastPage;
  dynamic lastPageUrl;
  dynamic nextPageUrl;
  late String path;
  late int perPage;
  dynamic prevPageUrl;
  late int to;
  late int total;
  Data.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    favoritesDetailsList =
        List.from(json['data']).map((e) => FavoritesData.fromJson(e)).toList();
    firstPageUrl = json['first_page_url'];
    from = json['from'];
    lastPage = json['last_page'];
    lastPageUrl = json['last_page_url'];
    nextPageUrl = json['next_page_url'];
    path = json['path'];
    perPage = json['per_page'];
    prevPageUrl = json['prev_page_url'];
    to = json['to'];
    total = json['total'];
  }
}

class FavoritesData {
  late int productIdInFavorites;
  late ProductOfFavorite product;
  FavoritesData.fromJson(Map<String, dynamic> json) {
    productIdInFavorites = json['id'];
    product = ProductOfFavorite.fromJson(json['product']);
  }
}

class ProductOfFavorite {
  late int id;
  dynamic price;
  dynamic oldPrice;
  dynamic discount;
  late String image;
  late String name;
  late String description;

  ProductOfFavorite.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    price = json['price'];
    oldPrice = json['old_price'];
    discount = json['discount'];
    image = json['image'];
    name = json['name'];
    description = json['description'];
  }
}
