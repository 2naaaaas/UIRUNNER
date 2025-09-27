class AppConstants {
  // App Information
  static const String appName = 'IUR EatsDelivery';
  static const String appVersion = '1.0.0';
  static const String appDescription = 'Peer-to-peer campus meal delivery platform';
  
  // University Information
  static const String universityName = 'International University of Rabat';
  static const String universityDomain = 'uir.ac.ma';
  static const String universityLocation = 'Rabat, Morocco';
  
  // Business Metrics
  static const double platformFee = 10.0; // DH per order
  static const int targetDailyOrders = 2000;
  static const double targetDailyRevenue = 20000.0; // DH
  static const int maxDeliveryTime = 20; // minutes
  static const double minCourierRating = 4.0;
  
  // User Roles
  static const String roleCustomer = 'customer';
  static const String roleCourier = 'courier';
  static const String roleAdmin = 'admin';
  static const String roleRestaurant = 'restaurant';
  
  // Order Status
  static const String orderStatusPending = 'pending';
  static const String orderStatusConfirmed = 'confirmed';
  static const String orderStatusPreparing = 'preparing';
  static const String orderStatusReady = 'ready';
  static const String orderStatusPickedUp = 'picked_up';
  static const String orderStatusDelivered = 'delivered';
  static const String orderStatusCancelled = 'cancelled';
  
  // Delivery Status
  static const String deliveryStatusAssigned = 'assigned';
  static const String deliveryStatusPickedUp = 'picked_up';
  static const String deliveryStatusInTransit = 'in_transit';
  static const String deliveryStatusDelivered = 'delivered';
  static const String deliveryStatusFailed = 'failed';
  
  // Payment Status
  static const String paymentStatusPending = 'pending';
  static const String paymentStatusCompleted = 'completed';
  static const String paymentStatusFailed = 'failed';
  static const String paymentStatusRefunded = 'refunded';
  
  // Payment Methods
  static const String paymentMethodCard = 'card';
  static const String paymentMethodWallet = 'wallet';
  static const String paymentMethodCash = 'cash';
  static const String paymentMethodStripe = 'stripe';
  
  // Notification Types
  static const String notificationTypeOrder = 'order';
  static const String notificationTypeDelivery = 'delivery';
  static const String notificationTypePayment = 'payment';
  static const String notificationTypePromotion = 'promotion';
  static const String notificationTypeSystem = 'system';
  
  // Cache Keys
  static const String cacheKeyUser = 'user_data';
  static const String cacheKeyRestaurants = 'restaurants_data';
  static const String cacheKeyOrders = 'orders_data';
  static const String cacheKeySettings = 'app_settings';
  static const String cacheKeyLocation = 'last_location';
  
  // API Endpoints
  static const String apiBaseUrl = '/api/v1';
  static const String apiAuth = '$apiBaseUrl/auth';
  static const String apiUsers = '$apiBaseUrl/users';
  static const String apiRestaurants = '$apiBaseUrl/restaurants';
  static const String apiOrders = '$apiBaseUrl/orders';
  static const String apiDeliveries = '$apiBaseUrl/deliveries';
  static const String apiPayments = '$apiBaseUrl/payments';
  static const String apiNotifications = '$apiBaseUrl/notifications';
  
  // Storage Paths
  static const String storageUsers = 'users';
  static const String storageRestaurants = 'restaurants';
  static const String storageOrders = 'orders';
  static const String storageDeliveries = 'deliveries';
  static const String storageDocuments = 'documents';
  
  // Validation Rules
  static const int minPasswordLength = 8;
  static const int maxPasswordLength = 50;
  static const int minPhoneLength = 10;
  static const int maxPhoneLength = 15;
  static const int minNameLength = 2;
  static const int maxNameLength = 50;
  
  // Time Limits
  static const int orderModificationTimeLimit = 5; // minutes
  static const int courierResponseTimeLimit = 2; // minutes
  static const int deliveryTimeLimit = 30; // minutes
  static const int sessionTimeout = 24 * 60 * 60; // 24 hours in seconds
  
  // Distance Limits
  static const double maxDeliveryDistance = 5.0; // km
  static const double maxPickupDistance = 2.0; // km
  static const double minCourierDistance = 0.5; // km
  
  // Rating Limits
  static const double minRating = 1.0;
  static const double maxRating = 5.0;
  static const int minReviewsForRating = 5;
  
  // File Limits
  static const int maxImageSize = 2 * 1024 * 1024; // 2MB
  static const int maxDocumentSize = 5 * 1024 * 1024; // 5MB
  static const List<String> allowedImageTypes = ['jpg', 'jpeg', 'png', 'webp'];
  static const List<String> allowedDocumentTypes = ['pdf', 'doc', 'docx'];
  
  // Retry Configuration
  static const int maxRetryAttempts = 3;
  static const int retryDelaySeconds = 2;
  static const int networkTimeoutSeconds = 30;
  
  // Pagination
  static const int defaultPageSize = 20;
  static const int maxPageSize = 100;
  
  // Animation Durations
  static const int shortAnimationDuration = 200;
  static const int mediumAnimationDuration = 300;
  static const int longAnimationDuration = 500;
  
  // Error Messages
  static const String errorNetworkConnection = 'No internet connection';
  static const String errorServerUnavailable = 'Server is temporarily unavailable';
  static const String errorInvalidCredentials = 'Invalid email or password';
  static const String errorUserNotFound = 'User not found';
  static const String errorOrderNotFound = 'Order not found';
  static const String errorPaymentFailed = 'Payment failed';
  static const String errorLocationPermission = 'Location permission required';
  static const String errorCameraPermission = 'Camera permission required';
  static const String errorGeneric = 'Something went wrong';
}
