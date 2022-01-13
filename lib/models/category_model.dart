class CategoryModel {
  late bool status;
  late CategoryDataModel data;
  CategoryModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = CategoryDataModel.fromJson(json['data']);
  }
}

class CategoryDataModel {
  late int currentPage;
  late List<DataModel> data;
  CategoryDataModel.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    data = List.from(json['data']).map((e) => DataModel.fromJson(e)).toList();
  }
}

class DataModel {
  late int id;
  late String name;
  late String image;
  DataModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
  }
}
