import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tabbar_post_list/features/home/ui/bloc/post_bloc.dart';

class PostListFailed extends StatelessWidget {
  const PostListFailed({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverFillRemaining(
      hasScrollBody: false,
      child: Center(
        child: ElevatedButton(
          onPressed: () {
            context.read<PostBloc>().add(GetPostListEvent());
          },
          child: const Text('Reintentar'),
        ),
      ),
    );
  }
}
