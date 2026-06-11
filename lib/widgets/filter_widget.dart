import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class FilterWidget extends StatelessWidget {
  final String selectedCampus;
  final List<String> campusOptions;
  final VoidCallback onClose;
  final Function(String) onCampusSelected;
  final VoidCallback onClearAll;

  const FilterWidget({
    super.key,
    required this.selectedCampus,
    required this.campusOptions,
    required this.onClose,
    required this.onCampusSelected,
    required this.onClearAll,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppTheme.cardNavy,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
        border: Border.all(color: AppTheme.borderBlue),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: AppTheme.borderBlue,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Filter',
                style: TextStyle(
                  color: AppTheme.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                children: [
                  GestureDetector(
                    onTap: onClearAll,
                    child: const Text(
                      'Clear all',
                      style: TextStyle(
                        color: AppTheme.gold,
                        fontSize: 13,
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  GestureDetector(
                    onTap: onClose,
                    child: const Icon(Icons.close,
                        color: AppTheme.mutedText, size: 20),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 20),
          const Text(
            'CAMPUS',
            style: TextStyle(
              color: AppTheme.mutedText,
              fontSize: 12,
              fontWeight: FontWeight.w600,
              letterSpacing: 1.1,
            ),
          ),
          const SizedBox(height: 10),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: campusOptions.map((campus) {
              final isSelected = selectedCampus == campus;
              return GestureDetector(
                onTap: () => onCampusSelected(campus),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                    color: isSelected ? AppTheme.gold : AppTheme.softNavy,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: isSelected ? AppTheme.gold : AppTheme.borderBlue,
                    ),
                  ),
                  child: Text(
                    campus,
                    style: TextStyle(
                      color: isSelected ? AppTheme.navy : AppTheme.mutedText,
                      fontSize: 13,
                      fontWeight: isSelected
                          ? FontWeight.bold
                          : FontWeight.normal,
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
          const SizedBox(height: 24),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: onClose,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppTheme.gold,
                foregroundColor: AppTheme.navy,
                elevation: 0,
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text(
                'Apply Filters',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
            ),
          ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }
}