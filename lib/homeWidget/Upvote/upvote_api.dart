import 'package:cloud_firestore/cloud_firestore.dart';

changeCounterPlus(String idd) async {
  print("Id is");
  print(idd);
  // Firestore.instance.collection("UpvoteEvent").document(idd).updateData({
  //   'counter': '$counter',
  // });

  Firestore.instance
      .collection("UpvoteEvent")
      .document(idd)
      .updateData({"counter": FieldValue.increment(1)});
}

changeCounterMinus(String idd) async {
  print("Id is");
  print(idd);
  // Firestore.instance.collection("UpvoteEvent").document(idd).updateData({
  //   'counter': '$counter',
  // });

  Firestore.instance
      .collection("UpvoteEvent")
      .document(idd)
      .updateData({"counter": FieldValue.increment(-1)});
}
