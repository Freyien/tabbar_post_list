import 'package:flutter/material.dart';

class PostListLoading extends StatelessWidget {
  const PostListLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return const SliverFillRemaining(
      hasScrollBody: false,
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
