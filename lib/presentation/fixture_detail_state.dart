import 'package:flutter/material.dart';
import '../domain/model/fixture_model.dart';

class FixtureDetail extends StatefulWidget {
  final Fixture fixture;

  const FixtureDetail({
    super.key,
    required this.fixture
  });

  @override
  State<FixtureDetail> createState() {
    return _FixtureDetailState();
  }
}

class _FixtureDetailState extends State<FixtureDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 300,
              width: double.infinity,
              child: Image.network(widget.fixture.league?.logo ?? ''),
            ),
            const SizedBox(
              height: 4,
            ),
            Text(
              widget.fixture.probability.toString(),
              style: const TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
