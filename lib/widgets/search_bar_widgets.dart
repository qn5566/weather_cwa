import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SearchBarCustom extends ConsumerWidget {
  final void Function(String) onSearch;

  const SearchBarCustom({super.key, required this.onSearch});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final TextEditingController locationController = TextEditingController();

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: locationController,
              decoration: const InputDecoration(
                hintText: '請輸入城市名稱',
              ),
            ),
          ),
          const SizedBox(width: 10),
          ElevatedButton(
            onPressed: () {
              final locationName = locationController.text;
              // if (locationName.isNotEmpty) {
              onSearch(locationName);
              // }
            },
            child: const Text('搜尋'),
          ),
        ],
      ),
    );
  }
}
