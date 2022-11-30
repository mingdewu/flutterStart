import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:layout_learn/common/theme.dart';
import 'package:layout_learn/models/cart.dart';
import 'package:layout_learn/models/catalog.dart';
import 'package:layout_learn/screens/cart.dart';
import 'package:layout_learn/screens/catalog.dart';
import 'package:layout_learn/screens/login.dart';
import 'package:window_size/window_size.dart';

void main(){
  // setupWindow();
  runApp(const MyApp());
}

const double windowWidth = 400;
const double windowHeight = 800;

void setuWindow(){
  if (!kIsWeb && (Platform.isWindows || Platform.isLinux || Platform.isMacOS)){
    WidgetsFlutterBinding.ensureInitialized();
    setWindowTitle('Provider Demo');
    setWindowMinSize(const Size(windowWidth,windowHeight));
    setWindowMaxSize(const Size(windowWidth,windowHeight));
    getCurrentScreen().then((screen){
      setWindowFrame(Rect.fromCenter(
        center:screen!.frame.center,
        width:windowWidth,
        height: windowHeight,
      ));
    });
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      Provider(create: (context) => CatalogModel()),

      ChangeNotifierProxyProvider<CatalogModel,CartModel>(
        create:(context) => CartModel(),
        update:(context,catalog,cart){
          if (cart == null) throw ArgumentError.notNull('cart');
          cart.catalog = catalog;
          return cart;
        },
      ),
    ],
    child:MaterialApp(
      title:'Provider Demo',
      theme: appTheme,
      initialRoute:'/',
      routes:{
        '/':(context) => const MyLogin(),
        '/catalog':(context) => const MyCatalog(),
        '/cart': (context) => const MyCart(),
      }
      ),
    );
  }
}