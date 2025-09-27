import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:geolocator/geolocator.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:dio/dio.dart';
import 'package:hive/hive.dart';

import 'dependency_injection.config.dart';
import '../network/network_info.dart';
import '../utils/logger.dart';

final getIt = GetIt.instance;

@InjectableInit()
Future<void> configureDependencies() async {
  // Initialize external dependencies
  final sharedPreferences = await SharedPreferences.getInstance();
  final firebaseAuth = FirebaseAuth.instance;
  final firestore = FirebaseFirestore.instance;
  final firebaseStorage = FirebaseStorage.instance;
  final firebaseMessaging = FirebaseMessaging.instance;
  final geolocator = GeolocatorPlatform.instance;
  final connectivity = Connectivity();
  final internetConnectionChecker = InternetConnectionChecker();
  
  // Initialize Hive boxes
  await Hive.openBox('user_data');
  await Hive.openBox('app_settings');
  await Hive.openBox('cache_data');
  
  // Register external dependencies
  getIt.registerLazySingleton<SharedPreferences>(() => sharedPreferences);
  getIt.registerLazySingleton<FirebaseAuth>(() => firebaseAuth);
  getIt.registerLazySingleton<FirebaseFirestore>(() => firestore);
  getIt.registerLazySingleton<FirebaseStorage>(() => firebaseStorage);
  getIt.registerLazySingleton<FirebaseMessaging>(() => firebaseMessaging);
  getIt.registerLazySingleton<GeolocatorPlatform>(() => geolocator);
  getIt.registerLazySingleton<Connectivity>(() => connectivity);
  getIt.registerLazySingleton<InternetConnectionChecker>(() => internetConnectionChecker);
  
  // Register network dependencies
  getIt.registerLazySingleton<Dio>(() => Dio());
  getIt.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(
    connectivity: getIt(),
    internetConnectionChecker: getIt(),
  ));
  
  // Register logger
  getIt.registerLazySingleton<AppLogger>(() => AppLogger());
  
  // Initialize generated dependencies
  getIt.init();
}
