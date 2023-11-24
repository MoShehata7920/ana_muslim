import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BookmarkData extends ChangeNotifier {
  final logger = Logger();
  SharedPreferences _prefs;

  // Constructor to initialize SharedPreferences
  BookmarkData(this._prefs);

  // Data structure to store page-level bookmarks
  final Map<int, Set<int>> _bookmarkedPages = {};

  // Function to toggle bookmark status for a specific page
  Future<void> toggleBookmark(int pageNumber) async {
    if (_bookmarkedPages.containsKey(pageNumber)) {
      _bookmarkedPages.remove(pageNumber);
      logger.i("Unbookmarked page: $pageNumber");
    } else {
      _bookmarkedPages[pageNumber] = {}; // Empty set for the page
      logger.i("Bookmarked page: $pageNumber");
    }

    await _updateBookmarksInPrefs();
    notifyListeners();
  }

  // Function to update bookmarks in SharedPreferences
  Future<void> _updateBookmarksInPrefs() async {
    await _prefs.setStringList(
      'bookmarkedPages',
      _bookmarkedPages.keys.map((pageNumber) => pageNumber.toString()).toList(),
    );
  }

  // Function to check if a page is bookmarked
  bool isPageBookmarked(int pageNumber) {
    return _bookmarkedPages.containsKey(pageNumber);
  }

  // Function to get all bookmarked pages
  Set<int>? getBookmarkedPages() {
    return _bookmarkedPages.keys.toSet();
  }

  Future<void> initializePrefs() async {
    _prefs = await SharedPreferences.getInstance();
    _loadBookmarkedPagesFromPrefs();
  }

  void _loadBookmarkedPagesFromPrefs() {
    final List<String>? savedPages = _prefs.getStringList('bookmarkedPages');
    if (savedPages != null) {
      _bookmarkedPages.clear();
      for (final pageNumberString in savedPages) {
        final pageNumber = int.tryParse(pageNumberString);
        if (pageNumber != null) {
          _bookmarkedPages[pageNumber] = {}; 
        }
      }
    }
  }
}
