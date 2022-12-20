import 'package:flutter/material.dart';
import '../../domain/model/fixture_model.dart';

class FixtureDetail extends StatefulWidget {
  const FixtureDetail({
    super.key
  });

  @override
  State<FixtureDetail> createState() {
    return _FixtureDetailState();
  }
}

class _FixtureDetailState extends State<FixtureDetail> {
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Fixture;

    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 300,
              width: double.infinity,
              child: Image.network(args.league?.logo ?? ''),
            ),
            const SizedBox(
              height: 4,
            ),
            Text(
              args.probability.toString(),
              style: const TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
