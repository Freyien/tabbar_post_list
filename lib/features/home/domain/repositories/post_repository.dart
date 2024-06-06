import 'package:tabbar_post_list/core/domain/entities/result.dart';
import 'package:tabbar_post_list/features/home/domain/entities/post_entity.dart';

abstract class PostRepository {
  Future<Result<List<PostEntity>>> getPost(int page);
}
