import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:receivo_expense/screens/home/views/mainscreen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  Future<void> _logout(BuildContext context) async {
    try {
      await FirebaseAuth.instance.signOut();
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error signing out: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Receivo - Expense Tracker"),
        backgroundColor: Colors.yellow.shade700,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () => _logout(context),
            tooltip: 'Logout',
          ),
        ],
      ),
      bottomNavigationBar: PersistentTabView(
        tabs: [
          // Add your Mainscreen as the first tab (Home tab)
          PersistentTabConfig(
            screen: const Mainscreen(),
            item: ItemConfig(
              icon: const Icon(Icons.home),
              title: "Home",
            ),
          ),
          PersistentTabConfig(
            screen: StatsScreen(),
            item: ItemConfig(
              icon: const Icon(Icons.bar_chart),
              title: "Stats",
            ),
          ),
          PersistentTabConfig(
            screen: CalendarScreen(),
            item: ItemConfig(
              icon: const Icon(Icons.calendar_month),
              title: "Calendar",
            ),
          ),
          PersistentTabConfig(
            screen: ScanScreen(),
            item: ItemConfig(
              icon: const Icon(Icons.qr_code_scanner),
              title: "Scan",
            ),
          ),
          PersistentTabConfig(
            screen: HistoryScreen(),
            item: ItemConfig(
              icon: const Icon(Icons.attach_money_rounded),
              title: "Expense",
            ),
          ),
        ],
        navBarBuilder: (navBarConfig) => Style1BottomNavBar(
          navBarConfig: navBarConfig,
        ),
      ),
    );
  }
}

// Create placeholder screens for each tab
class StatsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Statistics Screen",
              style: TextStyle(fontSize: 24),
            ),
          ],
        ),
      ),
    );
  }
}

class CalendarScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "Calendar Screen",
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}

class ScanScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "Scan QR Screen",
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}

class HistoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "Manually Add Expense",
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}