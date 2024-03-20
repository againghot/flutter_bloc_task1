import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_task_1/src/data/posts/posts_service.dart';
import 'package:flutter_bloc_task_1/src/presentation/blocs/posts_bloc/posts_bloc.dart';
import 'package:flutter_bloc_task_1/src/presentation/blocs/posts_bloc/posts_state.dart';
import 'package:flutter_bloc_task_1/src/presentation/widgets/loader_widget.dart';
import 'package:flutter_bloc_task_1/src/presentation/widgets/post_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocProvider(
          create: (context) => PostsBloc(PostsService()),
          child: BlocBuilder<PostsBloc, PostsState>(
            builder: (BuildContext context, PostsState state) {
              if (state is PostsLoading) {
                return const Center(
                  child: LoaderWidget(),
                );
              } else if (state is PostsLoaded) {
                return ListView.builder(
                  itemCount: state.posts.length,
                  padding: const EdgeInsets.all(12),
                  itemBuilder: (context, index) {
                    return PostWidget(
                      title: state.posts[index].title,
                      text: state.posts[index].body,
                    );
                  },
                );
              } else if (state is PostsError) {
                return Center(
                  child: Text(state.message),
                );
              }
              return const SizedBox.shrink();
            },
          ),
        ),
      ),
    );
  }
}
