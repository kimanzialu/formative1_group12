import 'package:flutter/material.dart';
import '../models/event_model.dart';

class RsvpButton extends StatefulWidget {
  final EventModel event;

  const RsvpButton({super.key, required this.event});

  @override
  State<RsvpButton> createState() => _RsvpButtonState();
}

class _RsvpButtonState extends State<RsvpButton> {
  void _toggleRsvp() {
    setState(() {
      widget.event.isRsvpd = !widget.event.isRsvpd;
      if (widget.event.isRsvpd) {
        widget.event.attendeeCount++;
        if (widget.event.isInterested) {
          widget.event.isInterested = false;
          widget.event.interestedCount--;
        }
      } else {
        widget.event.attendeeCount--;
      }
    });
    
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(widget.event.isRsvpd? 'You have RSVP\'d to ${widget.event.title}!': 'You are no longer RSVP\'d.'),
        backgroundColor: widget.event.isRsvpd? Colors.green: Colors.grey,
        duration: const Duration(seconds: 2),
      ),
    );
  }

  void _toggleInterested() {
    setState(() {
      widget.event.isInterested = !widget.event.isInterested;
      if (widget.event.isInterested) {
        widget.event.interestedCount++;
        if (widget.event.isRsvpd) {
          widget.event.isRsvpd = false;
          widget.event.attendeeCount--;
        }
      } else {
        widget.event.interestedCount--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // Going and Interested counts
        Row(
          children: [
            const Icon(Icons.group, color: Colors.grey, size: 20),
            const SizedBox(width: 8),
            Text(
              '${widget.event.attendeeCount} going    ${widget.event.interestedCount} interested',
              style: const TextStyle(color: Colors.white70, fontSize: 16),
            ),
          ],
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: _toggleRsvp,
          style: ElevatedButton.styleFrom(
            backgroundColor: widget.event.isRsvpd ? Colors.green : const Color(0xFFF9A826), // Yellow from design
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(vertical: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: Text(
            widget.event.isRsvpd ? 'Going' : 'RSVP',
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(height: 12),
        OutlinedButton(
          onPressed: _toggleInterested,
          style: OutlinedButton.styleFrom(
            foregroundColor: widget.event.isInterested ? Colors.white : Colors.grey,
            backgroundColor: widget.event.isInterested ? Colors.grey[800] : Colors.transparent,
            side: BorderSide(
              color: widget.event.isInterested ? Colors.transparent : Colors.grey,
            ),
            padding: const EdgeInsets.symmetric(vertical: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: Text(
            widget.event.isInterested ? 'Interested' : 'Interested',
            style: const TextStyle(fontSize: 16),
          ),
        ),
      ],
    );
  }
}

