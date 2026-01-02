class ContactInfo {
  final String type;
  final String label;
  final String value;
  final String? icon;
  final String? url;

  ContactInfo({
    required this.type,
    required this.label,
    required this.value,
    this.icon,
    this.url,
  });

  factory ContactInfo.fromJson(Map<String, dynamic> json) {
    return ContactInfo(
      type: json['type'] as String,
      label: json['label'] as String,
      value: json['value'] as String,
      icon: json['icon'] as String?,
      url: json['url'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'type': type,
      'label': label,
      'value': value,
      'icon': icon,
      'url': url,
    };
  }
}
