import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../core/constants/app_constants.dart';
import '../../core/theme/app_theme.dart';
import '../bloc/app_bloc.dart';
import '../widgets/profile_header_widget.dart';
import '../widgets/profile_menu_item.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      appBar: AppBar(
        title: Text(
          'Profile',
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
              Icons.settings_outlined,
              color: AppTheme.textPrimaryColor,
            ),
            onPressed: () {
              context.go('/profile/settings');
            },
          ),
        ],
      ),
      body: BlocBuilder<AppBloc, AppState>(
        builder: (context, state) {
          if (state is AppAuthenticated) {
            return SingleChildScrollView(
              padding: EdgeInsets.all(16.w),
              child: Column(
                children: [
                  // Profile Header
                  ProfileHeaderWidget(user: state.user),
                  
                  SizedBox(height: 24.h),
                  
                  // Profile Menu Items
                  _buildProfileMenu(context, state.user),
                  
                  SizedBox(height: 24.h),
                  
                  // Logout Button
                  _buildLogoutButton(context),
                ],
              ),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }

  Widget _buildProfileMenu(BuildContext context, user) {
    return Container(
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
      child: Column(
        children: [
          ProfileMenuItem(
            icon: Icons.person_outline,
            title: 'Edit Profile',
            subtitle: 'Update your personal information',
            onTap: () {
              context.go('/profile/edit');
            },
          ),
          const Divider(height: 1),
          ProfileMenuItem(
            icon: Icons.receipt_long_outlined,
            title: 'Order History',
            subtitle: 'View your past orders',
            onTap: () {
              context.go('/orders');
            },
          ),
          const Divider(height: 1),
          ProfileMenuItem(
            icon: Icons.favorite_outline,
            title: 'Favorites',
            subtitle: 'Your favorite restaurants',
            onTap: () {
              // TODO: Navigate to favorites
            },
          ),
          const Divider(height: 1),
          ProfileMenuItem(
            icon: Icons.location_on_outlined,
            title: 'Addresses',
            subtitle: 'Manage your delivery addresses',
            onTap: () {
              // TODO: Navigate to addresses
            },
          ),
          const Divider(height: 1),
          ProfileMenuItem(
            icon: Icons.payment_outlined,
            title: 'Payment Methods',
            subtitle: 'Manage your payment options',
            onTap: () {
              // TODO: Navigate to payment methods
            },
          ),
          const Divider(height: 1),
          ProfileMenuItem(
            icon: Icons.notifications_outlined,
            title: 'Notifications',
            subtitle: 'Manage your notification preferences',
            onTap: () {
              // TODO: Navigate to notifications
            },
          ),
          const Divider(height: 1),
          ProfileMenuItem(
            icon: Icons.help_outline,
            title: 'Help & Support',
            subtitle: 'Get help and contact support',
            onTap: () {
              // TODO: Navigate to help
            },
          ),
          const Divider(height: 1),
          ProfileMenuItem(
            icon: Icons.info_outline,
            title: 'About',
            subtitle: 'App version and information',
            onTap: () {
              // TODO: Navigate to about
            },
          ),
        ],
      ),
    );
  }

  Widget _buildLogoutButton(BuildContext context) {
    return Container(
      width: double.infinity,
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
      child: ProfileMenuItem(
        icon: Icons.logout,
        title: 'Logout',
        subtitle: 'Sign out of your account',
        iconColor: AppTheme.errorColor,
        titleColor: AppTheme.errorColor,
        onTap: () {
          _showLogoutDialog(context);
        },
      ),
    );
  }

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          'Logout',
          style: TextStyle(
            fontSize: 18.sp,
            fontWeight: FontWeight.w600,
            color: AppTheme.textPrimaryColor,
            fontFamily: 'Poppins',
          ),
        ),
        content: Text(
          'Are you sure you want to logout?',
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
              context.read<AppBloc>().add(const AppLogoutRequested());
            },
            child: Text(
              'Logout',
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
