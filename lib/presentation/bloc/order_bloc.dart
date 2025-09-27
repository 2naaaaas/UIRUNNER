import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../core/utils/logger.dart';
import '../../domain/entities/order_entity.dart';
import '../../domain/repositories/order_repository.dart';

part 'order_event.dart';
part 'order_state.dart';

@injectable
class OrderBloc extends Bloc<OrderEvent, OrderState> {
  final OrderRepository _orderRepository;
  final AppLogger _logger;

  OrderBloc(
    this._orderRepository,
    this._logger,
  ) : super(const OrderInitial()) {
    on<OrderLoadRequested>(_onOrderLoadRequested);
    on<OrderCreateRequested>(_onOrderCreateRequested);
    on<OrderUpdateRequested>(_onOrderUpdateRequested);
    on<OrderCancelRequested>(_onOrderCancelRequested);
    on<OrderRefreshRequested>(_onOrderRefreshRequested);
  }

  Future<void> _onOrderLoadRequested(
    OrderLoadRequested event,
    Emitter<OrderState> emit,
  ) async {
    try {
      emit(const OrderLoading());
      _logger.info('Loading orders for user: ${event.userId}');

      final orders = await _orderRepository.getOrdersByCustomer(event.userId);
      
      _logger.info('Orders loaded: ${orders.length}');
      emit(OrderLoaded(orders));
    } catch (e, stackTrace) {
      _logger.error('Failed to load orders', error: e, stackTrace: stackTrace);
      emit(OrderError(e.toString()));
    }
  }

  Future<void> _onOrderCreateRequested(
    OrderCreateRequested event,
    Emitter<OrderState> emit,
  ) async {
    try {
      emit(const OrderLoading());
      _logger.info('Creating order');

      final order = await _orderRepository.createOrder(event.order);
      
      _logger.info('Order created: ${order.id}');
      emit(OrderCreated(order));
    } catch (e, stackTrace) {
      _logger.error('Failed to create order', error: e, stackTrace: stackTrace);
      emit(OrderError(e.toString()));
    }
  }

  Future<void> _onOrderUpdateRequested(
    OrderUpdateRequested event,
    Emitter<OrderState> emit,
  ) async {
    try {
      emit(const OrderLoading());
      _logger.info('Updating order: ${event.orderId}');

      final order = await _orderRepository.updateOrderStatus(event.orderId, event.status);
      
      _logger.info('Order updated: ${order.id}');
      emit(OrderUpdated(order));
    } catch (e, stackTrace) {
      _logger.error('Failed to update order', error: e, stackTrace: stackTrace);
      emit(OrderError(e.toString()));
    }
  }

  Future<void> _onOrderCancelRequested(
    OrderCancelRequested event,
    Emitter<OrderState> emit,
  ) async {
    try {
      emit(const OrderLoading());
      _logger.info('Cancelling order: ${event.orderId}');

      final order = await _orderRepository.cancelOrder(event.orderId, event.reason);
      
      _logger.info('Order cancelled: ${order.id}');
      emit(OrderCancelled(order));
    } catch (e, stackTrace) {
      _logger.error('Failed to cancel order', error: e, stackTrace: stackTrace);
      emit(OrderError(e.toString()));
    }
  }

  Future<void> _onOrderRefreshRequested(
    OrderRefreshRequested event,
    Emitter<OrderState> emit,
  ) async {
    try {
      _logger.info('Refreshing orders for user: ${event.userId}');

      final orders = await _orderRepository.getOrdersByCustomer(event.userId);
      
      _logger.info('Orders refreshed: ${orders.length}');
      emit(OrderLoaded(orders));
    } catch (e, stackTrace) {
      _logger.error('Failed to refresh orders', error: e, stackTrace: stackTrace);
      emit(OrderError(e.toString()));
    }
  }
}
