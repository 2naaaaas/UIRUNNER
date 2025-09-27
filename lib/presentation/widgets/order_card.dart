import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/constants/app_constants.dart';
import '../../core/theme/app_theme.dart';
import '../../domain/entities/order_entity.dart';

class OrderCard extends StatelessWidget {
  final OrderEntity order;
  final VoidCallback? onTap;

  const OrderCard({
    super.key,
    required this.order,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: AppTheme.surfaceColor,
          borderRadius: BorderRadius.circular(12.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Padding(
          padding: EdgeInsets.all(16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Order Header
              Row(
                children: [
                  // Order ID
                  Text(
                    'Order #${order.id.substring(0, 8)}',
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                      color: AppTheme.textPrimaryColor,
                      fontFamily: 'Poppins',
                    ),
                  ),
                  
                  const Spacer(),
                  
                  // Status Badge
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                    decoration: BoxDecoration(
                      color: _getStatusColor().withOpacity(0.1),
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: Text(
                      _getStatusText(),
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w600,
                        color: _getStatusColor(),
                        fontFamily: 'Poppins',
                      ),
                    ),
                  ),
                ],
              ),
              
              SizedBox(height: 12.h),
              
              // Order Items
              Text(
                '${order.items.length} item${order.items.length > 1 ? 's' : ''}',
                style: TextStyle(
                  fontSize: 14.sp,
                  color: AppTheme.textSecondaryColor,
                  fontFamily: 'Inter',
                ),
              ),
              
              SizedBox(height: 8.h),
              
              // Order Total
              Row(
                children: [
                  Text(
                    'Total: ',
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: AppTheme.textSecondaryColor,
                      fontFamily: 'Inter',
                    ),
                  ),
                  Text(
                    '${order.totalAmount.toStringAsFixed(2)} DH',
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                      color: AppTheme.textPrimaryColor,
                      fontFamily: 'Poppins',
                    ),
                  ),
                  
                  const Spacer(),
                  
                  // Order Date
                  Text(
                    _formatDate(order.createdAt),
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: AppTheme.textTertiaryColor,
                      fontFamily: 'Inter',
                    ),
                  ),
                ],
              ),
              
              // Delivery Info (if available)
              if (order.delivery != null) ...[
                SizedBox(height: 12.h),
                Container(
                  padding: EdgeInsets.all(12.w),
                  decoration: BoxDecoration(
                    color: AppTheme.backgroundColor,
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.delivery_dining,
                        size: 16.w,
                        color: AppTheme.primaryColor,
                      ),
                      SizedBox(width: 8.w),
                      Text(
                        'Courier: ${order.delivery!.courierId.substring(0, 8)}',
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: AppTheme.textSecondaryColor,
                          fontFamily: 'Inter',
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }

  Color _getStatusColor() {
    switch (order.status) {
      case AppConstants.orderStatusPending:
        return AppTheme.warningColor;
      case AppConstants.orderStatusConfirmed:
        return AppTheme.infoColor;
      case AppConstants.orderStatusPreparing:
        return AppTheme.accentColor;
      case AppConstants.orderStatusReady:
        return AppTheme.primaryColor;
      case AppConstants.orderStatusPickedUp:
        return AppTheme.secondaryColor;
      case AppConstants.orderStatusDelivered:
        return AppTheme.successColor;
      case AppConstants.orderStatusCancelled:
        return AppTheme.errorColor;
      default:
        return AppTheme.textTertiaryColor;
    }
  }

  String _getStatusText() {
    switch (order.status) {
      case AppConstants.orderStatusPending:
        return 'Pending';
      case AppConstants.orderStatusConfirmed:
        return 'Confirmed';
      case AppConstants.orderStatusPreparing:
        return 'Preparing';
      case AppConstants.orderStatusReady:
        return 'Ready';
      case AppConstants.orderStatusPickedUp:
        return 'Picked Up';
      case AppConstants.orderStatusDelivered:
        return 'Delivered';
      case AppConstants.orderStatusCancelled:
        return 'Cancelled';
      default:
        return 'Unknown';
    }
  }

  String _formatDate(DateTime date) {
    final now = DateTime.now();
    final difference = now.difference(date);
    
    if (difference.inDays > 0) {
      return '${difference.inDays}d ago';
    } else if (difference.inHours > 0) {
      return '${difference.inHours}h ago';
    } else if (difference.inMinutes > 0) {
      return '${difference.inMinutes}m ago';
    } else {
      return 'Just now';
    }
  }
}
