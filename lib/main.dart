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

    bool isWhiteSpace(String? text) {
      return text == null || text.trim().isEmpty || text != text.trim();
    }

    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Add Dialog'),
          content: TextField(
            controller: _textFieldController,
            onChanged: (value) {
              setState(() {
                //valueText = value;
              });
            },
            decoration: const InputDecoration(hintText: "Type in task"),
          ),
          actions: <Widget>[
            MaterialButton(
              color: Colors.red,
              textColor: Colors.white,
              child: const Text('CANCEL'),
              onPressed: () {
                setState(() {
                  _textFieldController.clear();
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
                  if (isWhiteSpace(_textFieldController.text)) {
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  } else {
                    todoList.add(_textFieldController.text);
                    _textFieldController.clear();
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

  Future<void> _displayEditTextInputDialog(
    BuildContext context,
    int index,
  ) async {
    //const snackBar = SnackBar(content: Text('Text field cannot be empty.'));
    _textFieldController.text = todoList[index];

    const editSnackBar = SnackBar(content: Text('Edit field cannot be empty.'));

    bool isWhiteSpace(String? text) {
      return text == null || text.trim().isEmpty || text != text.trim();
    }

    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Edit Dialog'),
          content: TextField(
            controller: _textFieldController,
            // onChanged: (value) {
            //   setState(() {
            //     valueText = value;
            //   });
            // },
            decoration: const InputDecoration(
              hintText: "Edit task",
            ),
          ),
          actions: <Widget>[
            MaterialButton(
              color: Colors.red,
              textColor: Colors.white,
              child: const Text('CANCEL'),
              onPressed: () {
                //setState(() {
                _textFieldController.clear();
                Navigator.pop(context);
                //});
              },
            ),
            MaterialButton(
              color: Colors.green,
              textColor: Colors.white,
              child: const Text('OK'),
              onPressed: () {
                setState(() {
                  if (isWhiteSpace(_textFieldController.text)) {
                    ScaffoldMessenger.of(context).showSnackBar(editSnackBar);
                  } else {
                    _editItem(_textFieldController.text, index);
                    _textFieldController.clear();
                  }
                });
                Navigator.pop(context);
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

  void _editItem(String newText, int index) {
    setState(() {
      //final removedItem = todoList[index];
      todoList[index] = newText;
      //_selected.removeAt(index);
    });
  }

  void deletedItemSnackBar(
    BuildContext context,
    int index,
    String deletedItem,
  ) {
    //SnackBarAction isUndoPressed;
    //bool isDeleting = false;

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        duration: Duration(seconds: 3),
        content: Text(
          '"$deletedItem" has been deleted',
          style: TextStyle(color: Colors.white),
        ),
        action: SnackBarAction(
          label: "UNDO",
          textColor: Colors.blue,
          onPressed: () {
            //isUndoPressed = true;
            setState(() {
              todoList.insert(index, deletedItem);
            });
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "To-Do App",
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
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              onPressed: () =>
                                  _displayEditTextInputDialog(context, index),
                              icon: const Icon(Icons.edit, color: Colors.blue),
                            ),
                            IconButton(
                              onPressed: () {
                                final removedItem = todoList[index];
                                deleteItem(index);
                                deletedItemSnackBar(
                                  context,
                                  index,
                                  removedItem,
                                );
                              },
                              icon: const Icon(Icons.delete, color: Colors.red),
                            ),
                          ],
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
