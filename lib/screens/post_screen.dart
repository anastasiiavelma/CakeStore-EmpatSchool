import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projects/cubits/post_cubit/post_cubit.dart';
import 'package:projects/cubits/post_cubit/post_state.dart';
import 'package:projects/utlis/constants.dart';
import 'package:projects/widgets/list/comments_list_widget.dart';

class PostScreen extends StatelessWidget {
  const PostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.background,
        title: const Text('Posts'),
      ),
      body: BlocProvider(
        create: (context) => PostCubit()..getPosts(),
        child: BlocBuilder<PostCubit, PostState>(
          builder: (context, state) {
            if (state is PostLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is PostLoaded) {
              return ListView.builder(
                itemCount: state.posts.length,
                itemBuilder: (context, index) {
                  final post = state.posts[index];
                  return Padding(
                    padding: smallerPadding,
                    child: Card(
                      child: Column(
                        children: [
                          ListTile(
                            title: Text(
                              post.title,
                              style: const TextStyle(fontSize: 40.0),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            subtitle: Text(post.body,
                                overflow: TextOverflow.ellipsis),
                          ),
                          TextButton(
                            onPressed: () {
                              showModalBottomSheet(
                                context: context,
                                builder: (context) {
                                  return CommentsWidget(
                                    postId: post.id,
                                  );
                                },
                              );
                            },
                            child: Align(
                              alignment: Alignment.bottomLeft,
                              child: Text(
                                'View comments',
                                style: TextStyle(
                                    color:
                                        Theme.of(context).colorScheme.secondary,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            } else if (state is PostError) {
              return Center(child: Text(state.error));
            } else {
              return const Center(child: Text('Unknown'));
            }
          },
        ),
      ),
    );
  }
}
