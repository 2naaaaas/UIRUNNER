import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../core/utils/logger.dart';
import '../../domain/entities/user_entity.dart';
import '../../domain/repositories/user_repository.dart';

part 'auth_event.dart';
part 'auth_state.dart';

@injectable
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final UserRepository _userRepository;
  final AppLogger _logger;

  AuthBloc(
    this._userRepository,
    this._logger,
  ) : super(const AuthInitial()) {
    on<AuthLoginRequested>(_onLoginRequested);
    on<AuthGoogleLoginRequested>(_onGoogleLoginRequested);
    on<AuthBiometricLoginRequested>(_onBiometricLoginRequested);
    on<AuthRegisterRequested>(_onRegisterRequested);
    on<AuthLogoutRequested>(_onLogoutRequested);
    on<AuthPasswordResetRequested>(_onPasswordResetRequested);
    on<AuthEmailVerificationRequested>(_onEmailVerificationRequested);
    on<AuthBiometricAvailabilityRequested>(_onBiometricAvailabilityRequested);
  }

  Future<void> _onLoginRequested(
    AuthLoginRequested event,
    Emitter<AuthState> emit,
  ) async {
    try {
      emit(const AuthLoading());
      _logger.info('Login requested for email: ${event.email}');

      final user = await _userRepository.signInWithEmail(
        event.email,
        event.password,
      );

      _logger.info('Login successful for user: ${user.id}');
      emit(AuthSuccess(user));
    } catch (e, stackTrace) {
      _logger.error('Login failed', error: e, stackTrace: stackTrace);
      emit(AuthError(e.toString()));
    }
  }

  Future<void> _onGoogleLoginRequested(
    AuthGoogleLoginRequested event,
    Emitter<AuthState> emit,
  ) async {
    try {
      emit(const AuthLoading());
      _logger.info('Google login requested');

      // TODO: Implement Google Sign-In
      // final user = await _userRepository.signInWithGoogle();
      
      _logger.error('Google login not implemented yet');
      emit(const AuthError('Google login not implemented yet'));
    } catch (e, stackTrace) {
      _logger.error('Google login failed', error: e, stackTrace: stackTrace);
      emit(AuthError(e.toString()));
    }
  }

  Future<void> _onBiometricLoginRequested(
    AuthBiometricLoginRequested event,
    Emitter<AuthState> emit,
  ) async {
    try {
      emit(const AuthLoading());
      _logger.info('Biometric login requested');

      final isAvailable = await _userRepository.isBiometricAvailable();
      if (!isAvailable) {
        emit(const AuthError('Biometric authentication not available'));
        return;
      }

      final isAuthenticated = await _userRepository.authenticateWithBiometric();
      if (!isAuthenticated) {
        emit(const AuthError('Biometric authentication failed'));
        return;
      }

      // Get the current user after successful biometric authentication
      final user = await _userRepository.getCurrentUser();
      if (user == null) {
        emit(const AuthError('No user found'));
        return;
      }

      _logger.info('Biometric login successful for user: ${user.id}');
      emit(AuthSuccess(user));
    } catch (e, stackTrace) {
      _logger.error('Biometric login failed', error: e, stackTrace: stackTrace);
      emit(AuthError(e.toString()));
    }
  }

  Future<void> _onRegisterRequested(
    AuthRegisterRequested event,
    Emitter<AuthState> emit,
  ) async {
    try {
      emit(const AuthLoading());
      _logger.info('Register requested for email: ${event.email}');

      final user = await _userRepository.signUpWithEmail(
        event.email,
        event.password,
        event.firstName,
        event.lastName,
      );

      _logger.info('Registration successful for user: ${user.id}');
      emit(AuthSuccess(user));
    } catch (e, stackTrace) {
      _logger.error('Registration failed', error: e, stackTrace: stackTrace);
      emit(AuthError(e.toString()));
    }
  }

  Future<void> _onLogoutRequested(
    AuthLogoutRequested event,
    Emitter<AuthState> emit,
  ) async {
    try {
      emit(const AuthLoading());
      _logger.info('Logout requested');

      await _userRepository.signOut();
      emit(const AuthInitial());
      
      _logger.info('Logout successful');
    } catch (e, stackTrace) {
      _logger.error('Logout failed', error: e, stackTrace: stackTrace);
      emit(AuthError(e.toString()));
    }
  }

  Future<void> _onPasswordResetRequested(
    AuthPasswordResetRequested event,
    Emitter<AuthState> emit,
  ) async {
    try {
      emit(const AuthLoading());
      _logger.info('Password reset requested for email: ${event.email}');

      await _userRepository.sendPasswordResetEmail(event.email);
      emit(const AuthPasswordResetSent());
      
      _logger.info('Password reset email sent');
    } catch (e, stackTrace) {
      _logger.error('Password reset failed', error: e, stackTrace: stackTrace);
      emit(AuthError(e.toString()));
    }
  }

  Future<void> _onEmailVerificationRequested(
    AuthEmailVerificationRequested event,
    Emitter<AuthState> emit,
  ) async {
    try {
      emit(const AuthLoading());
      _logger.info('Email verification requested');

      await _userRepository.sendEmailVerification();
      emit(const AuthEmailVerificationSent());
      
      _logger.info('Email verification sent');
    } catch (e, stackTrace) {
      _logger.error('Email verification failed', error: e, stackTrace: stackTrace);
      emit(AuthError(e.toString()));
    }
  }

  Future<void> _onBiometricAvailabilityRequested(
    AuthBiometricAvailabilityRequested event,
    Emitter<AuthState> emit,
  ) async {
    try {
      final isAvailable = await _userRepository.isBiometricAvailable();
      emit(AuthBiometricAvailable(isAvailable));
    } catch (e, stackTrace) {
      _logger.error('Biometric availability check failed', error: e, stackTrace: stackTrace);
      emit(AuthBiometricAvailable(false));
    }
  }
}
