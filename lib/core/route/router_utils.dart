enum Pages { home, favourite, bookDetails, categories, filteredCategory }

extension AppPageExtension on Pages {
  String get screenPath {
    return switch (this) {
      Pages.home => '/',
      Pages.favourite => '/favourite',
      Pages.bookDetails => '/bookDetails',
      Pages.categories => '/categories',
      Pages.filteredCategory => '/filteredCategory',
    };
  }

  String get screenName {
    return switch (this) {
      Pages.home => 'Home',
      Pages.favourite => 'Favourite',
      Pages.bookDetails => 'Book details',
      Pages.categories => 'Categories',
      Pages.filteredCategory => 'Filtered category',
    };
  }
}
