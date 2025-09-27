import '../entities/order_entity.dart';

abstract class OrderRepository {
  // Order Management
  Future<OrderEntity> createOrder(OrderEntity order);
  Future<OrderEntity> getOrderById(String orderId);
  Future<List<OrderEntity>> getOrdersByCustomer(String customerId);
  Future<List<OrderEntity>> getOrdersByRestaurant(String restaurantId);
  Future<List<OrderEntity>> getOrdersByCourier(String courierId);
  Future<List<OrderEntity>> getActiveOrders();
  Future<List<OrderEntity>> getOrdersByStatus(String status);
  
  // Order Status Updates
  Future<OrderEntity> updateOrderStatus(String orderId, String status);
  Future<OrderEntity> confirmOrder(String orderId);
  Future<OrderEntity> cancelOrder(String orderId, String reason);
  Future<OrderEntity> completeOrder(String orderId);
  
  // Order Assignment
  Future<OrderEntity> assignCourier(String orderId, String courierId);
  Future<OrderEntity> unassignCourier(String orderId);
  Future<List<OrderEntity>> getAvailableOrdersForCourier(String courierId);
  
  // Order Tracking
  Future<OrderDeliveryEntity> updateDeliveryStatus(String orderId, String status);
  Future<OrderDeliveryEntity> updateCourierLocation(String orderId, double latitude, double longitude);
  Future<OrderDeliveryEntity> markOrderPickedUp(String orderId);
  Future<OrderDeliveryEntity> markOrderDelivered(String orderId, String deliveryPhoto, String signature);
  
  // Order Reviews
  Future<OrderReviewEntity> addOrderReview(String orderId, OrderReviewEntity review);
  Future<List<OrderReviewEntity>> getOrderReviews(String orderId);
  Future<void> updateOrderReview(String orderId, OrderReviewEntity review);
  Future<void> deleteOrderReview(String orderId);
  
  // Order Analytics
  Future<Map<String, dynamic>> getOrderAnalytics(DateTime startDate, DateTime endDate);
  Future<List<OrderEntity>> getOrdersByDateRange(DateTime startDate, DateTime endDate);
  Future<double> getTotalRevenue(DateTime startDate, DateTime endDate);
  Future<int> getTotalOrders(DateTime startDate, DateTime endDate);
  
  // Order Search and Filtering
  Future<List<OrderEntity>> searchOrders(String query);
  Future<List<OrderEntity>> getOrdersByPaymentMethod(String paymentMethod);
  Future<List<OrderEntity>> getOrdersByDeliveryLocation(double latitude, double longitude, double radius);
  
  // Order Notifications
  Future<void> sendOrderNotification(String orderId, String type, String message);
  Future<void> sendOrderUpdateNotification(String orderId, String status);
  
  // Order History
  Future<List<OrderEntity>> getOrderHistory(String userId, int limit, int offset);
  Future<List<OrderEntity>> getRecentOrders(String userId, int limit);
  Future<List<OrderEntity>> getFavoriteOrders(String userId);
  
  // Order Scheduling
  Future<OrderEntity> scheduleOrder(String orderId, DateTime scheduledTime);
  Future<List<OrderEntity>> getScheduledOrders(DateTime date);
  Future<void> cancelScheduledOrder(String orderId);
  
  // Order Modifications
  Future<OrderEntity> modifyOrder(String orderId, List<OrderItemEntity> newItems);
  Future<OrderEntity> addOrderNote(String orderId, String note);
  Future<OrderEntity> updateOrderLocation(String orderId, OrderLocationEntity location);
  
  // Order Payments
  Future<OrderEntity> processPayment(String orderId, String paymentMethod, double amount);
  Future<OrderEntity> refundOrder(String orderId, double amount, String reason);
  Future<List<OrderEntity>> getOrdersByPaymentStatus(String paymentStatus);
  
  // Order Statistics
  Future<Map<String, int>> getOrderStatusCounts();
  Future<double> getAverageOrderValue();
  Future<int> getAverageDeliveryTime();
  Future<double> getOrderCompletionRate();
}
