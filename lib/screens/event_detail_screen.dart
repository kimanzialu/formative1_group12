import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import 'event_model.dart';

class EventDetailScreen extends StatefulWidget {
  final EventModel event;

  const EventDetailScreen({super.key, required this.event});

  @override
  State<EventDetailScreen> createState() => _EventDetailScreenState();
}

class _EventDetailScreenState extends State<EventDetailScreen> {
  @override
  Widget build(BuildContext context) {
    final event = widget.event;

    return Scaffold(
      backgroundColor: AppTheme.navy,
      appBar: AppBar(
        title: const Text('Event Details'),
        backgroundColor: AppTheme.navy,
        elevation: 0,
        scrolledUnderElevation: 0,
        surfaceTintColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: AppTheme.gold,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Text(
                    event.category,
                    style: const TextStyle(
                      color: AppTheme.navy,
                      fontSize: 11,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                if (event.isFeatured) ...[
                  const SizedBox(width: 8),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(6),
                      border: Border.all(color: AppTheme.gold),
                    ),
                    child: const Text(
                      'Featured',
                      style: TextStyle(
                        color: AppTheme.gold,
                        fontSize: 11,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ],
            ),

            const SizedBox(height: 16),

            Text(
              event.title,
              style: const TextStyle(
                color: AppTheme.white,
                fontSize: 22,
                fontWeight: FontWeight.w700,
                height: 1.3,
              ),
            ),

            const SizedBox(height: 20),

            _infoRow(Icons.people, 'Organizer', event.organizer),
            const SizedBox(height: 12),
            _infoRow(Icons.calendar_month, 'Date', event.date),
            const SizedBox(height: 12),
            _infoRow(Icons.location_on, 'Location', event.location),

            const SizedBox(height: 28),

            Container(
              height: 1,
              color: AppTheme.borderBlue,
            ),

            const SizedBox(height: 28),


            const Text(
              'ABOUT',
              style: TextStyle(
                color: AppTheme.mutedText,
                fontSize: 11,
                fontWeight: FontWeight.w700,
                letterSpacing: 1.2,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'This is an ALU community event open to all students. '
              'Join us for an engaging session that brings together students '
              'across campuses to collaborate, learn, and grow together.',
              style: TextStyle(
                color: AppTheme.softWhite,
                fontSize: 14,
                height: 1.6,
              ),
            ),

            const SizedBox(height: 32),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    event.isRsvped = !event.isRsvped;
                  });
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        event.isRsvped
                            ? 'You\'re going to ${event.title}!'
                            : 'RSVP cancelled',
                      ),
                      backgroundColor: event.isRsvped
                          ? AppTheme.gold
                          : AppTheme.borderBlue,
                      duration: const Duration(seconds: 2),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      event.isRsvped ? AppTheme.borderBlue : AppTheme.gold,
                  foregroundColor:
                      event.isRsvped ? AppTheme.white : AppTheme.navy,
                  elevation: 0,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: event.isRsvped
                        ? const BorderSide(color: AppTheme.borderBlue)
                        : BorderSide.none,
                  ),
                ),
                child: Text(
                  event.isRsvped ? 'Cancel RSVP' : 'RSVP to this event',
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _infoRow(IconData icon, String label, String value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, color: AppTheme.gold, size: 18),
        const SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: const TextStyle(
                color: AppTheme.mutedText,
                fontSize: 11,
                fontWeight: FontWeight.w600,
                letterSpacing: 0.5,
              ),
            ),
            const SizedBox(height: 2),
            Text(
              value,
              style: const TextStyle(
                color: AppTheme.white,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ],
    );
  }
}