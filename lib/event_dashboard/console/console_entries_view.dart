import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../wrappers.dart';

class ConsoleEntry {
  ConsoleEntry(this.name);
  final String name;
}

class ConsoleEntriesView extends StatelessWidget {
  const ConsoleEntriesView({
    Key? key,
    required this.entries,
    this.controller,
  }) : super(key: key);

  final List<ConsoleEntry> entries;
  final ScrollController? controller;

  @override
  Widget build(BuildContext context) {
    if (entries.isEmpty) {
      return const SizedBox(
        width: double.infinity,
        child: ConsoleEntryTile('No events yet'),
      );
    }

    return ListView.builder(
      shrinkWrap: true,
      controller: controller,
      itemCount: entries.length,
      itemBuilder: (_, index) {
        final event = entries[index];
        return ConsoleEntryTile(event.name);
      },
    );
  }
}

class ConsoleEntryTile extends StatelessWidget {
  const ConsoleEntryTile(
    this.content, {
    Key? key,
  }) : super(key: key);

  final String content;

  @override
  Widget build(BuildContext context) {
    return Text(
      '> $content',
      style: GoogleFonts.robotoMono(
        textStyle: AppTextStyles.white300Label12,
      ),
    );
  }
}
