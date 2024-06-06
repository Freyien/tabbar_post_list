import 'package:tabbar_post_list/features/home/domain/entities/post_entity.dart';

abstract class PostDataSource {
  Future<List<PostEntity>> getPostList(int page);
}
