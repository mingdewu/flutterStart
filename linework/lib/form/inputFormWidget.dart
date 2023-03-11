import 'package:flutter/material.dart';

class FormPage extends StatelessWidget {
   FormPage({super.key});
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      home: Scaffold(
        key:_scaffoldKey,
        appBar: AppBar(title: const Text('Form')),
        body:Form(
          key:_formKey,
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                TextFormField(
                  decoration:const InputDecoration(border: OutlineInputBorder(),
                  filled: true,
                  icon:Icon(Icons.person),
                  hintText: "名前を入力してください。",
                  labelText:'名前'),
                  validator: (value){
                    if(value != null && value.isEmpty){
                      return '必要です';
                    }
                    return null;
                  }
                ),
                Padding(padding: const EdgeInsets.symmetric(vertical: 18.0),
                child: ElevatedButton(

                  onPressed:(){
                    if(_formKey.currentState!.validate()){
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('OK'))
                      );
                    }
                  },
                  child: const Text('Submit'),
                ),
                )
              ],
            ),
          ),
        )
      ),
    );
  }
}
