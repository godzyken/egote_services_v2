import 'package:egote_services_v2/features/devis/domain/entities/devis_model/devis_model_entity.dart';
import 'package:egote_services_v2/features/devis/domain/providers/devis_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DevisTableBuilder extends ConsumerStatefulWidget {
  const DevisTableBuilder({required this.devisModelEntity, super.key});

  final DevisModelEntity devisModelEntity;

  @override
  ConsumerState createState() => _DevisTableBuilderState();
}

class _DevisTableBuilderState extends ConsumerState<DevisTableBuilder> {

  @override
  Widget build(BuildContext context) {

    return Table(
      border: TableBorder.all(color: Colors.white54),
      children: List<TableRow>.generate(
          ref.watch(travauxListProvider).length,
          (index) => TableRow(
              children: List<TableCell>.generate(ref.watch(missionsListProvider).length,
                  (index) => const TableCell(child: Text('yo'))))),
    );
  }
}
