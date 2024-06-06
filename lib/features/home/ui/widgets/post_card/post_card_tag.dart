import 'package:flutter/material.dart';

class PostCardTag extends StatelessWidget {
  const PostCardTag({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
          backgroundColor: Theme.of(context).colorScheme.secondary,
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(
            horizontal: 12,
          ),
          visualDensity: VisualDensity.compact,
          textStyle: Theme.of(context)
              .textTheme
              .labelLarge
              ?.copyWith(color: Colors.white),
        ),
        onPressed: () {},
        child: Text(text),
      ),
    );
  }
}
