import 'package:alu_pulse/patrick_event_details/event_post_screen.dart';
import 'package:flutter/material.dart';
import 'models/event_model.dart';
import 'event_details_screen.dart';

class EventsMainScreen extends StatelessWidget {
  const EventsMainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dummyEvent = EventModel(
      id: '1',
      title: 'AI for Social Impact Workshop',
      description: 'Learn how AI tools can be used to drive social impact in Africa. Hands-on session + group projects.',
      date: DateTime.now().add(const Duration(days: 2)),
      location: 'Mauritius Campus Innovation Lab',
      category: 'Workshop',
      imagePath: 'assets/image-1.png',
      attendeeCount: 48,
      interestedCount: 12,
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Events Dummy Home Screen'),
        backgroundColor: const Color(0xFF121B2A),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EventDetailsScreen(event: dummyEvent),
                  ),
                );
              },
              child: const Text('View Event Details Screen'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CreatePostScreen(),
                  ),
                );
              },
              child: const Text('View Create Post Screen'),
            ),
          ],
        ),
      ),
    );
  }
}