import 'package:equatable/equatable.dart';

abstract class UniversitiesEvent extends Equatable {
  const UniversitiesEvent();

  @override
  List<Object?> get props => [];
}

class OnLoad extends UniversitiesEvent {
  final int fromIndex;
  final int toIndex;

  const OnLoad(this.fromIndex, this.toIndex);

  @override
  List<Object?> get props => [fromIndex, toIndex];
}
