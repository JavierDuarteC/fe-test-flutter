import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test/data/models/university.dart';
import 'package:test/presentation/bloc/universities_bloc.dart';
import 'package:test/presentation/bloc/universities_event.dart';
import 'package:test/presentation/bloc/universities_state.dart';
import 'package:test/presentation/pages/university_detail.dart';

class UniversitiesPage extends StatelessWidget {
  static const routeName = '/';

  const UniversitiesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<UniversitiesBloc>().add(const OnLoad());
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Universities',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: BlocBuilder<UniversitiesBloc, UniversitiesState>(
          builder: (context, state) {
            if (state is UniversitiesLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is UniversitiesHasDataAsList) {
              return Column(
                children: [
                  TextButton(
                    onPressed: () {
                      context
                          .read<UniversitiesBloc>()
                          .add(const OnChangeLayout(isList: false));
                    },
                    child: const Text('View as Grid'),
                  ),
                  const SizedBox(height: 32.0),
                  Expanded(
                    child: ListView.separated(
                      key: const Key('universities-listview'),
                      itemBuilder: (context, index) => TextButton(
                        onPressed: () {
                          _navigateToDetail(context, state.result[index]);
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Text(
                            state.result[index].name,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 18.0,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                      separatorBuilder: (context, _) => const Divider(),
                      itemCount: state.result.length,
                    ),
                  ),
                ],
              );
            } else if (state is UniversitiesHasDataAsGrid) {
              return Column(
                children: [
                  TextButton(
                    onPressed: () {
                      context
                          .read<UniversitiesBloc>()
                          .add(const OnChangeLayout(isList: true));
                    },
                    child: const Text('View as List'),
                  ),
                  const SizedBox(height: 32.0),
                  Expanded(
                    child: GridView.count(
                      key: const Key('universities-gridview'),
                      crossAxisCount: 2,
                      children: List.generate(state.result.length, (index) {
                        return GestureDetector(
                          onTap: () {
                            _navigateToDetail(context, state.result[index]);
                          },
                          child: Container(
                            margin: const EdgeInsets.all(8.0),
                            color: Colors.green[400],
                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  state.result[index].name,
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ),
                        );
                      }),
                    ),
                  ),
                ],
              );
            } else if (state is UniversitiesError) {
              return const Center(
                child: Text('Something went wrong!'),
              );
            } else {
              return const SizedBox();
            }
          },
        ),
      ),
    );
  }

  void _navigateToDetail(BuildContext context, University university) {
    Navigator.pushNamed(
      context,
      UniversityDetail.routeName,
      arguments: UniversityDetailArguments(university),
    );
  }
}
