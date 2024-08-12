// import 'dart:ffi';
// import 'dart:ui_web';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// import 'package:good_chat_new/models/message.dart';

import '../../models/message.dart';

// class ChatService extends ChangeNotifier {

//   final _auth = FirebaseAuth.instance;// אימות משתמש

//   final _firestore = FirebaseFirestore.instance;

//   Future<void> sendMessage(String receiverID, String message) async {

//     final currentUser = _auth.currentUser!;

//     final newMessage = Message(
//       senderEmail: currentUser.email!,
//       senderID: currentUser.uid,
//       receiverID: receiverID,
//       message: message,
//       timestamp: Timestamp.now(),
//     );

//     final chatRoomId=[currentUser.uid,receiverID]..sort();
//     await _firestore.collection('chat_room')
//     .doc(chatRoomId.join('_'))
//     .collection("Message")
//     .add(newMessage.toMap());

//     await _firestore.collection("Users").doc(currentUser.uid).update({'HashUrlStrategy':true});
//   }
//   Stream<List<Users>>getUsersStream(){
//     return _firestore.collection("users").snapshots().map((snapshot){
//      return snapshot.docs.map((doc) => 
//         Users.fromMap(doc.data() as Map<String, dynamic>)).toList();
//     });
//   }
//   Future<void> MarkMessageAsRead(String reciverId,String senderId)async{
//     final chatRoomId=[reciverId,senderId]..sort();

//     final MessageSnaphot=await _firestore
//         .collection("chatRooms")
//         .doc(chatRoomId.join('_'))
//         .collection("message")
//         .where('isread',isEqualTo: false)
//         .get();


//         for (var doc in MessageSnaphot.docs) {
//         await doc.reference.update(({'isRead':true}));
//   }
//   await _firestore//מעדכן שישנן הודעות שלא נקראו
//   .collection("users")
//   .doc(senderId)
//   .update({'hasUnreadMessage':false});
    
//   }
//   Stream<QuerySnapshot>getMessage(String userId,String otherUserId){
//     final chatRoomId=[userId,otherUserId]..sort();
    
//     return _firestore
//     .collection("chat_rooms")
//     .doc(chatRoomId.join('_'))
//     .collection("Message")
//     .orderBy("timestamp",descending: false)
//     .snapshots();
//   }

// }


class ChatService extends ChangeNotifier {

  final _auth = FirebaseAuth.instance;// אימות משתמש

  final _firestore = FirebaseFirestore.instance;

  Future<void> sendMessage(String receiverID, String message) async {

    final currentUser = _auth.currentUser!;

    final newMessage = Message(
      senderEmail: currentUser.email!,
      senderID: currentUser.uid,
      receiverID: receiverID,
      message: message,
      timestamp: Timestamp.now(),
    );

    final chatRoomID = [currentUser.uid, receiverID]..sort();

    await _firestore
    .collection('chat_rooms')
    .doc(chatRoomID.join('_'))
    .collection("message")
    .add(newMessage.toMap());

    await _firestore.collection("Users").doc(currentUser.uid).update({'hasUnreadMessages': true});
  }

  Stream<List<Users>> getUsersStream() {
    return _firestore.collection("Users").snapshots().map((snapshot){
        return snapshot.docs.map((doc) => 
        Users.fromMap(doc.data() as Map<String, dynamic>)).toList();
    });
  }

  Future<void> markMessageAsRead(String receiverID, String senderID) async {
    final chatRoomID = [receiverID, senderID]..sort();

    final messageSnapshot = await _firestore
    .collection("chat_rooms")
    .doc(chatRoomID.join('_'))
    .collection("messages")
    .where('isRead', isEqualTo: false)
    .get();

    for (var doc in messageSnapshot.docs) {
    await doc.reference.update({'isRead' : true});
  }

  await _firestore// מעדכן שיש הודעות שלא נקראו
  .collection("Users")
  .doc(senderID)
  .update({'hasUnreadMessages': false});
  }

  Stream<QuerySnapshot> getMessage(String userID, String otherUserID) {

    final chatRoomID = [userID, otherUserID]..sort();

    return _firestore
    .collection("chat_rooms")
    .doc(chatRoomID.join('_'))
    .collection("message")
    .orderBy("timestamp", descending: false)
    .snapshots();
  }
}