import 'package:flutter/foundation.dart';
import 'package:ecommerce/models/user_model.dart';

class AuthProvider with ChangeNotifier {
  UserModel _user = UserModel.empty();
  
  UserModel get user => _user;
  bool get isLoggedIn => _user.isNotEmpty;

  void login(String email, String password) {
    // Mock login - replace with real implementation
    _user = UserModel(
      uid: 'mock-uid',
      name: 'Demo User',
      email: email,
    );
    notifyListeners();
  }

  void signUp(String name, String email, String password) {
    // Mock signup
    _user = UserModel(
      uid: 'mock-uid',
      name: name,
      email: email,
    );
    notifyListeners();
  }

  void logout() {
    _user = UserModel.empty();
    notifyListeners();
  }
}