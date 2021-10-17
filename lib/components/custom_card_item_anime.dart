import 'package:flutter/material.dart';
import 'package:novo_projeto/models/anime_model.dart';

class CardAnime extends StatelessWidget {
  final Anime anime;
  const CardAnime({Key? key, required this.anime}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GestureDetector(
          onTap: () => abrirTelaDetalhes(context, anime),
          child: Padding(
            padding: const EdgeInsets.only(
              left: 8,
              right: 8,
              top: 8,
            ),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              clipBehavior: Clip.antiAlias,
              elevation: 20,
              color: const Color(0xFFf0f2f5),
              child: Column(
                children: [
                  SizedBox(
                    height: 100,
                    width: 180,
                    child: Image.network(anime.imgUrl, fit: BoxFit.fill),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 20,
                          width: 200,
                          child: Text(
                            anime.nome.toString().length > 15
                                ? anime.nome.toString().substring(0, 15) + "..."
                                : anime.nome.toString(),
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            const Icon(
                              Icons.star,
                              size: 18,
                              color: Colors.purple,
                            ),
                            Text(
                              anime.nota.toString(),
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.black.withOpacity(0.6),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          top: 18,
          left: 12,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
              color: anime.dublado ? const Color(0xFF3b5998) : Colors.red,
            ),
            child: Padding(
              padding: const EdgeInsets.all(4),
              child: Text(
                anime.dublado ? "Dublado" : "Legendado",
                style: const TextStyle(
                    fontSize: 13,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
      ],
    );
  }

  abrirTelaDetalhes(BuildContext context, Anime anime) {}
}
