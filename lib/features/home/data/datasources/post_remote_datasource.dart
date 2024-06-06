import 'package:dio/dio.dart';
import 'package:tabbar_post_list/features/home/data/datasources/post_datasource.dart';
import 'package:tabbar_post_list/features/home/domain/entities/post_entity.dart';

class PostRemoteDataSource implements PostDataSource {
  final Dio dio;

  PostRemoteDataSource(this.dio);

  @override
  Future<List<PostEntity>> getPostList(int page) async {
    final result = await dio.get('/posts');

    final postList = List<PostEntity>.from(
      result.data.map(
        (item) {
          final post = Map<String, dynamic>.from(item);
          return PostEntity.fromMap(post);
        },
      ),
    );

    // return postList;

    // Return only five to simulate infinite scroll
    return postList.getRange(0, 5).toList();
  }
}
