part of 'app_bloc.dart';

abstract class AppState extends Equatable {
  const AppState();

  @override
  List<Object?> get props => [];
}

class AppInitial extends AppState {
  const AppInitial();
}

class AppLoading extends AppState {
  const AppLoading();
}

class AppAuthenticated extends AppState {
  final UserEntity user;

  const AppAuthenticated(this.user);

  @override
  List<Object?> get props => [user];
}

class AppUnauthenticated extends AppState {
  const AppUnauthenticated();
}

class AppError extends AppState {
  final String message;

  const AppError(this.message);

  @override
  List<Object?> get props => [message];
}
