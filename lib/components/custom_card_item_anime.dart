import 'package:flutter/material.dart';
import 'package:novo_projeto/models/anime_model.dart';

class CardAnime extends StatelessWidget {
  final Anime anime;
  const CardAnime({Key? key, required this.anime}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: GestureDetector(
        onTap: () => abrirTelaDetalhes(context, anime),
        child: Card(
          clipBehavior: Clip.antiAlias,
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  height: 80,
                  width: 80,
                  child: ClipRRect(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(150),
                        color: Colors.black,
                      ),
                      child: Image.network(
                        anime.imgUrl,
                        fit: BoxFit.fill,
                      ),
                    ),
                    borderRadius: BorderRadius.circular(150),
                  ),
                ),
              ),
              Column(
                children: [
                  SizedBox(
                    height: 20,
                    width: 200,
                    child: Text(
                      anime.nome,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 200,
                    child: Row(
                      children: [
                        const Icon(
                          Icons.star,
                          color: Colors.purple,
                        ),
                        Text(
                          anime.nota.toString(),
                          style: TextStyle(
                            fontSize: 17,
                            color: Colors.black.withOpacity(0.6),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 50,
                    width: 200,
                    child: Text(
                      anime.descricao.toString().length > 90
                          ? anime.descricao.toString().substring(0, 90) + "..."
                          : anime.descricao.toString(),
                      style: TextStyle(color: Colors.black.withOpacity(1)),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  abrirTelaDetalhes(BuildContext context, Anime anime) {}
}
