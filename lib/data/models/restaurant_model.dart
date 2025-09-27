import 'package:json_annotation/json_annotation.dart';
import '../../domain/entities/restaurant_entity.dart';

part 'restaurant_model.g.dart';

@JsonSerializable()
class RestaurantModel extends RestaurantEntity {
  const RestaurantModel({
    required super.id,
    required super.name,
    required super.description,
    super.imageUrl,
    required super.category,
    required super.rating,
    required super.totalReviews,
    required super.deliveryTime,
    required super.deliveryFee,
    required super.minimumOrder,
    required super.isOpen,
    required super.isActive,
    required super.location,
    required super.cuisines,
    required super.paymentMethods,
    required super.hours,
    required super.menuItems,
    required super.stats,
  });

  factory RestaurantModel.fromJson(Map<String, dynamic> json) =>
      _$RestaurantModelFromJson(json);

  Map<String, dynamic> toJson() => _$RestaurantModelToJson(this);

  factory RestaurantModel.fromEntity(RestaurantEntity entity) {
    return RestaurantModel(
      id: entity.id,
      name: entity.name,
      description: entity.description,
      imageUrl: entity.imageUrl,
      category: entity.category,
      rating: entity.rating,
      totalReviews: entity.totalReviews,
      deliveryTime: entity.deliveryTime,
      deliveryFee: entity.deliveryFee,
      minimumOrder: entity.minimumOrder,
      isOpen: entity.isOpen,
      isActive: entity.isActive,
      location: entity.location,
      cuisines: entity.cuisines,
      paymentMethods: entity.paymentMethods,
      hours: entity.hours,
      menuItems: entity.menuItems,
      stats: entity.stats,
    );
  }

  RestaurantEntity toEntity() {
    return RestaurantEntity(
      id: id,
      name: name,
      description: description,
      imageUrl: imageUrl,
      category: category,
      rating: rating,
      totalReviews: totalReviews,
      deliveryTime: deliveryTime,
      deliveryFee: deliveryFee,
      minimumOrder: minimumOrder,
      isOpen: isOpen,
      isActive: isActive,
      location: location,
      cuisines: cuisines,
      paymentMethods: paymentMethods,
      hours: hours,
      menuItems: menuItems,
      stats: stats,
    );
  }
}

@JsonSerializable()
class RestaurantLocationModel extends RestaurantLocationEntity {
  const RestaurantLocationModel({
    required super.latitude,
    required super.longitude,
    required super.address,
    required super.building,
    required super.zone,
  });

  factory RestaurantLocationModel.fromJson(Map<String, dynamic> json) =>
      _$RestaurantLocationModelFromJson(json);

  Map<String, dynamic> toJson() => _$RestaurantLocationModelToJson(this);

  factory RestaurantLocationModel.fromEntity(RestaurantLocationEntity entity) {
    return RestaurantLocationModel(
      latitude: entity.latitude,
      longitude: entity.longitude,
      address: entity.address,
      building: entity.building,
      zone: entity.zone,
    );
  }

  RestaurantLocationEntity toEntity() {
    return RestaurantLocationEntity(
      latitude: latitude,
      longitude: longitude,
      address: address,
      building: building,
      zone: zone,
    );
  }
}

@JsonSerializable()
class RestaurantHoursModel extends RestaurantHoursEntity {
  const RestaurantHoursModel({
    required super.weeklyHours,
    required super.specialHours,
  });

  factory RestaurantHoursModel.fromJson(Map<String, dynamic> json) =>
      _$RestaurantHoursModelFromJson(json);

  Map<String, dynamic> toJson() => _$RestaurantHoursModelToJson(this);

  factory RestaurantHoursModel.fromEntity(RestaurantHoursEntity entity) {
    return RestaurantHoursModel(
      weeklyHours: entity.weeklyHours,
      specialHours: entity.specialHours,
    );
  }

