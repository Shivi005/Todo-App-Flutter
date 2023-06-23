import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todo_app/model/todo_model.dart';

class TodoService {
  final todoCollection = FirebaseFirestore.instance.collection('todoApp');

//Create
  void addNewTask(TodoModel model) {
    todoCollection.add(model.toMap());
  }

  //Update
  void updateTask(String? docId, bool? valueUpdate) {
    todoCollection.doc(docId).update({
      'isDone': valueUpdate,
    });
  }

  //Delete
  void deleteTask(String? docId) {
    todoCollection.doc(docId).delete();
  }
}
