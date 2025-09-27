import 'package:json_annotation/json_annotation.dart';
import '../../domain/entities/order_entity.dart';

part 'order_model.g.dart';

@JsonSerializable()
class OrderModel extends OrderEntity {
  const OrderModel({
    required super.id,
    required super.customerId,
    required super.restaurantId,
    super.courierId,
    required super.status,
    required super.totalAmount,
    required super.subtotal,
    required super.deliveryFee,
    required super.platformFee,
    required super.tax,
    required super.tip,
    required super.paymentMethod,
    required super.paymentStatus,
    required super.createdAt,
    super.updatedAt,
    super.scheduledAt,
    super.deliveredAt,
    required super.deliveryLocation,
    required super.items,
    super.delivery,
    super.review,
    super.notes,
    super.promoCode,
    super.discountAmount,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) => _$OrderModelFromJson(json);

  Map<String, dynamic> toJson() => _$OrderModelToJson(this);

  factory OrderModel.fromEntity(OrderEntity entity) {
    return OrderModel(
      id: entity.id,
      customerId: entity.customerId,
      restaurantId: entity.restaurantId,
      courierId: entity.courierId,
      status: entity.status,
      totalAmount: entity.totalAmount,
      subtotal: entity.subtotal,
      deliveryFee: entity.deliveryFee,
      platformFee: entity.platformFee,
      tax: entity.tax,
      tip: entity.tip,
      paymentMethod: entity.paymentMethod,
      paymentStatus: entity.paymentStatus,
      createdAt: entity.createdAt,
      updatedAt: entity.updatedAt,
      scheduledAt: entity.scheduledAt,
      deliveredAt: entity.deliveredAt,
      deliveryLocation: entity.deliveryLocation,
      items: entity.items,
      delivery: entity.delivery,
      review: entity.review,
      notes: entity.notes,
      promoCode: entity.promoCode,
      discountAmount: entity.discountAmount,
    );
  }

  OrderEntity toEntity() {
    return OrderEntity(
      id: id,
      customerId: customerId,
      restaurantId: restaurantId,
      courierId: courierId,
      status: status,
      totalAmount: totalAmount,
      subtotal: subtotal,
      deliveryFee: deliveryFee,
      platformFee: platformFee,
      tax: tax,
      tip: tip,
      paymentMethod: paymentMethod,
      paymentStatus: paymentStatus,
      createdAt: createdAt,
      updatedAt: updatedAt,
      scheduledAt: scheduledAt,
      deliveredAt: deliveredAt,
      deliveryLocation: deliveryLocation,
      items: items,
      delivery: delivery,
      review: review,
      notes: notes,
      promoCode: promoCode,
      discountAmount: discountAmount,
    );
  }
}

@JsonSerializable()
class OrderItemModel extends OrderItemEntity {
  const OrderItemModel({
    required super.id,
    required super.menuItemId,
    required super.name,
    required super.price,
    required super.quantity,
    required super.options,
    super.specialInstructions,
  });

  factory OrderItemModel.fromJson(Map<String, dynamic> json) =>
      _$OrderItemModelFromJson(json);

  Map<String, dynamic> toJson() => _$OrderItemModelToJson(this);

  factory OrderItemModel.fromEntity(OrderItemEntity entity) {
    return OrderItemModel(
      id: entity.id,
      menuItemId: entity.menuItemId,
      name: entity.name,
      price: entity.price,
      quantity: entity.quantity,
      options: entity.options,
      specialInstructions: entity.specialInstructions,
    );
  }

  OrderItemEntity toEntity() {
    return OrderItemEntity(
      id: id,
      menuItemId: menuItemId,
      name: name,
      price: price,
      quantity: quantity,
      options: options,
      specialInstructions: specialInstructions,
    );
  }
}

@JsonSerializable()
class OrderItemOptionModel extends OrderItemOptionEntity {
  const OrderItemOptionModel({
    required super.id,
    required super.name,
    required super.value,
    required super.price,
  });

  factory OrderItemOptionModel.fromJson(Map<String, dynamic> json) =>
      _$OrderItemOptionModelFromJson(json);

  Map<String, dynamic> toJson() => _$OrderItemOptionModelToJson(this);

  factory OrderItemOptionModel.fromEntity(OrderItemOptionEntity entity) {
    return OrderItemOptionModel(
      id: entity.id,
      name: entity.name,
      value: entity.value,
      price: entity.price,
    );
  }

  OrderItemOptionEntity toEntity() {
    return OrderItemOptionEntity(
      id: id,
      name: name,
      value: value,
      price: price,
    );
  }
}

@JsonSerializable()
class OrderLocationModel extends OrderLocationEntity {
  const OrderLocationModel({
    required super.latitude,
    required super.longitude,
    required super.address,
    required super.building,
    required super.room,
    super.instructions,
  });

  factory OrderLocationModel.fromJson(Map<String, dynamic> json) =>
      _$OrderLocationModelFromJson(json);

  Map<String, dynamic> toJson() => _$OrderLocationModelToJson(this);

  factory OrderLocationModel.fromEntity(OrderLocationEntity entity) {
    return OrderLocationModel(
      latitude: entity.latitude,
      longitude: entity.longitude,
      address: entity.address,
      building: entity.building,
      room: entity.room,
      instructions: entity.instructions,
    );
  }

