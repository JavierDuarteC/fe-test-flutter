import 'package:flutter/material.dart';
import 'package:test/data/models/university.dart';

class UniversityDetailArguments {
  final University university;

  UniversityDetailArguments(this.university);
}

class UniversityDetail extends StatelessWidget {
  static const routeName = '/detail';

  const UniversityDetail({super.key});

  @override
  Widget build(BuildContext context) {
    final arguments =
        ModalRoute.of(context)!.settings.arguments as UniversityDetailArguments;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          arguments.university.name,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              arguments.university.name,
              textAlign: TextAlign.center,
              style:
                  const TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 16,
            ),
            Container(
              alignment: Alignment.centerLeft,
              child: const Text(
                'Location:',
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  arguments.university.country ?? '',
                  style: const TextStyle(
                      fontSize: 16.0, fontWeight: FontWeight.bold),
                ),
                Text(
                  arguments.university.alphaTwoCode ?? '',
                  style: const TextStyle(
                      fontSize: 16.0, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Container(
              alignment: Alignment.centerLeft,
              child: Text(
                arguments.university.stateProvince ?? '',
                style: const TextStyle(
                  fontSize: 16.0,
                ),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            ExpansionTile(
              title: const Text('Domains'),
              tilePadding: const EdgeInsets.all(0),
              children: [
                ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: arguments.university.domains?.length ?? 0,
                  itemBuilder: (context, domainIndex) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      arguments.university.domains![domainIndex],
                    ),
                  ),
                  separatorBuilder: (context, _) => const Divider(
                    color: Colors.lightGreen,
                    height: 8,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            ExpansionTile(
              title: const Text('Web Pages'),
              tilePadding: const EdgeInsets.all(0),
              children: [
                ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: arguments.university.webPages?.length ?? 0,
                  itemBuilder: (context, webIndex) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      arguments.university.webPages![webIndex],
                    ),
                  ),
                  separatorBuilder: (context, _) => const Divider(
                    color: Colors.lightGreen,
                    height: 8,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
