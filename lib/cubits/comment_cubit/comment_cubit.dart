import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:projects/cubits/comment_cubit/comment_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projects/models/comment.dart';

class CommentCubit extends Cubit<CommentState> {
  CommentCubit() : super(CommentInitial());

  Future<void> getCommentInPosts(int postId) async {
    emit(CommentLoading());
    http
        .get(Uri.parse(
            'https://jsonplaceholder.typicode.com/posts/$postId/comments'))
        .then((response) {
      if (response.statusCode == 200) {
        final List<dynamic> jsonData = json.decode(response.body);
        final List<Comment> comments =
            jsonData.map((json) => Comment.parseJson(json)).toList();
        emit(CommentLoaded(comments));
      } else {
        throw Exception('Failed to load comments');
      }
    }).catchError((e) {
      emit(CommentError('Failed to load comments: $e'));
    });
  }
}
