import 'package:flutter/material.dart';

const List<Map<String, dynamic>> cards = [
  {'elevation': 0.0, 'label': 'Elevation 0'},
  {'elevation': 1.0, 'label': 'Elevation 1'},
  {'elevation': 2.0, 'label': 'Elevation 2'},
  {'elevation': 3.0, 'label': 'Elevation 3'},
  {'elevation': 4.0, 'label': 'Elevation 4'},
  {'elevation': 5.0, 'label': 'Elevation 5'},
  {'elevation': 6.0, 'label': 'Elevation 6'},
  {'elevation': 7.0, 'label': 'Elevation 7'},
  {'elevation': 8.0, 'label': 'Elevation 8'},
];

class CardScreen extends StatelessWidget {
  const CardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cards  Screen'),
      ),
      body: const _CardsView(),
    );
  }
}

class _CardsView extends StatelessWidget {
  const _CardsView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ...cards.map(
            (cards) => _CardType1(
              elevation: cards['elevation'],
              label: cards['label'],
            ),
          ),
          ...cards.map(
            (cards) => _CardType2(
              elevation: cards['elevation'],
              label: cards['label'],
            ),
          ),
          ...cards.map(
            (cards) => _CardType3(
              elevation: cards['elevation'],
              label: cards['label'],
            ),
          ),
          ...cards.map(
            (cards) => _CardType4(
              elevation: cards['elevation'],
              label: cards['label'],
            ),
          ),
          const SizedBox(height: 30)
        ],
      ),
    );
  }
}

class _CardType1 extends StatelessWidget {
  final String label;
  final double elevation;

  const _CardType1({required this.label, required this.elevation});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Card(
        elevation: elevation,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 5, 10, 10),
          child: Column(
            children: [
              const Align(
                  alignment: Alignment.topRight,
                  child: Icon(Icons.more_vert_outlined)),
              Align(
                alignment: Alignment.bottomLeft,
                child: Text(label),
              )
            ],
          ),
        ));
  }
}

class _CardType2 extends StatelessWidget {
  final String label;
  final double elevation;

  const _CardType2({required this.label, required this.elevation});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    // TODO: implement build
    return Card(
        shape: RoundedRectangleBorder(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            side: BorderSide(color: colors.outline)),
        elevation: elevation,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 5, 10, 10),
          child: Column(
            children: [
              const Align(
                  alignment: Alignment.topRight,
                  child: Icon(Icons.more_vert_outlined)),
              Align(
                alignment: Alignment.bottomLeft,
                child: Text('$label - OUTLINE'),
              )
            ],
          ),
        ));
  }
}

class _CardType3 extends StatelessWidget {
  final String label;
  final double elevation;

  const _CardType3({required this.label, required this.elevation});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    // TODO: implement build
    return Card(
        color: colors.surfaceVariant,
        elevation: elevation,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 5, 10, 10),
          child: Column(
            children: [
              const Align(
                  alignment: Alignment.topRight,
                  child: Icon(Icons.more_vert_outlined)),
              Align(
                alignment: Alignment.bottomLeft,
                child: Text('$label - FILLED'),
              )
            ],
          ),
        ));
  }
}

class _CardType4 extends StatelessWidget {
  final String label;
  final double elevation;

  const _CardType4({required this.label, required this.elevation});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    // TODO: implement build
    return Card(
        clipBehavior: Clip.hardEdge,
        elevation: elevation,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 5, 10, 10),
          child: Stack(
            children: [
              Image.network(
                'https://picsum.photos/id/${elevation.toInt()}/600/250',
                height: 350,
                fit: BoxFit.cover,
              ),
              Align(
                  alignment: Alignment.topRight,
                  child: Container(
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(20))),
                      child: const Icon(Icons.more_vert_outlined))),
              Align(
                alignment: Alignment.bottomLeft,
                child: Container(
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                            BorderRadius.only(bottomLeft: Radius.circular(20))),
                    child: Text('$label - IMAGE')),
              )
            ],
          ),
        ));
  }
}
