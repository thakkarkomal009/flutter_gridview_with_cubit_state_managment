class HomeModel {
  String image;
  String name;
  String detail;
  bool isSelected;

  HomeModel({this.image, this.name, this.detail, this.isSelected = false});

  set isProductSelected(bool value) {
    isSelected = value;
  }

  bool get isProductSelected => isSelected;
}
