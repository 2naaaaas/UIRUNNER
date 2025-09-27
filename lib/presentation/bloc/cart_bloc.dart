import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../core/utils/logger.dart';
import '../../domain/entities/order_entity.dart';

part 'cart_event.dart';
part 'cart_state.dart';

@injectable
class CartBloc extends Bloc<CartEvent, CartState> {
  final AppLogger _logger;

  CartBloc(this._logger) : super(const CartInitial()) {
    on<CartLoadRequested>(_onCartLoadRequested);
    on<CartItemAdded>(_onCartItemAdded);
    on<CartItemRemoved>(_onCartItemRemoved);
    on<CartItemQuantityChanged>(_onCartItemQuantityChanged);
    on<CartCleared>(_onCartCleared);
  }

  Future<void> _onCartLoadRequested(
    CartLoadRequested event,
    Emitter<CartState> emit,
  ) async {
    try {
      emit(const CartLoading());
      _logger.info('Loading cart');

      // TODO: Load cart from local storage or API
      final cart = const CartEntity(
        restaurantId: '',
        items: [],
        subtotal: 0.0,
        deliveryFee: 0.0,
        platformFee: 0.0,
        tax: 0.0,
        total: 0.0,
      );
      
      _logger.info('Cart loaded');
      emit(CartLoaded(cart));
    } catch (e, stackTrace) {
      _logger.error('Failed to load cart', error: e, stackTrace: stackTrace);
      emit(CartError(e.toString()));
    }
  }

  Future<void> _onCartItemAdded(
    CartItemAdded event,
    Emitter<CartState> emit,
  ) async {
    try {
      _logger.info('Adding item to cart: ${event.item.menuItemId}');

      if (state is CartLoaded) {
        final currentCart = (state as CartLoaded).cart;
        final updatedItems = List<CartItemEntity>.from(currentCart.items);
        
        // Check if item already exists
        final existingIndex = updatedItems.indexWhere(
          (item) => item.menuItemId == event.item.menuItemId,
        );
        
        if (existingIndex >= 0) {
          // Update quantity
          updatedItems[existingIndex] = updatedItems[existingIndex].copyWith(
            quantity: updatedItems[existingIndex].quantity + event.item.quantity,
          );
        } else {
          // Add new item
          updatedItems.add(event.item);
        }
        
        final updatedCart = _calculateCartTotals(currentCart.copyWith(items: updatedItems));
        emit(CartLoaded(updatedCart));
      }
    } catch (e, stackTrace) {
      _logger.error('Failed to add item to cart', error: e, stackTrace: stackTrace);
      emit(CartError(e.toString()));
    }
  }

  Future<void> _onCartItemRemoved(
    CartItemRemoved event,
    Emitter<CartState> emit,
  ) async {
    try {
      _logger.info('Removing item from cart: ${event.itemId}');

      if (state is CartLoaded) {
        final currentCart = (state as CartLoaded).cart;
        final updatedItems = currentCart.items.where(
          (item) => item.id != event.itemId,
        ).toList();
        
        final updatedCart = _calculateCartTotals(currentCart.copyWith(items: updatedItems));
        emit(CartLoaded(updatedCart));
      }
    } catch (e, stackTrace) {
      _logger.error('Failed to remove item from cart', error: e, stackTrace: stackTrace);
      emit(CartError(e.toString()));
    }
  }

  Future<void> _onCartItemQuantityChanged(
    CartItemQuantityChanged event,
    Emitter<CartState> emit,
  ) async {
    try {
      _logger.info('Changing item quantity: ${event.itemId} to ${event.quantity}');

      if (state is CartLoaded) {
        final currentCart = (state as CartLoaded).cart;
        final updatedItems = currentCart.items.map((item) {
          if (item.id == event.itemId) {
            return item.copyWith(quantity: event.quantity);
          }
          return item;
        }).where((item) => item.quantity > 0).toList();
        
        final updatedCart = _calculateCartTotals(currentCart.copyWith(items: updatedItems));
        emit(CartLoaded(updatedCart));
      }
    } catch (e, stackTrace) {
      _logger.error('Failed to change item quantity', error: e, stackTrace: stackTrace);
      emit(CartError(e.toString()));
    }
  }

  Future<void> _onCartCleared(
    CartCleared event,
    Emitter<CartState> emit,
  ) async {
    try {
      _logger.info('Clearing cart');

      final emptyCart = const CartEntity(
        restaurantId: '',
        items: [],
        subtotal: 0.0,
        deliveryFee: 0.0,
        platformFee: 0.0,
        tax: 0.0,
        total: 0.0,
      );
      
      emit(CartLoaded(emptyCart));
    } catch (e, stackTrace) {
      _logger.error('Failed to clear cart', error: e, stackTrace: stackTrace);
      emit(CartError(e.toString()));
    }
  }

  CartEntity _calculateCartTotals(CartEntity cart) {
    final subtotal = cart.items.fold<double>(
      0.0,
      (sum, item) => sum + (item.price * item.quantity),
    );
    
    const deliveryFee = 5.0; // Fixed delivery fee
    const platformFee = 10.0; // Fixed platform fee
    const taxRate = 0.1; // 10% tax
    final tax = subtotal * taxRate;
    final total = subtotal + deliveryFee + platformFee + tax;
    
    return cart.copyWith(
      subtotal: subtotal,
      deliveryFee: deliveryFee,
      platformFee: platformFee,
      tax: tax,
      total: total,
    );
  }
}
