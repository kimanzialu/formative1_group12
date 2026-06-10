class EventModel {
  final String id;
  final String title;
  final String category; // e.g., 'Competition', 'Workshop', 'Club'
  final String date;
  final String location;
  final String imageUrl;
  final bool isFeatured;
  final String organizer;

  // Mutable RSVP flag so UI can toggle this on user action
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