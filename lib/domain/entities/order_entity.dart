import 'package:equatable/equatable.dart';

class OrderEntity extends Equatable {
  final String id;
  final String customerId;
  final String restaurantId;
  final String? courierId;
  final String status;
  final double totalAmount;
  final double subtotal;
  final double deliveryFee;
  final double platformFee;
  final double tax;
  final double tip;
  final String paymentMethod;
  final String paymentStatus;
  final DateTime createdAt;
  final DateTime? updatedAt;
  final DateTime? scheduledAt;
  final DateTime? deliveredAt;
  final OrderLocationEntity deliveryLocation;
  final List<OrderItemEntity> items;
  final OrderDeliveryEntity? delivery;
  final OrderReviewEntity? review;
  final String? notes;
  final String? promoCode;
  final double? discountAmount;

  const OrderEntity({
    required this.id,
    required this.customerId,
    required this.restaurantId,
    this.courierId,
    required this.status,
    required this.totalAmount,
    required this.subtotal,
    required this.deliveryFee,
    required this.platformFee,
    required this.tax,
    required this.tip,
    required this.paymentMethod,
    required this.paymentStatus,
    required this.createdAt,
    this.updatedAt,
    this.scheduledAt,
    this.deliveredAt,
    required this.deliveryLocation,
    required this.items,
    this.delivery,
    this.review,
    this.notes,
    this.promoCode,
    this.discountAmount,
  });

  @override
  List<Object?> get props => [
        id,
        customerId,
        restaurantId,
        courierId,
        status,
        totalAmount,
        subtotal,
        deliveryFee,
        platformFee,
        tax,
        tip,
        paymentMethod,
        paymentStatus,
        createdAt,
        updatedAt,
        scheduledAt,
        deliveredAt,
        deliveryLocation,
        items,
        delivery,
        review,
        notes,
        promoCode,
        discountAmount,
      ];
}

class OrderItemEntity extends Equatable {
  final String id;
  final String menuItemId;
  final String name;
  final double price;
  final int quantity;
  final List<OrderItemOptionEntity> options;
  final String? specialInstructions;

  const OrderItemEntity({
    required this.id,
    required this.menuItemId,
    required this.name,
    required this.price,
    required this.quantity,
    required this.options,
    this.specialInstructions,
  });

  @override
  List<Object?> get props => [
        id,
        menuItemId,
        name,
        price,
        quantity,
        options,
        specialInstructions,
      ];
}

class OrderItemOptionEntity extends Equatable {
  final String id;
  final String name;
  final String value;
  final double price;

  const OrderItemOptionEntity({
    required this.id,
    required this.name,
    required this.value,
    required this.price,
  });

  @override
  List<Object?> get props => [id, name, value, price];
}

class OrderLocationEntity extends Equatable {
  final double latitude;
  final double longitude;
  final String address;
  final String building;
  final String room;
  final String? instructions;

  const OrderLocationEntity({
    required this.latitude,
    required this.longitude,
    required this.address,
    required this.building,
    required this.room,
    this.instructions,
  });

  @override
  List<Object?> get props => [
        latitude,
        longitude,
        address,
        building,
        room,
        instructions,
      ];
}

class OrderDeliveryEntity extends Equatable {
  final String id;
  final String courierId;
  final String status;
  final DateTime? assignedAt;
  final DateTime? pickedUpAt;
  final DateTime? deliveredAt;
  final double? courierLatitude;
  final double? courierLongitude;
  final String? courierNotes;
  final String? deliveryPhoto;
  final String? signature;

  const OrderDeliveryEntity({
    required this.id,
    required this.courierId,
    required this.status,
    this.assignedAt,
    this.pickedUpAt,
    this.deliveredAt,
    this.courierLatitude,
    this.courierLongitude,
    this.courierNotes,
    this.deliveryPhoto,
    this.signature,
  });

  @override
  List<Object?> get props => [
        id,
        courierId,
        status,
        assignedAt,
        pickedUpAt,
        deliveredAt,
        courierLatitude,
        courierLongitude,
        courierNotes,
        deliveryPhoto,
        signature,
      ];
}

class OrderReviewEntity extends Equatable {
  final String id;
  final double rating;
  final String? comment;
  final List<String> tags;
  final DateTime createdAt;

  const OrderReviewEntity({
    required this.id,
    required this.rating,
    this.comment,
    required this.tags,
    required this.createdAt,
  });

  @override
  List<Object?> get props => [id, rating, comment, tags, createdAt];
}

class CartEntity extends Equatable {
  final String restaurantId;
  final List<CartItemEntity> items;
  final double subtotal;
  final double deliveryFee;
  final double platformFee;
  final double tax;
  final double total;
  final String? promoCode;
  final double? discountAmount;

  const CartEntity({
    required this.restaurantId,
    required this.items,
    required this.subtotal,
    required this.deliveryFee,
    required this.platformFee,
    required this.tax,
    required this.total,
    this.promoCode,
    this.discountAmount,
  });

  @override
  List<Object?> get props => [
        restaurantId,
        items,
        subtotal,
        deliveryFee,
        platformFee,
        tax,
        total,
        promoCode,
        discountAmount,
      ];
}

class CartItemEntity extends Equatable {
  final String id;
  final String menuItemId;
  final String name;
  final double price;
  final int quantity;
  final List<CartItemOptionEntity> options;
  final String? specialInstructions;

  const CartItemEntity({
    required this.id,
    required this.menuItemId,
    required this.name,
    required this.price,
    required this.quantity,
    required this.options,
    this.specialInstructions,
  });

  @override
  List<Object?> get props => [
        id,
        menuItemId,
        name,
        price,
        quantity,
        options,
        specialInstructions,
      ];
}

class CartItemOptionEntity extends Equatable {
  final String id;
  final String name;
  final String value;
  final double price;

  const CartItemOptionEntity({
    required this.id,
    required this.name,
    required this.value,
    required this.price,
  });

  @override
  List<Object?> get props => [id, name, value, price];
}
