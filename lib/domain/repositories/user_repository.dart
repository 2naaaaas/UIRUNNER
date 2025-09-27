import '../entities/user_entity.dart';

abstract class UserRepository {
  // Authentication
  Future<UserEntity> signInWithEmail(String email, String password);
  Future<UserEntity> signUpWithEmail(String email, String password, String firstName, String lastName);
  Future<void> signOut();
  Future<UserEntity?> getCurrentUser();
  Future<void> sendEmailVerification();
  Future<void> sendPasswordResetEmail(String email);
  Future<void> updatePassword(String newPassword);
  
  // User Profile
  Future<UserEntity> getUserById(String userId);
  Future<UserEntity> updateUser(UserEntity user);
  Future<void> deleteUser(String userId);
  Future<void> uploadProfileImage(String userId, String imagePath);
  Future<void> deleteProfileImage(String userId);
  
  // User Preferences
  Future<UserPreferencesEntity> getUserPreferences(String userId);
  Future<void> updateUserPreferences(String userId, UserPreferencesEntity preferences);
  
  // User Location
  Future<UserLocationEntity> getUserLocation(String userId);
  Future<void> updateUserLocation(String userId, UserLocationEntity location);
  Future<void> deleteUserLocation(String userId);
  
  // User Stats
  Future<UserStatsEntity> getUserStats(String userId);
  Future<void> updateUserStats(String userId, UserStatsEntity stats);
  
  // User Verification
  Future<void> verifyEmail(String verificationCode);
  Future<void> verifyPhone(String phoneNumber, String verificationCode);
  Future<void> resendVerificationCode(String phoneNumber);
  
  // Biometric Authentication
  Future<bool> isBiometricAvailable();
  Future<bool> authenticateWithBiometric();
  Future<void> enableBiometricAuth(String userId);
  Future<void> disableBiometricAuth(String userId);
  
  // User Search
  Future<List<UserEntity>> searchUsers(String query);
  Future<List<UserEntity>> getUsersByRole(String role);
  Future<List<UserEntity>> getNearbyUsers(double latitude, double longitude, double radius);
  
  // User Status
  Future<void> setUserStatus(String userId, bool isActive);
  Future<void> setUserOnline(String userId);
  Future<void> setUserOffline(String userId);
  
  // User Notifications
  Future<void> updateNotificationSettings(String userId, bool enabled);
  Future<void> subscribeToTopic(String userId, String topic);
  Future<void> unsubscribeFromTopic(String userId, String topic);
}
