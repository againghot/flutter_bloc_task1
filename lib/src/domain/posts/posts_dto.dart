import 'package:json_annotation/json_annotation.dart';

part 'posts_dto.g.dart';

@JsonSerializable(explicitToJson: true)
class PostsDto {
  final int userId;
  final int id;
  final String title;
  final String body;

  PostsDto(
      {required this.userId,
      required this.id,
      required this.title,
      required this.body});

  factory PostsDto.fromJson(Map<String, dynamic> json) =>
      _$PostsDtoFromJson(json);

  Map<String, dynamic> toJson() => _$PostsDtoToJson(this);
}
