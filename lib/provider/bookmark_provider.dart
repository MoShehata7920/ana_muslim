import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class BookmarkData extends ChangeNotifier {
  final logger = Logger();
  // Data structure to store page-level bookmarks
  final Map<int, Set<int>> _bookmarkedPages = {};

  // Function to toggle bookmark status for a specific page
  void toggleBookmark(int pageNumber) {
    if (_bookmarkedPages.containsKey(pageNumber)) {
      _bookmarkedPages.remove(pageNumber);
      logger.i("unBookmarked page: $pageNumber");
    } else {
      _bookmarkedPages[pageNumber] = {pageNumber};
      logger.i("bookmarked page: $pageNumber");
    }

    notifyListeners();
  }

  // Function to check if a page is bookmarked
  bool isPageBookmarked(int pageNumber) {
    return _bookmarkedPages.containsKey(pageNumber);
  }

  // Function to get all bookmarked pages for a specific page number
  Set<int>? getBookmarkedPages() {
    Set<int> allBookmarkedPages = {};

    _bookmarkedPages.forEach((pageNumber, pages) {
      allBookmarkedPages.addAll(pages);
    });

    logger.i('All bookmarked pages: $allBookmarkedPages');

    return allBookmarkedPages.isNotEmpty ? allBookmarkedPages : null;
  }
}
