import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  // get collection of note (Medicine)
  final CollectionReference notes =
      FirebaseFirestore.instance.collection('notes');

  // CREATE : add a new Medicine
  Future<void> addNote(
      String medicineName,
      String price,
      int amountOfMedication,
      int packagesNumber,
      int medicationDose,
      String startDate,
      String time,
      String condition,
      int color,
      int remind,
      String repeat) {
    return notes.add({
      //'note': note,
      'timestamp': Timestamp.now(),
      'medicineName': medicineName,
      'price': price,
      //'isCompleted': 0,
      'amountOfMedication': amountOfMedication,
      'packagesNumber': packagesNumber,
      'medicationDose': medicationDose,
      'startDate': startDate,
      'time': time,
      'condition': condition,
      'color': color,
      'remind': remind,
      'repeat': repeat,
    });
  }

  //READ : get Medicine from database
  Stream<QuerySnapshot> getNoteStream() {
    // the new one will be in the top
    final notesStream =
        notes.orderBy('timestamp', descending: true).snapshots();
    return notesStream;
  }

  //UPDATE : update Medicine given doc id
  Future<void> updateNote(String docID, String newNote) {
    return notes.doc(docID).update({
      'note': newNote,
      'timestamp': Timestamp.now(),
    });
  }

  // DELET : delet Medicine given doc id
  Future<void> deletNote(String docID) {
    return notes.doc(docID).delete();
  }
}
