import 'package:flutter/material.dart';
import 'package:novo_projeto/components/custom_card_item_anime.dart';
import 'package:novo_projeto/components/custom_input_text.dart';
import 'package:novo_projeto/components/custom_switcher.dart';
import 'package:novo_projeto/models/anime_model.dart';
import 'package:novo_projeto/services/login_service.dart';
import 'package:provider/provider.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  List listAnimesFavoritos = [];
  List listAnimesAcompanhando = [];
  List listAnimesRecomendados = [];
  String nomeAnime = "";
  String descricaoAnime = "";
  String notaAnime = "";
  LoginService authService = LoginService();

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

    getAnimesFavoritos();
    getAnimesAcompanhando();
    getAnimesRecomendados();
  }

  @override
  void dispose() {
    super.dispose();
    nomeAnimeController.dispose();
    descricaoAnimeController.dispose();
    notaAnimeController.dispose();
  }

  void salvarAnime() {
    print(nomeAnime);
    print(descricaoAnime);
    print(notaAnime);
    print(authService.firebaseAuth.currentUser?.uid.toString());
  }

  @override
  Widget build(BuildContext context) {
    authService = Provider.of<LoginService>(context);
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
                text: "Favoritos",
                icon: Icon(Icons.favorite),
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
          color: const Color(0xFFf0f2f5),
          child: TabBarView(children: [
            getListAnimes(listAnimesFavoritos),
            getListAnimes(listAnimesAcompanhando),
            getListAnimes(listAnimesRecomendados),
          ]),
        ),
        floatingActionButton: FloatingActionButton(
            onPressed: () => abrirDialogAddAnime(context),
            child: const Icon(Icons.add),
            backgroundColor: Colors.purple),
      ),
    );
  }

  abrirDialogAddAnime(BuildContext context) {
    Widget okButton = ElevatedButton(
      child: const Text("Cancelar"),
      onPressed: () {},
    );

    Widget cancelButton = ElevatedButton(
      child: const Text("Ok"),
      onPressed: () {},
    );

    // configura o  AlertDialog
    AlertDialog alerta = AlertDialog(
      title: const Text("Preencha os campos"),
      content: const Text("Não perca a promoção."),
      actions: [
        okButton,
        cancelButton,
      ],
    );
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.topCenter,
            children: [
              SizedBox(
                height: 350,
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomInputText(
                          labelText: "Nome",
                          icon: Icons.insert_comment_rounded,
                          txtController: nomeAnimeController,
                          showPassword: false,
                          sufixIcon: null),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomInputText(
                          labelText: "Descrição",
                          icon: Icons.description_outlined,
                          txtController: descricaoAnimeController,
                          showPassword: false,
                          sufixIcon: null),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomInputText(
                          labelText: "Nota",
                          icon: Icons.star,
                          txtController: notaAnimeController,
                          showPassword: false,
                          sufixIcon: null),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        width: 320.0,
                        child: ElevatedButton(
                          onPressed: salvarAnime,
                          child: const Text(
                            "Save",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Positioned(
                top: -40,
                child: ClipRRect(
                  child: Container(
                      height: 80,
                      width: 80,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(150),
                        color: Colors.white,
                      ),
                      child: const Icon(Icons.add_a_photo_rounded)),
                  borderRadius: BorderRadius.circular(150),
                ),
              )
            ],
          ),
        );
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
          return CardAnime(anime: listAnimes[index]);
        },
      ),
    );
  }

  getAnimesFavoritos() {
    listAnimesFavoritos.add(
      Anime(
        1,
        "Death Note",
        "Death Note é uma série de mangá escrita por Tsugumi Ohba e ilustrada por Takeshi Obata. ",
        "https://cdn.culturagenial.com/imagens/death-note-cartaz.jpg",
        8.5,
        true,
      ),
    );
    listAnimesFavoritos.add(
      Anime(
        2,
        "Dr Stone",
        "Dr. Stone é um mangá japonês escrito por Riichiro Inagaki e ilustrado por Boichi, publicado na Weekly Shōnen Jump.",
        "https://sm.ign.com/ign_br/screenshot/b/bdr-stone-/bdr-stone-2019bbrbrdr-stone-is-an-explosive-chemical-reactio_mb57.jpg",
        8.0,
        true,
      ),
    );
    listAnimesFavoritos.add(
      Anime(
        3,
        "Os Cavaleiros do Zodíaco",
        "Saint Seiya ou Os Cavaleiros do Zodíaco é uma série japonesa de mangá e anime escrito e ilustrada por Masami Kurumada.",
        "https://uploads.jovemnerd.com.br/wp-content/uploads/2019/10/kurumada-sugere-uma-nova-serie-especial-de-cavaleiros-do-zodiaco.jpg",
        7.9,
        true,
      ),
    );
    listAnimesFavoritos.add(
      Anime(
        4,
        "Boku no Hero Academia",
        "Boku no Hero Academia, também conhecido como My Hero Academia no ocidente, é uma série de mangá. ",
        "https://sm.ign.com/t/ign_br/tv/m/my-hero-ac/my-hero-academia_f9ae.1200.jpg",
        8.5,
        false,
      ),
    );
    listAnimesFavoritos.add(
      Anime(
        5,
        "Tokyo Revengers",
        "Tokyo Revengers é um mangá japonês escrito e ilustrado por Ken Wakui. É serializado na revista Weekly Shōnen. ",
        "http://manchanocel.com/wp-content/uploads/2021/06/Tokyo-Revengers-1.jpg",
        9.0,
        false,
      ),
    );
  }

  getAnimesAcompanhando() {
    listAnimesAcompanhando.add(
      Anime(
        1,
        "Death Note",
        "Death Note é uma série de mangá escrita por Tsugumi Ohba e ilustrada por Takeshi Obata. ",
        "https://cdn.culturagenial.com/imagens/death-note-cartaz.jpg",
        8.5,
        false,
      ),
    );
    listAnimesAcompanhando.add(
      Anime(
        2,
        "Dr Stone",
        "Dr. Stone é um mangá japonês escrito por Riichiro Inagaki e ilustrado por Boichi, publicado na Weekly Shōnen Jump.",
        "https://sm.ign.com/ign_br/screenshot/b/bdr-stone-/bdr-stone-2019bbrbrdr-stone-is-an-explosive-chemical-reactio_mb57.jpg",
        8.0,
        false,
      ),
    );
    listAnimesAcompanhando.add(
      Anime(
        3,
        "Os Cavaleiros do Zodíaco",
        "Saint Seiya ou Os Cavaleiros do Zodíaco é uma série japonesa de mangá e anime escrito e ilustrada por Masami Kurumada.",
        "https://uploads.jovemnerd.com.br/wp-content/uploads/2019/10/kurumada-sugere-uma-nova-serie-especial-de-cavaleiros-do-zodiaco.jpg",
        7.9,
        false,
      ),
    );
    listAnimesAcompanhando.add(
      Anime(
        4,
        "Boku no Hero Academia",
        "Boku no Hero Academia, também conhecido como My Hero Academia no ocidente, é uma série de mangá. ",
        "https://sm.ign.com/t/ign_br/tv/m/my-hero-ac/my-hero-academia_f9ae.1200.jpg",
        8.5,
        false,
      ),
    );
    listAnimesAcompanhando.add(
      Anime(
        5,
        "Tokyo Revengers",
        "Tokyo Revengers é um mangá japonês escrito e ilustrado por Ken Wakui. É serializado na revista Weekly Shōnen. ",
        "http://manchanocel.com/wp-content/uploads/2021/06/Tokyo-Revengers-1.jpg",
        9.0,
        false,
      ),
    );
  }

  getAnimesRecomendados() {
    listAnimesRecomendados.add(
      Anime(
        1,
        "Death Note",
        "Death Note é uma série de mangá escrita por Tsugumi Ohba e ilustrada por Takeshi Obata. ",
        "https://cdn.culturagenial.com/imagens/death-note-cartaz.jpg",
        8.5,
        false,
      ),
    );
    listAnimesRecomendados.add(
      Anime(
        2,
        "Dr Stone",
        "Dr. Stone é um mangá japonês escrito por Riichiro Inagaki e ilustrado por Boichi, publicado na Weekly Shōnen Jump.",
        "https://sm.ign.com/ign_br/screenshot/b/bdr-stone-/bdr-stone-2019bbrbrdr-stone-is-an-explosive-chemical-reactio_mb57.jpg",
        8.0,
        false,
      ),
    );
    listAnimesRecomendados.add(
      Anime(
        3,
        "Os Cavaleiros do Zodíaco",
        "Saint Seiya ou Os Cavaleiros do Zodíaco é uma série japonesa de mangá e anime escrito e ilustrada por Masami Kurumada.",
        "https://uploads.jovemnerd.com.br/wp-content/uploads/2019/10/kurumada-sugere-uma-nova-serie-especial-de-cavaleiros-do-zodiaco.jpg",
        7.9,
        false,
      ),
    );
    listAnimesRecomendados.add(
      Anime(
        4,
        "Boku no Hero Academia",
        "Boku no Hero Academia, também conhecido como My Hero Academia no ocidente, é uma série de mangá. ",
        "https://sm.ign.com/t/ign_br/tv/m/my-hero-ac/my-hero-academia_f9ae.1200.jpg",
        8.5,
        false,
      ),
    );
    listAnimesRecomendados.add(
      Anime(
        5,
        "Tokyo Revengers",
        "Tokyo Revengers é um mangá japonês escrito e ilustrado por Ken Wakui. É serializado na revista Weekly Shōnen. ",
        "http://manchanocel.com/wp-content/uploads/2021/06/Tokyo-Revengers-1.jpg",
        9.0,
        false,
      ),
    );
  }
}
