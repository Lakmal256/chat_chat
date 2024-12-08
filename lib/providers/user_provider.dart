import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../controllers/controllers.dart';
import 'providers.dart';

class UserProvider extends ChangeNotifier {
  UsersController usersController = UsersController();

  Future<void> updateOnlineStatus(bool isOnline, BuildContext context) async {
    String uid = Provider.of<AuthUProvider>(context, listen: false).user!.uid;
    usersController.updateOnlineStatus(isOnline, uid);
  }
}