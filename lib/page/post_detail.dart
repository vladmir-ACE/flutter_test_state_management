import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test_state_management/models/post.dart';
import 'package:flutter_test_state_management/providers/post.provider.dart';


class PostDetail extends ConsumerWidget {
final int id;
const PostDetail({super.key,required this.id});

  @override
  Widget build(BuildContext context,WidgetRef ref) {

   final AsyncValue<Post> postDetail = ref.watch(postDetailProvider(id));

    return Scaffold(
      appBar: AppBar(
        title: Text("Post Detail"),
      ),
      body: Center(
        child: postDetail.when(
          data: (post) => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(post.title, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              SizedBox(height: 16),
              Text(post.description, style: TextStyle(fontSize: 16)),
            ],
          ),
          loading: () => CircularProgressIndicator(),
          error: (error, stackTrace) => Text('Error loading post'),
        ),
      ),
    );
  }
}