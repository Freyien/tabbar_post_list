import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tabbar_post_list/di/di_init.dart';
import 'package:tabbar_post_list/features/home/ui/bloc/post_bloc.dart';
import 'package:tabbar_post_list/features/home/ui/widgets/home_infinite_scroll.dart';
import 'package:tabbar_post_list/features/home/ui/widgets/post_list/post_list_builder.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> tabs = ['Posts', 'Tab 2'];

    return BlocProvider(
      create: (context) => sl<PostBloc>()..add(GetPostListEvent()),
      child: DefaultTabController(
        length: tabs.length,
        child: Scaffold(
          appBar: AppBar(),
          body: Builder(builder: (context) {
            return RefreshIndicator(
              onRefresh: () async {
                context.read<PostBloc>().add(GetPostListEvent());
              },
              child: HomeInfiniteScroll(
                children: [
                  // Post list builder
                  const PostListBuilder(),

                  // Blank
                  Container(
                    width: double.infinity,
                    height: 150,
                    color: Colors.purple,
                  ),
                ],
              ),
            );
          }),
        ),
      ),
    );
  }
}
