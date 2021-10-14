import 'package:flutter/material.dart';
import 'package:novo_projeto/components/custom_card_item_anime.dart';
import 'package:novo_projeto/components/custom_switcher.dart';
import 'package:novo_projeto/services/login_service.dart';
import 'package:provider/provider.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  List animes = [];
  @override
  void initState() {
    super.initState();

    getAnimes();
  }

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<LoginService>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Meus Animes"),
        actions: [
          CustomSwitcher(),
          IconButton(
              onPressed: () async {
                await authService.singOut();
                Navigator.popAndPushNamed(context, "/login");
              },
              icon: const Icon(Icons.logout_outlined)),
        ],
      ),
      body: ListView.builder(
        itemCount: animes.length,
        itemBuilder: (BuildContext context, int index) {
          final item = animes[index];

          return CardAnime(anime: item);
        },
      ),
    );
  }

  void getAnimes() {
    animes.add(
      Anime(
          1,
          "Death Note",
          "Death Note é uma série de mangá escrita por Tsugumi Ohba e ilustrada por Takeshi Obata. ",
          "https://cdn.culturagenial.com/imagens/death-note-cartaz.jpg"),
    );
    animes.add(
      Anime(
          2,
          "Dr Stone",
          "Dr. Stone é um mangá japonês escrito por Riichiro Inagaki e ilustrado por Boichi, publicado na Weekly Shōnen Jump.",
          "https://sm.ign.com/ign_br/screenshot/b/bdr-stone-/bdr-stone-2019bbrbrdr-stone-is-an-explosive-chemical-reactio_mb57.jpg"),
    );
    animes.add(
      Anime(
          3,
          "Os Cavaleiros do Zodíaco",
          "Saint Seiya ou Os Cavaleiros do Zodíaco é uma série japonesa de mangá e anime escrito e ilustrada por Masami Kurumada.",
          "https://uploads.jovemnerd.com.br/wp-content/uploads/2019/10/kurumada-sugere-uma-nova-serie-especial-de-cavaleiros-do-zodiaco.jpg"),
    );
    animes.add(
      Anime(
          4,
          "Boku no Hero Academia",
          "Boku no Hero Academia, também conhecido como My Hero Academia no ocidente, é uma série de mangá. ",
          "https://sm.ign.com/t/ign_br/tv/m/my-hero-ac/my-hero-academia_f9ae.1200.jpg"),
    );
    animes.add(
      Anime(
          5,
          "Tokyo Revengers",
          "Tokyo Revengers é um mangá japonês escrito e ilustrado por Ken Wakui. É serializado na revista Weekly Shōnen. ",
          "http://manchanocel.com/wp-content/uploads/2021/06/Tokyo-Revengers-1.jpg"),
    );
  }
}

class Anime {
  int id;
  String nome;
  String descricao;
  String imgUrl;

  Anime(this.id, this.nome, this.descricao, this.imgUrl);
}
