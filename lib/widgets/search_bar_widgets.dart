import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SearchBarCustom extends ConsumerWidget {
  final void Function(String) onSearch;

  SearchBarCustom({required this.onSearch});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final TextEditingController _locationController = TextEditingController();

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _locationController,
              decoration: const InputDecoration(
                hintText: 'Enter locationName',
              ),
            ),
          ),
          const SizedBox(width: 10),
          ElevatedButton(
            onPressed: () {
              final locationName = _locationController.text;
              if (locationName.isNotEmpty) {
                // 直接使用 ref.read(weatherProvider) 读取 provider 的值
                onSearch(locationName);
              }
            },
            child: const Text('Search'),
          ),
        ],
      ),
    );
  }
}
