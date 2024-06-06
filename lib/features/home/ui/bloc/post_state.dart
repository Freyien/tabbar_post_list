part of 'post_bloc.dart';

class PostState extends Equatable {
  const PostState({
    required this.status,
    required this.isLoadingMore,
    required this.postList,
    required this.page,
  });

  final FetchingStatus status;
  final bool isLoadingMore;
  final List<PostEntity> postList;
  final int page;

  factory PostState.initial() => const PostState(
        status: FetchingStatus.initial,
        isLoadingMore: false,
        postList: [],
        page: 1,
      );

  PostState copyWith({
    FetchingStatus? status,
    bool? isLoadingMore,
    List<PostEntity>? postList,
    int? page,
  }) {
    return PostState(
      status: status ?? this.status,
      isLoadingMore: isLoadingMore ?? this.isLoadingMore,
      postList: postList ?? this.postList,
      page: page ?? this.page,
    );
  }

  @override
  List<Object> get props => [status, isLoadingMore, postList, page];
}
