import 'package:core/core.dart';
import 'package:flutter/material.dart';

import 'in_memory_events_store.dart';

///TODO: Add clear events cache log action
class EventRecordsView extends StatelessWidget {
  static const String routeName = "/buzz-events";

  const EventRecordsView({
    Key? key,
    required this.eventsStoreStream,
    this.customColorDecorator,
    required this.onDeleteEventsPressed,
  }) : super(key: key);

  final Stream<List<EventRecord>> eventsStoreStream;
  final Color Function(EventRecord)? customColorDecorator;
  final Function() onDeleteEventsPressed;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              icon: const Icon(Icons.delete_forever),
              onPressed: onDeleteEventsPressed,
            )
          ],
        ),
        body: EventRecordsViewStreamBuilder(
          eventsStoreStream: eventsStoreStream,
          customColorDecorator: customColorDecorator,
        ),
      ),
    );
  }
}

class EventRecordsViewStreamBuilder extends StatelessWidget {
  const EventRecordsViewStreamBuilder({
    Key? key,
    required this.eventsStoreStream,
    this.customColorDecorator,
  }) : super(key: key);

  final Stream<List<EventRecord>> eventsStoreStream;
  final Color Function(EventRecord)? customColorDecorator;

  @override
  Widget build(BuildContext context) {
    return ManagedStreamBuilder<List<EventRecord>>(
      stream: eventsStoreStream,
      onLoading: () => const Center(child: CircularProgressIndicator()),
      onError: (error) => Center(child: Text(error)),
      onData: (data) => EventRecordsListView(
        items: data ?? const [],
        colorDecorator: customColorDecorator,
      ),
    );
  }
}

class EventRecordsListView extends StatelessWidget {
  const EventRecordsListView({
    Key? key,
    required this.items,
    this.colorDecorator,
  }) : super(key: key);

  final List<EventRecord> items;
  final Color Function(EventRecord)? colorDecorator;

  Color _getDecorationColor(EventRecord event) {
    if (colorDecorator == null) return Colors.grey;
    return colorDecorator!(event);
  }

  @override
  Widget build(BuildContext context) {
    if (items.isEmpty) {
      return const Center(
        child: Text('No items yet'),
      );
    }

    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        final event = items[index];

        return Container(
          margin: const EdgeInsets.only(top: 4),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                width: 3,
                color: Colors.grey.shade300,
              ),
            ),
          ),
          child: ListTile(
            leading: Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                color: _getDecorationColor(event),
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Text('${index + 1}'),
              ),
            ),
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  event.name,
                  style: const TextStyle(fontWeight: FontWeight.w500),
                ),
              ],
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (event.params != null) ...[
                  const SizedBox(height: 4),
                  Text(event.params.toString()),
                ],
                const SizedBox(height: 6),
                Text(event.timestamp.toIso8601String()),
              ],
            ),
          ),
        );
      },
    );
  }
}
