import 'package:cubit_state_management/cubit/home/home_cubit.dart';
import 'package:cubit_state_management/cubit/home/home_repository.dart';
import 'package:cubit_state_management/cubit/home/model/home_model.dart';
import 'package:cubit_state_management/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(repository: HomeRepository()),
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          List<HomeModel> productList = [];
          if (state is HomeLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is ErrorState) {
            return Center(
              child: Text("No data found"),
            );
          } else if (state is LoadedState) {
            productList = state.products;
          }

          return Material(
            child: Container(
              margin: const EdgeInsets.only(left: 10, right: 10, top: 30),
              child: bindProductList(context, productList),
            ),
          );
        },
      ),
    );
  }
}

Widget showProductItem(int index, HomeModel home, BuildContext context) {
  return BlocBuilder<HomeCubit, HomeState>(
    builder: (context, state) {
      return SizedBox(
          child: Container(
              margin: const EdgeInsets.only(top: 8, bottom: 8),
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(20.0))),
              child: Stack(children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8), // Image border
                  child: SizedBox.fromSize(
                      // size: Size.fromRadius(90),
                      child: Image.asset(
                    home.image,
                    fit: BoxFit.fill,
                    height: double.infinity,
                    width: double.infinity,
                  )),
                ),
                Positioned(
                    right: 25,
                    top: 10,
                    child: InkWell(
                      onTap: () {
                        context.read<HomeCubit>().selectProducts(index);
                      },
                      child: state is LoadedState
                          ? home.isProductSelected
                              ? Image.asset(
                                  "assets/ic_tick.png",
                                )
                              : Image.asset(
                                  "assets/ic_tick_disable.png",
                                )
                          : Image.asset(
                              "assets/ic_tick_disable.png",
                            ),
                    )),
                Positioned(
                    bottom: 0,
                    child: Container(
                        height: MediaQuery.of(context).size.height * 0.05,
                        width: MediaQuery.of(context).size.width,
                        color: Color(0x000000).withOpacity(0.3),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            home.name,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                        ))),
              ])));
    },
  );
}

Widget bindProductList(BuildContext context, List<HomeModel> products) {
  List<HomeModel> productList = [];
  productList = products;
  print("length::" + productList.length.toString());
  return SingleChildScrollView(
      child: StaggeredGrid.count(
    crossAxisCount: 4,
    mainAxisSpacing: 0,
    crossAxisSpacing: 10,
    children: [
      ...productList.mapIndexed((e, i) => StaggeredGridTile.count(
          crossAxisCellCount: 2,
          mainAxisCellCount: (i % 2) == 0 ? 2 : 3, //i.isEven ? 2 : 3,
          child: showProductItem(i, e, context))),
    ],
  ));
}
