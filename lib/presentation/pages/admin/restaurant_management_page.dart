import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/theme/app_theme.dart';

class RestaurantManagementPage extends StatefulWidget {
  const RestaurantManagementPage({super.key});

  @override
  State<RestaurantManagementPage> createState() => _RestaurantManagementPageState();
}

class _RestaurantManagementPageState extends State<RestaurantManagementPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      body: const Center(
        child: Text('Restaurant Management Page - Coming Soon'),
      ),
    );
  }
}
