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

userUploadEvent(bool name, imeiNo, eventName) async {
  CollectionReference userRef = Firestore.instance.collection('Users');
  await userRef
      .document(imeiNo)
      .setData({'$eventName': '$name', 'imeiNo': '$imeiNo'});
}

getUserTapped(
  bool name,
  imeiNo,
  eventName,
) async{
  print('GetUserTappedUPI');
  await Firestore.instance
      .collection("Users")
      .document(imeiNo)
      .updateData({"$eventName": name});
}

userExist(imeiNo) async {
  var userRef = await Firestore.instance
      .collection('Users')
      .where('imeiNo', isEqualTo: imeiNo)
      .getDocuments();
  //print(userRef);
  //if (userRef.documents.length == 0) {
  print(userRef.documents.length);
  return userRef.documents.length;
  //}
}

// userExist(imeiNo) async {
//   await Firestore.instance
//       .collection('Users')
//       .where('imeiNo', isEqualTo: imeiNo)
//       .getDocuments()
//       .then((value) {
//     if (value == null) {
//       return true;
//     }
//   });
//   //print(userRef);
// }

eventExist(imeiNo, eventName) async{
  await Firestore.instance
      .collection("Users")
      .where("eventName", isEqualTo: eventName)
      .where('imeiNo', isEqualTo: imeiNo)
      .getDocuments()
      .then((value) {
    value.documents.forEach((result) {
      //  print('ResultInExistingEventAPI');
      print(result.data['eventName']);
      if (result.data['eventName'] == null) {
        //   print('In null section');
        return null;
      } else {
        print('In not null sec');
        print(result.data['$eventName']);
        return result.data['$eventName'];
      }
    });
  });
}

addPerticularUploadEvent(bool name, imeiNo, eventName) async {
  CollectionReference userRef =  Firestore.instance.collection('Users');
  userRef.document(imeiNo).setData({'$eventName': '$name'});
}
