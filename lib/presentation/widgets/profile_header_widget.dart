import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../../core/theme/app_theme.dart';
import '../../domain/entities/user_entity.dart';

class ProfileHeaderWidget extends StatelessWidget {
  final UserEntity user;

  const ProfileHeaderWidget({
    super.key,
    required this.user,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: AppTheme.surfaceColor,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          // Profile Picture
          Container(
            width: 80.w,
            height: 80.w,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: AppTheme.primaryColor.withOpacity(0.2),
                width: 2,
              ),
            ),
            child: ClipOval(
              child: user.profileImageUrl != null
                  ? CachedNetworkImage(
                      imageUrl: user.profileImageUrl!,
                      fit: BoxFit.cover,
                      placeholder: (context, url) => Container(
                        color: AppTheme.backgroundColor,
                        child: Icon(
                          Icons.person,
                          size: 40.w,
                          color: AppTheme.textTertiaryColor,
                        ),
                      ),
                      errorWidget: (context, url, error) => Container(
                        color: AppTheme.backgroundColor,
                        child: Icon(
                          Icons.person,
                          size: 40.w,
                          color: AppTheme.textTertiaryColor,
                        ),
                      ),
                    )
                  : Container(
                      color: AppTheme.backgroundColor,
                      child: Icon(
                        Icons.person,
                        size: 40.w,
                        color: AppTheme.textTertiaryColor,
                      ),
                    ),
            ),
          ),
          
          SizedBox(width: 16.w),
          
          // User Info
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${user.firstName} ${user.lastName}',
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w600,
                    color: AppTheme.textPrimaryColor,
                    fontFamily: 'Poppins',
                  ),
                ),
                
                SizedBox(height: 4.h),
                
                Text(
                  user.email,
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: AppTheme.textSecondaryColor,
                    fontFamily: 'Inter',
                  ),
                ),
                
                SizedBox(height: 8.h),
                
                // User Role Badge
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                  decoration: BoxDecoration(
                    color: _getRoleColor().withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  child: Text(
                    _getRoleText(),
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w600,
                      color: _getRoleColor(),
                      fontFamily: 'Poppins',
                    ),
                  ),
                ),
              ],
            ),
          ),
          
          // Edit Button
          IconButton(
            icon: Icon(
              Icons.edit_outlined,
              size: 20.w,
              color: AppTheme.primaryColor,
            ),
            onPressed: () {
              // TODO: Navigate to edit profile
            },
          ),
        ],
      ),
    );
  }

  Color _getRoleColor() {
    switch (user.role) {
      case AppConstants.roleCustomer:
        return AppTheme.primaryColor;
      case AppConstants.roleCourier:
        return AppTheme.secondaryColor;
      case AppConstants.roleAdmin:
        return AppTheme.errorColor;
      default:
        return AppTheme.textTertiaryColor;
    }
  }

  String _getRoleText() {
    switch (user.role) {
      case AppConstants.roleCustomer:
        return 'Customer';
      case AppConstants.roleCourier:
        return 'Courier';
      case AppConstants.roleAdmin:
        return 'Admin';
      default:
        return 'User';
    }
  }
}
