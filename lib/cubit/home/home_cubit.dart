import 'package:bloc/bloc.dart';
import 'package:cubit_state_management/cubit/home/home_repository.dart';
import 'package:cubit_state_management/cubit/home/model/home_model.dart';
import 'package:meta/meta.dart';

part 'home_state.dart';

final homeModel = HomeModel();

class HomeCubit extends Cubit<HomeState> {
  HomeCubit({this.repository}) : super(HomeInitial()) {
    getProductList();
  }

  final HomeRepository repository;

  List<HomeModel> productList;

  void getProductList() async {
    try {
      emit(HomeLoading());
      productList = await repository.getProducts();
      emit(LoadedState(productList));
    } catch (e) {
      emit(ErrorState());
    }
  }

  void selectProducts(int index) async {
    try {
      //multiple selection of an item
     /* productList.elementAt(index).isProductSelected =
          !productList.elementAt(index).isProductSelected;*/
      //single selection of an item
      productList.forEach((element) {
        element.isSelected = false;
      });

      productList[index].isSelected = true;
      emit(LoadedState(productList));
    } catch (e) {
      emit(ErrorState());
    }
  }
}
