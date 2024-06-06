import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:tabbar_post_list/features/home/data/datasources/post_remote_datasource.dart';
import 'package:tabbar_post_list/features/home/domain/entities/post_entity.dart';

void main() {
  late Dio dio;
  late DioAdapter dioAdapter;
  late PostRemoteDataSource postRemoteDataSource;

  setUp(() {
    dio = Dio();
    dioAdapter = DioAdapter(dio: dio);
    postRemoteDataSource = PostRemoteDataSource(dio);
  });

  group('getPostList', () {
    final response = [
      {
        "userId": 1,
        "id": 1,
        "title":
            "sunt aut facere repellat provident occaecati excepturi optio reprehenderit",
        "body":
            "quia et suscipit\nsuscipit recusandae consequuntur expedita et cum\nreprehenderit molestiae ut ut quas totam\nnostrum rerum est autem sunt rem eveniet architecto"
      },
      {
        "userId": 1,
        "id": 2,
        "title": "qui est esse",
        "body":
            "est rerum tempore vitae\nsequi sint nihil reprehenderit dolor beatae ea dolores neque\nfugiat blanditiis voluptate porro vel nihil molestiae ut reiciendis\nqui aperiam non debitis possimus qui neque nisi nulla"
      },
      {
        "userId": 1,
        "id": 3,
        "title": "ea molestias quasi exercitationem repellat qui ipsa sit aut",
        "body":
            "et iusto sed quo iure\nvoluptatem occaecati omnis eligendi aut ad\nvoluptatem doloribus vel accusantium quis pariatur\nmolestiae porro eius odio et labore et velit aut"
      },
      {
        "userId": 1,
        "id": 4,
        "title": "eum et est occaecati",
        "body":
            "ullam et saepe reiciendis voluptatem adipisci\nsit amet autem assumenda provident rerum culpa\nquis hic commodi nesciunt rem tenetur doloremque ipsam iure\nquis sunt voluptatem rerum illo velit"
      },
      {
        "userId": 1,
        "id": 5,
        "title": "nesciunt quas odio",
        "body":
            "repudiandae veniam quaerat sunt sed\nalias aut fugiat sit autem sed est\nvoluptatem omnis possimus esse voluptatibus quis\nest aut tenetur dolor neque"
      }
    ];

    test('Return List<PostEntity>', () async {
      dioAdapter.onGet('/posts', (server) => server.reply(200, response));

      final result = await postRemoteDataSource.getPostList(1);

      final postList = List<PostEntity>.from(
        response.map(
          (item) {
            final post = Map<String, dynamic>.from(item);
            return PostEntity.fromMap(post);
          },
        ),
      );

      expect(result, isA<List<PostEntity>>());
      expect(result, postList);
    });

    test('Return throw Exception', () async {
      dioAdapter.onGet('/posts', (server) => server.reply(500, {}));

      expect(
        () async => await postRemoteDataSource.getPostList(1),
        throwsA(isA<Exception>()),
      );
    });
  });
}
