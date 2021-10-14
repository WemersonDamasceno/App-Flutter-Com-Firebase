import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
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
          const CustomSwitcher(),
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
          return Slidable(
            child: Container(
              color: Colors.white,
              child: CardAnime(anime: item),
            ),
            actionPane: const SlidableDrawerActionPane(),
            actionExtentRatio: 0.25,
            actions: [
              IconSlideAction(
                caption: "Favoritar",
                icon: Icons.favorite,
                color: Colors.red,
                foregroundColor: Colors.white,
                onTap: () {
                  print("Clicou!");
                },
              ),
              IconSlideAction(
                caption: "Compartilhar",
                icon: Icons.share,
                onTap: () {
                  print("Clicou!");
                },
              ),
            ],
            secondaryActions: [
              IconSlideAction(
                caption: "Editar",
                icon: Icons.create,
                onTap: () {
                  print("Clicou!");
                },
              ),
              IconSlideAction(
                caption: "Deletar",
                icon: Icons.delete,
                color: Colors.red,
                foregroundColor: Colors.white,
                onTap: () {
                  print("Clicou!");
                },
              ),
            ],
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () => abrirDialogAddAnime(context),
          child: const Icon(Icons.add),
          backgroundColor: Colors.purple),
    );
  }

  void getAnimes() {
    animes.add(
      Anime(
        1,
        "Death Note",
        "Death Note é uma série de mangá escrita por Tsugumi Ohba e ilustrada por Takeshi Obata. ",
        "https://cdn.culturagenial.com/imagens/death-note-cartaz.jpg",
        8.5,
      ),
    );
    animes.add(
      Anime(
        2,
        "Dr Stone",
        "Dr. Stone é um mangá japonês escrito por Riichiro Inagaki e ilustrado por Boichi, publicado na Weekly Shōnen Jump.",
        "https://sm.ign.com/ign_br/screenshot/b/bdr-stone-/bdr-stone-2019bbrbrdr-stone-is-an-explosive-chemical-reactio_mb57.jpg",
        8.0,
      ),
    );
    animes.add(
      Anime(
        3,
        "Os Cavaleiros do Zodíaco",
        "Saint Seiya ou Os Cavaleiros do Zodíaco é uma série japonesa de mangá e anime escrito e ilustrada por Masami Kurumada.",
        "https://uploads.jovemnerd.com.br/wp-content/uploads/2019/10/kurumada-sugere-uma-nova-serie-especial-de-cavaleiros-do-zodiaco.jpg",
        7.9,
      ),
    );
    animes.add(
      Anime(
        4,
        "Boku no Hero Academia",
        "Boku no Hero Academia, também conhecido como My Hero Academia no ocidente, é uma série de mangá. ",
        "https://sm.ign.com/t/ign_br/tv/m/my-hero-ac/my-hero-academia_f9ae.1200.jpg",
        8.5,
      ),
    );
    animes.add(
      Anime(
        5,
        "Tokyo Revengers",
        "Tokyo Revengers é um mangá japonês escrito e ilustrado por Ken Wakui. É serializado na revista Weekly Shōnen. ",
        "http://manchanocel.com/wp-content/uploads/2021/06/Tokyo-Revengers-1.jpg",
        9.0,
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
          child: Container(
            height: 300,
            child: Padding(
              padding: EdgeInsets.all(12),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CustomInputText(
                      labelText: "Nome",
                      icon: null,
                      txtController: null,
                      showPassword: false,
                      sufixIcon: null),
                  SizedBox(
                    width: 320.0,
                    child: ElevatedButton(
                      onPressed: () {},
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
        );
      },
    );
  }
}
