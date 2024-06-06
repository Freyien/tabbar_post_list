import 'package:flutter/material.dart';
import 'package:tabbar_post_list/features/home/domain/entities/post_entity.dart';
import 'package:tabbar_post_list/features/home/ui/widgets/post_card/post_card_widgets.dart';
import 'package:tabbar_post_list/features/home/ui/widgets/post_list/post_list_widgets.dart';

class PostListSuccess extends StatefulWidget {
  const PostListSuccess({super.key, required this.postList});

  final List<PostEntity> postList;

  @override
  State<PostListSuccess> createState() => _PostListSuccessState();
}

class _PostListSuccessState extends State<PostListSuccess>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    final childCount = widget.postList.length;

    return ListView.builder(
      itemCount: childCount,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      itemBuilder: (BuildContext context, int index) {
        final post = widget.postList[index];
        final isLast = index == (childCount - 1);

        return Column(
          children: [
            // Card
            PostCard(post: post),

            // Loading more
            PostListLoadingMore(show: isLast),
          ],
        );
      },
    );
  }

  @override
  bool get wantKeepAlive => true;
}
