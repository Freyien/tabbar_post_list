import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tabbar_post_list/core/domain/enums/fetching_status.dart';
import 'package:tabbar_post_list/features/home/domain/entities/post_entity.dart';
import 'package:tabbar_post_list/features/home/domain/repositories/post_repository.dart';

part 'post_event.dart';
part 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  final PostRepository _postRepository;

  PostBloc(this._postRepository) : super(PostState.initial()) {
    on<GetPostListEvent>(_onGetPostListEvent);
    on<GetMorePostListEvent>(_onGetMorePostListEvent);
  }

  Future<void> _onGetPostListEvent(
    GetPostListEvent event,
    Emitter<PostState> emit,
  ) async {
    emit(state.copyWith(status: FetchingStatus.loading));

    final result = await _postRepository.getPost(1);

    if (result.isSuccess) {
      return emit(state.copyWith(
        status: FetchingStatus.success,
        postList: result.data,
      ));
    }

    emit(state.copyWith(status: FetchingStatus.failed));
  }

  Future<void> _onGetMorePostListEvent(
    GetMorePostListEvent event,
    Emitter<PostState> emit,
  ) async {
    emit(state.copyWith(isLoadingMore: true));
    final nextPage = state.page + 1;

    final result = await _postRepository.getPost(nextPage);

    if (result.isSuccess) {
      final newPostList = [...state.postList, ...result.data!];

      return emit(state.copyWith(
        isLoadingMore: false,
        postList: newPostList,
        page: nextPage,
      ));
    }

    emit(state.copyWith(isLoadingMore: false));
  }
}
