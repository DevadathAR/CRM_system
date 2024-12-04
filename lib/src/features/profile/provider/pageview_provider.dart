import 'package:flutter/material.dart';

// class PageviewProvider extends ChangeNotifier {
//   final PageController _pageController = PageController();
//   int _selectedIndex = 2;

//   int get selectedIndex => _selectedIndex;
//   PageController get pageController => _pageController;

//   // Handle page change (for swiping)
//   void onPageChanged(int index) {
//     _selectedIndex = index;
//     notifyListeners(); // Notify listeners to update the UI
//   }

//   // Jump to the specific page and notify listeners
//   void jumpToPage(int index) {
//     if (_selectedIndex != index) {
//       _selectedIndex = index;
//       _pageController.animateToPage(index, duration: Duration(milliseconds: 300), curve: Curves.ease);
//       notifyListeners(); // Ensure UI updates when page changes
//     }
//   }
// }

class PageSelectionProvider with ChangeNotifier {
  int _currentPage = 0;

  int get currentPage => _currentPage;

  void setPage(int page) {
    if (_currentPage != page) {
      _currentPage = page;
      notifyListeners();
    }
  }
}