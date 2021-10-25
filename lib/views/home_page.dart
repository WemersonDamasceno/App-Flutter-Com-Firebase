import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:novo_projeto/DAO/firestore_dao.dart';
import 'package:novo_projeto/components/custom_card_item_anime.dart';
import 'package:novo_projeto/components/custom_switcher.dart';
import 'package:novo_projeto/models/anime_model.dart';
import 'package:novo_projeto/services/auth_firebase_service.dart';
import 'package:novo_projeto/services/storage_firebase_service.dart';
import 'package:provider/provider.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  List listAnimesSemSelo = [];
  List listAnimesAcompanhando = [];
  List listAnimesRecomendados = [];

  AuthService authService = AuthService();
  FirestoreDAO firestoreDAO = FirestoreDAO();

  @override
  void initState() {
    super.initState();

    getAnimesSemSelo();
    getAnimesAcompanhando();
    getAnimesRecomendados();
  }

  @override
  Widget build(BuildContext context) {
    authService = Provider.of<AuthService>(context);
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          shadowColor: Colors.black,
          title: const Text("Meus Animes"),
          bottom: const TabBar(
            labelColor: Colors.white,
            isScrollable: true,
            tabs: [
              Tab(
                text: "Animes",
                icon: Icon(Icons.list_alt_rounded),
              ),
              Tab(
                text: "Acompanhando",
                icon: Icon(Icons.live_tv_rounded),
              ),
              Tab(
                text: "Recomendados",
                icon: Icon(Icons.collections_bookmark_sharp),
              ),
            ],
          ),
          actions: [
            const CustomSwitcher(),
            IconButton(
                onPressed: () async {
                  await authService.singOut();
                  Navigator.popAndPushNamed(context, "/login");
                },
                icon: const Icon(Icons.logout_outlined)),
          ],
        ),
        body: Container(
          color: const Color(0xFF150e04),
          child: TabBarView(children: [
            getListAnimes(listAnimesSemSelo),
            getListAnimes(listAnimesAcompanhando),
            getListAnimes(listAnimesRecomendados),
          ]),
        ),
        floatingActionButton: FloatingActionButton(
            onPressed: () => abrirDialogAddAnime(context),
            child: const Icon(Icons.add),
            backgroundColor: const Color(0xFFBA2D0B)),
      ),
    );
  }

  abrirDialogAddAnime(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return DialogCustom();
      },
    );
  }

  getListAnimes(List listAnimes) {
    return GridView.count(
      crossAxisCount: 2,
      crossAxisSpacing: 2,
      children: List.generate(
        listAnimes.length,
        (index) {
          return CardAnime(
            anime: listAnimes[index],
          );
        },
      ),
    );
  }

  getAnimesSemSelo() async {
    List list = await firestoreDAO.getAnimes();
    setState(() {
      listAnimesSemSelo = list;
    });
  }

  getAnimesAcompanhando() {
    listAnimesAcompanhando.add(
      Anime(
        '1',
        "Death Note",
        "Death Note é uma série de mangá escrita por Tsugumi Ohba e ilustrada por Takeshi Obata. ",
        "https://cdn.culturagenial.com/imagens/death-note-cartaz.jpg",
        "8.5",
        false,
        false,
        true,
        false,
      ),
    );
    listAnimesAcompanhando.add(
      Anime(
        '2',
        "Dr Stone",
        "Dr. Stone é um mangá japonês escrito por Riichiro Inagaki e ilustrado por Boichi, publicado na Weekly Shōnen Jump.",
        "https://sm.ign.com/ign_br/screenshot/b/bdr-stone-/bdr-stone-2019bbrbrdr-stone-is-an-explosive-chemical-reactio_mb57.jpg",
        "8.0",
        false,
        false,
        true,
        false,
      ),
    );
    listAnimesAcompanhando.add(
      Anime(
        '3',
        "Os Cavaleiros do Zodíaco",
        "Saint Seiya ou Os Cavaleiros do Zodíaco é uma série japonesa de mangá e anime escrito e ilustrada por Masami Kurumada.",
        "https://uploads.jovemnerd.com.br/wp-content/uploads/2019/10/kurumada-sugere-uma-nova-serie-especial-de-cavaleiros-do-zodiaco.jpg",
        "7.9",
        false,
        false,
        true,
        false,
      ),
    );
    listAnimesAcompanhando.add(
      Anime(
        '4',
        "Boku no Hero Academia",
        "Boku no Hero Academia, também conhecido como My Hero Academia no ocidente, é uma série de mangá. ",
        "https://sm.ign.com/t/ign_br/tv/m/my-hero-ac/my-hero-academia_f9ae.1200.jpg",
        "8.5",
        false,
        false,
        true,
        false,
      ),
    );
    listAnimesAcompanhando.add(
      Anime(
        '5',
        "Tokyo Revengers",
        "Tokyo Revengers é um mangá japonês escrito e ilustrado por Ken Wakui. É serializado na revista Weekly Shōnen. ",
        "http://manchanocel.com/wp-content/uploads/2021/06/Tokyo-Revengers-1.jpg",
        "9.0",
        false,
        false,
        true,
        false,
      ),
    );
  }

  getAnimesRecomendados() {
    listAnimesRecomendados.add(
      Anime(
        '1',
        "Death Note",
        "Death Note é uma série de mangá escrita por Tsugumi Ohba e ilustrada por Takeshi Obata. ",
        "https://cdn.culturagenial.com/imagens/death-note-cartaz.jpg",
        "8.5",
        false,
        false,
        false,
        true,
      ),
    );
    listAnimesRecomendados.add(
      Anime(
        '2',
        "Dr Stone",
        "Dr. Stone é um mangá japonês escrito por Riichiro Inagaki e ilustrado por Boichi, publicado na Weekly Shōnen Jump.",
        "https://sm.ign.com/ign_br/screenshot/b/bdr-stone-/bdr-stone-2019bbrbrdr-stone-is-an-explosive-chemical-reactio_mb57.jpg",
        "8.0",
        false,
        false,
        false,
        true,
      ),
    );
    listAnimesRecomendados.add(
      Anime(
        '3',
        "Os Cavaleiros do Zodíaco",
        "Saint Seiya ou Os Cavaleiros do Zodíaco é uma série japonesa de mangá e anime escrito e ilustrada por Masami Kurumada.",
        "https://uploads.jovemnerd.com.br/wp-content/uploads/2019/10/kurumada-sugere-uma-nova-serie-especial-de-cavaleiros-do-zodiaco.jpg",
        "7.9",
        false,
        false,
        false,
        true,
      ),
    );
    listAnimesRecomendados.add(
      Anime(
        '4',
        "Boku no Hero Academia",
        "Boku no Hero Academia, também conhecido como My Hero Academia no ocidente, é uma série de mangá. ",
        "https://sm.ign.com/t/ign_br/tv/m/my-hero-ac/my-hero-academia_f9ae.1200.jpg",
        "8.5",
        false,
        false,
        false,
        true,
      ),
    );
    listAnimesRecomendados.add(
      Anime(
        '5',
        "Tokyo Revengers",
        "Tokyo Revengers é um mangá japonês escrito e ilustrado por Ken Wakui. É serializado na revista Weekly Shōnen. ",
        "http://manchanocel.com/wp-content/uploads/2021/06/Tokyo-Revengers-1.jpg",
        "9.0",
        false,
        false,
        false,
        true,
      ),
    );
  }
}

