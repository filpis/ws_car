import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';

class TasksMonitoring {
  void logTaskStart(String taskId) {
    FirebaseFirestore.instance.collection('taskLogs').doc(taskId).set({
      'status': 'started',
      'startTime': FieldValue.serverTimestamp(),
    });
  }

  void logTaskComplete(String taskId) {
    FirebaseFirestore.instance.collection('taskLogs').doc(taskId).update({
      'status': 'completed',
      'endTime': FieldValue.serverTimestamp(),
    });
  }
}
