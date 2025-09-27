import '../entities/restaurant_entity.dart';

abstract class RestaurantRepository {
  // Restaurant Management
  Future<List<RestaurantEntity>> getRestaurants();
  Future<RestaurantEntity> getRestaurantById(String restaurantId);
  Future<List<RestaurantEntity>> getRestaurantsByCategory(String category);
  Future<List<RestaurantEntity>> getRestaurantsByLocation(double latitude, double longitude, double radius);
  Future<List<RestaurantEntity>> searchRestaurants(String query);
  Future<List<RestaurantEntity>> getOpenRestaurants();
  Future<List<RestaurantEntity>> getFeaturedRestaurants();
  
  // Restaurant CRUD
  Future<RestaurantEntity> createRestaurant(RestaurantEntity restaurant);
  Future<RestaurantEntity> updateRestaurant(RestaurantEntity restaurant);
  Future<void> deleteRestaurant(String restaurantId);
  Future<void> activateRestaurant(String restaurantId);
  Future<void> deactivateRestaurant(String restaurantId);
  
  // Restaurant Hours
  Future<RestaurantHoursEntity> getRestaurantHours(String restaurantId);
  Future<void> updateRestaurantHours(String restaurantId, RestaurantHoursEntity hours);
  
  // Menu Management
  Future<List<MenuItemEntity>> getMenuItems(String restaurantId);
  Future<MenuItemEntity> getMenuItemById(String restaurantId, String menuItemId);
  Future<List<MenuItemEntity>> getMenuItemsByCategory(String restaurantId, String category);
  Future<List<MenuItemEntity>> searchMenuItems(String restaurantId, String query);
  Future<List<MenuItemEntity>> getAvailableMenuItems(String restaurantId);
  
  // Menu Item CRUD
  Future<MenuItemEntity> createMenuItem(String restaurantId, MenuItemEntity menuItem);
  Future<MenuItemEntity> updateMenuItem(String restaurantId, MenuItemEntity menuItem);
  Future<void> deleteMenuItem(String restaurantId, String menuItemId);
  Future<void> toggleMenuItemAvailability(String restaurantId, String menuItemId, bool isAvailable);
  
  // Menu Categories
  Future<List<String>> getMenuCategories(String restaurantId);
  Future<void> addMenuCategory(String restaurantId, String category);
  Future<void> removeMenuCategory(String restaurantId, String category);
  
  // Restaurant Stats
  Future<RestaurantStatsEntity> getRestaurantStats(String restaurantId);
  Future<void> updateRestaurantStats(String restaurantId, RestaurantStatsEntity stats);
  
  // Restaurant Images
  Future<void> uploadRestaurantImage(String restaurantId, String imagePath);
  Future<void> deleteRestaurantImage(String restaurantId);
  Future<void> uploadMenuItemImage(String restaurantId, String menuItemId, String imagePath);
  Future<void> deleteMenuItemImage(String restaurantId, String menuItemId);
  
  // Restaurant Reviews
  Future<List<RestaurantEntity>> getRestaurantsByRating(double minRating);
  Future<void> updateRestaurantRating(String restaurantId, double rating);
  
  // Restaurant Availability
  Future<bool> isRestaurantOpen(String restaurantId);
  Future<bool> isRestaurantAvailableForDelivery(String restaurantId, double latitude, double longitude);
  Future<void> setRestaurantAvailability(String restaurantId, bool isOpen);
  
  // Restaurant Analytics
  Future<Map<String, dynamic>> getRestaurantAnalytics(String restaurantId, DateTime startDate, DateTime endDate);
  Future<List<RestaurantEntity>> getTopPerformingRestaurants(int limit);
  Future<List<RestaurantEntity>> getRestaurantsByRevenue(double minRevenue);
}
