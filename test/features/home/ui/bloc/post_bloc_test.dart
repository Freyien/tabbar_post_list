import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tabbar_post_list/core/domain/entities/result.dart';
import 'package:tabbar_post_list/core/domain/enums/fetching_status.dart';
import 'package:tabbar_post_list/core/domain/failures/failures.dart';
import 'package:tabbar_post_list/features/home/domain/entities/post_entity.dart';
import 'package:tabbar_post_list/features/home/domain/repositories/post_repository.dart';
import 'package:tabbar_post_list/features/home/ui/bloc/post_bloc.dart';

class MockPostRepository extends Mock implements PostRepository {}

class MockPostEntity extends Mock implements PostEntity {}

void main() {
  late MockPostRepository mockPostRepository;

  setUp(() {
    mockPostRepository = MockPostRepository();
  });

  group('GetPostList', () {
    final postList = List.generate(5, (_) => MockPostEntity());

    blocTest<PostBloc, PostState>(
      'emits [FetchingStatus.success] when GetPostListEvent is added.',
      setUp: () {
        when(() => mockPostRepository.getPost(1)).thenAnswer(
          (_) async => Result.success(postList),
        );
      },
      build: () => PostBloc(mockPostRepository),
      act: (bloc) => bloc.add(GetPostListEvent()),
      expect: () => [
        PostState.initial().copyWith(status: FetchingStatus.loading),
        PostState.initial().copyWith(
          status: FetchingStatus.success,
          postList: postList,
        ),
      ],
      verify: (bloc) {
        verify(() => mockPostRepository.getPost(1)).called(1);
      },
    );

    blocTest<PostBloc, PostState>(
      'emits [FetchingStatus.failed] when GetPostListEvent is added.',
      setUp: () {
        when(() => mockPostRepository.getPost(1)).thenAnswer(
          (_) async => Result.failed(UnexpectedFailure()),
        );
      },
      build: () => PostBloc(mockPostRepository),
      act: (bloc) => bloc.add(GetPostListEvent()),
      expect: () => [
        PostState.initial().copyWith(status: FetchingStatus.loading),
        PostState.initial().copyWith(status: FetchingStatus.failed),
      ],
      verify: (bloc) {
        verify(() => mockPostRepository.getPost(1)).called(1);
      },
    );
  });

  group('GetMorePostListEvent', () {
    final postList = List.generate(
      5,
      (_) => MockPostEntity(),
    );
    final seedState = PostState.initial().copyWith(
      status: FetchingStatus.success,
      postList: postList,
    );

    blocTest<PostBloc, PostState>(
      'emits [isLoadingMore] when GetMorePostListEvent is added.',
      setUp: () {
        when(() => mockPostRepository.getPost(2)).thenAnswer(
          (_) async => Result.success(postList),
        );
      },
      seed: () => seedState,
      build: () => PostBloc(mockPostRepository),
      act: (bloc) => bloc.add(GetMorePostListEvent()),
      expect: () => [
        seedState.copyWith(isLoadingMore: true),
        seedState.copyWith(
          isLoadingMore: false,
          postList: [...postList, ...postList],
          page: 2,
        ),
      ],
      verify: (bloc) {
        verify(() => mockPostRepository.getPost(2)).called(1);
      },
    );

    blocTest<PostBloc, PostState>(
      'emits [!isLoadingMore] when GetMorePostListEvent is added.',
      setUp: () {
        when(() => mockPostRepository.getPost(2)).thenAnswer(
          (_) async => Result.failed(UnexpectedFailure()),
        );
      },
      seed: () => seedState,
      build: () => PostBloc(mockPostRepository),
      act: (bloc) => bloc.add(GetMorePostListEvent()),
      expect: () => [
        seedState.copyWith(isLoadingMore: true),
        seedState.copyWith(isLoadingMore: false, page: 1),
      ],
      verify: (bloc) {
        verify(() => mockPostRepository.getPost(2)).called(1);
      },
    );
  });
}
