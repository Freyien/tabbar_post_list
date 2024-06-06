import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tabbar_post_list/features/home/ui/bloc/post_bloc.dart';

class HomeInfiniteScroll extends StatefulWidget {
  const HomeInfiniteScroll({super.key, required this.slivers});

  final List<Widget> slivers;

  @override
  State<HomeInfiniteScroll> createState() => _HomeInfiniteScrollState();
}

class _HomeInfiniteScrollState extends State<HomeInfiniteScroll> {
  late ScrollController _scrollController;

  @override
  void initState() {
    _scrollController = ScrollController();
    _scrollController.addListener(_loadMore);

    super.initState();
  }

  void _loadMore() {
    final scrollPosition = _scrollController.position;
    final currentPosition = scrollPosition.pixels;
    final maxPosition = scrollPosition.maxScrollExtent * .8;

    if (currentPosition < maxPosition) return;

    _scrollController.removeListener(_loadMore);
    context.read<PostBloc>().add(GetMorePostListEvent());
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<PostBloc, PostState>(
      listenWhen: (p, c) => p.isLoadingMore != c.isLoadingMore,
      listener: (context, state) async {
        if (state.isLoadingMore) return;

        await Future.delayed(const Duration(milliseconds: 500));
        _scrollController.addListener(_loadMore);
      },
      child: CustomScrollView(
        controller: _scrollController,
        slivers: widget.slivers,
      ),
    );
  }
}
