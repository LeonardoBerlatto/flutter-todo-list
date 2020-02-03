import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'todo.g.dart';

@JsonSerializable()
class ToDo extends JsonEncoder {
  String title;
  String description;

  @JsonKey(name: 'is_done')
  bool isDone;

  ToDo(this.title, this.description, this.isDone);

  factory ToDo.fromJson(Map<String, dynamic> json) => _$ToDoFromJson(json);
  
  Map<String, dynamic> toJson() => _$ToDoToJson(this);
}
