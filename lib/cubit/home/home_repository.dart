
import 'package:cubit_state_management/cubit/home/model/home_model.dart';

class HomeRepository {
  List<HomeModel> productList = [];

  Future<List<HomeModel>> getProducts() async {
    try {
      productList = [
        HomeModel(image: "assets/item_1.jpg", name: "Russell", detail: "Lorem Ipsum is simply dummy text of the printing and typesetting industry.", isSelected: false),
        HomeModel(image: "assets/item_2.jpg", name: "Wilber", detail: "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.", isSelected: false),
        HomeModel(image: "assets/item_3.jpg", name: "Patricia", detail: "It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.", isSelected: false),
        HomeModel(image: "assets/item_4.jpg", name: "Denmark", detail: "It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.", isSelected: false),
        HomeModel(image: "assets/item_5.jpg", name: "Steven", detail: "Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old.", isSelected: false),
        HomeModel(image: "assets/item_6.jpg", name: "Oliver", detail: "Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source.", isSelected: false),
        HomeModel(image: "assets/item_7.jpg", name: "David", detail: "Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of de Finibus Bonorum et Malorum (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance.", isSelected: false),
        HomeModel(image: "assets/item_8.jpg", name: "Maestas",detail: "The first line of Lorem Ipsum, Lorem ipsum dolor sit amet.., comes from a line in section 1.10.32.", isSelected: false),
        HomeModel(image: "assets/item_9.jpg", name: "Ben", detail: "The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from de Finibus Bonorum et Malorum by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.", isSelected: false),
        HomeModel(image: "assets/item_10.jpg", name: "Diaz", detail: "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.", isSelected: false),
      ];
      return productList;
    } catch (e) {
      throw e;
    }
  }
}
