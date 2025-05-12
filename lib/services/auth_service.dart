import 'package:flutter/foundation.dart';  // Add this import

enum PhoneApprovalStatus {
  approved,
  pendingOrRejected,
  blocked,
}

class AuthService with ChangeNotifier {
  bool _isManager = false;  // Add manager state tracking
  
  bool get isManager => _isManager;
  bool get isAuthenticated => false; // Add your actual auth logic

  Future<PhoneApprovalStatus> checkPhoneApproval(String phone) async {
    // Dummy logic simulating Firestore check
    if (phone == "+1234567890") {
      _isManager = true;  // Example: set manager status
      notifyListeners();
      return PhoneApprovalStatus.approved;
    }

    // Simulate checking last request timestamp
    final lastRequest = DateTime.now().subtract(Duration(days: 30));
    if (DateTime.now().difference(lastRequest).inDays < 90) {
      return PhoneApprovalStatus.blocked;
    }

    return PhoneApprovalStatus.pendingOrRejected;
  }
}