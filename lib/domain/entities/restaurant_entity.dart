import 'package:equatable/equatable.dart';

class RestaurantEntity extends Equatable {
  final String id;
  final String name;
  final String description;
  final String? imageUrl;
  final String category;
  final double rating;
  final int totalReviews;
  final int deliveryTime;
  final double deliveryFee;
  final double minimumOrder;
  final bool isOpen;
  final bool isActive;
  final RestaurantLocationEntity location;
  final List<String> cuisines;
  final List<String> paymentMethods;
  final RestaurantHoursEntity hours;
  final List<MenuItemEntity> menuItems;
  final RestaurantStatsEntity stats;

  const RestaurantEntity({
    required this.id,
    required this.name,
    required this.description,
    this.imageUrl,
    required this.category,
    required this.rating,
    required this.totalReviews,
    required this.deliveryTime,
    required this.deliveryFee,
    required this.minimumOrder,
    required this.isOpen,
    required this.isActive,
    required this.location,
    required this.cuisines,
    required this.paymentMethods,
    required this.hours,
    required this.menuItems,
    required this.stats,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        description,
        imageUrl,
        category,
        rating,
        totalReviews,
        deliveryTime,
        deliveryFee,
        minimumOrder,
        isOpen,
        isActive,
        location,
        cuisines,
        paymentMethods,
        hours,
        menuItems,
        stats,
      ];
}

class RestaurantLocationEntity extends Equatable {
  final double latitude;
  final double longitude;
  final String address;
  final String building;
  final String zone;

  const RestaurantLocationEntity({
    required this.latitude,
    required this.longitude,
    required this.address,
    required this.building,
    required this.zone,
  });

  @override
  List<Object?> get props => [
        latitude,
        longitude,
        address,
        building,
        zone,
      ];
}

class RestaurantHoursEntity extends Equatable {
  final Map<String, RestaurantDayHoursEntity> weeklyHours;
  final List<String> specialHours;

  const RestaurantHoursEntity({
    required this.weeklyHours,
    required this.specialHours,
  });

  @override
  List<Object?> get props => [weeklyHours, specialHours];
}

class RestaurantDayHoursEntity extends Equatable {
  final String openTime;
  final String closeTime;
  final bool isOpen;

  const RestaurantDayHoursEntity({
    required this.openTime,
    required this.closeTime,
    required this.isOpen,
  });

  @override
  List<Object?> get props => [openTime, closeTime, isOpen];
}

class MenuItemEntity extends Equatable {
  final String id;
  final String name;
  final String description;
  final double price;
  final String? imageUrl;
  final String category;
  final bool isAvailable;
  final bool isVegetarian;
  final bool isVegan;
  final bool isGlutenFree;
  final bool isHalal;
  final List<String> allergens;
  final List<String> ingredients;
  final int preparationTime;
  final double rating;
  final int totalReviews;
  final List<MenuItemOptionEntity> options;
  final MenuItemNutritionEntity? nutrition;

  const MenuItemEntity({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    this.imageUrl,
    required this.category,
    required this.isAvailable,
    required this.isVegetarian,
    required this.isVegan,
    required this.isGlutenFree,
    required this.isHalal,
    required this.allergens,
    required this.ingredients,
    required this.preparationTime,
    required this.rating,
    required this.totalReviews,
    required this.options,
    this.nutrition,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        description,
        price,
        imageUrl,
        category,
        isAvailable,
        isVegetarian,
        isVegan,
        isGlutenFree,
        isHalal,
        allergens,
        ingredients,
        preparationTime,
        rating,
        totalReviews,
        options,
        nutrition,
      ];
}

class MenuItemOptionEntity extends Equatable {
  final String id;
  final String name;
  final List<MenuItemOptionValueEntity> values;
  final bool isRequired;
  final int maxSelections;

  const MenuItemOptionEntity({
    required this.id,
    required this.name,
    required this.values,
    required this.isRequired,
    required this.maxSelections,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        values,
        isRequired,
        maxSelections,
      ];
}

class MenuItemOptionValueEntity extends Equatable {
  final String id;
  final String name;
  final double price;
  final bool isAvailable;

  const MenuItemOptionValueEntity({
    required this.id,
    required this.name,
    required this.price,
    required this.isAvailable,
  });

  @override
  List<Object?> get props => [id, name, price, isAvailable];
}

class MenuItemNutritionEntity extends Equatable {
  final double calories;
  final double protein;
  final double carbohydrates;
  final double fat;
  final double fiber;
  final double sugar;
  final double sodium;

  const MenuItemNutritionEntity({
    required this.calories,
    required this.protein,
    required this.carbohydrates,
    required this.fat,
    required this.fiber,
    required this.sugar,
    required this.sodium,
  });

  @override
  List<Object?> get props => [
        calories,
        protein,
        carbohydrates,
        fat,
        fiber,
        sugar,
        sodium,
      ];
}

class RestaurantStatsEntity extends Equatable {
  final int totalOrders;
  final double totalRevenue;
  final double averageOrderValue;
  final int totalCustomers;
  final double averageRating;
  final int totalReviews;
  final int averageDeliveryTime;
  final double completionRate;

  const RestaurantStatsEntity({
    required this.totalOrders,
    required this.totalRevenue,
    required this.averageOrderValue,
    required this.totalCustomers,
    required this.averageRating,
    required this.totalReviews,
    required this.averageDeliveryTime,
    required this.completionRate,
  });

  @override
  List<Object?> get props => [
        totalOrders,
        totalRevenue,
        averageOrderValue,
        totalCustomers,
        averageRating,
        totalReviews,
        averageDeliveryTime,
        completionRate,
      ];
}
