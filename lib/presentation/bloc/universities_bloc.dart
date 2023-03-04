import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';
import 'package:test/domain/usecases/universities_usecase.dart';
import 'package:test/presentation/bloc/universities_event.dart';
import 'package:test/presentation/bloc/universities_state.dart';

class UniversitiesBloc extends Bloc<UniversitiesEvent, UniversitiesState> {
  final UniversitiesUseCase _universitiesUseCase;

  UniversitiesBloc(this._universitiesUseCase) : super(UniversitiesEmpty()) {
    on<OnLoad>(
      (event, emit) async {
        final fromIndex = event.fromIndex;
        final toIndex = event.toIndex;

        emit(UniversitiesLoading());

        final result = await _universitiesUseCase.executeGetUniversities();
        result.fold(
          (failure) {
            emit(UniversitiesError(failure.message));
          },
          (data) {
            emit(UniversitiesHasData(data));
          },
        );
      },
      transformer: debounce(const Duration(milliseconds: 500)),
    );
  }

  EventTransformer<T> debounce<T>(Duration duration) {
    return (events, mapper) => events.debounceTime(duration).flatMap(mapper);
  }
}
