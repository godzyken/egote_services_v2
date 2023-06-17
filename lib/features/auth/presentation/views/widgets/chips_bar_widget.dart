import 'package:egote_services_v2/features/auth/presentation/views/models/userlist/filter_status_view.dart';
import 'package:egote_services_v2/features/common/presentation/extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ChipsBarWidget extends ConsumerWidget {
  ChipsBarWidget({Key? key}) : super(key: key);

  final _provider = filterKindViewModelStateNotifierProvider;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Consumer(builder: (context, ref, _) {
      final viewModel = ref.watch(_provider.notifier);
      ref.watch(_provider);

      return SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 8, right: 8),
          child: Row(
            children: [
              InputChip(label: Text(context.tr!.all),
              selected: viewModel.isFilterByAll(),
              onSelected: (value) => viewModel.filterByAll(),
              selectedColor: viewModel.isFilterByAll() ? Colors.lightGreen : null,),
              const SizedBox(width: 8,),
              InputChip(label: Text(context.tr!.available),
                selected: viewModel.isFilterByAvailable(),
                onSelected: (value) => viewModel.filterByAvailable(),
                selectedColor: viewModel.isFilterByAvailable() ? Colors.lightGreen : null,),
              const SizedBox(width: 8,),
              InputChip(label: Text(context.tr!.unAvailable),
                selected: viewModel.isFilterByUnavailable(),
                onSelected: (value) => viewModel.filterByUnavailable(),
                selectedColor: viewModel.isFilterByUnavailable() ? Colors.lightGreen : null,),
            ],
          ),
        ),
      );
    });
  }
}
