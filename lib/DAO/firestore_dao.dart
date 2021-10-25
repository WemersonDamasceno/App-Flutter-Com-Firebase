import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:novo_projeto/models/anime_model.dart';

class FirestoreDAO {
  static final FirestoreDAO _instance = FirestoreDAO();
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  static FirebaseFirestore get() {
    return FirestoreDAO._instance.firestore;
  }

  CollectionReference users = FirebaseFirestore.instance.collection('users/');
  CollectionReference animes = FirebaseFirestore.instance.collection('animes/');

  Future<String> addUser(
      String id, String nome, String email, String urlImage) async {
    String res = "";
    await users.add({
      'id': id,
      'nome': nome,
      'email': email,
      'urlImage': urlImage,
    }).then((value) {
      res = "Usuario adicionado com sucesso";
    }).catchError((error) {
      res = "Failed to add user: $error";
    });
    return res;
  }

  Future<String> addAnime(
    String id,
    String nome,
    String descricao,
    String urlImage,
    String nota,
    bool dublado,
    bool recomendado,
    bool favorito,
    bool acompanhando,
  ) async {
    String res = "";
    await animes.doc(id).set({
      'id': id,
      'nome': nome,
      'descricao': descricao,
      'urlImage': urlImage,
      'nota': nota,
      'isDublado': dublado,
      'isRecomendado': recomendado,
      'isFavorito': favorito,
      'isAcompanhando': acompanhando,
    }).then((value) {
      res = "Anime adicionado com sucesso";
    }).catchError((error) {
      res = "Ocorreu um erro: $error";
    });

    return res;
  }

  Future<List> getAnimes() async {
    List listAnimes = [];
    await animes.get().then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        Anime anime = Anime(
            doc['id'],
            doc['nome'],
            doc['descricao'],
            doc['urlImage'],
            doc['nota'],
            doc['isDublado'],
            doc['isFavorito'],
            doc['isAcompanhando'],
            doc['isRecomendado']);
        listAnimes.add(anime);
      });
    });
    return listAnimes;
  }
}
