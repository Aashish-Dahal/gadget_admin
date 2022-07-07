import 'package:equatable/equatable.dart';

class SliderModel extends Equatable {
  String id;
  final String imagePath;
  SliderModel({
    this.id = '',
    required this.imagePath,
  });
  factory SliderModel.fromFirestore(Map<String, dynamic> json) => SliderModel(
      id: json['id'] as String, imagePath: json['imagePath'] as String);

  Map<String, dynamic> toFirestore() => {
        "id": id,
        "imagePath": imagePath,
      };

  @override
  List<Object?> get props => [id, imagePath];
}
