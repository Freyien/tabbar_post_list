import 'package:flutter/material.dart';

class PostCardImage extends StatelessWidget {
  const PostCardImage({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: SizedBox(
        width: double.infinity,
        child: Image.network(
          'https://cdn.prod.website-files.com/64c308983b98e1ea07cc2765/664b7fe365d89ee5a3341891_O.jpg',
          frameBuilder: (BuildContext context, Widget child, int? frame,
              bool? wasSynchronouslyLoaded) {
            return Padding(
              padding: const EdgeInsets.all(0),
              child: child,
            );
          },
          loadingBuilder: (context, child, loadingProgress) {
            final imageOpacity = loadingProgress == null ? 1.0 : 0.0;

            return Stack(
              children: [
                Container(
                  color: Colors.grey[300],
                  width: double.infinity,
                  height: 150,
                  child: Icon(
                    Icons.image,
                    size: 80,
                    color: Colors.grey[400],
                  ),
                ),
                AnimatedOpacity(
                  opacity: imageOpacity,
                  duration: const Duration(milliseconds: 250),
                  child: child,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
