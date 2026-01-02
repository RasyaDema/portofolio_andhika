import 'package:flutter/material.dart';

class AboutController extends ChangeNotifier {
  // Profile data
  final String name = 'JUST_K';
  final String title = 'CONTENT CREATOR & DEVELOPER';
  final String bio = '''
I'm a passionate content creator and developer specializing in cosplay, photography, and digital design. 
With years of experience in bringing creative visions to life, I combine technical skills with artistic expression.
  ''';

  // Skills data
  final List<String> skills = [
    'Cosplay Creation',
    'Photography',
    'Video Editing',
    'UI/UX Design',
    'Flutter Development',
    'Content Creation',
  ];

  // Experience years
  final int experienceYears = 5;

  // Social stats
  int _followersCount = 10000;
  int _projectsCompleted = 150;
  int _awardsReceived = 12;

  // Getters
  int get followersCount => _followersCount;
  int get projectsCompleted => _projectsCompleted;
  int get awardsReceived => _awardsReceived;

  // Methods for updating stats (if needed)
  void updateFollowersCount(int count) {
    _followersCount = count;
    notifyListeners();
  }

  void updateProjectsCompleted(int count) {
    _projectsCompleted = count;
    notifyListeners();
  }

  void updateAwardsReceived(int count) {
    _awardsReceived = count;
    notifyListeners();
  }

  // Get skill by category
  List<String> getSkillsByCategory(String category) {
    // TODO: Implement skill categorization if needed
    return skills;
  }
}
