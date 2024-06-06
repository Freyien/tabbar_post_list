import 'package:flutter/material.dart';

class PostCardBody extends StatelessWidget {
  const PostCardBody({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context)
          .textTheme
          .bodyMedium
          ?.copyWith(color: Colors.grey[600]!),
    );
  }
}
