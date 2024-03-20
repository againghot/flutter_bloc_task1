import 'package:flutter_bloc_task_1/src/domain/posts/posts_dto.dart';

sealed class PostsState {}

class PostsLoading extends PostsState {}

class PostsLoaded extends PostsState {
  final List<PostsDto> posts;
  PostsLoaded({required this.posts});
}

class PostsError extends PostsState {
  final String message;
  PostsError({required this.message});
}
