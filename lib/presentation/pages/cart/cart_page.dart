import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../core/constants/app_constants.dart';
import '../../core/theme/app_theme.dart';
import '../bloc/cart_bloc.dart';
import '../widgets/cart_item_widget.dart';
import '../widgets/loading_widget.dart';
import '../widgets/error_widget.dart';
import '../widgets/custom_button.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  void initState() {
    super.initState();
    context.read<CartBloc>().add(const CartLoadRequested());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      appBar: AppBar(
        title: Text(
          'My Cart',
          style: TextStyle(
            fontSize: 20.sp,
            fontWeight: FontWeight.w600,
            color: AppTheme.textPrimaryColor,
            fontFamily: 'Poppins',
          ),
        ),
        backgroundColor: AppTheme.surfaceColor,
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(
              Icons.delete_outline,
              color: AppTheme.textPrimaryColor,
            ),
            onPressed: () {
              _showClearCartDialog();
            },
          ),
        ],
      ),
      body: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          if (state is CartLoading) {
            return const LoadingWidget();
          } else if (state is CartError) {
            return CustomErrorWidget(
              message: state.message,
              onRetry: () {
                context.read<CartBloc>().add(const CartLoadRequested());
              },
            );
          } else if (state is CartLoaded) {
            if (state.cart.items.isEmpty) {
              return _buildEmptyCart();
            }
            
            return Column(
              children: [
                // Cart Items
                Expanded(
                  child: ListView.builder(
                    padding: EdgeInsets.all(16.w),
                    itemCount: state.cart.items.length,
                    itemBuilder: (context, index) {
                      final item = state.cart.items[index];
                      return Padding(
                        padding: EdgeInsets.only(bottom: 12.h),
                        child: CartItemWidget(
                          item: item,
                          onQuantityChanged: (quantity) {
                            context.read<CartBloc>().add(
                              CartItemQuantityChanged(
                                itemId: item.id,
                                quantity: quantity,
                              ),
                            );
                          },
                          onRemove: () {
                            context.read<CartBloc>().add(
                              CartItemRemoved(itemId: item.id),
                            );
                          },
                        ),
                      );
                    },
                  ),
                ),
                
                // Cart Summary
                _buildCartSummary(state.cart),
              ],
            );
          }
          
          return const SizedBox.shrink();
        },
      ),
    );
  }

  Widget _buildEmptyCart() {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(24.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.shopping_cart_outlined,
              size: 64.w,
              color: AppTheme.textTertiaryColor,
            ),
            SizedBox(height: 16.h),
            Text(
              'Your cart is empty',
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.w600,
                color: AppTheme.textPrimaryColor,
                fontFamily: 'Poppins',
              ),
            ),
            SizedBox(height: 8.h),
            Text(
              'Add some delicious food to get started!',
              style: TextStyle(
                fontSize: 14.sp,
                color: AppTheme.textSecondaryColor,
                fontFamily: 'Inter',
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 24.h),
            CustomButton(
              text: 'Browse Restaurants',
              onPressed: () {
                context.go('/home');
              },
              isFullWidth: false,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCartSummary(cart) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: AppTheme.surfaceColor,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: Column(
        children: [
          // Order Summary
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Subtotal',
                style: TextStyle(
                  fontSize: 14.sp,
                  color: AppTheme.textSecondaryColor,
                  fontFamily: 'Inter',
                ),
              ),
              Text(
                '${cart.subtotal.toStringAsFixed(2)} DH',
                style: TextStyle(
                  fontSize: 14.sp,
                  color: AppTheme.textPrimaryColor,
                  fontFamily: 'Inter',
                ),
              ),
            ],
          ),
          
          SizedBox(height: 8.h),
          
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Delivery Fee',
                style: TextStyle(
                  fontSize: 14.sp,
                  color: AppTheme.textSecondaryColor,
                  fontFamily: 'Inter',
                ),
              ),
              Text(
                '${cart.deliveryFee.toStringAsFixed(2)} DH',
                style: TextStyle(
                  fontSize: 14.sp,
                  color: AppTheme.textPrimaryColor,
                  fontFamily: 'Inter',
                ),
              ),
            ],
          ),
          
          SizedBox(height: 8.h),
          
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Platform Fee',
                style: TextStyle(
                  fontSize: 14.sp,
                  color: AppTheme.textSecondaryColor,
                  fontFamily: 'Inter',
                ),
              ),
              Text(
                '${cart.platformFee.toStringAsFixed(2)} DH',
                style: TextStyle(
                  fontSize: 14.sp,
                  color: AppTheme.textPrimaryColor,
                  fontFamily: 'Inter',
                ),
              ),
            ],
          ),
          
          SizedBox(height: 8.h),
          
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Tax',
                style: TextStyle(
                  fontSize: 14.sp,
                  color: AppTheme.textSecondaryColor,
                  fontFamily: 'Inter',
                ),
              ),
              Text(
                '${cart.tax.toStringAsFixed(2)} DH',
                style: TextStyle(
                  fontSize: 14.sp,
                  color: AppTheme.textPrimaryColor,
                  fontFamily: 'Inter',
                ),
              ),
            ],
          ),
          
          SizedBox(height: 12.h),
          
          const Divider(),
          
          SizedBox(height: 12.h),
          
          // Total
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Total',
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                  color: AppTheme.textPrimaryColor,
                  fontFamily: 'Poppins',
                ),
              ),
              Text(
                '${cart.total.toStringAsFixed(2)} DH',
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                  color: AppTheme.primaryColor,
                  fontFamily: 'Poppins',
                ),
              ),
            ],
          ),
          
          SizedBox(height: 16.h),
          
          // Checkout Button
          CustomButton(
            text: 'Proceed to Checkout',
            onPressed: () {
              context.go('/checkout');
            },
          ),
        ],
      ),
    );
  }

  void _showClearCartDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          'Clear Cart',
          style: TextStyle(
            fontSize: 18.sp,
            fontWeight: FontWeight.w600,
            color: AppTheme.textPrimaryColor,
            fontFamily: 'Poppins',
          ),
        ),
        content: Text(
          'Are you sure you want to remove all items from your cart?',
          style: TextStyle(
            fontSize: 14.sp,
            color: AppTheme.textSecondaryColor,
            fontFamily: 'Inter',
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text(
              'Cancel',
              style: TextStyle(
                fontSize: 14.sp,
                color: AppTheme.textSecondaryColor,
                fontFamily: 'Inter',
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              context.read<CartBloc>().add(const CartCleared());
            },
            child: Text(
              'Clear',
              style: TextStyle(
                fontSize: 14.sp,
                color: AppTheme.errorColor,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
