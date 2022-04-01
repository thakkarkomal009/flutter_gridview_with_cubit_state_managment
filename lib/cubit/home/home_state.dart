part of 'home_cubit.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {
  @override
  List<Object> get props => [];
}

class HomeLoading extends HomeState {
  @override
  List<Object> get props => [];
}

class LoadedState extends HomeState {
  LoadedState(this.products);

  final List<HomeModel> products;

  @override
  List<Object> get props => [products];
}

class HomeList extends HomeState {
  final List<HomeModel> products;

  HomeList(this.products);
}

class ErrorState extends HomeState {
  @override
  List<Object> get props => [];
}