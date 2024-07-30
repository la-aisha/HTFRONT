import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive/hive.dart';
import 'package:hizboufront/src/core/global/colors.dart';
import 'package:hizboufront/src/core/providers/bottomnav_provider.dart';
import 'package:hizboufront/src/core/providers/auth_provider.dart';
import 'package:hizboufront/src/ui/routes/route_path.dart';
import 'package:hizboufront/src/ui/screens/home/home.dart';
import 'package:hizboufront/src/ui/screens/login/login.dart';
import 'package:hizboufront/src/ui/screens/splash_screen.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';


Future<void> main() async {
  //final ApiService apiService = ApiService();
  
  WidgetsFlutterBinding.ensureInitialized();
  final appDocumentDir = await getApplicationDocumentsDirectory();
  Hive.init(appDocumentDir.path);
  runApp(MyApp());

  /* runApp(
    MultiProvider(
      providers: providerList,
      child: const MyApp(),
    ),
  ); */
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
    );
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthProvider>(create: (_) => AuthProvider()), 
        ChangeNotifierProvider(create: (_) => SelectedIndexModelProvider()),

      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: AppColors.green1)),
        home: Login(),
      ),
    );
  }
}
