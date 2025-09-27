part of 'restaurant_bloc.dart';

abstract class RestaurantEvent extends Equatable {
  const RestaurantEvent();

  @override
  List<Object?> get props => [];
}

class RestaurantLoadRequested extends RestaurantEvent {
  const RestaurantLoadRequested();
}

class RestaurantSearchRequested extends RestaurantEvent {
  final String query;

  const RestaurantSearchRequested(this.query);

  @override
  List<Object?> get props => [query];
}

class RestaurantCategoryFilterRequested extends RestaurantEvent {
  final String category;

  const RestaurantCategoryFilterRequested(this.category);

  @override
  List<Object?> get props => [category];
}

class RestaurantRefreshRequested extends RestaurantEvent {
  const RestaurantRefreshRequested();
}
