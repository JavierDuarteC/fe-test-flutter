import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test/presentation/bloc/universities_bloc.dart';
import 'package:test/presentation/bloc/universities_event.dart';
import 'package:test/presentation/bloc/universities_state.dart';

class UniversitiesPage extends StatelessWidget {
  const UniversitiesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Weather',
          style: TextStyle(color: Colors.orange),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            TextButton(
              onPressed: () {
                context.read<UniversitiesBloc>().add(const OnLoad(0, 0));
              },
              child: const Text('Load Universities'),
            ),
            const SizedBox(height: 32.0),
            BlocBuilder<UniversitiesBloc, UniversitiesState>(
              builder: (context, state) {
                if (state is UniversitiesLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is UniversitiesHasData) {
                  return Expanded(
                    child: ListView.separated(
                      key: const Key('universities-listview'),
                      itemBuilder: (context, index) => Column(
                        children: [
                          Text(
                            state.result[index].name,
                            style: const TextStyle(
                              fontSize: 22.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            state.result[index].country ?? '',
                            style: const TextStyle(
                              fontSize: 20.0,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                state.result[index].stateProvince ?? '',
                              ),
                              Text(
                                state.result[index].alphaTwoCode ?? '',
                              ),
                            ],
                          ),
                          ExpansionTile(
                            title: const Text('Domains'),
                            children: [
                              ListView.separated(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount:
                                    state.result[index].domains?.length ?? 0,
                                itemBuilder: (context, domainIndex) => Text(
                                  state.result[index].domains![domainIndex],
                                ),
                                separatorBuilder: (context, _) => const Divider(
                                  color: Colors.black26,
                                ),
                              ),
                            ],
                          ),
                          ExpansionTile(
                            title: const Text('Web Pages'),
                            children: [
                              ListView.separated(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount:
                                    state.result[index].webPages?.length ?? 0,
                                itemBuilder: (context, webIndex) => Text(
                                  state.result[index].webPages![webIndex],
                                ),
                                separatorBuilder: (context, _) => const Divider(
                                  color: Colors.black26,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      separatorBuilder: (context, _) => const Divider(),
                      itemCount: 20,
                    ),
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
          ],
        ),
      ),
    );
  }
}
