import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:store/database/cart_item.dart';
import 'package:store/pages/home/main_page.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();

  Hive.registerAdapter(CartItemAdapter());
  await Hive.openBox<CartItem>("cartitems");

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      home: MainScreen(),
      // home: Scaffold(
      //   appBar: appBar(context),
      //   body: const Center(
      //     child: Text("Hello World"),
      //   ),
      //   bottomNavigationBar: const BottomNavBar(),
      // ),
    );
  }
}
