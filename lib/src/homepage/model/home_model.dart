import 'dart:convert';

List models = [];

class HomeModel {
  String name;
  String code;
  HomeModel({required this.name, required this.code});
}

class InfoAddUsersModel {
  String title;
  String numberPhone;
  InfoAddUsersModel({
    required this.title,
    required this.numberPhone,
  });

  InfoAddUsersModel copyWith({
    String? title,
    String? numberPhone,
  }) {
    return InfoAddUsersModel(
      title: title ?? this.title,
      numberPhone: numberPhone ?? this.numberPhone,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'numberPhone': numberPhone,
    };
  }

  factory InfoAddUsersModel.fromMap(Map<String, dynamic> map) {
    return InfoAddUsersModel(
      title: map['title'] ?? '',
      numberPhone: map['numberPhone'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory InfoAddUsersModel.fromJson(String source) =>
      InfoAddUsersModel.fromMap(json.decode(source));

  @override
  String toString() =>
      'InfoAddUsersModel(title: $title, numberPhone: $numberPhone)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is InfoAddUsersModel &&
        other.title == title &&
        other.numberPhone == numberPhone;
  }

  @override
  int get hashCode => title.hashCode ^ numberPhone.hashCode;
}
