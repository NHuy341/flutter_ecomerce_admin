import 'package:admin/data/repositories/authentication/authentication_repository.dart';
import 'package:admin/data/repositories/user/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:url_strategy/url_strategy.dart';
import 'app.dart';
import 'package:get/get.dart';
import 'firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';

/// Entry point of Flutter App
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await GetStorage.init();

  setPathUrlStrategy();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  // Đăng ký UserRepository vào GetX
  Get.put(UserRepository());

  // Đăng ký AuthenticationRepository vào GetX
  Get.put(AuthenticationRepository());

  runApp(const App());
}
