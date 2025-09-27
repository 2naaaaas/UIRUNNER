import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String id;
  final String email;
  final String firstName;
  final String lastName;
  final String? phoneNumber;
  final String? profileImageUrl;
  final String role;
  final bool isEmailVerified;
  final bool isPhoneVerified;
  final bool isActive;
  final DateTime createdAt;
  final DateTime updatedAt;
  final UserPreferencesEntity? preferences;
  final UserLocationEntity? location;
  final UserStatsEntity? stats;

  const UserEntity({
    required this.id,
    required this.email,
    required this.firstName,
    required this.lastName,
    this.phoneNumber,
    this.profileImageUrl,
    required this.role,
    required this.isEmailVerified,
    required this.isPhoneVerified,
    required this.isActive,
    required this.createdAt,
    required this.updatedAt,
    this.preferences,
    this.location,
    this.stats,
  });

  @override
  List<Object?> get props => [
        id,
        email,
        firstName,
        lastName,
        phoneNumber,
        profileImageUrl,
        role,
        isEmailVerified,
        isPhoneVerified,
        isActive,
        createdAt,
        updatedAt,
        preferences,
        location,
        stats,
      ];

  UserEntity copyWith({
    String? id,
    String? email,
    String? firstName,
    String? lastName,
    String? phoneNumber,
    String? profileImageUrl,
    String? role,
    bool? isEmailVerified,
    bool? isPhoneVerified,
    bool? isActive,
    DateTime? createdAt,
    DateTime? updatedAt,
    UserPreferencesEntity? preferences,
    UserLocationEntity? location,
    UserStatsEntity? stats,
  }) {
    return UserEntity(
      id: id ?? this.id,
      email: email ?? this.email,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      profileImageUrl: profileImageUrl ?? this.profileImageUrl,
      role: role ?? this.role,
      isEmailVerified: isEmailVerified ?? this.isEmailVerified,
      isPhoneVerified: isPhoneVerified ?? this.isPhoneVerified,
      isActive: isActive ?? this.isActive,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      preferences: preferences ?? this.preferences,
      location: location ?? this.location,
      stats: stats ?? this.stats,
    );
  }
}

class UserPreferencesEntity extends Equatable {
  final String language;
  final String currency;
  final bool notificationsEnabled;
  final bool locationTrackingEnabled;
  final bool biometricAuthEnabled;
  final String theme;
  final List<String> dietaryRestrictions;
  final double maxDeliveryDistance;
  final int preferredDeliveryTime;

  const UserPreferencesEntity({
    required this.language,
    required this.currency,
    required this.notificationsEnabled,
    required this.locationTrackingEnabled,
    required this.biometricAuthEnabled,
    required this.theme,
    required this.dietaryRestrictions,
    required this.maxDeliveryDistance,
    required this.preferredDeliveryTime,
  });

  @override
  List<Object?> get props => [
        language,
        currency,
        notificationsEnabled,
        locationTrackingEnabled,
        biometricAuthEnabled,
        theme,
        dietaryRestrictions,
        maxDeliveryDistance,
        preferredDeliveryTime,
      ];
}

class UserLocationEntity extends Equatable {
  final double latitude;
  final double longitude;
  final String? address;
  final String? building;
  final String? room;
  final DateTime lastUpdated;
  final double accuracy;

  const UserLocationEntity({
    required this.latitude,
    required this.longitude,
    this.address,
    this.building,
    this.room,
    required this.lastUpdated,
    required this.accuracy,
  });

  @override
  List<Object?> get props => [
        latitude,
        longitude,
        address,
        building,
        room,
        lastUpdated,
        accuracy,
      ];
}

class UserStatsEntity extends Equatable {
  final int totalOrders;
  final int completedOrders;
  final int cancelledOrders;
  final double totalSpent;
  final double totalEarned;
  final double averageRating;
  final int totalReviews;
  final int totalDeliveries;
  final double totalDistance;
  final int totalTime;

  const UserStatsEntity({
    required this.totalOrders,
    required this.completedOrders,
    required this.cancelledOrders,
    required this.totalSpent,
    required this.totalEarned,
    required this.averageRating,
    required this.totalReviews,
    required this.totalDeliveries,
    required this.totalDistance,
    required this.totalTime,
  });

  @override
  List<Object?> get props => [
        totalOrders,
        completedOrders,
        cancelledOrders,
        totalSpent,
        totalEarned,
        averageRating,
        totalReviews,
        totalDeliveries,
        totalDistance,
        totalTime,
      ];
}
