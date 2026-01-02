import 'package:flutter/material.dart';
import '../models/contact_info.dart';
import '../services/contact_service.dart';

class ContactController extends ChangeNotifier {
  final ContactService _contactService = ContactService();

  List<ContactInfo> _contactInfo = [];
  bool _isLoading = false;
  String? _errorMessage;

  // Getters
  List<ContactInfo> get contactInfo => _contactInfo;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  // Constructor
  ContactController() {
    loadContactInfo();
  }

  // Load contact information
  Future<void> loadContactInfo() async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      _contactInfo = _contactService.getContactInfo();
    } catch (e) {
      _errorMessage = 'Failed to load contact information';
      debugPrint('Error loading contact info: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  // Get contact by type
  ContactInfo? getContactByType(String type) {
    return _contactService.getContactByType(type);
  }

  // Open contact URL (can be implemented with url_launcher)
  Future<void> openContactUrl(ContactInfo contact) async {
    // TODO: Implement url launcher
    debugPrint('Opening URL: ${contact.url}');
  }
}
