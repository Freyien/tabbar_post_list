import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tabbar_post_list/features/home/ui/bloc/post_bloc.dart';

class PostListLoadingMore extends StatelessWidget {
  const PostListLoadingMore({super.key, required this.show});

  final bool show;

  @override
  Widget build(BuildContext context) {
    if (!show) return const SizedBox.shrink();

    return SafeArea(
      child: BlocSelector<PostBloc, PostState, bool>(
        selector: (state) => state.isLoadingMore,
        builder: (context, isLoadingMore) {
          if (!isLoadingMore) return const SizedBox.shrink();

          return const CircularProgressIndicator();
        },
      ),
    );
  }
}
