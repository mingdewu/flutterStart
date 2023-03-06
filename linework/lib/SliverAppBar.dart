import 'package:flutter/material.dart';

class SliverBar extends StatefulWidget {
  @override
  _SliverBarState createState() => _SliverBarState();
}

class Grade {
  final String name;
  final int score;
  const Grade(this.name,this.score);
}

class _SliverBarState extends State<SliverBar>{
  final grades =[
    const Grade('えりな', 100),
    const Grade('くるみ', 10),
    const Grade('みなみ', 2),
  ];

  final _selected =[];
  var _sort = true;

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar:  AppBar(title: const Text('DataTable')),
      body: DataTable(
        sortAscending:_sort,
        sortColumnIndex: 1,
        columns: [
          const DataColumn(label: Text("name"),),
          DataColumn(label: const Text("score"),
                  numeric: true,
            onSort: (int columnIndex,bool ascending){
            if (columnIndex == 1){
              if (ascending){
                grades.sort((a,b)=> a.score.compareTo(b.score),);
              }else{
               grades.sort((a,b) => b.score.compareTo(a.score));
              }
              setState((){
                _sort = !_sort;
              });
            }
            }
          )
        ],
        rows: [
            for (var grade in grades)
              DataRow(
                selected: _selected.contains(grade.name),
                onSelectChanged: (bool value != null){
                  setState(() {
                    if (value){
                      _selected.add(grade.name);
                    }else{
                      _selected.remove(grade.name);
                    }
                  });
                },
                cells: [
                  DataCell(
                    Text(grade.name),
                  ),
                  DataCell(
                    Text(grade.score.toString()),
                  )
                ]
              )
        ],
      ),
    );
  }
}