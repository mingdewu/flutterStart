import 'package:flutter/material.dart';
void main() {
  runApp(const  MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter layout demo',
      home:  buildHomePage('ABC')
    );
  }

  Widget _buildImageColumn(){
    return Container(
      decoration: const BoxDecoration(
        color: Colors.black26,
      ),
      child: Column(
        children: [
          Icon(Icons.star, color: Colors.green[500]),
          Icon(Icons.star, color: Colors.green[500]),
        ],
      ),
    );
  }

  Widget _buildList(){
    return ListView(
      children:[
        _tile('CineArts at the Empire', '85 W Portal Ave',Icons.theaters),
        _tile('The Castro Theater', '429 Castro St', Icons.theaters),
        _tile('Alamo Drafthouse Cinema', '2550 Mission St', Icons.theaters),
        _tile('Roxie Theater', '3117 16th St', Icons.theaters),
        _tile('United Artists Stonestown Twin', '501 Buckingham Way',
            Icons.theaters),
        _tile('AMC Metreon 16', '135 4th St #3000', Icons.theaters),
        const Divider(),
        _tile('K\'s Kitchen', '757 Monterey Blvd', Icons.restaurant),
        _tile('Emmy\'s Restaurant', '1923 Ocean Ave', Icons.restaurant),
        _tile(
            'Chaiya Thai Restaurant', '272 Claremont Blvd', Icons.restaurant),
        _tile('La Ciccia', '291 30th St', Icons.restaurant),
      ]
    );
  }
  ListTile _tile(String title,String subtitle,IconData icon){
    return ListTile(
      title:Text(title,
      style:const TextStyle(
        fontWeight:FontWeight.w500,
        fontSize: 20,
      )),
      subtitle:Text(subtitle),
      leading:Icon(
        icon,
        color: Colors.red,
      )
    );
  }
  Widget buildHomePage(String title){
    const titleText = Padding(
      padding:EdgeInsets.all(20),
      child:Text(
        "BCD",
        style: TextStyle(
          fontWeight: FontWeight.w800,
          letterSpacing:0.5,
          fontSize: 30,
        ),
      )
    );
    var stars = Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(Icons.star, color: Colors.green[500]),
        Icon(Icons.star, color: Colors.green[500]),
        Icon(Icons.star, color: Colors.green[500]),
        const Icon(Icons.star, color: Colors.black),
        const Icon(Icons.star, color: Colors.black),
      ],
    );
    var pic = Column(
      mainAxisAlignment:MainAxisAlignment.spaceEvenly,
      children:[
        Icon(Icons.star, color: Colors.green[500]),
        Icon(Icons.star, color: Colors.green[500]),
        Icon(Icons.star, color: Colors.green[500]),
        const Icon(Icons.star, color: Colors.black),
        const Icon(Icons.star, color: Colors.black),
      ],
    );
    final ratings = Container(
      padding: const EdgeInsets.all(20),
      child:Row(
        mainAxisAlignment:MainAxisAlignment.spaceEvenly,
        children: [
          stars,
          const Text(
            '170 Reviews',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w800,
              fontFamily: 'Roboto',
              letterSpacing: 0.5,
              fontSize: 40,
            )
          )
        ],
      )
    );

    const deskStyle = TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.w600,
      fontFamily: 'Roboto',
      letterSpacing:0.5,
      fontSize: 18,
      height:2,
    );
    final iconList = DefaultTextStyle.merge(
        style: deskStyle,
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children:[
                  Icon(Icons.kitchen,color: Colors.green),
                  const Text('PREP'),
                  const Text('1 hr'),
                ],
              ),
              Column(
                children: [
                  Icon(Icons.timer, color: Colors.green[500]),
                  const Text('COOK:'),
                  const Text('1 hr'),
                ],
              ),
              Column(
                children:[
                  Icon(Icons.restaurant,color: Colors.red[500]),
                  const Text('Feeds'),
                  const Text('4-6'),
                ]
              )
            ],
          ),
        )
    );

    final leftColumn = Container(
      padding :const EdgeInsets.fromLTRB(20, 30, 30, 30),
      child: Column(
        children: [
          titleText,
          ratings,
          iconList,
        ],
      ),
    );
    return Scaffold(
      appBar:AppBar(
        title:Text(title),
      ),
      body: Column(
        children:[pic,stars,ratings,iconList,leftColumn,]
      ),
    );
  }
}