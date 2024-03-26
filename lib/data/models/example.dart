import 'package:front_scaffold_flutter/domain/entity/example_entity.dart';

class Example implements ExampleEntity {
  final int idExample;
  final String name;

  const Example({required this.name, required this.idExample});

  factory Example.fromJson(Map<String, dynamic> json) {
    return Example(name: json['name'], idExample: json['id']);
  }

  @override
  String toString() {
    return "Example: $name";
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'name': name,
    };
  }

  @override
  int get id => idExample;
}
