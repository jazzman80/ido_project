import 'package:flutter/material.dart';
import 'package:ido_project/business_logic/business_logic.dart';
import 'package:provider/provider.dart';

class AddTaskScreen extends StatelessWidget {
  AddTaskScreen({Key? key}) : super(key: key);

  TextEditingController _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        right: 10.0,
        left: 20.0,
        bottom: MediaQuery.of(context).viewInsets.bottom + 20.0,
      ),
      child: ListTile(
        title: TextField(
          decoration: const InputDecoration(
            hintText: 'enter task name',
            labelText: 'create new task',
          ),
          autofocus: true,
          controller: _textController,
        ),
        trailing: IconButton(
          onPressed: () {
            Provider.of<BusinessLogic>(context, listen: false)
                .addTask(_textController.text);
            _textController.clear();
          },
          icon: Icon(Icons.send),
        ),
      ),
    );
  }
}
