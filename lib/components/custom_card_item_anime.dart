import 'package:flutter/material.dart';
import 'package:novo_projeto/views/home_page.dart';

class CardAnime extends StatelessWidget {
  final Anime anime;
  const CardAnime({Key? key, required this.anime}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: Row(
        children: [
          SizedBox(
            height: 100,
            width: 100,
            child: Image.network(anime.imgUrl),
          ),
          SizedBox(
            height: 50,
            width: 100,
            child: Text(anime.nome),
          ),
          SizedBox(
            height: 100,
            width: 150,
            child: Text(
              anime.descricao,
              style: TextStyle(color: Colors.black.withOpacity(1)),
            ),
          ),
        ],
      ),
    );
  }
}
