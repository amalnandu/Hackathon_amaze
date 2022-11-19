import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

Future<void> storage() async {
  await FirebaseFirestore.instance
      .collection('groceries')
      .add({'Name': "tomato", 'Price': "12"});
}
