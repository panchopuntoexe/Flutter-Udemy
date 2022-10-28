import 'package:flutter/material.dart';

import '../theme/app_theme.dart';

class ListViewBuilderScreen extends StatefulWidget {
  const ListViewBuilderScreen({Key? key}) : super(key: key);

  @override
  State<ListViewBuilderScreen> createState() => _ListViewBuilderScreenState();
}

class _ListViewBuilderScreenState extends State<ListViewBuilderScreen> {
  final List<int> imageIds = List.generate(10, (index) => index);
  final ScrollController scrollController = ScrollController();
  bool isLoading = false;

  @override
  void initState() {
    super.initState();

    scrollController.addListener(() {
      if (scrollController.position.pixels + 500 >=
          scrollController.position.maxScrollExtent) {
        //add10();
        fetchData();
      }
    });
  }

  Future fetchData() async {
    if (isLoading) return;
    isLoading = true;
    setState(() {});
    await Future.delayed(const Duration(seconds: 3));
    add10();
    isLoading = false;
    setState(() {});

    if (scrollController.position.pixels + 120 <=
        scrollController.position.maxScrollExtent) {
      scrollController.animateTo(
        scrollController.position.pixels + 100,
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeOut,
      );
    }
  }

  void add10() {
    final lastid = imageIds.last;
    imageIds.addAll(List.generate(10, (index) => index + lastid));
    setState(() {});
  }

  Future<void> onRefresh() async {
    await Future.delayed(const Duration(seconds: 3));

    final lastid = imageIds.last;
    imageIds.clear();
    imageIds.add(lastid + 1);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      body: MediaQuery.removePadding(
        context: context,
        removeTop: true,
        removeBottom: true,
        child: Stack(
          children: [
            RefreshIndicator(
              color: AppTheme.primaryColor,
              onRefresh: onRefresh,
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                controller: scrollController,
                itemCount: imageIds.length,
                itemBuilder: (BuildContext context, int index) {
                  return FadeInImage(
                    width: double.infinity,
                    height: 300,
                    fit: BoxFit.cover,
                    placeholder: const AssetImage("assets/jar-loading.gif"),
                    image: NetworkImage(
                        'https://picsum.photos/500/300?image=${imageIds[index]}'),
                  );
                },
              ),
            ),
            if (isLoading)
              Positioned(
                  bottom: 40,
                  left: size.width * 0.5 - 30,
                  child: const _LoadingIcon())
          ],
        ),
      ),
    );
  }
}

class _LoadingIcon extends StatelessWidget {
  const _LoadingIcon({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      height: 60,
      width: 60,
      decoration: BoxDecoration(
        color: Colors.white10,
        borderRadius: BorderRadius.circular(100),
      ),
      child: const CircularProgressIndicator(
        color: AppTheme.primaryColor,
      ),
    );
  }
}
