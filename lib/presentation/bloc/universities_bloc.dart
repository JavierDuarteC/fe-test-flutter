import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';
import 'package:test/data/models/university.dart';
import 'package:test/domain/usecases/universities_usecase.dart';
import 'package:test/presentation/bloc/universities_event.dart';
import 'package:test/presentation/bloc/universities_state.dart';

class UniversitiesBloc extends Bloc<UniversitiesEvent, UniversitiesState> {
  final UniversitiesUseCase _universitiesUseCase;

  List<University> _universities = [];

  UniversitiesBloc(this._universitiesUseCase) : super(UniversitiesEmpty()) {
    on<OnLoad>(
      (event, emit) async {
        emit(UniversitiesLoading());

        final result = await _universitiesUseCase.executeGetUniversities();
        result.fold(
          (failure) {
            emit(UniversitiesError(failure.message));
          },
          (data) {
            _universities = data;
            emit(UniversitiesHasDataAsList(data));
          },
        );
      },
      transformer: debounce(const Duration(milliseconds: 500)),
    );
    on<OnChangeLayout>(
      (event, emit) async {
        final isList = event.isList;

        if (isList) {
          emit(UniversitiesHasDataAsList(_universities));
        } else {
          emit(UniversitiesHasDataAsGrid(_universities));
        }
      },
    );
  }

  EventTransformer<T> debounce<T>(Duration duration) {
    return (events, mapper) => events.debounceTime(duration).flatMap(mapper);
  }
}
