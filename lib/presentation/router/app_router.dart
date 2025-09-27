import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/app_bloc.dart';
import '../pages/splash_page.dart';
import '../pages/auth/login_page.dart';
import '../pages/auth/register_page.dart';
import '../pages/auth/forgot_password_page.dart';
import '../pages/auth/verify_email_page.dart';
import '../pages/home/home_page.dart';
import '../pages/restaurants/restaurants_page.dart';
import '../pages/restaurants/restaurant_detail_page.dart';
import '../pages/orders/orders_page.dart';
import '../pages/orders/order_detail_page.dart';
import '../pages/orders/order_tracking_page.dart';
import '../pages/cart/cart_page.dart';
import '../pages/cart/checkout_page.dart';
import '../pages/profile/profile_page.dart';
import '../pages/profile/edit_profile_page.dart';
import '../pages/profile/settings_page.dart';
import '../pages/courier/courier_dashboard_page.dart';
import '../pages/courier/available_orders_page.dart';
import '../pages/courier/delivery_tracking_page.dart';
import '../pages/admin/admin_dashboard_page.dart';
import '../pages/admin/restaurant_management_page.dart';
import '../pages/admin/order_management_page.dart';
import '../pages/admin/analytics_page.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: '/splash',
    debugLogDiagnostics: true,
    routes: [
      // Splash Route
      GoRoute(
        path: '/splash',
        name: 'splash',
        builder: (context, state) => const SplashPage(),
      ),
      
      // Authentication Routes
      GoRoute(
        path: '/login',
        name: 'login',
        builder: (context, state) => const LoginPage(),
      ),
      GoRoute(
        path: '/register',
        name: 'register',
        builder: (context, state) => const RegisterPage(),
      ),
      GoRoute(
        path: '/forgot-password',
        name: 'forgot-password',
        builder: (context, state) => const ForgotPasswordPage(),
      ),
      GoRoute(
        path: '/verify-email',
        name: 'verify-email',
        builder: (context, state) => const VerifyEmailPage(),
      ),
      
      // Main App Routes
      GoRoute(
        path: '/home',
        name: 'home',
        builder: (context, state) => const HomePage(),
        routes: [
          // Restaurant Routes
          GoRoute(
            path: '/restaurants',
            name: 'restaurants',
            builder: (context, state) => const RestaurantsPage(),
            routes: [
              GoRoute(
                path: '/:restaurantId',
                name: 'restaurant-detail',
                builder: (context, state) {
                  final restaurantId = state.pathParameters['restaurantId']!;
                  return RestaurantDetailPage(restaurantId: restaurantId);
                },
              ),
            ],
          ),
          
          // Order Routes
          GoRoute(
            path: '/orders',
            name: 'orders',
            builder: (context, state) => const OrdersPage(),
            routes: [
              GoRoute(
                path: '/:orderId',
                name: 'order-detail',
                builder: (context, state) {
                  final orderId = state.pathParameters['orderId']!;
                  return OrderDetailPage(orderId: orderId);
                },
              ),
              GoRoute(
                path: '/:orderId/tracking',
                name: 'order-tracking',
                builder: (context, state) {
                  final orderId = state.pathParameters['orderId']!;
                  return OrderTrackingPage(orderId: orderId);
                },
              ),
            ],
          ),
          
          // Cart Routes
          GoRoute(
            path: '/cart',
            name: 'cart',
            builder: (context, state) => const CartPage(),
          ),
          GoRoute(
            path: '/checkout',
            name: 'checkout',
            builder: (context, state) => const CheckoutPage(),
          ),
          
          // Profile Routes
          GoRoute(
            path: '/profile',
            name: 'profile',
            builder: (context, state) => const ProfilePage(),
            routes: [
              GoRoute(
                path: '/edit',
                name: 'edit-profile',
                builder: (context, state) => const EditProfilePage(),
              ),
              GoRoute(
                path: '/settings',
                name: 'settings',
                builder: (context, state) => const SettingsPage(),
              ),
            ],
          ),
          
          // Courier Routes
          GoRoute(
            path: '/courier',
            name: 'courier',
            builder: (context, state) => const CourierDashboardPage(),
            routes: [
              GoRoute(
                path: '/available-orders',
                name: 'available-orders',
                builder: (context, state) => const AvailableOrdersPage(),
              ),
              GoRoute(
                path: '/delivery-tracking',
                name: 'delivery-tracking',
                builder: (context, state) => const DeliveryTrackingPage(),
              ),
            ],
          ),
          
          // Admin Routes
          GoRoute(
            path: '/admin',
            name: 'admin',
            builder: (context, state) => const AdminDashboardPage(),
            routes: [
              GoRoute(
                path: '/restaurants',
                name: 'restaurant-management',
                builder: (context, state) => const RestaurantManagementPage(),
              ),
              GoRoute(
                path: '/orders',
                name: 'order-management',
                builder: (context, state) => const OrderManagementPage(),
              ),
              GoRoute(
                path: '/analytics',
                name: 'analytics',
                builder: (context, state) => const AnalyticsPage(),
              ),
            ],
          ),
        ],
      ),
    ],
    redirect: (context, state) {
      final appState = context.read<AppBloc>().state;
      final isAuthRoute = state.uri.path.startsWith('/login') ||
          state.uri.path.startsWith('/register') ||
          state.uri.path.startsWith('/forgot-password') ||
          state.uri.path.startsWith('/verify-email');
      
      // If user is not authenticated and trying to access protected routes
      if (appState is AppUnauthenticated && !isAuthRoute && state.uri.path != '/splash') {
        return '/login';
      }
      
      // If user is authenticated and trying to access auth routes
      if (appState is AppAuthenticated && isAuthRoute) {
        return '/home';
      }
      
      // If user is authenticated but email is not verified
      if (appState is AppAuthenticated && !appState.user.isEmailVerified && !isAuthRoute) {
        return '/verify-email';
      }
      
      return null;
    },
  );
}
