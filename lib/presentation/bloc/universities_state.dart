import 'package:equatable/equatable.dart';
import 'package:test/data/models/university.dart';

abstract class UniversitiesState extends Equatable {
  const UniversitiesState();

  @override
  List<Object?> get props => [];
}

class UniversitiesEmpty extends UniversitiesState {}

class UniversitiesLoading extends UniversitiesState {}

class UniversitiesError extends UniversitiesState {
  final String message;

  UniversitiesError(this.message);

  @override
  List<Object?> get props => [message];
}

class UniversitiesHasData extends UniversitiesState {
  final List<University> result;

  UniversitiesHasData(this.result);

  @override
  List<Object?> get props => [result];
}