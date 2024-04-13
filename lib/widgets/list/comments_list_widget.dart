import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projects/cubits/comment_cubit/comment_cubit.dart';
import 'package:projects/cubits/comment_cubit/comment_state.dart';
import 'package:projects/utlis/constants.dart';

class CommentsWidget extends StatelessWidget {
  final int? postId;
  const CommentsWidget({
    super.key,
    required this.postId,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.background,
          title: Text(
            "Comments",
            style: TextStyle(color: Theme.of(context).colorScheme.secondary),
          )),
      body: BlocProvider(
        create: (context) => CommentCubit()..getCommentInPosts(postId!),
        child: BlocBuilder<CommentCubit, CommentState>(
          builder: (context, state) {
            if (state is CommentLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is CommentLoaded) {
              return ListView.builder(
                itemCount: state.comments.length,
                itemBuilder: (context, index) {
                  final comments = state.comments[index];
                  return Card(
                    child: ListTile(
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            comments.name.split(' ').take(2).join(' '),
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Theme.of(context).colorScheme.secondary,
                            ),
                          ),
                          smallSizedBoxWidth,
                          Text(
                            comments.email,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 8,
                              color: Theme.of(context).colorScheme.secondary,
                            ),
                          ),
                        ],
                      ),
                      subtitle: Text(
                        comments.body,
                        maxLines: 2,
                        style: TextStyle(
                          fontSize: 14,
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                      ),
                    ),
                  );
                },
              );
            } else if (state is CommentError) {
              return Center(child: Text(state.error));
            } else {
              return const Center(child: Text('Unknown state'));
            }
          },
        ),
      ),
    );
  }
}
