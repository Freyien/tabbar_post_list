import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tabbar_post_list/core/domain/failures/failures.dart';
import 'package:tabbar_post_list/features/home/data/datasources/post_datasource.dart';
import 'package:tabbar_post_list/features/home/data/repositories/post_repository_impl.dart';
import 'package:tabbar_post_list/features/home/domain/entities/post_entity.dart';
import 'package:tabbar_post_list/features/home/domain/repositories/post_repository.dart';

class MockPostDataSource extends Mock implements PostDataSource {}

class MockPostEntity extends Mock implements PostEntity {}

void main() {
  late MockPostDataSource mockPostDataSource;
  late PostRepository postRepository;

  setUp(() {
    mockPostDataSource = MockPostDataSource();
    postRepository = PostRepositoryImpl(mockPostDataSource);
  });

  group('getPost', () {
    final postList = List.generate(5, (_) => MockPostEntity());

    test('Return success Result<List<PostEntity>>', () async {
      when(() => mockPostDataSource.getPostList(1)).thenAnswer(
        (_) async => postList,
      );

      final result = await postRepository.getPost(1);

      expect(result.isSuccess, true);
      expect(result.data, isA<List<PostEntity>>());
      expect(result.data, postList);
      verify(() => postRepository.getPost(1)).called(1);
    });

    test('Return failed Result with UnexpectedFailure', () async {
      when(() => mockPostDataSource.getPostList(1)).thenThrow(Exception());

      final result = await postRepository.getPost(1);

      expect(result.isFailed, true);
      expect(result.failure, isA<UnexpectedFailure>());
      verify(() => mockPostDataSource.getPostList(1)).called(1);
    });
  });
}
