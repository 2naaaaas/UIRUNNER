import 'dart:io';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

abstract class NetworkInfo {
  Future<bool> get isConnected;
  Future<bool> get isWifiConnected;
  Future<bool> get isMobileConnected;
  Stream<bool> get connectionStream;
}

class NetworkInfoImpl implements NetworkInfo {
  final Connectivity connectivity;
  final InternetConnectionChecker internetConnectionChecker;

  NetworkInfoImpl({
    required this.connectivity,
    required this.internetConnectionChecker,
  });

  @override
  Future<bool> get isConnected async {
    try {
      final connectivityResult = await connectivity.checkConnectivity();
      if (connectivityResult == ConnectivityResult.none) {
        return false;
      }
      return await internetConnectionChecker.hasConnection;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<bool> get isWifiConnected async {
    try {
      final connectivityResult = await connectivity.checkConnectivity();
      return connectivityResult == ConnectivityResult.wifi;
    } catch (e) {
        return false;
    }
  }

  @override
  Future<bool> get isMobileConnected async {
    try {
      final connectivityResult = await connectivity.checkConnectivity();
      return connectivityResult == ConnectivityResult.mobile;
    } catch (e) {
      return false;
    }
  }

  @override
  Stream<bool> get connectionStream async* {
    yield* connectivity.onConnectivityChanged.asyncMap((result) async {
      if (result == ConnectivityResult.none) {
        return false;
      }
      return await internetConnectionChecker.hasConnection;
    });
  }
}
