import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../config/providers/monitoring/performance_monitor_provider.dart';

class PerformanceOverlay extends ConsumerWidget {
  const PerformanceOverlay({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final monitor = ref.watch(performanceMonitorProvider);

    return Positioned(
      top: 20,
      right: 10,
      child: Material(
        color: Colors.transparent,
        child: Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.7),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: monitor.providerExecutionTimes.entries.map((entry) {
              return Text(
                '${entry.key}: ${entry.value} ms',
                style: TextStyle(color: Colors.white),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