class DialogCustom extends StatefulWidget {
  const DialogCustom({Key? key}) : super(key: key);
  @override
  State<DialogCustom> createState() => _DialogCustomState();
}

class _DialogCustomState extends State<DialogCustom> {
  AuthService authService = AuthService();
  StorageService storageService = StorageService();
  FirestoreDAO firestoreDAO = FirestoreDAO();

  String nomeAnime = "";
  String descricaoAnime = "";
  String notaAnime = "";
  int? group = 1;
  String urlImage =
      "https://firebasestorage.googleapis.com/v0/b/projeto-crud-flutter.appspot.com/o/images%2Fimg-statics%2Fadd%20(2).png?alt=media&token=d5edc878-8757-4532-8fc4-6c85acd3711c";

  double totalBytesTranferidos = 0;
  String mensagemRes = "";

  final nomeAnimeController = TextEditingController();
  final descricaoAnimeController = TextEditingController();
  final notaAnimeController = TextEditingController();

  @override
  void initState() {
    super.initState();

    nomeAnimeController.addListener(() {
      setState(() {
        nomeAnime = nomeAnimeController.text;
      });
    });
    descricaoAnimeController.addListener(() {
      setState(() {
        descricaoAnime = descricaoAnimeController.text;
      });
    });

    notaAnimeController.addListener(() {
      setState(() {
        notaAnime = notaAnimeController.text;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    nomeAnimeController.dispose();
    descricaoAnimeController.dispose();
    notaAnimeController.dispose();
  }

  Future<void> salvarAnime() async {
    String id = DateTime.now().toString();
    bool dublado = group == 1 ? false : true;
    String nota = notaAnime.toString();

    String urlFotoPadrao =
        "https://firebasestorage.googleapis.com/v0/b/projeto-crud-flutter.appspot.com/o/images%2Fimg-statics%2Fdownload.png?alt=media&token=599b7f18-36bd-4153-8917-a667199f20ce";
    String urlFotoAdd =
        "https://firebasestorage.googleapis.com/v0/b/projeto-crud-flutter.appspot.com/o/images%2Fimg-statics%2Fadd%20(2).png?alt=media&token=d5edc878-8757-4532-8fc4-6c85acd3711c";

    if (urlImage == urlFotoAdd) {
      setState(() {
        urlImage = urlFotoPadrao;
      });
    }

    String str = await firestoreDAO.addAnime(
      id,
      nomeAnime,
      descricaoAnime,
      urlImage,
      nota,
      dublado,
      false,
      true,
      false,
    );

    setState(() {
      mensagemRes = str;
    });
  }

  Future<XFile?> getImage() async {
    final ImagePicker _picker = ImagePicker();
    XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    return image;
  }

  Future<UploadTask> upload(String path) async {
    File file = File(path);
    try {
      String nomeImage = "img-${DateTime.now().toString()}.jpg";
      String ref = 'images/$nomeImage';
      setState(() {
        urlImage = ref;
      });
      return storageService.storage.ref(ref).putFile(file);
    } on FirebaseException catch (e) {
      throw Exception('Erro no upload: ${e.code}');
    }
  }

  Future<void> downloadURLExample() async {
    String downloadURL =
        await storageService.storage.ref(urlImage).getDownloadURL();
    setState(() {
      urlImage = downloadURL;
      print("url Image: $urlImage");
    });
  }

  void dialogTransfer() {
    AlertDialog dialogTranfer = AlertDialog(
      title: Column(
        children: const [
          Text("Aguarde um momento!"),
          LinearProgressIndicator(),
        ],
      ),
      content: Text("${totalBytesTranferidos.round()}% enviado..."),
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return dialogTranfer;
      },
    );
  }

  void getAndLoadImage() async {
    XFile? file = await getImage();
    if (file != null) {
      UploadTask task = await upload(file.path);

      task.snapshotEvents.listen((TaskSnapshot snapshot) async {
        if (snapshot.state == TaskState.running) {
          setState(() {
            totalBytesTranferidos =
                (snapshot.bytesTransferred / snapshot.totalBytes) * 100;
          });
        } else if (snapshot.state == TaskState.success) {
          downloadURLExample();
        }
      });
    }
  }

  GlobalKey<FormState> keyForm = GlobalKey<FormState>();
  bool buttonSalvarLoading = false;
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.topCenter,
        children: [
          SizedBox(
            height: 400,
            child: ListView(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Form(
                  key: keyForm,
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          keyboardType: TextInputType.name,
                          controller: nomeAnimeController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Preencha este campo!";
                            }
                          },
                          decoration: const InputDecoration(
                            hintText: 'Nome do anime',
                            hintStyle: TextStyle(color: Colors.grey),
                            prefixIcon: Icon(Icons.insert_comment_rounded),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(10.0),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          minLines: 1,
                          maxLines: 3,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Preencha este campo!";
                            }
                          },
                          controller: descricaoAnimeController,
                          keyboardType: TextInputType.multiline,
                          decoration: const InputDecoration(
                            hintText: 'Descrição',
                            hintStyle: TextStyle(color: Colors.grey),
                            prefixIcon: Icon(Icons.description),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(10.0),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          keyboardType: TextInputType.number,
                          controller: notaAnimeController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Preencha este campo!";
                            }
                            double nota = double.parse(value);
                            if (nota > 10) {
                              return "A nota deve ser igual ou menor que 10!";
                            }
                          },
                          decoration: const InputDecoration(
                            hintText: 'Ex: 8.0',
                            labelText: "Nota",
                            hintStyle: TextStyle(color: Colors.grey),
                            prefixIcon: Icon(Icons.star),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(10.0),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Radio(
                              value: 1,
                              groupValue: group,
                              activeColor: Colors.red,
                              onChanged: (T) {
                                setState(() {
                                  print(T);
                                  group = T as int?;
                                });
                              },
                            ),
                            const Text(
                              'Legendado',
                              style: TextStyle(fontSize: 16.0),
                            ),
                            Radio(
                              value: 2,
                              groupValue: group,
                              activeColor: Colors.red,
                              onChanged: (T) {
                                setState(() {
                                  group = T as int?;
                                });
                              },
                            ),
                            const Text(
                              'Dublado',
                              style: TextStyle(fontSize: 16.0),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: Colors.orange,
                              ),
                              onPressed: () => Navigator.of(context).pop(),
                              child: const Text("Cancelar"),
                            ),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: Colors.blue,
                              ),
                              onPressed: () async {
                                if (keyForm.currentState!.validate()) {
                                  setState(() {
                                    buttonSalvarLoading = true;
                                  });
                                  await salvarAnime();
                                  Navigator.of(context).pop();
                                  showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          actions: [
                                            ElevatedButton(
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                              },
                                              child: const Text("Ok"),
                                            ),
                                          ],
                                          title: const Text("Atenção!"),
                                          content: Text(mensagemRes),
                                        );
                                      });
                                }
                              },
                              child: const Text("Salvar"),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: -40,
            child: SizedBox(
              height: 80,
              width: 80,
              child: InkWell(
                onTap: getAndLoadImage,
                child: Container(
                  width: 70.0,
                  height: 70.0,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: NetworkImage(urlImage),
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
