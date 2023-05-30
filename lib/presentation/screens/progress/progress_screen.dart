import 'package:flutter/material.dart';

class ProgressScreen extends StatelessWidget {
  const ProgressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Progress Indicators'),
      ),
      body: _ProgressView(),
    );
  }
}

class _ProgressView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const SizedBox(height: 30),
          const Text('Circular Progress indicator'),
          const SizedBox(height: 30),
          const CircularProgressIndicator(
            strokeWidth: 2,
            backgroundColor: Colors.black45,
          ),
          const SizedBox(height: 30),
          const Text('Circular and linear Progress indicator controlado'),
          const SizedBox(height: 30),
          _ControllerProgresIndicator(),
        ],
      ),
    );
  }
}

class _ControllerProgresIndicator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<double>(
        stream: Stream.periodic(const Duration(milliseconds: 300), (values) {
          return (values * 2) / 100;
        }).takeWhile((values) => values < 100),
        builder: (context, snapshot) {
          final progressValue = snapshot.data ?? 0;
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircularProgressIndicator(
                  value: progressValue,
                  strokeWidth: 2,
                  backgroundColor: Colors.black12,
                ),
                const SizedBox(
                  width: 20,
                ),
                Expanded(child: LinearProgressIndicator(value: progressValue)),
              ],
            ),
          );
        });
  }
}
