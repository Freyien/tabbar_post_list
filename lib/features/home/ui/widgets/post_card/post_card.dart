import 'package:flutter/material.dart';
import 'package:tabbar_post_list/core/ui/widgets/core_widgets.dart';
import 'package:tabbar_post_list/features/home/domain/entities/post_entity.dart';
import 'package:tabbar_post_list/features/home/ui/widgets/post_card/post_card_widgets.dart';

class PostCard extends StatelessWidget {
  const PostCard({super.key, required this.post});

  final PostEntity post;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 16),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey[300]!,
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Tags
                const Wrap(
                  children: [
                    PostCardTag(text: 'Community'),
                  ],
                ),

                VerticalSpace.large(),

                // Title
                PostCardTitle(text: post.title),

                // Body
                PostCardBody(text: post.body),

                // Read more button
                const PostCardReadMoreButton(),
              ],
            ),
          ),

          // Image
          const PostCardImage(),
        ],
      ),
    );
  }
}
