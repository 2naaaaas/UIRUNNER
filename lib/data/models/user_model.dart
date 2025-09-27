import 'package:json_annotation/json_annotation.dart';
import '../../domain/entities/user_entity.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel extends UserEntity {
  const UserModel({
    required super.id,
    required super.email,
    required super.firstName,
    required super.lastName,
    super.phoneNumber,
    super.profileImageUrl,
    required super.role,
    required super.isEmailVerified,
    required super.isPhoneVerified,
    required super.isActive,
    required super.createdAt,
    required super.updatedAt,
    super.preferences,
    super.location,
    super.stats,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);

  factory UserModel.fromEntity(UserEntity entity) {
    return UserModel(
      id: entity.id,
      email: entity.email,
      firstName: entity.firstName,
      lastName: entity.lastName,
      phoneNumber: entity.phoneNumber,
      profileImageUrl: entity.profileImageUrl,
      role: entity.role,
      isEmailVerified: entity.isEmailVerified,
      isPhoneVerified: entity.isPhoneVerified,
      isActive: entity.isActive,
      createdAt: entity.createdAt,
      updatedAt: entity.updatedAt,
      preferences: entity.preferences,
      location: entity.location,
      stats: entity.stats,
    );
  }

  UserEntity toEntity() {
    return UserEntity(
      id: id,
      email: email,
      firstName: firstName,
      lastName: lastName,
      phoneNumber: phoneNumber,
      profileImageUrl: profileImageUrl,
      role: role,
      isEmailVerified: isEmailVerified,
      isPhoneVerified: isPhoneVerified,
      isActive: isActive,
      createdAt: createdAt,
      updatedAt: updatedAt,
      preferences: preferences,
      location: location,
      stats: stats,
    );
  }
}

@JsonSerializable()
class UserPreferencesModel extends UserPreferencesEntity {
  const UserPreferencesModel({
    required super.language,
    required super.currency,
    required super.notificationsEnabled,
    required super.locationTrackingEnabled,
    required super.biometricAuthEnabled,
    required super.theme,
    required super.dietaryRestrictions,
    required super.maxDeliveryDistance,
    required super.preferredDeliveryTime,
  });

  factory UserPreferencesModel.fromJson(Map<String, dynamic> json) =>
      _$UserPreferencesModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserPreferencesModelToJson(this);

  factory UserPreferencesModel.fromEntity(UserPreferencesEntity entity) {
    return UserPreferencesModel(
      language: entity.language,
      currency: entity.currency,
      notificationsEnabled: entity.notificationsEnabled,
      locationTrackingEnabled: entity.locationTrackingEnabled,
      biometricAuthEnabled: entity.biometricAuthEnabled,
      theme: entity.theme,
      dietaryRestrictions: entity.dietaryRestrictions,
      maxDeliveryDistance: entity.maxDeliveryDistance,
      preferredDeliveryTime: entity.preferredDeliveryTime,
    );
  }

  UserPreferencesEntity toEntity() {
    return UserPreferencesEntity(
      language: language,
      currency: currency,
      notificationsEnabled: notificationsEnabled,
      locationTrackingEnabled: locationTrackingEnabled,
      biometricAuthEnabled: biometricAuthEnabled,
      theme: theme,
      dietaryRestrictions: dietaryRestrictions,
      maxDeliveryDistance: maxDeliveryDistance,
      preferredDeliveryTime: preferredDeliveryTime,
    );
  }
}

@JsonSerializable()
class UserLocationModel extends UserLocationEntity {
  const UserLocationModel({
    required super.latitude,
    required super.longitude,
    super.address,
    super.building,
    super.room,
    required super.lastUpdated,
    required super.accuracy,
  });

  factory UserLocationModel.fromJson(Map<String, dynamic> json) =>
      _$UserLocationModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserLocationModelToJson(this);

  factory UserLocationModel.fromEntity(UserLocationEntity entity) {
    return UserLocationModel(
      latitude: entity.latitude,
      longitude: entity.longitude,
      address: entity.address,
      building: entity.building,
      room: entity.room,
      lastUpdated: entity.lastUpdated,
      accuracy: entity.accuracy,
    );
  }

  UserLocationEntity toEntity() {
    return UserLocationEntity(
      latitude: latitude,
      longitude: longitude,
      address: address,
      building: building,
      room: room,
      lastUpdated: lastUpdated,
      accuracy: accuracy,
    );
  }
}

@JsonSerializable()
class UserStatsModel extends UserStatsEntity {
  const UserStatsModel({
    required super.totalOrders,
    required super.completedOrders,
    required super.cancelledOrders,
    required super.totalSpent,
    required super.totalEarned,
    required super.averageRating,
    required super.totalReviews,
    required super.totalDeliveries,
    required super.totalDistance,
    required super.totalTime,
  });

  factory UserStatsModel.fromJson(Map<String, dynamic> json) =>
      _$UserStatsModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserStatsModelToJson(this);

  factory UserStatsModel.fromEntity(UserStatsEntity entity) {
    return UserStatsModel(
      totalOrders: entity.totalOrders,
      completedOrders: entity.completedOrders,
      cancelledOrders: entity.cancelledOrders,
      totalSpent: entity.totalSpent,
      totalEarned: entity.totalEarned,
      averageRating: entity.averageRating,
      totalReviews: entity.totalReviews,
      totalDeliveries: entity.totalDeliveries,
      totalDistance: entity.totalDistance,
      totalTime: entity.totalTime,
    );
  }

  UserStatsEntity toEntity() {
    return UserStatsEntity(
      totalOrders: totalOrders,
      completedOrders: completedOrders,
      cancelledOrders: cancelledOrders,
      totalSpent: totalSpent,
      totalEarned: totalEarned,
      averageRating: averageRating,
      totalReviews: totalReviews,
      totalDeliveries: totalDeliveries,
      totalDistance: totalDistance,
      totalTime: totalTime,
    );
  }
}
