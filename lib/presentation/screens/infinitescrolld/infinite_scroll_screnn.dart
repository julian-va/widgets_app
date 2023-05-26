import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class InfiniteScrollSreen extends StatefulWidget {
  const InfiniteScrollSreen({super.key});

  @override
  State<InfiniteScrollSreen> createState() => _InfiniteScrollSreenState();
}

class _InfiniteScrollSreenState extends State<InfiniteScrollSreen> {
  List<int> imagesId = [1, 2, 3, 4, 5];
  final ScrollController scrollController = ScrollController();
  bool isLoading = false;
  bool isMounted = true;

  void addImages() {
    final lastId = imagesId.length;
    imagesId.addAll([1, 2, 3, 4, 5].map((e) => lastId + e));
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    scrollController.addListener(() {
      if ((scrollController.position.pixels + 500) >=
          scrollController.position.maxScrollExtent) {
        loadNextPage();
      }
    });
  }

  Future loadNextPage() async {
    if (isLoading) {
      return;
    }
    isLoading = true;
    setState(() {});
    await Future.delayed(const Duration(seconds: 2));
    addImages();
    isLoading = false;

    if (!isMounted) {
      return;
    }
    setState(() {});
  }

  Future<void> onRefresh() async {
    isLoading = true;
    setState(() {});
    await Future.delayed(const Duration(seconds: 3));
    if (!isMounted) {
      return;
    }
    isLoading = false;
    final lastId = imagesId.last;
    imagesId.clear();
    imagesId.add(lastId);
    addImages();
    setState(() {});
  }

  @override
  void dispose() {
    isMounted = false;
    scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('InfineScroll'),
      ),
      body: RefreshIndicator(
        onRefresh: onRefresh,
        edgeOffset: 10,
        strokeWidth: 2,
        child: ListView.builder(
          controller: scrollController,
          itemCount: imagesId.length,
          itemBuilder: (context, index) {
            return FadeInImage(
                fit: BoxFit.cover,
                width: double.infinity,
                height: 300,
                placeholder: const AssetImage('assets/images/jar-loading.gif'),
                image: NetworkImage(
                    'https://picsum.photos/id/${imagesId[index]}/500/300'));
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () => context.pop(),
          child: isLoading
              ? const CircularProgressIndicator()
              : const Icon(Icons.arrow_back_ios_new_outlined)),
    );
  }
}
