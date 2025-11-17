import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/radio_provider.dart';
import '../services/accessibility_service.dart';

class StationsScreen extends StatelessWidget {
  const StationsScreen({super.key});

  void _showAddStationDialog(BuildContext context) {
    final nameController = TextEditingController();
    final urlController = TextEditingController();
    final accessibilityService = AccessibilityService.instance;

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Add Radio Station'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                labelText: 'Station Name',
                hintText: 'e.g., BBC Radio 1',
              ),
              autofocus: true,
            ),
            const SizedBox(height: 16),
            TextField(
              controller: urlController,
              decoration: const InputDecoration(
                labelText: 'Stream URL',
                hintText: 'e.g., http://stream.example.com/radio',
              ),
              keyboardType: TextInputType.url,
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () async {
              final name = nameController.text.trim();
              final url = urlController.text.trim();
              
              if (name.isNotEmpty && url.isNotEmpty) {
                final provider = context.read<RadioProvider>();
                await provider.addStation(name, url);
                accessibilityService.announceStationAdded(name);
                if (context.mounted) {
                  Navigator.pop(context);
                }
              }
            },
            child: const Text('Add'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Radio Stations'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            tooltip: 'Add new station',
            onPressed: () => _showAddStationDialog(context),
          ),
        ],
      ),
      body: Consumer<RadioProvider>(
        builder: (context, provider, child) {
          if (provider.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (provider.stations.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.radio, size: 64, color: Colors.grey),
                  const SizedBox(height: 16),
                  const Text(
                    'No stations added yet',
                    style: TextStyle(fontSize: 18),
                  ),
                  const SizedBox(height: 8),
                  ElevatedButton.icon(
                    icon: const Icon(Icons.add),
                    label: const Text('Add Station'),
                    onPressed: () => _showAddStationDialog(context),
                  ),
                ],
              ),
            );
          }

          return ListView.builder(
            itemCount: provider.stations.length,
            itemBuilder: (context, index) {
              final station = provider.stations[index];
              return Card(
                margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                child: ListTile(
                  leading: const Icon(Icons.radio, size: 40),
                  title: Text(
                    station.name,
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    station.url,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: Icon(
                          station.isFavorite ? Icons.favorite : Icons.favorite_border,
                          color: station.isFavorite ? Colors.red : null,
                        ),
                        tooltip: station.isFavorite ? 'Remove from favorites' : 'Add to favorites',
                        onPressed: () => provider.toggleFavorite(station),
                      ),
                      IconButton(
                        icon: const Icon(Icons.delete, color: Colors.red),
                        tooltip: 'Delete station',
                        onPressed: () async {
                          await provider.deleteStation(station.id!);
                          AccessibilityService.instance.announceStationDeleted(station.name);
                        },
                      ),
                    ],
                  ),
                  onTap: () async {
                    await provider.playStation(station);
                    AccessibilityService.instance.announceStationPlaying(station.name);
                  },
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showAddStationDialog(context),
        tooltip: 'Add new station',
        child: const Icon(Icons.add),
      ),
    );
  }
}