  RestaurantHoursEntity toEntity() {
    return RestaurantHoursEntity(
      weeklyHours: weeklyHours,
      specialHours: specialHours,
    );
  }
}

@JsonSerializable()
class RestaurantDayHoursModel extends RestaurantDayHoursEntity {
  const RestaurantDayHoursModel({
    required super.openTime,
    required super.closeTime,
    required super.isOpen,
  });

  factory RestaurantDayHoursModel.fromJson(Map<String, dynamic> json) =>
      _$RestaurantDayHoursModelFromJson(json);

  Map<String, dynamic> toJson() => _$RestaurantDayHoursModelToJson(this);

  factory RestaurantDayHoursModel.fromEntity(RestaurantDayHoursEntity entity) {
    return RestaurantDayHoursModel(
      openTime: entity.openTime,
      closeTime: entity.closeTime,
      isOpen: entity.isOpen,
    );
  }

  RestaurantDayHoursEntity toEntity() {
    return RestaurantDayHoursEntity(
      openTime: openTime,
      closeTime: closeTime,
      isOpen: isOpen,
    );
  }
}

@JsonSerializable()
class MenuItemModel extends MenuItemEntity {
  const MenuItemModel({
    required super.id,
    required super.name,
    required super.description,
    required super.price,
    super.imageUrl,
    required super.category,
    required super.isAvailable,
    required super.isVegetarian,
    required super.isVegan,
    required super.isGlutenFree,
    required super.isHalal,
    required super.allergens,
    required super.ingredients,
    required super.preparationTime,
    required super.rating,
    required super.totalReviews,
    required super.options,
    super.nutrition,
  });

  factory MenuItemModel.fromJson(Map<String, dynamic> json) =>
      _$MenuItemModelFromJson(json);

  Map<String, dynamic> toJson() => _$MenuItemModelToJson(this);

  factory MenuItemModel.fromEntity(MenuItemEntity entity) {
    return MenuItemModel(
      id: entity.id,
      name: entity.name,
      description: entity.description,
      price: entity.price,
      imageUrl: entity.imageUrl,
      category: entity.category,
      isAvailable: entity.isAvailable,
      isVegetarian: entity.isVegetarian,
      isVegan: entity.isVegan,
      isGlutenFree: entity.isGlutenFree,
      isHalal: entity.isHalal,
      allergens: entity.allergens,
      ingredients: entity.ingredients,
      preparationTime: entity.preparationTime,
      rating: entity.rating,
      totalReviews: entity.totalReviews,
      options: entity.options,
      nutrition: entity.nutrition,
    );
  }

  MenuItemEntity toEntity() {
    return MenuItemEntity(
      id: id,
      name: name,
      description: description,
      price: price,
      imageUrl: imageUrl,
      category: category,
      isAvailable: isAvailable,
      isVegetarian: isVegetarian,
      isVegan: isVegan,
      isGlutenFree: isGlutenFree,
      isHalal: isHalal,
      allergens: allergens,
      ingredients: ingredients,
      preparationTime: preparationTime,
      rating: rating,
      totalReviews: totalReviews,
      options: options,
      nutrition: nutrition,
    );
  }
}

@JsonSerializable()
class MenuItemOptionModel extends MenuItemOptionEntity {
  const MenuItemOptionModel({
    required super.id,
    required super.name,
    required super.values,
    required super.isRequired,
    required super.maxSelections,
  });

  factory MenuItemOptionModel.fromJson(Map<String, dynamic> json) =>
      _$MenuItemOptionModelFromJson(json);

  Map<String, dynamic> toJson() => _$MenuItemOptionModelToJson(this);

  factory MenuItemOptionModel.fromEntity(MenuItemOptionEntity entity) {
    return MenuItemOptionModel(
      id: entity.id,
      name: entity.name,
      values: entity.values,
      isRequired: entity.isRequired,
      maxSelections: entity.maxSelections,
    );
  }

