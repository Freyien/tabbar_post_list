import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:tabbar_post_list/features/home/data/datasources/post_datasource.dart';
import 'package:tabbar_post_list/features/home/data/datasources/post_remote_datasource.dart';
import 'package:tabbar_post_list/features/home/data/repositories/post_repository_impl.dart';
import 'package:tabbar_post_list/features/home/domain/repositories/post_repository.dart';
import 'package:tabbar_post_list/features/home/ui/bloc/post_bloc.dart';

GetIt sl = GetIt.instance;

void init() {
  _registerNetwork();

  _registerDataSources();

  _registerRepositories();

  _registerBlocs();
}

void _registerNetwork() {
  final dio = Dio(
    BaseOptions(
      baseUrl: 'https://jsonplaceholder.typicode.com',
    ),
  );

  sl.registerLazySingleton<Dio>(() => dio);
}

void _registerDataSources() {
  sl.registerLazySingleton<PostDataSource>(() => PostRemoteDataSource(sl()));
}

void _registerRepositories() {
  sl.registerLazySingleton<PostRepository>(() => PostRepositoryImpl(sl()));
}

void _registerBlocs() {
  sl.registerFactory<PostBloc>(() => PostBloc(sl()));
}
