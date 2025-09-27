import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../core/theme/app_theme.dart';
import '../bloc/auth_bloc.dart';
import '../widgets/custom_button.dart';
import '../widgets/loading_overlay.dart';

class VerifyEmailPage extends StatefulWidget {
  const VerifyEmailPage({super.key});

  @override
  State<VerifyEmailPage> createState() => _VerifyEmailPageState();
}

class _VerifyEmailPageState extends State<VerifyEmailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthEmailVerificationSent) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Verification email sent!'),
                backgroundColor: AppTheme.successColor,
              ),
            );
          } else if (state is AuthError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
                backgroundColor: AppTheme.errorColor,
              ),
            );
          }
        },
        child: BlocBuilder<AuthBloc, AuthState>(
          builder: (context, state) {
            return LoadingOverlay(
              isLoading: state is AuthLoading,
              child: SafeArea(
                child: Padding(
                  padding: EdgeInsets.all(24.w),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Icon
                      Container(
                        width: 120.w,
                        height: 120.w,
                        decoration: BoxDecoration(
                          color: AppTheme.primaryColor.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(60.r),
                        ),
                        child: Icon(
                          Icons.mark_email_read_outlined,
                          size: 60.w,
                          color: AppTheme.primaryColor,
                        ),
                      ),
                      
                      SizedBox(height: 32.h),
                      
                      // Title
                      Text(
                        'Verify Your Email',
                        style: TextStyle(
                          fontSize: 28.sp,
                          fontWeight: FontWeight.bold,
                          color: AppTheme.textPrimaryColor,
                          fontFamily: 'Poppins',
                        ),
                        textAlign: TextAlign.center,
                      ),
                      
                      SizedBox(height: 16.h),
                      
                      // Description
                      Text(
                        'We\'ve sent a verification link to your email address. Please check your inbox and click the link to verify your account.',
                        style: TextStyle(
                          fontSize: 16.sp,
                          color: AppTheme.textSecondaryColor,
                          fontFamily: 'Inter',
                        ),
                        textAlign: TextAlign.center,
                      ),
                      
                      SizedBox(height: 32.h),
                      
                      // Resend Button
                      CustomButton(
                        text: 'Resend Verification Email',
                        onPressed: () {
                          context.read<AuthBloc>().add(const AuthEmailVerificationRequested());
                        },
                        variant: ButtonVariant.outlined,
                      ),
                      
                      SizedBox(height: 16.h),
                      
                      // Back to Login
                      TextButton(
                        onPressed: () {
                          context.go('/login');
                        },
                        child: Text(
                          'Back to Login',
                          style: TextStyle(
                            fontSize: 16.sp,
                            color: AppTheme.primaryColor,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
