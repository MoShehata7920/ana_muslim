import 'package:ana_muslim/resources/icons_manager.dart';
import 'package:ana_muslim/service/animation.dart';
import 'package:ana_muslim/service/utils.dart';
import 'package:ana_muslim/widgets/bookmark_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:ana_muslim/provider/bookmark_provider.dart';
import 'package:ana_muslim/resources/routes_manager.dart';

class BookmarksScreen extends StatelessWidget {
  const BookmarksScreen({super.key});

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
              "Bookmarks",
              style: Theme.of(context).textTheme.bodyMedium,
            ).animateOnPageLoad(
                msDelay: 150, dx: 0.0, dy: -200.0, showDelay: 900),
            leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(AppIcons.backArrow, color: textColor)),
          ),
          body: bookmarkScreenBody(context),
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
              'Page $pageNumber',
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
