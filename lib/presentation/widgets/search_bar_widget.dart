import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/theme/app_theme.dart';

class SearchBarWidget extends StatelessWidget {
  final TextEditingController controller;
  final ValueChanged<String>? onChanged;
  final String hint;
  final VoidCallback? onClear;
  final VoidCallback? onFilter;

  const SearchBarWidget({
    super.key,
    required this.controller,
    this.onChanged,
    required this.hint,
    this.onClear,
    this.onFilter,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppTheme.surfaceColor,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(
          color: AppTheme.borderColor,
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: TextField(
        controller: controller,
        onChanged: onChanged,
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: TextStyle(
            color: AppTheme.textTertiaryColor,
            fontSize: 16.sp,
            fontFamily: 'Inter',
          ),
          prefixIcon: Icon(
            Icons.search,
            color: AppTheme.textTertiaryColor,
            size: 20.w,
          ),
          suffixIcon: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (controller.text.isNotEmpty)
                IconButton(
                  icon: Icon(
                    Icons.clear,
                    color: AppTheme.textTertiaryColor,
                    size: 20.w,
                  ),
                  onPressed: () {
                    controller.clear();
                    onChanged?.call('');
                    onClear?.call();
                  },
                ),
              if (onFilter != null)
                IconButton(
                  icon: Icon(
                    Icons.tune,
                    color: AppTheme.textTertiaryColor,
                    size: 20.w,
                  ),
                  onPressed: onFilter,
                ),
            ],
          ),
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(
            horizontal: 16.w,
            vertical: 12.h,
          ),
        ),
        style: TextStyle(
          fontSize: 16.sp,
          color: AppTheme.textPrimaryColor,
          fontFamily: 'Inter',
        ),
      ),
    );
  }
}
