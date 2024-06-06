import 'package:flutter/material.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return const SliverAppBar(
      pinned: true,
      floating: true,
      snap: false,
      toolbarHeight: 0,
      bottom: TabBar(
        tabs: [
          Tab(text: 'Posts'),
          Tab(text: 'Other'),
        ],
      ),
    );
  }
}
