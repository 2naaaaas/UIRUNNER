part of 'app_bloc.dart';

abstract class AppEvent extends Equatable {
  const AppEvent();

  @override
  List<Object?> get props => [];
}

class AppStarted extends AppEvent {
  const AppStarted();
}

class AppUserChanged extends AppEvent {
  final UserEntity? user;

  const AppUserChanged(this.user);

  @override
  List<Object?> get props => [user];
}

class AppLogoutRequested extends AppEvent {
  const AppLogoutRequested();
}

class AppThemeChanged extends AppEvent {
  final String theme;

  const AppThemeChanged(this.theme);

  @override
  List<Object?> get props => [theme];
}

class AppLanguageChanged extends AppEvent {
  final String language;

  const AppLanguageChanged(this.language);

  @override
  List<Object?> get props => [language];
}
