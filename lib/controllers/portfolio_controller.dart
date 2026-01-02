import 'package:flutter/material.dart';
import '../models/portfolio_item.dart';
import '../services/portfolio_service.dart';

class PortfolioController extends ChangeNotifier {
  final PortfolioService _portfolioService = PortfolioService();

  String _selectedCategory = 'COSPLAY';
  int? _selectedImageIndex;
  bool _isLoading = false;
  List<PortfolioItem> _portfolioItems = [];

  // Getters
  String get selectedCategory => _selectedCategory;
  int? get selectedImageIndex => _selectedImageIndex;
  bool get isLoading => _isLoading;
  List<PortfolioItem> get portfolioItems => _portfolioItems;
  List<String> get categories => _portfolioService.categories;

  // Constructor
  PortfolioController() {
    loadPortfolioItems();
  }

  // Load portfolio items
  Future<void> loadPortfolioItems() async {
    _isLoading = true;
    notifyListeners();

    try {
      _portfolioItems = _portfolioService.getPortfolioByCategory(
        _selectedCategory,
      );
    } catch (e) {
      debugPrint('Error loading portfolio items: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  // Change selected category
  void selectCategory(String category) {
    if (_selectedCategory != category) {
      _selectedCategory = category;
      _selectedImageIndex = null;
      loadPortfolioItems();
    }
  }

  // Select image
  void selectImage(int? index) {
    _selectedImageIndex = index;
    notifyListeners();
  }

  // Clear selection
  void clearSelection() {
    _selectedImageIndex = null;
    notifyListeners();
  }
}
