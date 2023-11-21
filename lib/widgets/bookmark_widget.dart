import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:ana_muslim/provider/bookmark_provider.dart';
import 'package:ana_muslim/resources/icons_manager.dart';

class BookmarkButton extends StatefulWidget {
  final int pageNumber;

  const BookmarkButton(this.pageNumber, {Key? key}) : super(key: key);

  @override
  State<BookmarkButton> createState() => _BookmarkButtonState();
}

class _BookmarkButtonState extends State<BookmarkButton> {
  @override
  Widget build(BuildContext context) {
    final bookmarkData = Provider.of<BookmarkData>(context);

    return IconButton(
      icon: Icon(
        bookmarkData.isPageBookmarked(widget.pageNumber)
            ? AppIcons.bookmarked
            : AppIcons.notBookmarked,
        color: bookmarkData.isPageBookmarked(widget.pageNumber)
            ? Colors.red
            : Colors.grey,
      ),
      onPressed: () {
        bookmarkData.toggleBookmark(widget.pageNumber);
        setState(() {});
      },
    );
  }
}
