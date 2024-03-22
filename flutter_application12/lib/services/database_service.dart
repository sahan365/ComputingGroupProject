import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application12/admin/connection.dart';

const String TODO_COLLECTION_REF = "todos";
const String DOCTORLOG_COLLECTION_REF = "doctorlog";
const String ADMINLOG_COLLECTION_REF = "adminlog";

class DatabaseService {
  final _firestore = FirebaseFirestore.instance;

  late final CollectionReference _todosRef;
  late final CollectionReference _doctorlogRef1;
  late final CollectionReference _doctorlogRef2;
  late final CollectionReference _adminlogRef;

  DatabaseService() {
    _todosRef = _firestore.collection(TODO_COLLECTION_REF).withConverter<Todo>(
        fromFirestore: (snapshots, _) => Todo.fromJson(
              snapshots.data()!,
            ),
        toFirestore: (todo, _) => todo.toJson());

    _doctorlogRef1 = _firestore.collection(DOCTORLOG_COLLECTION_REF).withConverter<DoctorLog>(
        fromFirestore: (snapshots, _) => DoctorLog.fromJson(
              snapshots.data()!,
            ),
        toFirestore: (doctorLog, _) => doctorLog.toJson());

    _doctorlogRef2 = _firestore.collection(DOCTORLOG_COLLECTION_REF);

    _adminlogRef = _firestore.collection(ADMINLOG_COLLECTION_REF);
  }

  // Fetch doctor logs from Firestore
  Future<List<DoctorLog>> fetchDoctorLogs() async {
    try {
      QuerySnapshot querySnapshot = await _doctorlogRef2.get();
      return querySnapshot.docs
          .map((doc) => DoctorLog.fromJson(doc.data() as Map<String, dynamic>))
          .toList();
    } catch (e) {
      // Handle error
      print("Error fetching doctor logs: $e");
      throw Exception("Error fetching doctor logs");
    }
  }

  // Fetch admin logs from Firestore
  Future<List<AdminLog>> fetchAdminLogs() async {
    try {
      QuerySnapshot querySnapshot = await _adminlogRef.get();
      return querySnapshot.docs
          .map((doc) => AdminLog.fromJson(doc.data() as Map<String, dynamic>))
          .toList();
    } catch (e) {
      // Handle error
      print("Error fetching doctor logs: $e");
      throw Exception("Error fetching Admin logs");
    }
  }

  //get doctor logs as a stream
  Stream<List<DoctorLog>> getDoctorLogs() {
    return _doctorlogRef2.snapshots().map((snapshot) => snapshot.docs
        .map((doc) => DoctorLog.fromJson(doc.data() as Map<String, dynamic>))
        .toList());
  }

  //get admin logs as a stream
  Stream<List<AdminLog>> getAdminLogs() {
    return _adminlogRef.snapshots().map((snapshot) => snapshot.docs
        .map((doc) => AdminLog.fromJson(doc.data() as Map<String, dynamic>))
        .toList());
  }

  //get
  Stream<QuerySnapshot> getTodos() {
    return _todosRef.snapshots();
  }

   Stream<QuerySnapshot> getDoctorLogs1() {
    return _doctorlogRef1.snapshots();
  }
  //get
  

  void addTodo(Todo todo) async {
    _todosRef.add(todo);
  }

  void AddDoctor(DoctorLog doctorLog) async {
    _doctorlogRef1.add(doctorLog);
  }

  void updateTodo(String todoId, Todo todo) {
    _todosRef.doc(todoId).update(todo.toJson());
  }

  void deleteTodo(String todoId) {
    _todosRef.doc(todoId).delete();
  }

  void deleteDoctor(String doctorId) {
    _doctorlogRef1.doc(doctorId).delete();
  }

  // Update doctor availability in Firestore
  void updateDoctor(String doctorId, DoctorLog updatedDoctor) {
    _doctorlogRef1.doc(doctorId).update(updatedDoctor.toJson());
  }


}
