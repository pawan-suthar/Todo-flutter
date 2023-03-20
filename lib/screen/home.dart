import 'package:flutter/material.dart';

import '../constants/colors.dart';
import '../model/todo.dart';
import '../widgets/todoitems.dart';

class Home extends StatefulWidget {
  Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final todoslist = Todo.todoList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: tdBg,

      appBar: _buildappbar(), //method hai alag se app bar ka niche

      body: Stack(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            child: Column(
              children: [
                searchbox(), // alag se widget banaya hai

                Expanded(
                  child: ListView(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 50, bottom: 20),
                        child: Text(
                          "All Todos",
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.w500),
                        ),
                      ),
                      for (Todo todoo in todoslist)
                        Todoitem(
                          todo: todoo,
                          ontodochange: _handletodo,
                          ondelete: () {},
                        ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(bottom: 20, right: 20, left: 20),
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          offset: Offset(0.0, 0.0),
                          blurRadius: 10.0,
                          spreadRadius: 10.0,
                        )
                      ],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                          hintText: "Add a new todo", border: InputBorder.none),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 20, right: 20),
                  child: ElevatedButton(
                    child: Text(
                      "+",
                      style: TextStyle(fontSize: 40),
                    ),
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      primary: tdBlue,
                      minimumSize: Size(60, 60),
                      elevation: 10,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _handletodo(Todo todo) {
    setState(() {
      todo.isdone = !todo.isdone;
    });
  }

// serch bar wala widget
  Widget searchbox() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(20)),
      child: TextField(
        decoration: InputDecoration(
            contentPadding: EdgeInsets.all(0),
            prefixIcon: Icon(
              Icons.search,
              color: tdBlack,
              size: 20,
            ),
            prefixIconConstraints: BoxConstraints(maxHeight: 20, minWidth: 25),
            border: InputBorder.none,
            hintText: "Search",
            hintStyle: TextStyle(color: tdGray)),
      ),
    );
  }

//app bar method
  AppBar _buildappbar() {
    return AppBar(
      elevation: 0,
      backgroundColor: tdBg,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(
            Icons.menu,
            color: tdBlack,
            size: 30,
          ),
          Container(
            height: 40,
            width: 40,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(25),
              child: Image.asset("assets/images/avatar.jpg"),
            ),
          ),
        ],
      ),
    );
  }
}
