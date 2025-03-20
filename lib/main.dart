import 'dart:ui';

import 'package:campus_marketplace/screens/navigation/screens/home/widgets/product_vm.dart';
import 'package:campus_marketplace/utils/provider/category_provider.dart';
import 'package:campus_marketplace/utils/provider/product_provider.dart';
import 'package:campus_marketplace/utils/provider/review_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';
import 'package:campus_marketplace/firebase_options.dart';
import 'package:campus_marketplace/screens/navigation/navigation_screen.dart';
import 'package:campus_marketplace/utils/constants/app_assets.dart';
import 'package:campus_marketplace/utils/constants/router.dart';
import 'package:campus_marketplace/screens/authentication/authentication_vm.dart';
import 'package:campus_marketplace/utils/provider/theme_provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:campus_marketplace/utils/provider/user_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await dotenv.load(fileName: AppAssets.env_file);

  await Supabase.initialize(
    url: dotenv.env['SUPABASE_URL'] ?? "No API Key Found",
    anonKey: dotenv.env['SUPABASE_KEY'] ?? "No API Key Found",
  );

  await Firebase.initializeApp(
    name: "Campus Marketplace",
    options: DefaultFirebaseOptions.currentPlatform,
  );

  final firebaseAuth = FirebaseAuth.instance;
  final UserProvider userProvider = UserProvider();

  // Check if a user is already signed in
  final firebaseUser = firebaseAuth.currentUser;
  if (firebaseUser != null) {
    await userProvider.fetchUserByFirebaseUid(firebaseUser.uid);
  }

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ChangeNotifierProvider(create: (_) => NavigationProvider()),
        ChangeNotifierProvider(create: (_) => AuthenticationViewModel()),
        ChangeNotifierProvider(create: (_) => CategoryProvider()),
        ChangeNotifierProvider(create: (_) => ProductViewModel()),
        ChangeNotifierProvider(create: (_) => UserProvider()),
        ChangeNotifierProvider(
          create: (_) => userProvider,
        ), // ✅ Pass preloaded user data=
        ChangeNotifierProvider(
          create: (context) => ProductProvider()..loadProducts(),
        ),
        ChangeNotifierProvider(
          create: (context) => ReviewProvider()..loadReviews(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class NoThumbScrollBehavior extends ScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
    PointerDeviceKind.touch,
    PointerDeviceKind.mouse,
    PointerDeviceKind.stylus,
    PointerDeviceKind.trackpad,
  };
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return MaterialApp.router(
      title: 'Campus Market',
      debugShowCheckedModeBanner: false,
      theme: themeProvider.lightTheme(context), // Light theme
      darkTheme: themeProvider.darkTheme(context), // Dark theme
      themeMode: themeProvider.themeMode, // Dynamic theme mode
      scrollBehavior: NoThumbScrollBehavior().copyWith(scrollbars: false),
      routerConfig: AppRoutes.router,
    );
  }
}
