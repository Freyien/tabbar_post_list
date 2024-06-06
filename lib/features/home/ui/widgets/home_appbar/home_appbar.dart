import 'package:flutter/material.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key, required this.tabController});

  final TabController tabController;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      floating: true,
      snap: false,
      toolbarHeight: 0,
      bottom: TabBar(
        controller: tabController,
        tabs: const [
          Tab(text: 'Posts'),
          Tab(text: 'Other'),
        ],
      ),
    );
  }
}
