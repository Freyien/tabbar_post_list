import 'package:flutter/material.dart';

class PostCardReadMoreButton extends StatelessWidget {
  const PostCardReadMoreButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: const Offset(-12, 0),
      child: TextButton.icon(
        onPressed: () {},
        label: const Text(
          'Read more',
        ),
        icon: const Icon(Icons.arrow_right_alt_rounded),
        iconAlignment: IconAlignment.end,
        style: TextButton.styleFrom(
          foregroundColor: Theme.of(context).primaryColor,
        ),
      ),
    );
  }
}
