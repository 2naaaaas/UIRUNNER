import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/theme/app_theme.dart';

enum ButtonVariant {
  primary,
  secondary,
  outlined,
  text,
  danger,
}

enum ButtonSize {
  small,
  medium,
  large,
}

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final IconData? icon;
  final ButtonVariant variant;
  final ButtonSize size;
  final bool isLoading;
  final bool isFullWidth;
  final Color? backgroundColor;
  final Color? textColor;
  final Color? borderColor;
  final double borderRadius;
  final EdgeInsetsGeometry? padding;
  final double? width;
  final double? height;

  const CustomButton({
    super.key,
    required this.text,
    this.onPressed,
    this.icon,
    this.variant = ButtonVariant.primary,
    this.size = ButtonSize.medium,
    this.isLoading = false,
    this.isFullWidth = true,
    this.backgroundColor,
    this.textColor,
    this.borderColor,
    this.borderRadius = 8.0,
    this.padding,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    final isDisabled = onPressed == null || isLoading;
    
    return SizedBox(
      width: isFullWidth ? double.infinity : width,
      height: height ?? _getHeight(),
      child: ElevatedButton(
        onPressed: isDisabled ? null : onPressed,
        style: _getButtonStyle(isDisabled),
        child: _buildChild(),
      ),
    );
  }

  Widget _buildChild() {
    if (isLoading) {
      return SizedBox(
        width: 20.w,
        height: 20.w,
        child: CircularProgressIndicator(
          strokeWidth: 2,
          valueColor: AlwaysStoppedAnimation<Color>(
            _getTextColor(),
          ),
        ),
      );
    }

    if (icon != null) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            size: _getIconSize(),
            color: _getTextColor(),
          ),
          SizedBox(width: 8.w),
          Text(
            text,
            style: _getTextStyle(),
          ),
        ],
      );
    }

    return Text(
      text,
      style: _getTextStyle(),
    );
  }

  ButtonStyle _getButtonStyle(bool isDisabled) {
    final backgroundColor = _getBackgroundColor();
    final foregroundColor = _getTextColor();
    final side = _getBorderSide();

    return ElevatedButton.styleFrom(
      backgroundColor: isDisabled ? backgroundColor.withOpacity(0.5) : backgroundColor,
      foregroundColor: isDisabled ? foregroundColor.withOpacity(0.5) : foregroundColor,
      elevation: variant == ButtonVariant.primary ? 2 : 0,
      shadowColor: variant == ButtonVariant.primary ? AppTheme.shadowColor : Colors.transparent,
      side: side,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadius.r),
      ),
      padding: padding ?? _getPadding(),
      minimumSize: Size.zero,
      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
    );
  }

  Color _getBackgroundColor() {
    if (backgroundColor != null) return backgroundColor!;
    
    switch (variant) {
      case ButtonVariant.primary:
        return AppTheme.primaryColor;
      case ButtonVariant.secondary:
        return AppTheme.secondaryColor;
      case ButtonVariant.outlined:
        return Colors.transparent;
      case ButtonVariant.text:
        return Colors.transparent;
      case ButtonVariant.danger:
        return AppTheme.errorColor;
    }
  }

  Color _getTextColor() {
    if (textColor != null) return textColor!;
    
    switch (variant) {
      case ButtonVariant.primary:
        return Colors.white;
      case ButtonVariant.secondary:
        return Colors.white;
      case ButtonVariant.outlined:
        return AppTheme.primaryColor;
      case ButtonVariant.text:
        return AppTheme.primaryColor;
      case ButtonVariant.danger:
        return Colors.white;
    }
  }

  BorderSide? _getBorderSide() {
    if (variant == ButtonVariant.outlined) {
      return BorderSide(
        color: borderColor ?? AppTheme.primaryColor,
        width: 1.5,
      );
    }
    return null;
  }

  TextStyle _getTextStyle() {
    return TextStyle(
      fontSize: _getFontSize(),
      fontWeight: FontWeight.w600,
      fontFamily: 'Poppins',
      color: _getTextColor(),
    );
  }

  double _getFontSize() {
    switch (size) {
      case ButtonSize.small:
        return 14.sp;
      case ButtonSize.medium:
        return 16.sp;
      case ButtonSize.large:
        return 18.sp;
    }
  }

  double _getHeight() {
    switch (size) {
      case ButtonSize.small:
        return 36.h;
      case ButtonSize.medium:
        return 48.h;
      case ButtonSize.large:
        return 56.h;
    }
  }

  double _getIconSize() {
    switch (size) {
      case ButtonSize.small:
        return 16.w;
      case ButtonSize.medium:
        return 20.w;
      case ButtonSize.large:
        return 24.w;
    }
  }

  EdgeInsetsGeometry _getPadding() {
    switch (size) {
      case ButtonSize.small:
        return EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h);
      case ButtonSize.medium:
        return EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h);
      case ButtonSize.large:
        return EdgeInsets.symmetric(horizontal: 32.w, vertical: 16.h);
    }
  }
}
