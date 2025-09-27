import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/theme/app_theme.dart';
import '../bloc/order_bloc.dart';
import '../widgets/order_card.dart';
import '../widgets/loading_widget.dart';
import '../widgets/error_widget.dart';

class OrdersPage extends StatefulWidget {
  const OrdersPage({super.key});

  @override
  State<OrdersPage> createState() => _OrdersPageState();
}

class _OrdersPageState extends State<OrdersPage> with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    context.read<OrderBloc>().add(const OrderLoadRequested());
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      appBar: AppBar(
        title: Text(
          'My Orders',
          style: TextStyle(
            fontSize: 20.sp,
            fontWeight: FontWeight.w600,
            color: AppTheme.textPrimaryColor,
            fontFamily: 'Poppins',
          ),
        ),
        backgroundColor: AppTheme.surfaceColor,
        elevation: 0,
        bottom: TabBar(
          controller: _tabController,
          labelColor: AppTheme.primaryColor,
          unselectedLabelColor: AppTheme.textTertiaryColor,
          indicatorColor: AppTheme.primaryColor,
          labelStyle: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w600,
            fontFamily: 'Poppins',
          ),
          unselectedLabelStyle: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.normal,
            fontFamily: 'Poppins',
          ),
          tabs: const [
            Tab(text: 'Active'),
            Tab(text: 'History'),
            Tab(text: 'Cancelled'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildActiveOrders(),
          _buildOrderHistory(),
          _buildCancelledOrders(),
        ],
      ),
    );
  }

  Widget _buildActiveOrders() {
    return BlocBuilder<OrderBloc, OrderState>(
      builder: (context, state) {
        if (state is OrderLoading) {
          return const LoadingWidget();
        } else if (state is OrderError) {
          return CustomErrorWidget(
            message: state.message,
            onRetry: () {
              context.read<OrderBloc>().add(const OrderLoadRequested());
            },
          );
        } else if (state is OrderLoaded) {
          final activeOrders = state.orders
              .where((order) => order.status != 'delivered' && order.status != 'cancelled')
              .toList();
          
          if (activeOrders.isEmpty) {
            return _buildEmptyState(
              icon: Icons.shopping_bag_outlined,
              title: 'No Active Orders',
              subtitle: 'You don\'t have any active orders right now',
            );
          }
          
          return RefreshIndicator(
            onRefresh: () async {
              context.read<OrderBloc>().add(const OrderLoadRequested());
            },
            child: ListView.builder(
              padding: EdgeInsets.all(16.w),
              itemCount: activeOrders.length,
              itemBuilder: (context, index) {
                final order = activeOrders[index];
                return Padding(
                  padding: EdgeInsets.only(bottom: 16.h),
                  child: OrderCard(
                    order: order,
                    onTap: () {
                      // Navigate to order details
                    },
                  ),
                );
              },
            ),
          );
        }
        
        return const SizedBox.shrink();
      },
    );
  }

  Widget _buildOrderHistory() {
    return BlocBuilder<OrderBloc, OrderState>(
      builder: (context, state) {
        if (state is OrderLoading) {
          return const LoadingWidget();
        } else if (state is OrderError) {
          return CustomErrorWidget(
            message: state.message,
            onRetry: () {
              context.read<OrderBloc>().add(const OrderLoadRequested());
            },
          );
        } else if (state is OrderLoaded) {
          final completedOrders = state.orders
              .where((order) => order.status == 'delivered')
              .toList();
          
          if (completedOrders.isEmpty) {
            return _buildEmptyState(
              icon: Icons.history,
              title: 'No Order History',
              subtitle: 'Your completed orders will appear here',
            );
          }
          
          return RefreshIndicator(
            onRefresh: () async {
              context.read<OrderBloc>().add(const OrderLoadRequested());
            },
            child: ListView.builder(
              padding: EdgeInsets.all(16.w),
              itemCount: completedOrders.length,
              itemBuilder: (context, index) {
                final order = completedOrders[index];
                return Padding(
                  padding: EdgeInsets.only(bottom: 16.h),
                  child: OrderCard(
                    order: order,
                    onTap: () {
                      // Navigate to order details
                    },
                  ),
                );
              },
            ),
          );
        }
        
        return const SizedBox.shrink();
      },
    );
  }

  Widget _buildCancelledOrders() {
    return BlocBuilder<OrderBloc, OrderState>(
      builder: (context, state) {
        if (state is OrderLoading) {
          return const LoadingWidget();
        } else if (state is OrderError) {
          return CustomErrorWidget(
            message: state.message,
            onRetry: () {
              context.read<OrderBloc>().add(const OrderLoadRequested());
            },
          );
        } else if (state is OrderLoaded) {
          final cancelledOrders = state.orders
              .where((order) => order.status == 'cancelled')
              .toList();
          
          if (cancelledOrders.isEmpty) {
            return _buildEmptyState(
              icon: Icons.cancel_outlined,
              title: 'No Cancelled Orders',
              subtitle: 'Your cancelled orders will appear here',
            );
          }
          
          return RefreshIndicator(
            onRefresh: () async {
              context.read<OrderBloc>().add(const OrderLoadRequested());
            },
            child: ListView.builder(
              padding: EdgeInsets.all(16.w),
              itemCount: cancelledOrders.length,
              itemBuilder: (context, index) {
                final order = cancelledOrders[index];
                return Padding(
                  padding: EdgeInsets.only(bottom: 16.h),
                  child: OrderCard(
                    order: order,
                    onTap: () {
                      // Navigate to order details
                    },
                  ),
                );
              },
            ),
          );
        }
        
        return const SizedBox.shrink();
      },
    );
  }

  Widget _buildEmptyState({
    required IconData icon,
    required String title,
    required String subtitle,
  }) {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(24.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 64.w,
              color: AppTheme.textTertiaryColor,
            ),
            SizedBox(height: 16.h),
            Text(
              title,
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.w600,
                color: AppTheme.textPrimaryColor,
                fontFamily: 'Poppins',
              ),
            ),
            SizedBox(height: 8.h),
            Text(
              subtitle,
              style: TextStyle(
                fontSize: 14.sp,
                color: AppTheme.textSecondaryColor,
                fontFamily: 'Inter',
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
