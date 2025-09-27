import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/theme/app_theme.dart';

enum TextFieldVariant {
  outlined,
  filled,
  underlined,
}

class CustomTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String? label;
  final String? hint;
  final String? helperText;
  final String? errorText;
  final IconData? prefixIcon;
  final Widget? suffixIcon;
  final bool obscureText;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final int maxLines;
  final int? maxLength;
  final bool enabled;
  final bool readOnly;
  final VoidCallback? onTap;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;
  final FormFieldValidator<String>? validator;
  final TextFieldVariant variant;
  final EdgeInsetsGeometry? contentPadding;
  final Color? fillColor;
  final Color? borderColor;
  final double borderRadius;
  final bool autofocus;

  const CustomTextField({
    super.key,
    this.controller,
    this.label,
    this.hint,
    this.helperText,
    this.errorText,
    this.prefixIcon,
    this.suffixIcon,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.textInputAction = TextInputAction.done,
    this.maxLines = 1,
    this.maxLength,
    this.enabled = true,
    this.readOnly = false,
    this.onTap,
    this.onChanged,
    this.onSubmitted,
    this.validator,
    this.variant = TextFieldVariant.outlined,
    this.contentPadding,
    this.fillColor,
    this.borderColor,
    this.borderRadius = 8.0,
    this.autofocus = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null) ...[
          Text(
            label!,
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
              color: AppTheme.textPrimaryColor,
              fontFamily: 'Poppins',
            ),
          ),
          SizedBox(height: 8.h),
        ],
        TextFormField(
          controller: controller,
          obscureText: obscureText,
          keyboardType: keyboardType,
          textInputAction: textInputAction,
          maxLines: maxLines,
          maxLength: maxLength,
          enabled: enabled,
          readOnly: readOnly,
          onTap: onTap,
          onChanged: onChanged,
          onFieldSubmitted: onSubmitted,
          validator: validator,
          autofocus: autofocus,
          style: TextStyle(
            fontSize: 16.sp,
            color: AppTheme.textPrimaryColor,
            fontFamily: 'Inter',
          ),
          decoration: InputDecoration(
            hintText: hint,
            helperText: helperText,
            errorText: errorText,
            prefixIcon: prefixIcon != null
                ? Icon(
                    prefixIcon,
                    size: 20.w,
                    color: AppTheme.textTertiaryColor,
                  )
                : null,
            suffixIcon: suffixIcon,
            filled: variant == TextFieldVariant.filled,
            fillColor: fillColor ?? AppTheme.surfaceColor,
            contentPadding: contentPadding ??
                EdgeInsets.symmetric(
                  horizontal: 16.w,
                  vertical: 12.h,
                ),
            border: _getBorder(),
            enabledBorder: _getBorder(),
            focusedBorder: _getBorder(isFocused: true),
            errorBorder: _getBorder(isError: true),
            focusedErrorBorder: _getBorder(isFocused: true, isError: true),
            disabledBorder: _getBorder(isDisabled: true),
            hintStyle: TextStyle(
              color: AppTheme.textTertiaryColor,
              fontSize: 16.sp,
              fontFamily: 'Inter',
            ),
            helperStyle: TextStyle(
              color: AppTheme.textSecondaryColor,
              fontSize: 12.sp,
              fontFamily: 'Inter',
            ),
            errorStyle: TextStyle(
              color: AppTheme.errorColor,
              fontSize: 12.sp,
              fontFamily: 'Inter',
            ),
            counterStyle: TextStyle(
              color: AppTheme.textTertiaryColor,
              fontSize: 12.sp,
              fontFamily: 'Inter',
            ),
          ),
        ),
      ],
    );
  }

  InputBorder _getBorder({
    bool isFocused = false,
    bool isError = false,
    bool isDisabled = false,
  }) {
    final color = isError
        ? AppTheme.errorColor
        : isFocused
            ? AppTheme.primaryColor
            : isDisabled
                ? AppTheme.borderLightColor
                : borderColor ?? AppTheme.borderColor;

    switch (variant) {
      case TextFieldVariant.outlined:
        return OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius.r),
          borderSide: BorderSide(
            color: color,
            width: isFocused ? 2.0 : 1.0,
          ),
        );
      case TextFieldVariant.filled:
        return OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius.r),
          borderSide: BorderSide.none,
        );
      case TextFieldVariant.underlined:
        return UnderlineInputBorder(
          borderSide: BorderSide(
            color: color,
            width: isFocused ? 2.0 : 1.0,
          ),
        );
    }
  }
}
