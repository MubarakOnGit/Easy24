import 'package:abu_app/data/repositories_authentication/user/user_model.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

/// Repository class for user-related operations.
class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  /// Function to save user data to Firestore.
  Future<void> saveUserRecord(UserModel user) async {
    try {
      await _db.collection("Users").doc(user.id).set(user.toJson());
    } on FirebaseException catch (e) {
      throw 'Firebase Error: ${e.message}';
    } on FormatException catch (e) {
      throw 'Format Error: ${e.message}';
    } on PlatformException catch (e) {
      throw 'Platform Error: ${e.message}';
    } catch (e) {
      throw 'Something went wrong. Please try again: $e';
    }
  }
}

class FirebaseExceptionCustom implements Exception {
  final String message;
  FirebaseExceptionCustom(this.message);

  @override
  String toString() => 'FirebaseExceptionCustom: $message';
}

class FormatExceptionCustom implements Exception {
  final String message;
  FormatExceptionCustom(this.message);

  @override
  String toString() => 'FormatExceptionCustom: $message';
}

class PlatformExceptionCustom implements Exception {
  final String message;
  PlatformExceptionCustom(this.message);

  @override
  String toString() => 'PlatformExceptionCustom: $message';
}
