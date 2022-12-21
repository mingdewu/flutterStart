import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart' show debugPaintSizeEnabled;
void main() {
  debugPaintSizeEnabled = false;
  runApp(const  MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  static const showCard = true;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter layout demo',
        home:  Scaffold(
          appBar: AppBar(
            title:const Text('Flutter layout demo'),
          ),
          body: Center(child:
          showCard ? _buildCard() : _buildStack()),
        ),
    );
  }
  Widget _buildStack(){
    return Stack(
      alignment:const Alignment(0.6,0.6),
      children:[
        const CircleAvatar(
          backgroundImage:AssetImage('images/wxy.jpg'),
          radius:100,
        ),
        Container(
          decoration: const BoxDecoration(
            color:Colors.black12,
          ),
          child: const Text(
            'Mia B',
            style: TextStyle(
              fontSize: 20,
              fontWeight:FontWeight.bold,
              color: Colors.red,
            ),
          ),
        )
      ]
    );
  }
  Widget _buildCard(){
    return SizedBox(
      child: Card(
        child:Column(
          children:[
            ListTile(
              title: const Text(
                '1625 Main Street',
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              subtitle:const Text('My City,Ca 99984'),
              leading:Icon(
                Icons.restaurant_menu,
                color: Colors.green,
              )
            ),
            const Divider(),
            ListTile(
              title: const Text(
                '(408) 555-1212',
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              leading:Icon(
                Icons.contact_phone,
                color: Colors.yellow,
              )
            ),
            ListTile(
              title: const Text('cons@ABC.com'),
              leading:Icon(
                Icons.contact_mail,
                color:Colors.blue,
              )
            )
          ]
        )
      ),
    );
  }
}
