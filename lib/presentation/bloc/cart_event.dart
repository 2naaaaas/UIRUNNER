part of 'cart_bloc.dart';

abstract class CartEvent extends Equatable {
  const CartEvent();

  @override
  List<Object?> get props => [];
}

class CartLoadRequested extends CartEvent {
  const CartLoadRequested();
}

class CartItemAdded extends CartEvent {
  final CartItemEntity item;

  const CartItemAdded(this.item);

  @override
  List<Object?> get props => [item];
}

class CartItemRemoved extends CartEvent {
  final String itemId;

  const CartItemRemoved(this.itemId);

  @override
  List<Object?> get props => [itemId];
}

class CartItemQuantityChanged extends CartEvent {
  final String itemId;
  final int quantity;

  const CartItemQuantityChanged({
    required this.itemId,
    required this.quantity,
  });

  @override
  List<Object?> get props => [itemId, quantity];
}

class CartCleared extends CartEvent {
  const CartCleared();
}
