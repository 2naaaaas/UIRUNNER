part of 'order_bloc.dart';

abstract class OrderEvent extends Equatable {
  const OrderEvent();

  @override
  List<Object?> get props => [];
}

class OrderLoadRequested extends OrderEvent {
  final String userId;

  const OrderLoadRequested(this.userId);

  @override
  List<Object?> get props => [userId];
}

class OrderCreateRequested extends OrderEvent {
  final OrderEntity order;

  const OrderCreateRequested(this.order);

  @override
  List<Object?> get props => [order];
}

class OrderUpdateRequested extends OrderEvent {
  final String orderId;
  final String status;

  const OrderUpdateRequested({
    required this.orderId,
    required this.status,
  });

  @override
  List<Object?> get props => [orderId, status];
}

class OrderCancelRequested extends OrderEvent {
  final String orderId;
  final String reason;

  const OrderCancelRequested({
    required this.orderId,
    required this.reason,
  });

  @override
  List<Object?> get props => [orderId, reason];
}

class OrderRefreshRequested extends OrderEvent {
  final String userId;

  const OrderRefreshRequested(this.userId);

  @override
  List<Object?> get props => [userId];
}
