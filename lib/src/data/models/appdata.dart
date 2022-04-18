import 'package:equatable/equatable.dart';

class AppData extends Equatable {
  final String name;
  final List<dynamic> objek;

  const AppData({
    required this.name,
    required this.objek,
  });

  @override
  List<Object?> get props => [name, objek];
}
