import '../models/contact_info.dart';

class ContactService {
  // Singleton pattern
  static final ContactService _instance = ContactService._internal();
  factory ContactService() => _instance;
  ContactService._internal();

  // Get all contact information
  List<ContactInfo> getContactInfo() {
    return [
      ContactInfo(
        type: 'email',
        label: 'Email',
        value: 'contact@justk.com',
        icon: 'email',
        url: 'mailto:contact@justk.com',
      ),
      ContactInfo(
        type: 'instagram',
        label: 'Instagram',
        value: '@just_k_official',
        icon: 'instagram',
        url: 'https://instagram.com/just_k_official',
      ),
      ContactInfo(
        type: 'twitter',
        label: 'Twitter',
        value: '@just_k',
        icon: 'twitter',
        url: 'https://twitter.com/just_k',
      ),
      ContactInfo(
        type: 'github',
        label: 'GitHub',
        value: 'just-k',
        icon: 'github',
        url: 'https://github.com/just-k',
      ),
    ];
  }

  // Get contact by type
  ContactInfo? getContactByType(String type) {
    try {
      return getContactInfo().firstWhere((contact) => contact.type == type);
    } catch (e) {
      return null;
    }
  }
}