  MenuItemOptionEntity toEntity() {
    return MenuItemOptionEntity(
      id: id,
      name: name,
      values: values,
      isRequired: isRequired,
      maxSelections: maxSelections,
    );
  }
}

@JsonSerializable()
class MenuItemOptionValueModel extends MenuItemOptionValueEntity {
  const MenuItemOptionValueModel({
    required super.id,
    required super.name,
    required super.price,
    required super.isAvailable,
  });

  factory MenuItemOptionValueModel.fromJson(Map<String, dynamic> json) =>
      _$MenuItemOptionValueModelFromJson(json);

  Map<String, dynamic> toJson() => _$MenuItemOptionValueModelToJson(this);

  factory MenuItemOptionValueModel.fromEntity(MenuItemOptionValueEntity entity) {
    return MenuItemOptionValueModel(
      id: entity.id,
      name: entity.name,
      price: entity.price,
      isAvailable: entity.isAvailable,
    );
  }

  MenuItemOptionValueEntity toEntity() {
    return MenuItemOptionValueEntity(
      id: id,
      name: name,
      price: price,
      isAvailable: isAvailable,
    );
  }
}

@JsonSerializable()
class MenuItemNutritionModel extends MenuItemNutritionEntity {
  const MenuItemNutritionModel({
    required super.calories,
    required super.protein,
    required super.carbohydrates,
    required super.fat,
    required super.fiber,
    required super.sugar,
    required super.sodium,
  });

  factory MenuItemNutritionModel.fromJson(Map<String, dynamic> json) =>
      _$MenuItemNutritionModelFromJson(json);

  Map<String, dynamic> toJson() => _$MenuItemNutritionModelToJson(this);

  factory MenuItemNutritionModel.fromEntity(MenuItemNutritionEntity entity) {
    return MenuItemNutritionModel(
      calories: entity.calories,
      protein: entity.protein,
      carbohydrates: entity.carbohydrates,
      fat: entity.fat,
      fiber: entity.fiber,
      sugar: entity.sugar,
      sodium: entity.sodium,
    );
  }

  MenuItemNutritionEntity toEntity() {
    return MenuItemNutritionEntity(
      calories: calories,
      protein: protein,
      carbohydrates: carbohydrates,
      fat: fat,
      fiber: fiber,
      sugar: sugar,
      sodium: sodium,
    );
  }
}

@JsonSerializable()
class RestaurantStatsModel extends RestaurantStatsEntity {
  const RestaurantStatsModel({
    required super.totalOrders,
    required super.totalRevenue,
    required super.averageOrderValue,
    required super.totalCustomers,
    required super.averageRating,
    required super.totalReviews,
    required super.averageDeliveryTime,
    required super.completionRate,
  });

  factory RestaurantStatsModel.fromJson(Map<String, dynamic> json) =>
      _$RestaurantStatsModelFromJson(json);

  Map<String, dynamic> toJson() => _$RestaurantStatsModelToJson(this);

  factory RestaurantStatsModel.fromEntity(RestaurantStatsEntity entity) {
    return RestaurantStatsModel(
      totalOrders: entity.totalOrders,
      totalRevenue: entity.totalRevenue,
      averageOrderValue: entity.averageOrderValue,
      totalCustomers: entity.totalCustomers,
      averageRating: entity.averageRating,
      totalReviews: entity.totalReviews,
      averageDeliveryTime: entity.averageDeliveryTime,
      completionRate: entity.completionRate,
    );
  }

  RestaurantStatsEntity toEntity() {
    return RestaurantStatsEntity(
      totalOrders: totalOrders,
      totalRevenue: totalRevenue,
      averageOrderValue: averageOrderValue,
      totalCustomers: totalCustomers,
      averageRating: averageRating,
      totalReviews: totalReviews,
      averageDeliveryTime: averageDeliveryTime,
      completionRate: completionRate,
    );
  }
}
