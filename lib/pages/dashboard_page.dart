import 'package:flutter/material.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
        centerTitle: true,
        elevation: 0,
        backgroundColor: theme.colorScheme.background,
        foregroundColor: theme.colorScheme.onBackground,
      ),
      body: Center(
        child: Text(
          'Selamat datang di Dashboard!',
          style: theme.textTheme.headlineMedium,
        ),
      ),
      backgroundColor: theme.colorScheme.background,
    );
  }
}
