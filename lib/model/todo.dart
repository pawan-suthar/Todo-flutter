class Todo {
  String? id;
  String? todotext;
  bool isdone;

  Todo({required this.id, required this.todotext, this.isdone = false});

  static List<Todo> todoList() {
    return [
      Todo(id: "01", todotext: "learn flutter"),
      Todo(id: "02", todotext: "learn python"),
      Todo(id: "03", todotext: "learn c++"),
      Todo(id: "04", todotext: "learn django"),
      Todo(id: "05", todotext: "learn Html"),
      Todo(id: "06", todotext: "learn css"),
    ];
  }
}
