import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/widgets.dart';
import '../constants/colors.dart';
import '../model/todo.dart';

class Todoitem extends StatelessWidget {
  final Todo todo;
  final ontodochange;
  final ondelete;

  const Todoitem(
      {super.key,
      required this.todo,
      required this.ontodochange,
      required this.ondelete});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: ListTile(
        onTap: () {
          ontodochange(todo);
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        tileColor: Colors.white,
        leading: Icon(
          todo.isdone
              ? Icons.check_box
              : Icons
                  .check_box_outline_blank, //agar todo done then tick otherwise only outline
          color: tdBlue,
        ),
        title: Text(
          todo.todotext!,
          style: TextStyle(
            fontSize: 17,
            color: tdBlack,
            decoration: todo.isdone
                ? TextDecoration.lineThrough
                : null, // if tot is done then linethre other wise not lien
          ),
        ),
        trailing: Container(
          padding: EdgeInsets.all(0),
          margin: EdgeInsets.symmetric(vertical: 12),
          height: 35,
          width: 35,
          decoration: BoxDecoration(
            color: tdRed,
            borderRadius: BorderRadius.circular(5),
          ),
          child: IconButton(
            color: Colors.white,
            iconSize: 18,
            icon: Icon(Icons.delete),
            onPressed: () {
              print("click on deleted Icon");
            },
          ),
        ),
      ),
    );
  }
}
