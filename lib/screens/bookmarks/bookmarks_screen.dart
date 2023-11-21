import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:ana_muslim/provider/bookmark_provider.dart';
import 'package:ana_muslim/resources/routes_manager.dart';

class BookmarksScreen extends StatelessWidget {
  const BookmarksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bookmarkData = Provider.of<BookmarkData>(context);

    Set<int> bookmarkedPages = bookmarkData.getBookmarkedPages() ?? {};

    return Scaffold(
      backgroundColor: Colors.amber,
      appBar: AppBar(
        title: const Text('Bookmarks'),
      ),
      body: ListView.builder(
        itemCount: bookmarkedPages.length,
        itemBuilder: (context, index) {
          int pageNumber = bookmarkedPages.elementAt(index);

          return ListTile(
            title: Text('Page $pageNumber'),
            onTap: () {
              Navigator.pushNamed(context, Routes.suraRoute,
                  arguments: pageNumber.toString());
            },
          );
        },
      ),
    );
  }
}
