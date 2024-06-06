import 'package:tabbar_post_list/core/domain/entities/result.dart';
import 'package:tabbar_post_list/core/domain/failures/failures.dart';
import 'package:tabbar_post_list/features/home/data/datasources/post_datasource.dart';
import 'package:tabbar_post_list/features/home/domain/entities/post_entity.dart';
import 'package:tabbar_post_list/features/home/domain/repositories/post_repository.dart';

class PostRepositoryImpl implements PostRepository {
  final PostDataSource _postRemoteDataSource;

  PostRepositoryImpl(this._postRemoteDataSource);

  @override
  Future<Result<List<PostEntity>>> getPost(int page) async {
    try {
      final result = await _postRemoteDataSource.getPostList(page);

      return Result.success(result);
    } catch (_) {
      return Result.failed(UnexpectedFailure());
    }
  }
}
