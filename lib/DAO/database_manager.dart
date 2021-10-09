/*import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseManager {
  final CollectionReference profileList =
      Firestore.instance.collection('usuarios');

  Future<void> criarNovoUsuarioBanco(
      String name, String email, int idade, String uid) async {
    return await profileList
        .document(uid)
        .setData({'name': name, 'email': gender, 'idade': score});
  }

  Future updateUserList(
      String name, String gender, int score, String uid) async {
    return await profileList
        .document(uid)
        .updateData({'name': name, 'gender': gender, 'score': score});
  }

  Future getUsersList() async {
    List itemsList = [];

    try {
      await profileList.getDocuments().then((querySnapshot) {
        querySnapshot.documents.forEach((element) {
          itemsList.add(element.data);
        });
      });
      return itemsList;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
*/