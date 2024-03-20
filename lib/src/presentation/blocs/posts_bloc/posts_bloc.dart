import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_task_1/src/data/posts/posts_service.dart';
import 'package:flutter_bloc_task_1/src/domain/posts/posts_dto.dart';
import 'package:flutter_bloc_task_1/src/presentation/blocs/posts_bloc/posts_event.dart';
import 'package:flutter_bloc_task_1/src/presentation/blocs/posts_bloc/posts_state.dart';

class PostsBloc extends Bloc<PostsEvent, PostsState> {
  final PostsService _postsService;

  PostsBloc(this._postsService) : super(PostsLoading()) {
    on<PostsEvent>(
      (event, emit) async {
        switch (event) {
          case GetPostsEvent():
            await _getPosts(event, emit);
            break;
          default:
        }
      },
    );
    add(GetPostsEvent());
  }

  Future<void> _getPosts(GetPostsEvent event, Emitter<PostsState> emit) async {
    try {
      final List<PostsDto> posts = await _postsService.getPosts();
      emit(PostsLoaded(posts: posts));
    } catch (e) {
      emit(PostsError(message: e.toString()));
    }
  }
}