  OrderLocationEntity toEntity() {
    return OrderLocationEntity(
      latitude: latitude,
      longitude: longitude,
      address: address,
      building: building,
      room: room,
      instructions: instructions,
    );
  }
}

@JsonSerializable()
class OrderDeliveryModel extends OrderDeliveryEntity {
  const OrderDeliveryModel({
    required super.id,
    required super.courierId,
    required super.status,
    super.assignedAt,
    super.pickedUpAt,
    super.deliveredAt,
    super.courierLatitude,
    super.courierLongitude,
    super.courierNotes,
    super.deliveryPhoto,
    super.signature,
  });

  factory OrderDeliveryModel.fromJson(Map<String, dynamic> json) =>
      _$OrderDeliveryModelFromJson(json);

  Map<String, dynamic> toJson() => _$OrderDeliveryModelToJson(this);

  factory OrderDeliveryModel.fromEntity(OrderDeliveryEntity entity) {
    return OrderDeliveryModel(
      id: entity.id,
      courierId: entity.courierId,
      status: entity.status,
      assignedAt: entity.assignedAt,
      pickedUpAt: entity.pickedUpAt,
      deliveredAt: entity.deliveredAt,
      courierLatitude: entity.courierLatitude,
      courierLongitude: entity.courierLongitude,
      courierNotes: entity.courierNotes,
      deliveryPhoto: entity.deliveryPhoto,
      signature: entity.signature,
    );
  }

  OrderDeliveryEntity toEntity() {
    return OrderDeliveryEntity(
      id: id,
      courierId: courierId,
      status: status,
      assignedAt: assignedAt,
      pickedUpAt: pickedUpAt,
      deliveredAt: deliveredAt,
      courierLatitude: courierLatitude,
      courierLongitude: courierLongitude,
      courierNotes: courierNotes,
      deliveryPhoto: deliveryPhoto,
      signature: signature,
    );
  }
}

@JsonSerializable()
class OrderReviewModel extends OrderReviewEntity {
  const OrderReviewModel({
    required super.id,
    required super.rating,
    super.comment,
    required super.tags,
    required super.createdAt,
  });

  factory OrderReviewModel.fromJson(Map<String, dynamic> json) =>
      _$OrderReviewModelFromJson(json);

  Map<String, dynamic> toJson() => _$OrderReviewModelToJson(this);

  factory OrderReviewModel.fromEntity(OrderReviewEntity entity) {
    return OrderReviewModel(
      id: entity.id,
      rating: entity.rating,
      comment: entity.comment,
      tags: entity.tags,
      createdAt: entity.createdAt,
    );
  }

  OrderReviewEntity toEntity() {
    return OrderReviewEntity(
      id: id,
      rating: rating,
      comment: comment,
      tags: tags,
      createdAt: createdAt,
    );
  }
}

@JsonSerializable()
class CartModel extends CartEntity {
  const CartModel({
    required super.restaurantId,
    required super.items,
    required super.subtotal,
    required super.deliveryFee,
    required super.platformFee,
    required super.tax,
    required super.total,
    super.promoCode,
    super.discountAmount,
  });

  factory CartModel.fromJson(Map<String, dynamic> json) => _$CartModelFromJson(json);

  Map<String, dynamic> toJson() => _$CartModelToJson(this);

  factory CartModel.fromEntity(CartEntity entity) {
    return CartModel(
      restaurantId: entity.restaurantId,
      items: entity.items,
      subtotal: entity.subtotal,
      deliveryFee: entity.deliveryFee,
      platformFee: entity.platformFee,
      tax: entity.tax,
      total: entity.total,
      promoCode: entity.promoCode,
      discountAmount: entity.discountAmount,
    );
  }

  CartEntity toEntity() {
    return CartEntity(
      restaurantId: restaurantId,
      items: items,
      subtotal: subtotal,
      deliveryFee: deliveryFee,
      platformFee: platformFee,
      tax: tax,
      total: total,
      promoCode: promoCode,
      discountAmount: discountAmount,
    );
  }
}

@JsonSerializable()
class CartItemModel extends CartItemEntity {
  const CartItemModel({
    required super.id,
    required super.menuItemId,
    required super.name,
    required super.price,
    required super.quantity,
    required super.options,
    super.specialInstructions,
  });

  factory CartItemModel.fromJson(Map<String, dynamic> json) =>
      _$CartItemModelFromJson(json);

  Map<String, dynamic> toJson() => _$CartItemModelToJson(this);

  factory CartItemModel.fromEntity(CartItemEntity entity) {
    return CartItemModel(
      id: entity.id,
      menuItemId: entity.menuItemId,
      name: entity.name,
      price: entity.price,
      quantity: entity.quantity,
      options: entity.options,
      specialInstructions: entity.specialInstructions,
    );
  }

  CartItemEntity toEntity() {
    return CartItemEntity(
      id: id,
      menuItemId: menuItemId,
      name: name,
      price: price,
      quantity: quantity,
      options: options,
      specialInstructions: specialInstructions,
    );
  }
}

@JsonSerializable()
class CartItemOptionModel extends CartItemOptionEntity {
  const CartItemOptionModel({
    required super.id,
    required super.name,
    required super.value,
    required super.price,
  });

  factory CartItemOptionModel.fromJson(Map<String, dynamic> json) =>
      _$CartItemOptionModelFromJson(json);

  Map<String, dynamic> toJson() => _$CartItemOptionModelToJson(this);

  factory CartItemOptionModel.fromEntity(CartItemOptionEntity entity) {
    return CartItemOptionModel(
      id: entity.id,
      name: entity.name,
      value: entity.value,
      price: entity.price,
    );
  }

  CartItemOptionEntity toEntity() {
    return CartItemOptionEntity(
      id: id,
      name: name,
      value: value,
      price: price,
    );
  }
}
