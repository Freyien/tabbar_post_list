import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tabbar_post_list/core/domain/enums/fetching_status.dart';
import 'package:tabbar_post_list/features/home/ui/bloc/post_bloc.dart';
import 'package:tabbar_post_list/features/home/ui/widgets/post_list/post_list_widgets.dart';

class PostListBuilder extends StatelessWidget {
  const PostListBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PostBloc, PostState>(
      buildWhen: (p, c) => p.status != c.status || p.postList != c.postList,
      builder: (context, state) {
        switch (state.status) {
          // Loading
          case FetchingStatus.initial:
          case FetchingStatus.loading:
            return const PostListLoading();
          // Success
          case FetchingStatus.success:
            return PostListSuccess(postList: state.postList);
          // Failed
          case FetchingStatus.failed:
            return const PostListFailed();
        }
      },
    );
  }
}
