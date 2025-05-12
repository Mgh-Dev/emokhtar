import 'package:flutter/foundation.dart';

class UserService extends ChangeNotifier {  // Added ChangeNotifier
  Future<void> submitApprovalRequest(String phone, String name) async {
    // Dummy logic to simulate Firestore write
    await Future.delayed(Duration(seconds: 1));
    print("Request submitted for $phone by $name");
    notifyListeners();  // Notify any listeners after submission
  }
}