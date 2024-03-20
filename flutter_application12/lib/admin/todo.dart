import 'package:cloud_firestore/cloud_firestore.dart';

class Todo {
  String task;
  bool isDone;
  Timestamp createdOn;
  Timestamp updatedOn;

  Todo({
    required this.task,
    required this.isDone,
    required this.createdOn,
    required this.updatedOn,
  });

  Todo.fromJson(Map<String, Object?> json)
      : this(
          task: json['task']! as String,
          isDone: json['isDone']! as bool,
          createdOn: json['createdOn']! as Timestamp,
          updatedOn: json['updatedOn']! as Timestamp,
        );

  Todo copyWith({
    String? task,
    bool? isDone,
    Timestamp? createdOn,
    Timestamp? updatedOn,
  }) {
    return Todo(
        task: task ?? this.task,
        isDone: isDone ?? this.isDone,
        createdOn: createdOn ?? this.createdOn,
        updatedOn: updatedOn ?? this.updatedOn);
  }

  Map<String, Object?> toJson(){
    return {
      'task' : task,
      'isDone' : isDone,
      'createdOn' : createdOn,
      'updatedOn' : updatedOn,
    };
  }
}


class DoctorLog {
  String name;
  String email;
  String password;

  DoctorLog({
    required this.name,
    required this.email,
    required this.password,
  });

  DoctorLog.fromJson(Map<String, Object?> json)
      : this(
          name: json['name']! as String,
          email: json['email']! as String,
          password: json['password']! as String,
        );

  DoctorLog copyWith({
    String? name,
    String? email,
    String? password,
  }) {
    return DoctorLog(
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }

  Map<String, Object?> toJson() {
    return {
      'name': name,
      'email': email,
      'password': password,
    };
  }
}

class AdminLog {
  String email;
  String password;

  AdminLog({
    required this.email,
    required this.password,
  });

  AdminLog.fromJson(Map<String, Object?> json)
      : this(
          email: json['email']! as String,
          password: json['password']! as String,
        );

  AdminLog copyWith({
    String? email,
    String? password,
  }) {
    return AdminLog(
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }

  Map<String, Object?> toJson() {
    return {
      'email': email,
      'password': password,
    };
  }
}
