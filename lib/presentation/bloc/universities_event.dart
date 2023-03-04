import 'package:equatable/equatable.dart';

abstract class UniversitiesEvent extends Equatable {
  const UniversitiesEvent();

  @override
  List<Object?> get props => [];
}

class OnLoad extends UniversitiesEvent {
  const OnLoad();

  @override
  List<Object?> get props => [];
}

class OnChangeLayout extends UniversitiesEvent {
  final bool isList;

  const OnChangeLayout({required this.isList});

  @override
  List<Object?> get props => [isList];
}
