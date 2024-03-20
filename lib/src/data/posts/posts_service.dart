import 'dart:convert';
import 'dart:io';

import 'package:flutter_bloc_task_1/src/domain/posts/posts_dto.dart';

class PostsService {
  final httpClient = HttpClient();

  Future<List<PostsDto>> getPosts() async {
    final json = await get('https://jsonplaceholder.typicode.com/posts');

    final posts = json
        .map((dynamic e) => PostsDto.fromJson(e as Map<String, dynamic>))
        .toList();

    return posts;
  }

  Future<List<dynamic>> get(String url) async {
    final parseUrl = Uri.parse(url);
    final request = await httpClient.getUrl(parseUrl);
    final response = await request.close();

    final jsonStrings = await response.transform(utf8.decoder).toList();
    final jsonString = jsonStrings.join();

    final json = jsonDecode(jsonString) as List<dynamic>;
    return json;
  }
}
