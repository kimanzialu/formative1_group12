
class EventModel {
  final String id;
  final String title;
  final String description;
  final DateTime date;
  final String location;
  final String category;
  final String imagePath;
  int attendeeCount;
  int interestedCount;
  bool isRsvpd;
  bool isInterested;

  EventModel({
    required this.id,
    required this.title,
    required this.description,
    required this.date,
    required this.location,
    required this.category,
    required this.imagePath,
    this.attendeeCount = 0,
    this.interestedCount = 0,
    this.isRsvpd = false,
    this.isInterested = false,
  });
}
