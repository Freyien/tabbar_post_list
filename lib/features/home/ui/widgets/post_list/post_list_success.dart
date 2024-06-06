import 'package:flutter/material.dart';
import 'package:tabbar_post_list/features/home/domain/entities/post_entity.dart';
import 'package:tabbar_post_list/features/home/ui/widgets/post_card/post_card_widgets.dart';
import 'package:tabbar_post_list/features/home/ui/widgets/post_list/post_list_widgets.dart';

class PostListSuccess extends StatelessWidget {
  const PostListSuccess({super.key, required this.postList});

  final List<PostEntity> postList;

  @override
  Widget build(BuildContext context) {
    final childCount = postList.length;

    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      sliver: SliverList(
        delegate: SliverChildBuilderDelegate(
          (BuildContext context, int index) {
            final post = postList[index];
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
          childCount: childCount,
        ),
      ),
    );
  }
}
