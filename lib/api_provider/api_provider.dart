import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_demo/utils/app_strings.dart';

enum AuthStatus { uninitialized, authenticated, unauthenticated }

class ApiProviderViewModel extends ChangeNotifier {
  Client client = Client();
  Account? account;
  late User _currentUser;

  AuthStatus _status = AuthStatus.uninitialized;

  User get currentUser => _currentUser;

  AuthStatus get status => _status;

  String? get username => _currentUser.name;

  String? get email => _currentUser.email;

  String? get userid => _currentUser.$id;

  AuthAPI() {
    init();
    loadUser();
  }

  init() {
    client
        .setEndpoint(AppStrings.appWriteUrl)
        .setProject(AppStrings.appWriteProjectId)
        .setSelfSigned();
    account = Account(client);
  }

  loadUser() async {
    try {
      await account?.get().then((value) {
        _status = AuthStatus.authenticated;
        _currentUser = value;
      });
    } catch (e) {
      _status = AuthStatus.unauthenticated;
    } finally {
      notifyListeners();
    }
  }

  Future<User?> createUser(
      {required String email, required String password}) async {
    try {
      final user = await account?.create(
          userId: ID.unique(), email: email, password: password, name: 'Demo');
      return user;
    } finally {
      notifyListeners();
    }
  }

  Future<Session?> createEmailSession(
      {required String email, required String password}) async {
    try {
      final session =
          await account?.createEmailSession(email: email, password: password);
      await account?.get().then((value) {
        _currentUser = value;
      });
      _status = AuthStatus.authenticated;
      return session;
    } finally {
      notifyListeners();
    }
  }
}
