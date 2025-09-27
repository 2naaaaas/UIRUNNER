import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../core/utils/logger.dart';
import '../../domain/entities/restaurant_entity.dart';
import '../../domain/repositories/restaurant_repository.dart';

part 'restaurant_event.dart';
part 'restaurant_state.dart';

@injectable
class RestaurantBloc extends Bloc<RestaurantEvent, RestaurantState> {
  final RestaurantRepository _restaurantRepository;
  final AppLogger _logger;

  RestaurantBloc(
    this._restaurantRepository,
    this._logger,
  ) : super(const RestaurantInitial()) {
    on<RestaurantLoadRequested>(_onRestaurantLoadRequested);
    on<RestaurantSearchRequested>(_onRestaurantSearchRequested);
    on<RestaurantCategoryFilterRequested>(_onRestaurantCategoryFilterRequested);
    on<RestaurantRefreshRequested>(_onRestaurantRefreshRequested);
  }

  Future<void> _onRestaurantLoadRequested(
    RestaurantLoadRequested event,
    Emitter<RestaurantState> emit,
  ) async {
    try {
      emit(const RestaurantLoading());
      _logger.info('Loading restaurants');

      final restaurants = await _restaurantRepository.getRestaurants();
      
      _logger.info('Restaurants loaded: ${restaurants.length}');
      emit(RestaurantLoaded(restaurants));
    } catch (e, stackTrace) {
      _logger.error('Failed to load restaurants', error: e, stackTrace: stackTrace);
      emit(RestaurantError(e.toString()));
    }
  }

  Future<void> _onRestaurantSearchRequested(
    RestaurantSearchRequested event,
    Emitter<RestaurantState> emit,
  ) async {
    try {
      if (event.query.isEmpty) {
        // If search query is empty, load all restaurants
        add(const RestaurantLoadRequested());
        return;
      }

      emit(const RestaurantLoading());
      _logger.info('Searching restaurants with query: ${event.query}');

      final restaurants = await _restaurantRepository.searchRestaurants(event.query);
      
      _logger.info('Restaurant search completed: ${restaurants.length} results');
      emit(RestaurantLoaded(restaurants));
    } catch (e, stackTrace) {
      _logger.error('Restaurant search failed', error: e, stackTrace: stackTrace);
      emit(RestaurantError(e.toString()));
    }
  }

  Future<void> _onRestaurantCategoryFilterRequested(
    RestaurantCategoryFilterRequested event,
    Emitter<RestaurantState> emit,
  ) async {
    try {
      emit(const RestaurantLoading());
      _logger.info('Filtering restaurants by category: ${event.category}');

      List<RestaurantEntity> restaurants;
      if (event.category == 'All') {
        restaurants = await _restaurantRepository.getRestaurants();
      } else {
        restaurants = await _restaurantRepository.getRestaurantsByCategory(event.category);
      }
      
      _logger.info('Restaurant category filter completed: ${restaurants.length} results');
      emit(RestaurantLoaded(restaurants));
    } catch (e, stackTrace) {
      _logger.error('Restaurant category filter failed', error: e, stackTrace: stackTrace);
      emit(RestaurantError(e.toString()));
    }
  }

  Future<void> _onRestaurantRefreshRequested(
    RestaurantRefreshRequested event,
    Emitter<RestaurantState> emit,
  ) async {
    try {
      _logger.info('Refreshing restaurants');

      final restaurants = await _restaurantRepository.getRestaurants();
      
      _logger.info('Restaurants refreshed: ${restaurants.length}');
      emit(RestaurantLoaded(restaurants));
    } catch (e, stackTrace) {
      _logger.error('Failed to refresh restaurants', error: e, stackTrace: stackTrace);
      emit(RestaurantError(e.toString()));
    }
  }
}
