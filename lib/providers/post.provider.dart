
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test_state_management/models/post.dart';
import 'package:flutter_test_state_management/repository/post_repository.dart';

final postProvider=FutureProvider<List<Post>>((ref) async {
  final postRepository = PostRepository();
  return  postRepository.fetchPosts();
});