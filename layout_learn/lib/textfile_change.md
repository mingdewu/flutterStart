
给 TextField 绑定 onChanged() 回调。每当文本内容改变时，回调函数会被触发。
TextField(
onChanged:(text){
print("First text field:$text);
}
)



class MyCustomForm extends StatefulWidget{
const MyCustoForm({super.key});

    @override
    State<MyCustomForm> createState() => _MyCUstomFormState();
}

class _MyCustomFormState extends State<MyCustomForm> {
    final myController = TextEditingController();


    @override
    void dispose() {
    myCOntroller.dispose();
    super.dispose();
    }
    @override
Widget build(BuildContext context){
    
}
}

TextEditingController 必须绑定到 TextField 或者是 TextFormField 才能被正常的使用。一旦绑定，就能够开始监听文本框的变化。

TextField(
controller:myController,
),

创建一个打印当前值的方法

void _printLaestValue(){
    print("se Text field : $(myController.text");
}

监听控制器的变化