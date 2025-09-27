import 'package:flutter/foundation.dart';

class AppConfig {
  static const String appName = 'IUR EatsDelivery';
  static const String appVersion = '1.0.0';
  static const String appBuildNumber = '1';
  
  // Environment
  static const bool isProduction = kReleaseMode;
  static const bool isDevelopment = kDebugMode;
  static const bool isTesting = kProfileMode;
  
  // API Configuration
  static const String baseUrl = isProduction 
      ? 'https://api.iureats.com' 
      : 'https://api-dev.iureats.com';
  
  // Firebase Configuration
  static const String firebaseProjectId = 'iur-eats-delivery';
  
  // Stripe Configuration
  static const String stripePublishableKey = isProduction
      ? 'pk_live_...' // Production key
      : 'pk_test_...'; // Test key
  
  // Google Maps Configuration
  static const String googleMapsApiKey = isProduction
      ? 'AIzaSy...' // Production key
      : 'AIzaSy...'; // Test key
  
  // University Configuration
  static const String universityDomain = 'uir.ac.ma';
  static const String universityName = 'International University of Rabat';
  
  // Business Configuration
  static const double platformFee = 10.0; // DH
  static const int maxDeliveryTime = 20; // minutes
  static const int maxConcurrentUsers = 2000;
  static const double minCourierRating = 4.0;
  
  // Performance Configuration
  static const int maxImageSize = 2 * 1024 * 1024; // 2MB
  static const int maxCacheSize = 100 * 1024 * 1024; // 100MB
  static const int locationUpdateInterval = 30; // seconds
  static const int maxRetryAttempts = 3;
  
  // Security Configuration
  static const int sessionTimeout = 24 * 60 * 60; // 24 hours in seconds
  static const int maxLoginAttempts = 5;
  static const int lockoutDuration = 15 * 60; // 15 minutes in seconds
  
  // Feature Flags
  static const bool enableBiometricAuth = true;
  static const bool enablePushNotifications = true;
  static const bool enableRealTimeTracking = true;
  static const bool enableGroupOrdering = true;
  static const bool enableSurgePricing = true;
  static const bool enableAnalytics = true;
  
  // Debug Configuration
  static const bool enableLogging = isDevelopment;
  static const bool enableCrashReporting = isProduction;
  static const bool enablePerformanceMonitoring = isProduction;
}
