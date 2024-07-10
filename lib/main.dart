import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:securitas/colors.dart';
import 'package:securitas/common/widgets/error.dart';
import 'package:securitas/common/widgets/loader.dart';
import 'package:securitas/features/auth/controller/auth_controller.dart';
import 'package:securitas/features/auth/screen/user_information_screen.dart';
import 'package:securitas/features/landing/screens/landing_screen.dart';
import 'package:securitas/firebase_options.dart';
import 'package:securitas/router.dart';
import 'screens/mobile_layout_screen.dart';
import 'screens/web_layout_screen.dart';
import 'utils/responsive_layout.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Whatsapp UI',
      // theme: ThemeData.dark().copyWith(
      //   scaffoldBackgroundColor: backgroundColor,
      // ),
      onGenerateRoute: ((settings) => generateRoute(settings)),
      home: ref.watch(userDataAuthProvider).when(
            data: (user) {
              if (user == null) {
                return const LandingScreen();
              }
              return const MobileLayoutScreen();
            },
            error: (err, trace) {
              return ErrorScreen(
                error: err.toString(),
              );
            },
            loading: () => const Loader(),
          ),
    );
  }
}
