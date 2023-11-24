import 'package:ana_muslim/resources/strings_manager.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

import 'package:ana_muslim/provider/bookmark_provider.dart';
import 'package:ana_muslim/resources/assets_manager.dart';
import 'package:ana_muslim/resources/icons_manager.dart';
import 'package:ana_muslim/resources/routes_manager.dart';
import 'package:ana_muslim/service/animation.dart';
import 'package:ana_muslim/service/utils.dart';
import 'package:ana_muslim/widgets/bookmark_widget.dart';

class BookmarksScreen extends StatefulWidget {
  const BookmarksScreen({super.key});

  @override
  State<BookmarksScreen> createState() => _BookmarksScreenState();
}

class _BookmarksScreenState extends State<BookmarksScreen> {
  late Set<int> bookmarkedPages;

  @override
  void initState() {
    super.initState();
    loadBookmarkedPages();
  }

  Future<void> loadBookmarkedPages() async {
    final bookmarkData = Provider.of<BookmarkData>(context, listen: false);
    bookmarkedPages = bookmarkData.getBookmarkedPages() ?? {};
    setState(() {}); // Update the UI after loading bookmarks
  }

  @override
  Widget build(BuildContext context) {
    String scaffoldBackground = Utils(context).scaffoldBackgroundImage;
    Color textColor = Utils(context).textColor;

    return Stack(
      children: [
        Image.asset(
          scaffoldBackground,
          width: double.infinity,
          fit: BoxFit.cover,
        ),
        Scaffold(
          appBar: AppBar(
            title: Text(
              AppStrings.bookmarks,
              style: Theme.of(context).textTheme.bodyMedium,
            ).animateOnPageLoad(
                msDelay: 150, dx: 0.0, dy: -200.0, showDelay: 900),
            leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(AppIcons.backArrow, color: textColor)),
          ),
          body: bookmarkedPages.isEmpty
              ? Center(child: Lottie.asset(JsonAssets.empty))
              : bookmarkScreenBody(context),
        ),
      ],
    );
  }

  Widget bookmarkScreenBody(BuildContext context) {
    final bookmarkData = Provider.of<BookmarkData>(context);
    Set<int> bookmarkedPages = bookmarkData.getBookmarkedPages() ?? {};

    return Padding(
      padding: const EdgeInsets.only(top: 30.0),
      child: ListView.builder(
        itemCount: bookmarkedPages.length,
        itemBuilder: (context, index) {
          int pageNumber = bookmarkedPages.elementAt(index);

          return ListTile(
            title: Text(
              '$pageNumber :${AppStrings.page}',
              style: Theme.of(context).textTheme.bodyMedium,
            ).animateOnPageLoad(
                msDelay: 150, dx: -100.0, dy: 0.0, showDelay: 900),
            contentPadding: const EdgeInsets.symmetric(horizontal: 30),
            onTap: () {
              Navigator.pushNamed(context, Routes.suraRoute,
                  arguments: pageNumber.toString());
            },
            leading: const Icon(
              AppIcons.page,
              size: 25,
            ).animateOnPageLoad(
                msDelay: 150, dx: -100.0, dy: 0.0, showDelay: 900),
            trailing: BookmarkButton(pageNumber).animateOnPageLoad(
                msDelay: 150, dx: 100.0, dy: 0.0, showDelay: 900),
          );
        },
      ),
    );
  }
}
