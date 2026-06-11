import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../data/mock_events.dart';
import '../models/event_model.dart';
import '../widgets/category_chip.dart';
import '../widgets/filter_widget.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({super.key});

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  final TextEditingController _searchController = TextEditingController();

final List<Map<String, dynamic>> _categories = [
    {'label': 'All', 'icon': Icons.grid_view},
    {'label': 'Events', 'icon': Icons.calendar_month},
    {'label': 'Workshops', 'icon': Icons.laptop_mac},
    {'label': 'Clubs', 'icon': Icons.people},
    {'label': 'Competitions', 'icon': Icons.military_tech},
    {'label': 'Opportunities', 'icon': Icons.rocket_launch},
    {'label': 'Online', 'icon': Icons.wifi},
  ];
  String _selectedCategory = 'All';

  final List<String> _campusOptions = [
    'All Campuses',
    'Kigali',
    'Mauritius',
    'Online',
  ];
  String _selectedCampus = 'All Campuses';

  String _searchQuery = '';

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  List<EventModel> get _filteredEvents {
    return mockEvents.where((event) {
      final matchesSearch = _searchQuery.isEmpty ||
          event.title.toLowerCase().contains(_searchQuery.toLowerCase()) ||
          event.organizer.toLowerCase().contains(_searchQuery.toLowerCase()) ||
          event.category.toLowerCase().contains(_searchQuery.toLowerCase());

      final matchesCategory = _selectedCategory == 'All' ||
          event.category
              .toLowerCase()
              .contains(_selectedCategory.toLowerCase());

      final matchesCampus = _selectedCampus == 'All Campuses' ||
          event.location
              .toLowerCase()
              .contains(_selectedCampus.toLowerCase());

      return matchesSearch && matchesCategory && matchesCampus;
    }).toList();
  }

  void _showFilterSheet() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (_) => FilterWidget(
        selectedCampus: _selectedCampus,
        campusOptions: _campusOptions,
        onClose: () => Navigator.pop(context),
        onCampusSelected: (campus) {
          setState(() => _selectedCampus = campus);
        },
        onClearAll: () {
          setState(() {
            _selectedCampus = 'All Campuses';
            _selectedCategory = 'All';
            _searchQuery = '';
            _searchController.clear();
          });
          Navigator.pop(context);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final results = _filteredEvents;

    return Scaffold(
      backgroundColor: AppTheme.navy,
      appBar: AppBar(
        title: const Text('Explore'),
        actions: [
          Stack(
            alignment: Alignment.topRight,
            children: [
              IconButton(
                icon: const Icon(Icons.tune, color: AppTheme.white),
                onPressed: _showFilterSheet,
              ),
              if (_selectedCampus != 'All Campuses')
                Positioned(
                  top: 10,
                  right: 10,
                  child: Container(
                    width: 8,
                    height: 8,
                    decoration: const BoxDecoration(
                      color: AppTheme.gold,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
            ],
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
            child: Container(
              decoration: BoxDecoration(
                color: AppTheme.cardNavy,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: AppTheme.borderBlue),
              ),
              child: TextField(
                controller: _searchController,
                onChanged: (val) => setState(() => _searchQuery = val.trim()),
                style: const TextStyle(color: AppTheme.white, fontSize: 15),
                decoration: InputDecoration(
                  hintText: 'Search events, clubs, opportunities...',
                  hintStyle: const TextStyle(
                      color: AppTheme.mutedText, fontSize: 14),
                  prefixIcon: const Icon(Icons.search,
                      color: AppTheme.mutedText, size: 20),
                  suffixIcon: _searchQuery.isNotEmpty
                      ? IconButton(
                          icon: const Icon(Icons.close,
                              color: AppTheme.mutedText, size: 18),
                          onPressed: () {
                            setState(() {
                              _searchQuery = '';
                              _searchController.clear();
                            });
                          },
                        )
                      : null,
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.symmetric(vertical: 14),
                ),
              ),
            ),
          ),
          const SizedBox(height: 14),
          SizedBox(
            height: 38,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: _categories.length,
              separatorBuilder: (_, __) => const SizedBox(width: 8),
              itemBuilder: (context, index) {
                final cat = _categories[index];
                return CategoryChipWidget(
                  label: cat['label'],
                  icon: cat['icon'],
                  isSelected: _selectedCategory == cat['label'],
                  onTap: () =>
                      setState(() => _selectedCategory = cat['label']),
                );
              },
            ),
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  _searchQuery.isNotEmpty
                      ? 'Results for "$_searchQuery"'
                      : _selectedCategory == 'All'
                          ? 'All Opportunities'
                          : _selectedCategory,
                  style: const TextStyle(
                    color: AppTheme.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '${results.length} found',
                  style: const TextStyle(
                    color: AppTheme.mutedText,
                    fontSize: 13,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          Expanded(
            child: results.isEmpty
                ? _buildEmptyState()
                : ListView.separated(
                    padding: const EdgeInsets.fromLTRB(16, 0, 16, 20),
                    itemCount: results.length,
                    separatorBuilder: (_, __) => const SizedBox(height: 12),
                    itemBuilder: (context, index) {
                      return _buildEventTile(results[index]);
                    },
                  ),
          ),
        ],
      ),
    );
  }

  Widget _buildEventTile(EventModel event) {
  return Container(
    padding: const EdgeInsets.all(16),
    decoration: BoxDecoration(
      color: AppTheme.cardNavy,
      borderRadius: BorderRadius.circular(16),
      border: Border.all(color: AppTheme.borderBlue),
    ),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            color: AppTheme.softNavy,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: AppTheme.borderBlue),
          ),
          child: Icon(
            _iconForCategory(event.category),
            color: AppTheme.gold,
            size: 22,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                decoration: BoxDecoration(
                  color: AppTheme.gold,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Text(
                  event.category,
                  style: const TextStyle(
                    color: AppTheme.navy,
                    fontSize: 11,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const SizedBox(height: 6),
              Text(
                event.title,
                style: const TextStyle(
                  color: AppTheme.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 6),
              Row(
                children: [
                  const Icon(Icons.calendar_today,
                      color: AppTheme.mutedText, size: 12),
                  const SizedBox(width: 4),
                  Expanded(
                    child: Text(
                      event.date,
                      style: const TextStyle(
                          color: AppTheme.mutedText, fontSize: 12),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 3),
              Row(
                children: [
                  const Icon(Icons.location_on,
                      color: AppTheme.mutedText, size: 12),
                  const SizedBox(width: 4),
                  Text(
                    event.location,
                    style: const TextStyle(
                        color: AppTheme.mutedText, fontSize: 12),
                  ),
                ],
              ),
            ],
          ),
        ),
        if (event.isRsvped)
          Container(
            margin: const EdgeInsets.only(left: 8),
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: AppTheme.gold,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: AppTheme.gold),
            ),
            child: const Text(
              'RSVP\'d',
              style: TextStyle(
                color: AppTheme.navy,
                fontSize: 10,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
      ],
    ),
  );
}

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.search_off_rounded,
              size: 64, color: AppTheme.borderBlue),
          const SizedBox(height: 16),
          const Text(
            'No results found',
            style: TextStyle(
              color: AppTheme.white,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'Try a different search or\nadjust your filters',
            textAlign: TextAlign.center,
            style: TextStyle(color: AppTheme.mutedText, fontSize: 14),
          ),
          const SizedBox(height: 20),
          GestureDetector(
            onTap: () {
              setState(() {
                _searchQuery = '';
                _searchController.clear();
                _selectedCategory = 'All';
                _selectedCampus = 'All Campuses';
              });
            },
            child: Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: BoxDecoration(
                color: AppTheme.gold,
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Text(
                'Clear filters',
                style: TextStyle(
                  color: AppTheme.navy,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  IconData _iconForCategory(String category) {
    switch (category.toLowerCase()) {
      case 'workshop':
        return Icons.build;
      case 'competition':
        return Icons.emoji_events;
      case 'campaign':
        return Icons.campaign;
      case 'club':
        return Icons.group;
      case 'internship':
        return Icons.work;
      case 'hackathon':
        return Icons.code;
      default:
        return Icons.event;
    }
  }
}