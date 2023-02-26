import 'package:flutter/material.dart';
import 'package:linework/containerWiget.dart';
import 'package:linework/secondPage.dart';
import 'package:linework/decorationWidget.dart';
import 'package:linework/sizeBoxWidget.dart';
import 'package:linework/alignCenterWidget.dart';
import 'package:linework/frationallySizedBoxWidget.dart';
import 'package:linework/paddingWidget.dart';
import 'package:linework/edgeInsets.dart';
import 'package:linework/limitedBox.dart';
import 'package:linework/spacerWidget.dart';
import 'package:linework/multiColumnWidget.dart';
import 'package:linework/textBaseLineWidget.dart';
import 'package:linework/gridViewWidget.dart';
import 'package:linework/pageViewWidget.dart';
import 'package:linework/form/inputFormWidget.dart';

void main() => runApp(
    MyApp()
);

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      initialRoute: "/",
      routes: {
        '/': (context) =>  const FirstPage(),
        '/second': (context) => const SecondPage(),
        '/containerWidget': (context) => const ContainerWidget(),
        '/decorationWidget': (context) => const decorationWidget(),
        '/sizeBoxWidget': (context) => const SizeBoxWidget(),
        '/alignCenterWidget': (context) => const AlignCenterWidget(),
        '/frationallySizedBoxWidget': (context) => const FractionallySizedBoxWidget(),
        '/paddingWidget': (context) => const PaddingWidget(),
        '/edgeInsets': (context) => const EdgeInsertsWidget(),
        '/limitedBoxWidget': (context) => const LimitedBoxWidget(),
        '/spacerWidget': (context) => const SpacerWidget(),
        '/multiColumnWidget': (context) => const MultiColumnWidget(),
        '/textBaseLineWidget': (context) => const TextBaseLineWidget(),
        '/gridViewWidget': (context) => const GridViewWidget(),
        '/pageViewWidget': (context) =>  PageViewWidget(),
        '/inputFormWidget': (context) =>  FormPage(),
      },
    );
  }
}

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('First Page')
      ),
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children:[
              buttonFunction(context, '/second'),
              buttonFunction(context, '/containerWidget'),
              buttonFunction(context, '/decorationWidget'),
              buttonFunction(context, '/sizeBoxWidget'),
              buttonFunction(context, '/alignCenterWidget'),
              buttonFunction(context, '/frationallySizedBoxWidget'),
              buttonFunction(context, '/paddingWidget'),
              buttonFunction(context, '/edgeInsets'),
              buttonFunction(context, '/limitedBoxWidget'),
              buttonFunction(context, '/spacerWidget'),
              buttonFunction(context, '/multiColumnWidget'),
              buttonFunction(context, '/textBaseLineWidget'),
              buttonFunction(context, '/gridViewWidget'),
              buttonFunction(context, '/pageViewWidget'),
              buttonFunction(context, '/inputFormWidget'),
              ]
      ),
    ),
    );
  }
}

buttonFunction(context,var route){
  return ElevatedButton(
    onPressed: () {
      Navigator.pushNamed(context, route);
    },
    child:  Text('Launch '+route),
  );
}




