import 'package:flutter/material.dart';
import 'package:alu_pulse/event/event_card.dart';
import 'mock_events.dart';
import 'event_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late List<EventModel> _events;

  @override
  void initState() {
    super.initState();
    // copy list reference; EventModel is now mutable for RSVP flag
    _events = List<EventModel>.from(mockEvents);
  }

  void _toggleRsvp(String id) {
    setState(() {
      final idx = _events.indexWhere((e) => e.id == id);
      if (idx != -1) {
        _events[idx].isRsvped = !_events[idx].isRsvped;
      }
    });
  }

  void _showAddEventModal(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    final titleCtrl = TextEditingController();
    final organizerCtrl = TextEditingController();
    final locationCtrl = TextEditingController();
    final dateCtrl = TextEditingController();
    String category = 'Workshop';

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (ctx) {
        return DraggableScrollableSheet(
          initialChildSize: 0.6,
          maxChildSize: 0.95,
          minChildSize: 0.4,
          builder: (context, scrollController) {
            return Container(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
              decoration: const BoxDecoration(
                color: Color(0xFF121216),
                borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
              ),
              child: SingleChildScrollView(
                controller: scrollController,
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 4),
                      Center(
                        child: Container(
                          width: 48,
                          height: 4,
                          decoration: BoxDecoration(
                            color: Colors.white12,
                            borderRadius: BorderRadius.circular(2),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        'Create Event',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 12),
                      TextFormField(
                        controller: titleCtrl,
                        style: const TextStyle(color: Colors.white),
                        decoration: const InputDecoration(
                          labelText: 'Title',
                          labelStyle: TextStyle(color: Colors.white70),
                          filled: true,
                          fillColor: Color(0xFF1E1E2A),
                        ),
                        validator: (v) => (v == null || v.trim().isEmpty)
                            ? 'Please enter a title'
                            : null,
                      ),
                      const SizedBox(height: 12),
                      DropdownButtonFormField<String>(
                        value: category,
                        decoration: const InputDecoration(
                          labelText: 'Category',
                          labelStyle: TextStyle(color: Colors.white70),
                          filled: true,
                          fillColor: Color(0xFF1E1E2A),
                        ),
                        items: const [
                          DropdownMenuItem(
                            value: 'Workshop',
                            child: Text('Workshop'),
                          ),
                          DropdownMenuItem(
                            value: 'Competition',
                            child: Text('Competition'),
                          ),
                          DropdownMenuItem(
                            value: 'Campaign',
                            child: Text('Campaign'),
                          ),
                          DropdownMenuItem(value: 'Club', child: Text('Club')),
                          DropdownMenuItem(
                            value: 'Incubator',
                            child: Text('Incubator'),
                          ),
                        ],
                        onChanged: (v) => category = v ?? 'Workshop',
                      ),
                      const SizedBox(height: 12),
                      TextFormField(
                        controller: organizerCtrl,
                        style: const TextStyle(color: Colors.white),
                        decoration: const InputDecoration(
                          labelText: 'Organizer',
                          labelStyle: TextStyle(color: Colors.white70),
                          filled: true,
                          fillColor: Color(0xFF1E1E2A),
                        ),
                      ),
                      const SizedBox(height: 12),
                      TextFormField(
                        controller: dateCtrl,
                        style: const TextStyle(color: Colors.white),
                        readOnly: true,
                        decoration: const InputDecoration(
                          labelText: 'Date',
                          labelStyle: TextStyle(color: Colors.white70),
                          filled: true,
                          fillColor: Color(0xFF1E1E2A),
                        ),
                        onTap: () async {
                          final now = DateTime.now();
                          final picked = await showDatePicker(
                            context: context,
                            initialDate: now,
                            firstDate: DateTime(now.year - 1),
                            lastDate: DateTime(now.year + 3),
                            builder: (context, child) => Theme(
                              data: Theme.of(context).copyWith(
                                colorScheme: const ColorScheme.dark(
                                  primary: Color(0xffFF6B00),
                                  onPrimary: Colors.white,
                                  surface: Color(0xFF1E1E2A),
                                  onSurface: Colors.white,
                                ),
                                dialogBackgroundColor: const Color(0xFF121216),
                              ),
                              child: child!,
                            ),
                          );
                          if (picked != null) {
                            dateCtrl.text =
                                '${picked.year}-${picked.month.toString().padLeft(2, '0')}-${picked.day.toString().padLeft(2, '0')}';
                          }
                        },
                      ),
                      const SizedBox(height: 12),
                      TextFormField(
                        controller: locationCtrl,
                        style: const TextStyle(color: Colors.white),
                        decoration: const InputDecoration(
                          labelText: 'Location',
                          labelStyle: TextStyle(color: Colors.white70),
                          filled: true,
                          fillColor: Color(0xFF1E1E2A),
                        ),
                      ),
                      const SizedBox(height: 20),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xffFF6B00),
                            padding: const EdgeInsets.symmetric(vertical: 14),
                          ),
                          onPressed: () {
                            if (_formKey.currentState?.validate() ?? false) {
                              final newEvent = EventModel(
                                id: DateTime.now().millisecondsSinceEpoch
                                    .toString(),
                                title: titleCtrl.text.trim(),
                                category: category,
                                date: dateCtrl.text.isNotEmpty
                                    ? dateCtrl.text
                                    : 'TBD',
                                location: locationCtrl.text.trim().isNotEmpty
                                    ? locationCtrl.text.trim()
                                    : 'TBD',
                                imageUrl: 'https://unsplash.com',
                                isFeatured: false,
                                organizer: organizerCtrl.text.trim().isNotEmpty
                                    ? organizerCtrl.text.trim()
                                    : 'Organizer',
                              );
                              setState(() {
                                _events.insert(0, newEvent);
                              });
                              Navigator.of(context).pop();
                            }
                          },
                          child: const Text(
                            'Publish Event',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final featuredEvents = _events.where((e) => e.isFeatured).toList();
    final latestOpportunities = _events.where((e) => !e.isFeatured).toList();

    return Scaffold(
      backgroundColor: const Color(0xff0F0F16),
      appBar: AppBar(
        backgroundColor: const Color(0xff0F0F16),
        elevation: 0,
        title: const Text(
          'ALU Intercampus',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.notifications_none_outlined,
              color: Colors.white,
            ),
            onPressed: () {},
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xffFF6B00), // ALU Orange
        foregroundColor: Colors.white,
        child: const Icon(Icons.add),
        onPressed: () => _showAddEventModal(context),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 8),
            const Text(
              'Hi, Friend!',
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
            const Text(
              'Explore What\'s Happening',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Featured Events',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    'View all',
                    style: TextStyle(color: Color(0xffFF6B00)),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            SizedBox(
              height: 250,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                itemCount: featuredEvents.length,
                itemBuilder: (context, index) {
                  final ev = featuredEvents[index];
                  return EventCard(
                    event: ev,
                    isHorizontal: true,
                    onToggleRsvp: () => _toggleRsvp(ev.id),
                  );
                },
              ),
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Latest Opportunities',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    'View all',
                    style: TextStyle(color: Color(0xffFF6B00)),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: latestOpportunities.length,
              itemBuilder: (context, index) {
                final ev = latestOpportunities[index];
                return EventCard(
                  event: ev,
                  isHorizontal: false,
                  onToggleRsvp: () => _toggleRsvp(ev.id),
                );
              },
            ),
            const SizedBox(
              height: 80,
            ), // Padding so FAB doesn't cover last item
          ],
        ),
      ),
    );
  }
}
