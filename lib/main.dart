import 'package:flutter/material.dart';

//import 'textfield_controller.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TodoScreen',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const TodoScreen(),
    );
  }
}

class TodoScreen extends StatefulWidget {
  const TodoScreen({Key? key, this.title}) : super(key: key);
  final String? title;
  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  late TextEditingController _textFieldController;

  @override
  void initState() {
    super.initState();
    _textFieldController = TextEditingController();
  }

  @override
  void dispose() {
    _textFieldController.dispose();
    super.dispose();
  }

  final List<String> todoList = [];

  //List<bool> _selected = [];

  //List<String> tempArray = [];

  Future<void> _displayTextInputDialog(BuildContext context) async {
     const snackBar = SnackBar(content: Text('Text field cannot be empty.'));

    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('TextField in Dialog'),
          content: TextField(
            controller: _textFieldController,
            onChanged: (value) {
              setState(() {
                //valueText = value;
              });
            },
            decoration: const InputDecoration(hintText: "Text Field in Dialog"),
          ),
          actions: <Widget>[
            MaterialButton(
              color: Colors.red,
              textColor: Colors.white,
              child: const Text('CANCEL'),
              onPressed: () {
                setState(() {
                  Navigator.pop(context);
                });
              },
            ),
            MaterialButton(
              color: Colors.green,
              textColor: Colors.white,
              child: const Text('OK'),
              onPressed: () {
                setState(() {
                  if (_textFieldController.text.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  } else {
                    todoList.add(_textFieldController.text);
                    setState(() {});
                    Navigator.of(context).pop();
                  }
                });
              },
            ),
          ],
        );
      },
    );
  }

  void deleteItem(int index) {
    setState(() {
      //final removedItem = todoList[index];
      todoList.removeAt(index);
      //_selected.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "ListView With Select",
          style: TextStyle(fontStyle: FontStyle.italic, fontSize: 30),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: todoList.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    child: Card(
                      child: ListTile(
                        title: Text(
                          todoList[index].toString(),
                          style: TextStyle(
                            fontStyle: FontStyle.italic,
                            fontSize: 20,
                          ),
                        ),
                        trailing: IconButton(
                          icon: const Icon(Icons.delete, color: Colors.red),
                          onPressed: () {
                            deleteItem(index);
                          },
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            Flexible(
              flex: 1,
              child: Row(
                children: [
                  ElevatedButton(
                    child: const Text('Add'),
                    onPressed: () {
                      _displayTextInputDialog(context);
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/*
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List<String> name = ['January','February','March','April','May','June','July','August','September'
    ,'October','November','December'];

  List<String> tempArray = [];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ListView With Select" , style: TextStyle(fontStyle: FontStyle.italic,
            fontSize: 30),),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             Expanded(
               child: ListView.builder(
                   itemCount: name.length,
                   itemBuilder: (context, index) {
                     return InkWell(
                       child: Card(
                         child: ListTile(
                           title: Text(name[index].toString(), style: TextStyle(fontStyle: FontStyle.italic,
                               fontSize: 20)),
                           trailing: Container(
                             height: 50,
                             width: 100,
                             decoration: BoxDecoration(
                               color: tempArray.contains(name[index].toString()) ? Colors.red : Colors.green
                             ),
                             child: Center(
                               child: Text(tempArray.contains(name[index].toString()) ? 'REMOVE' : 'ADD',
                                   style: TextStyle(fontStyle: FontStyle.italic,
                                   fontSize: 20)),
                             ),
                           ),
                         ),
                       ),
                       onTap: () {
                        setState(() {
                          if(tempArray.contains(name[index].toString())) {
                            tempArray.remove(name[index].toString());
                          } else {
                            tempArray.add(name[index].toString());
                          }
                        });
                       },
                     );
                   }),
             )
          ],
        ),
      ),
    );
  }
}
*/

//  String? valueText;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.teal,
//         title: const Text('Mijn To do List'),
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             child: ListView.builder(
//               itemCount: todoList.length,
//               itemBuilder: (context, index) {
//                 return ListTile(
//                   title: Text(todoList[index]),
//                   leading: Checkbox(
//                     value: _selected[index],
//                     onChanged: (value) {
//                       setState(() {
//                         _selected[index] = value!;
//                       });
//                     },
//                   ),
//                 );
//               },
//             ),
//           ),
//           Flexible(
//             flex: 1,
//             child: Row(
//               children: [
//                 ElevatedButton(
//                   child: const Text('Add'),
//                   onPressed: () {
//                     _displayTextInputDialog(context);
//                   },
//                 ),
//               ],
//             ),
//           ),
//           ElevatedButton(
//             child: Text('Remove'),
//             onPressed: () {
//               setState(() {
//                 if (todoList.isNotEmpty) {
//                   todoList.removeLast();
//                 }
//               });
//             },
//           ),
//         ],
//       ),
//     );
//   }
