import '../models/portfolio_item.dart';

class PortfolioService {
  // Singleton pattern
  static final PortfolioService _instance = PortfolioService._internal();
  factory PortfolioService() => _instance;
  PortfolioService._internal();

  // Portfolio categories
  final List<String> categories = ['COSPLAY', 'PHOTOGRAPHY', 'DESIGN', 'ALL'];

  // Get portfolio items by category
  List<PortfolioItem> getPortfolioByCategory(String category) {
    // TODO: Implementasi fetch data dari API atau local storage
    // Untuk sementara return dummy data
    return _getDummyPortfolioItems()
        .where((item) => category == 'ALL' || item.category == category)
        .toList();
  }

  // Get all portfolio items
  List<PortfolioItem> getAllPortfolios() {
    return _getDummyPortfolioItems();
  }

  // Dummy data untuk contoh
  List<PortfolioItem> _getDummyPortfolioItems() {
    return [
      PortfolioItem(
        title: 'Cosplay Project 1',
        description: 'Amazing cosplay project',
        category: 'COSPLAY',
        tags: ['cosplay', 'anime'],
      ),
      PortfolioItem(
        title: 'Photography Work 1',
        description: 'Beautiful photography',
        category: 'PHOTOGRAPHY',
        tags: ['photo', 'nature'],
      ),
      PortfolioItem(
        title: 'Design Work 1',
        description: 'Creative design work',
        category: 'DESIGN',
        tags: ['design', 'ui/ux'],
      ),
    ];
  }
}
