
import 'package:crm_system/src/utilities/common_widget/custumScaffold.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';




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





class Dummy extends StatelessWidget {
  static String route ='dummy';

  @override
  Widget build(BuildContext context) {
    return CustumScaffold(
      
      
      body: Column(
        children: [
          // Header Section
          Consumer<PageSelectionProvider>(
            builder: (context, provider, child) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(3, (index) {
                  return GestureDetector(
                    onTap: () {
                      provider.setPage(index);
                    },
                    child: Container(
                      padding: EdgeInsets.all(10),
                      color: provider.currentPage == index
                          ? Colors.blue
                          : Colors.grey,
                      child: Text(
                        'Page ${index + 1}',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  );
                }),
              );
            },
          ),
          
          // PageView Section
          Expanded(
            child: Consumer<PageSelectionProvider>(
              builder: (context, provider, child) {
                return PageView.builder(
                  controller: PageController(initialPage: provider.currentPage),
                  itemCount: 3,
                  onPageChanged: (index) {
                    provider.setPage(index);
                  },
                  itemBuilder: (context, index) {
                    return Center(
                      child: Text(
                        'Content for Page ${index + 1}',
                        style: TextStyle(fontSize: 24),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
