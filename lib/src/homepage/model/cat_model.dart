import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class Category extends Equatable {
  final int id;
  final String image;
  const Category({
    required this.id,
    required this.image,
  });
  @override
  List<Object?> get props => [id, image];
  static List<Category> categories = [
    const Category(
      id: 1,
      image: 'assets/alarme.jpg',
    ),
    const Category(
      id: 2,
      image: 'assets/windows.jpg',
    ),
    const Category(
      id: 3,
      image: 'assets/gaz.jpg',
    ),
    const Category(
      id: 4,
      image: 'assets/lampe.jpg',
    ),
    const Category(
      id: 5,
      image: 'assets/vontilo.png',
    ),
  ];
}
