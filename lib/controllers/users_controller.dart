import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/providers.dart';

class UsersController {
  final users = FirebaseFirestore.instance.collection("Users");

  Stream<QuerySnapshot> getAllUsers(BuildContext context) {
    String uid = Provider.of<AuthUProvider>(context, listen: false).user!.uid;
    return users.where('uid', isNotEqualTo: uid).snapshots();
  }

  Future<void> updateOnlineStatus(bool isOnline, String uid) async {
    await users
        .doc(uid)
        .update({'isOnline': isOnline, 'lastSeen': DateTime.now().toString()});
  }
}