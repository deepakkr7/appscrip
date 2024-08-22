import 'package:appscrip/models/user.dart';
import 'package:appscrip/services/api_services.dart';
import 'package:flutter/foundation.dart';

class UserProvider with ChangeNotifier{
  final ApiService _apiService=ApiService();
  List<User> _users=[];
  bool _isLoading=false;
  String _error='';

  List<User>get users=>_users;
  bool get isLoading=>_isLoading;
  String get error=>_error;

  Future<void> fetchUsers()async{
    _isLoading=true;
    _error='';
    notifyListeners();
    try {
      _users = await _apiService.getUsers();
    } catch (e) {
      _error = 'Failed to load users. Please try again.';
    }

    _isLoading = false;
    notifyListeners();
  }

  void searchUsers(String query) {
    if (query.isEmpty) {
      fetchUsers();
    } else {
      _users = _users.where((user) =>
          user.name!.toLowerCase().contains(query.toLowerCase())).toList();
      notifyListeners();
    }
  }
}