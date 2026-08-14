import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../app/router.dart';
import '../../../shared/widgets/empty_view.dart';

/// The three buckets the user triages from.
///
/// No data source yet — each tab renders its empty state until action
/// persistence lands. The shell exists first so the navigation and the tab
/// semantics can be checked on a real device before any storage work.
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Action'),
          bottom: const TabBar(
            // Three equal tabs on a 360dp-wide phone leave ~120dp each, and
            // "Needs attention" truncates at the default 14sp with 16dp side
            // padding. Trimming both keeps the product's wording intact rather
            // than shortening the label to fit.
            labelPadding: EdgeInsets.symmetric(horizontal: 4),
            labelStyle: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
            unselectedLabelStyle: TextStyle(fontSize: 13),
            tabs: [
              Tab(text: 'Needs attention'),
              Tab(text: 'Upcoming'),
              Tab(text: 'Completed'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            EmptyView(
              icon: Icons.check_circle_outline,
              title: 'Nothing needs attention',
              message: 'Actions that are overdue or due soon show up here.',
            ),
            EmptyView(
              icon: Icons.event_outlined,
              title: 'Nothing upcoming',
              message: 'Confirmed actions with a future due date show up here.',
            ),
            EmptyView(
              icon: Icons.inventory_2_outlined,
              title: 'Nothing completed yet',
              message: 'Actions you finish are kept here.',
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () => context.push(Routes.capture),
          icon: const Icon(Icons.add),
          label: const Text('Add'),
        ),
      ),
    );
  }
}
