import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../core/constants/app_constants.dart';
import '../../core/theme/app_theme.dart';
import '../bloc/restaurant_bloc.dart';
import '../widgets/restaurant_card.dart';
import '../widgets/search_bar_widget.dart';
import '../widgets/category_filter_widget.dart';
import '../widgets/loading_widget.dart';
import '../widgets/error_widget.dart';

class RestaurantsPage extends StatefulWidget {
  const RestaurantsPage({super.key});

  @override
  State<RestaurantsPage> createState() => _RestaurantsPageState();
}

class _RestaurantsPageState extends State<RestaurantsPage> {
  final TextEditingController _searchController = TextEditingController();
  String _selectedCategory = 'All';
  String _searchQuery = '';

  @override
  void initState() {
    super.initState();
    context.read<RestaurantBloc>().add(const RestaurantLoadRequested());
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _onSearchChanged(String query) {
    setState(() {
      _searchQuery = query;
    });
    context.read<RestaurantBloc>().add(RestaurantSearchRequested(query));
  }

  void _onCategoryChanged(String category) {
    setState(() {
      _selectedCategory = category;
    });
    context.read<RestaurantBloc>().add(RestaurantCategoryFilterRequested(category));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      appBar: AppBar(
        title: Text(
          'Restaurants',
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
              Icons.filter_list,
              color: AppTheme.textPrimaryColor,
            ),
            onPressed: () {
              _showFilterBottomSheet();
            },
          ),
        ],
      ),
      body: Column(
        children: [
          // Search Bar
          Padding(
            padding: EdgeInsets.all(16.w),
            child: SearchBarWidget(
              controller: _searchController,
              onChanged: _onSearchChanged,
              hint: 'Search restaurants...',
            ),
          ),
          
          // Category Filter
          CategoryFilterWidget(
            selectedCategory: _selectedCategory,
            onCategoryChanged: _onCategoryChanged,
            categories: const [
              'All',
              'Fast Food',
              'Healthy',
              'Desserts',
              'Beverages',
              'Moroccan',
              'International',
            ],
          ),
          
          // Restaurants List
          Expanded(
            child: BlocBuilder<RestaurantBloc, RestaurantState>(
              builder: (context, state) {
                if (state is RestaurantLoading) {
                  return const LoadingWidget();
                } else if (state is RestaurantError) {
                  return CustomErrorWidget(
                    message: state.message,
                    onRetry: () {
                      context.read<RestaurantBloc>().add(const RestaurantLoadRequested());
                    },
                  );
                } else if (state is RestaurantLoaded) {
                  final restaurants = state.restaurants;
                  
                  if (restaurants.isEmpty) {
                    return _buildEmptyState();
                  }
                  
                  return RefreshIndicator(
                    onRefresh: () async {
                      context.read<RestaurantBloc>().add(const RestaurantLoadRequested());
                    },
                    child: ListView.builder(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      itemCount: restaurants.length,
                      itemBuilder: (context, index) {
                        final restaurant = restaurants[index];
                        return Padding(
                          padding: EdgeInsets.only(bottom: 16.h),
                          child: RestaurantCard(
                            restaurant: restaurant,
                            onTap: () {
                              context.go('/restaurants/${restaurant.id}');
                            },
                          ),
                        );
                      },
                    ),
                  );
                }
                
                return const SizedBox.shrink();
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.restaurant_outlined,
            size: 64.w,
            color: AppTheme.textTertiaryColor,
          ),
          SizedBox(height: 16.h),
          Text(
            'No restaurants found',
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.w600,
              color: AppTheme.textPrimaryColor,
              fontFamily: 'Poppins',
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            'Try adjusting your search or filters',
            style: TextStyle(
              fontSize: 14.sp,
              color: AppTheme.textSecondaryColor,
              fontFamily: 'Inter',
            ),
          ),
        ],
      ),
    );
  }

  void _showFilterBottomSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        height: MediaQuery.of(context).size.height * 0.6,
        decoration: BoxDecoration(
          color: AppTheme.surfaceColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.r),
            topRight: Radius.circular(20.r),
          ),
        ),
        child: Column(
          children: [
            Container(
              width: 40.w,
              height: 4.h,
              margin: EdgeInsets.only(top: 12.h),
              decoration: BoxDecoration(
                color: AppTheme.borderColor,
                borderRadius: BorderRadius.circular(2.r),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(24.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Filter Restaurants',
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w600,
                      color: AppTheme.textPrimaryColor,
                      fontFamily: 'Poppins',
                    ),
                  ),
                  SizedBox(height: 24.h),
                  // Add filter options here
                  Text(
                    'Filter options will be implemented here',
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: AppTheme.textSecondaryColor,
                      fontFamily: 'Inter',
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
