class EventModel {
  final String id;
  final String title;
  final String category;
  final String date;
  final String location;
  final String imageUrl;
  final bool isFeatured;
  final String organizer;
  bool isRsvped;

  EventModel({
    required this.id,
    required this.title,
    required this.category,
    required this.date,
    required this.location,
    required this.imageUrl,
    required this.isFeatured,
    required this.organizer,
    this.isRsvped = false,
  });
}