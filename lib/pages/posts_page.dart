import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:lesson_six/models/post.dart';

final class PostsPage extends StatefulWidget {
  const PostsPage({super.key});

  @override
  State<PostsPage> createState() => _PostsPageState();
}

Future<List<Post>> getPosts() async {
  try {
    const url = 'https://jsonplaceholder.typicode.com/posts';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode != 200) {
      throw 'Error Occured while fetching';
    }

    // final data = json.decode(response.body) as List;
    final data = jsonDecode(response.body) as List;
    final posts = data.map((result) => Post.fromJson(result)).toList();

    return posts;
  } catch (e) {
    debugPrint(e.toString());
    return [];
  }
}

class _PostsPageState extends State<PostsPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Posts'),
        centerTitle: true,
      ),
      body: Center(
        child: FutureBuilder(
          future: getPosts(),
          builder: (
            BuildContext context,
            AsyncSnapshot<List<Post>> snapshot,
          ) {
            if (!snapshot.hasData) {
              return const CircularProgressIndicator.adaptive();
            }
            if (snapshot.hasError) {
              return const Text('Error Occured');
            }
            return ListView.builder(
              itemCount: snapshot.data?.length,
              itemBuilder: (
                BuildContext context,
                int index,
              ) {
                final post = snapshot.data?[index];
                return Card(
                  margin: const EdgeInsets.all(10),
                  child: ListTile(
                    leading: CircleAvatar(
                      child: Text(post?.id.toString() ?? ''),
                    ),
                    title: Text(post?.title ?? ''),
                    subtitle: Text(post?.message ?? ''),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
