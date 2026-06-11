class EventModel {
  final String id;
  final String title;
  final String description;
  final String category;
  final DateTime date;
  final String location;
  final String imageUrl;
  final bool isFeatured;
  final String organizer;
  bool isRsvped;
  int attendeeCount;
  int interestedCount;
  bool isInterested;

  EventModel({
    required this.id,
    required this.title,
    required this.description,
    required this.category,
    required this.date,
    required this.location,
    required this.imageUrl,
    required this.isFeatured,
    required this.organizer,
    this.isRsvped = false,
    this.attendeeCount=0,
    this.interestedCount=0,
    this.isInterested=false,
  });
}