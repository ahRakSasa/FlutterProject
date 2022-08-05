import 'package:flutter/material.dart';

class FavoritRecipePage extends StatelessWidget {
  final String title;
  final String rating;
  final String cookTime;
  final String thumbnailUrl;

  FavoritRecipePage({
    required this.title,
    required this.cookTime,
    required this.rating,
    required this.thumbnailUrl,
  });

  @override
  Widget build(BuildContext context) {
   
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: MediaQuery.of(context).size.width,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: GridTile(
                footer: Container(
                  padding:const EdgeInsets.all(10),
                   color: Colors.white70,
                  child: Stack(
                    children: [
                      Text(
                        title,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: const TextStyle(
                          fontSize: 10,
                        ),
                      ),
                      const Positioned(
                        right: 0,
                        child: Icon(Icons.favorite,color: Colors.red,size: 14,))
                    ],
                  ),
                ),
                child: Image.network(
                  thumbnailUrl,
                  fit: BoxFit.cover,
                ),
              ),
            )
        //   ],
        // ),
      
      ),
    );
  }
}
