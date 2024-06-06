import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tabbar_post_list/features/home/ui/bloc/post_bloc.dart';
import 'package:tabbar_post_list/features/home/ui/widgets/home_appbar/home_appbar.dart';
import 'package:tabbar_post_list/features/home/ui/widgets/home_title.dart';

class HomeInfiniteScroll extends StatefulWidget {
  const HomeInfiniteScroll({super.key, required this.children});

  final List<Widget> children;

  @override
  State<HomeInfiniteScroll> createState() => _HomeInfiniteScrollState();
}

class _HomeInfiniteScrollState extends State<HomeInfiniteScroll>
    with SingleTickerProviderStateMixin {
  final GlobalKey<NestedScrollViewState> globalKey = GlobalKey();
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(_tabListener);

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      globalKey.currentState!.innerController.addListener(_loadMore);
    });

    super.initState();
  }

  void _tabListener() {
    if (_tabController.indexIsChanging) return;

    if (_tabController.index == 0) {
      return globalKey.currentState!.innerController.addListener(_loadMore);
    }

    return globalKey.currentState!.innerController.removeListener(_loadMore);
  }

  void _loadMore() {
    final scrollPosition = globalKey.currentState!.innerController.position;
    final currentPosition = scrollPosition.pixels;
    final maxPosition = scrollPosition.maxScrollExtent * .8;

    if (currentPosition < maxPosition) return;

    globalKey.currentState!.innerController.removeListener(_loadMore);
    context.read<PostBloc>().add(GetMorePostListEvent());
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<PostBloc, PostState>(
      listenWhen: (p, c) => p.isLoadingMore != c.isLoadingMore,
      listener: (context, state) async {
        if (state.isLoadingMore) return;

        await Future.delayed(const Duration(milliseconds: 500));
        globalKey.currentState!.innerController.addListener(_loadMore);
      },
      child: NestedScrollView(
        key: globalKey,
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            // Title and subtitle
            const HomeTitle(),

            // Appbar with Tabs
            HomeAppBar(tabController: _tabController),
          ];
        },
        body: TabBarView(
          controller: _tabController,
          children: widget.children,
        ),
      ),
    );
  }
}
