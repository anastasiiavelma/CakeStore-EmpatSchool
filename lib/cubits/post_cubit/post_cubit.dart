import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:projects/cubits/post_cubit/post_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projects/models/post.dart';

class PostCubit extends Cubit<PostState> {
  PostCubit() : super(PostInitial());

  Future<void> getPosts() async {
    emit(PostLoading());
    try {
      final response = await http
          .get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
      if (response.statusCode == 200) {
        final List<dynamic> jsonData = json.decode(response.body);
        final List<Post> posts =
            jsonData.map((json) => Post.parseJson(json)).toList();
        emit(PostLoaded(posts));
      } else {
        throw Exception('Failed to load posts');
      }
    } catch (e) {
      emit(PostError('Failed to load posts: $e'));
    }
  }
}
