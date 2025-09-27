import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

import '../../core/utils/logger.dart';
import '../../domain/entities/user_entity.dart';
import '../../domain/repositories/user_repository.dart';

part 'app_event.dart';
part 'app_state.dart';

@injectable
class AppBloc extends Bloc<AppEvent, AppState> {
  final UserRepository _userRepository;
  final AppLogger _logger;

  AppBloc(
    this._userRepository,
    this._logger,
  ) : super(const AppInitial()) {
    on<AppStarted>(_onAppStarted);
    on<AppUserChanged>(_onAppUserChanged);
    on<AppLogoutRequested>(_onAppLogoutRequested);
    on<AppThemeChanged>(_onAppThemeChanged);
    on<AppLanguageChanged>(_onAppLanguageChanged);
  }

  Future<void> _onAppStarted(AppStarted event, Emitter<AppState> emit) async {
    try {
      _logger.info('App started');
      emit(const AppLoading());

      // Check if user is already authenticated
      final currentUser = await _userRepository.getCurrentUser();
      
      if (currentUser != null) {
        _logger.info('User already authenticated: ${currentUser.id}');
        emit(AppAuthenticated(currentUser));
      } else {
        _logger.info('No authenticated user found');
        emit(const AppUnauthenticated());
      }
    } catch (e, stackTrace) {
      _logger.error('Error during app start', error: e, stackTrace: stackTrace);
      emit(AppError(e.toString()));
    }
  }

  Future<void> _onAppUserChanged(AppUserChanged event, Emitter<AppState> emit) async {
    try {
      _logger.info('User changed: ${event.user?.id ?? 'null'}');
      
      if (event.user != null) {
        emit(AppAuthenticated(event.user!));
      } else {
        emit(const AppUnauthenticated());
      }
    } catch (e, stackTrace) {
      _logger.error('Error handling user change', error: e, stackTrace: stackTrace);
      emit(AppError(e.toString()));
    }
  }

  Future<void> _onAppLogoutRequested(AppLogoutRequested event, Emitter<AppState> emit) async {
    try {
      _logger.info('Logout requested');
      emit(const AppLoading());
      
      await _userRepository.signOut();
      emit(const AppUnauthenticated());
      
      _logger.info('User logged out successfully');
    } catch (e, stackTrace) {
      _logger.error('Error during logout', error: e, stackTrace: stackTrace);
      emit(AppError(e.toString()));
    }
  }

  Future<void> _onAppThemeChanged(AppThemeChanged event, Emitter<AppState> emit) async {
    try {
      _logger.info('Theme changed to: ${event.theme}');
      
      if (state is AppAuthenticated) {
        final currentUser = (state as AppAuthenticated).user;
        final updatedUser = currentUser.copyWith(
          preferences: currentUser.preferences?.copyWith(
            theme: event.theme,
          ),
        );
        
        await _userRepository.updateUser(updatedUser);
        emit(AppAuthenticated(updatedUser));
      }
    } catch (e, stackTrace) {
      _logger.error('Error changing theme', error: e, stackTrace: stackTrace);
      emit(AppError(e.toString()));
    }
  }

  Future<void> _onAppLanguageChanged(AppLanguageChanged event, Emitter<AppState> emit) async {
    try {
      _logger.info('Language changed to: ${event.language}');
      
      if (state is AppAuthenticated) {
        final currentUser = (state as AppAuthenticated).user;
        final updatedUser = currentUser.copyWith(
          preferences: currentUser.preferences?.copyWith(
            language: event.language,
          ),
        );
        
        await _userRepository.updateUser(updatedUser);
        emit(AppAuthenticated(updatedUser));
      }
    } catch (e, stackTrace) {
      _logger.error('Error changing language', error: e, stackTrace: stackTrace);
      emit(AppError(e.toString()));
    }
  }
}
