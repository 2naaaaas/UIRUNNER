import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/theme/app_theme.dart';
import '../../domain/entities/order_entity.dart';

class CartItemWidget extends StatelessWidget {
  final CartItemEntity item;
  final ValueChanged<int> onQuantityChanged;
  final VoidCallback onRemove;

  const CartItemWidget({
    super.key,
    required this.item,
    required this.onQuantityChanged,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: AppTheme.surfaceColor,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Item Header
          Row(
            children: [
              Expanded(
                child: Text(
                  item.name,
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                    color: AppTheme.textPrimaryColor,
                    fontFamily: 'Poppins',
                  ),
                ),
              ),
              IconButton(
                icon: Icon(
                  Icons.close,
                  size: 20.w,
                  color: AppTheme.textTertiaryColor,
                ),
                onPressed: onRemove,
              ),
            ],
          ),
          
          SizedBox(height: 8.h),
          
          // Item Options
          if (item.options.isNotEmpty) ...[
            ...item.options.map((option) => Padding(
              padding: EdgeInsets.only(bottom: 4.h),
              child: Text(
                '${option.name}: ${option.value}',
                style: TextStyle(
                  fontSize: 12.sp,
                  color: AppTheme.textSecondaryColor,
                  fontFamily: 'Inter',
                ),
              ),
            )),
            SizedBox(height: 8.h),
          ],
          
          // Special Instructions
          if (item.specialInstructions != null && item.specialInstructions!.isNotEmpty) ...[
            Container(
              padding: EdgeInsets.all(8.w),
              decoration: BoxDecoration(
                color: AppTheme.backgroundColor,
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.note_outlined,
                    size: 14.w,
                    color: AppTheme.primaryColor,
                  ),
                  SizedBox(width: 8.w),
                  Expanded(
                    child: Text(
                      item.specialInstructions!,
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: AppTheme.textSecondaryColor,
                        fontFamily: 'Inter',
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 12.h),
          ],
          
          // Quantity and Price
          Row(
            children: [
              // Quantity Controls
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: AppTheme.borderColor),
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.remove,
                        size: 16.w,
                        color: AppTheme.textPrimaryColor,
                      ),
                      onPressed: item.quantity > 1
                          ? () => onQuantityChanged(item.quantity - 1)
                          : null,
                      constraints: BoxConstraints(
                        minWidth: 32.w,
                        minHeight: 32.h,
                      ),
                      padding: EdgeInsets.zero,
                    ),
                    Container(
                      width: 40.w,
                      alignment: Alignment.center,
                      child: Text(
                        item.quantity.toString(),
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                          color: AppTheme.textPrimaryColor,
                          fontFamily: 'Poppins',
                        ),
                      ),
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.add,
                        size: 16.w,
                        color: AppTheme.textPrimaryColor,
                      ),
                      onPressed: () => onQuantityChanged(item.quantity + 1),
                      constraints: BoxConstraints(
                        minWidth: 32.w,
                        minHeight: 32.h,
                      ),
                      padding: EdgeInsets.zero,
                    ),
                  ],
                ),
              ),
              
              const Spacer(),
              
              // Total Price
              Text(
                '${(item.price * item.quantity).toStringAsFixed(2)} DH',
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                  color: AppTheme.primaryColor,
                  fontFamily: 'Poppins',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
