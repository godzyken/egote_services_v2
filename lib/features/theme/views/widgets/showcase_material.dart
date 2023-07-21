import 'package:egote_services_v2/features/common/presentation/extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';

/// Used to show the current theme on Material widgets.
///
/// Use this widget to review your theme's impact on [ThemeData] and see
/// how it looks with different Material widgets.
///
/// The sub widgets used in this theme show case can also be used on their
/// own, for example combined in smaller panels instead of in on big column
/// like here. Using the individual elements is done in example 5 where they
/// are put in separate cards.
///
/// These are all Flutter "Universal" Widgets that only depends on the SDK and
/// all the Widgets in this file be dropped into any application. They are
/// however not so useful, unless all you really want to do is to show what
/// Flutter Widgets look like.
class ShowcaseMaterial extends StatelessWidget {
  const ShowcaseMaterial({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        const SizedBox(height: 8),
        const TextInputField(),
        const SizedBox(height: 8),
        const DropDownButtonFormField(),
        const SizedBox(height: 8),
        const DropDownMenuShowcase(),
        const Divider(),
        const ElevatedButtonShowcase(),
        const SizedBox(height: 8),
        const FilledButtonShowcase(),
        const SizedBox(height: 8),
        const FilledButtonTonalShowcase(),
        const SizedBox(height: 8),
        const OutlinedButtonShowcase(),
        const SizedBox(height: 8),
        const TextButtonShowcase(),
        const SizedBox(height: 8),
        const ToggleButtonsShowcase(),
        const SizedBox(height: 8),
        const SegmentedButtonShowcase(),
        const Divider(),
        const FabShowcase(),
        const SizedBox(height: 16),
        const ChipShowcase(),
        const Divider(),
        const SizedBox(height: 8),
        const PopupMenuButtonsShowcase(),
        const SizedBox(height: 8),
        const Divider(),
        const DropDownMenuShowcase(explainUsage: true),
        const MenuBarShowcase(),
        const MenuAnchorShowcase(),
        const SizedBox(height: 8),
        const Divider(),
        const SizedBox(height: 8),
        const TooltipShowcase(),
        const SizedBox(height: 16),
        const IconButtonCircleAvatarDropdownShowcase(),
        const SizedBox(height: 16),
        const IconButtonShowcase(),
        const SizedBox(height: 16),
        const ProgressIndicatorShowcase(),
        const Divider(),
        const SwitchShowcase(),
        const CheckboxShowcase(),
        const RadioShowcase(),
        const SizedBox(height: 8),
        const Divider(),
        const SliderShowcase(),
        const SizedBox(height: 8),
        const RangeSliderShowcase(),
        const SizedBox(height: 8),
        const Divider(),
        const ListTileAllShowcase(),
        const Divider(),
        const ExpansionTileShowcase(),
        const Divider(),
        const ExpansionPanelListShowcase(),
        const Divider(),
        const AppBarShowcase(),
        const Divider(),
        const BottomAppBarShowcase(),
        const Divider(),
        const TabBarForAppBarShowcase(),
        const SizedBox(height: 8),
        const Divider(),
        const TabBarForBackgroundShowcase(),
        const SizedBox(height: 8),
        const Divider(),
        const BottomNavigationBarShowcase(),
        const SizedBox(height: 8),
        const NavigationBarShowcase(),
        const SizedBox(height: 8),
        const Divider(),
        const NavigationRailShowcase(),
        const SizedBox(height: 8),
        const NavigationDrawerShowcase(),
        const DrawerShowcase(),
        const SizedBox(height: 8),
        const Divider(),
        const AlertDialogShowcase(),
        const TimePickerDialogShowcase(),
        const DatePickerDialogShowcase(),
        const SizedBox(height: 8),
        const Divider(),
        const SizedBox(height: 16),
        const BottomSheetShowcase(),
        const SizedBox(height: 16),
        const BottomSheetModalShowcase(),
        const SizedBox(height: 32),
        const MaterialBannerSnackBarShowcase(),
        const Divider(height: 32),
        const MaterialShowcase(),
        const Divider(height: 32),
        const CardShowcase(),
        const SizedBox(height: 8),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: Text(context.tr!.normalTextTheme,
                      style: theme.textTheme.titleMedium),
                ),
                const TextThemeShowcase(),
              ],
            ),
          ),
        ),
        const SizedBox(height: 8),
        Card(
          color: theme.colorScheme.primary,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: Text(context.tr!.primaryTextTheme,
                      style: theme.primaryTextTheme.titleMedium),
                ),
                const PrimaryTextThemeShowcase(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class ElevatedButtonShowcase extends StatelessWidget {
  const ElevatedButtonShowcase({super.key});

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        spacing: 8,
        runSpacing: 8,
        children: <Widget>[
          ElevatedButton(
            onPressed: () {},
            child: Text(context.tr!.elevatedButton),
          ),
          ElevatedButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.add),
            label: Text(context.tr!.elevatedIcon),
          ),
          ElevatedButton(
            onPressed: null,
            child: Text(context.tr!.elevatedButton),
          ),
        ],
      ),
    );
  }
}

class FilledButtonShowcase extends StatelessWidget {
  const FilledButtonShowcase({super.key});

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        spacing: 8,
        runSpacing: 8,
        children: <Widget>[
          FilledButton(
            onPressed: () {},
            child: Text(context.tr!.filledButton),
          ),
          FilledButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.add),
            label: Text(context.tr!.filledIcon),
          ),
          FilledButton(
            onPressed: null,
            child: Text(context.tr!.filledButton),
          ),
        ],
      ),
    );
  }
}

class FilledButtonTonalShowcase extends StatelessWidget {
  const FilledButtonTonalShowcase({super.key});

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        spacing: 8,
        runSpacing: 8,
        children: <Widget>[
          FilledButton.tonal(
            onPressed: () {},
            child: Text(context.tr!.filledTonalButton),
          ),
          FilledButton.tonalIcon(
            onPressed: () {},
            icon: const Icon(Icons.add),
            label: Text(context.tr!.filledTonalIcon),
          ),
          FilledButton.tonal(
            onPressed: null,
            child: Text(context.tr!.filledTonalButton),
          ),
        ],
      ),
    );
  }
}

class OutlinedButtonShowcase extends StatelessWidget {
  const OutlinedButtonShowcase({super.key});

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        spacing: 8,
        runSpacing: 8,
        children: <Widget>[
          OutlinedButton(
            onPressed: () {},
            child: Text(context.tr!.outlinedButton),
          ),
          OutlinedButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.add),
            label: Text(context.tr!.outlinedIcon),
          ),
          OutlinedButton(
            onPressed: null,
            child: Text(context.tr!.outlinedButton),
          ),
        ],
      ),
    );
  }
}

class TextButtonShowcase extends StatelessWidget {
  const TextButtonShowcase({super.key});

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        spacing: 8,
        runSpacing: 8,
        children: <Widget>[
          TextButton(
            onPressed: () {},
            child: Text(context.tr!.textButton),
          ),
          TextButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.add),
            label: Text(context.tr!.textIcon),
          ),
          TextButton(
            onPressed: null,
            child: Text(context.tr!.textButton),
          ),
        ],
      ),
    );
  }
}

class ToggleButtonsShowcase extends StatefulWidget {
  const ToggleButtonsShowcase({this.compareButtons, super.key});
  final bool? compareButtons;

  @override
  State<ToggleButtonsShowcase> createState() => _ToggleButtonsShowcaseState();
}

class _ToggleButtonsShowcaseState extends State<ToggleButtonsShowcase> {
  List<bool> selected = <bool>[true, false, false];

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        spacing: 8,
        runSpacing: 8,
        children: <Widget>[
          ToggleButtons(
            isSelected: selected,
            onPressed: (int toggledIndex) {
              setState(() {
                selected[toggledIndex] = !selected[toggledIndex];
              });
            },
            children: const <Widget>[
              Icon(Icons.adb),
              Icon(Icons.phone),
              Icon(Icons.account_circle),
            ],
          ),
          if (widget.compareButtons ?? false)
            OutlinedButton(
              onPressed: () {},
              child: Text(context.tr!.outlined),
            ),
          if (widget.compareButtons ?? false)
            FilledButton(
              onPressed: () {},
              child: Text(context.tr!.filled),
            ),
          ToggleButtons(
            isSelected: const <bool>[true, false, false],
            onPressed: null,
            children: const <Widget>[
              Icon(Icons.adb),
              Icon(Icons.phone),
              Icon(Icons.account_circle),
            ],
          ),
          if (widget.compareButtons ?? false)
            OutlinedButton(
              onPressed: null,
              child: Text(context.tr!.outlined),
            ),
        ],
      ),
    );
  }
}

class SegmentedButtonShowcase extends StatefulWidget {
  const SegmentedButtonShowcase({this.showOutlinedButton, super.key});
  final bool? showOutlinedButton;

  @override
  State<SegmentedButtonShowcase> createState() =>
      _SegmentedButtonShowcaseState();
}

enum Calendar { day, week, month, year }

class _SegmentedButtonShowcaseState extends State<SegmentedButtonShowcase> {
  List<bool> selected = <bool>[true, false, false, true];
  Calendar _selected = Calendar.day;

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        spacing: 8,
        runSpacing: 8,
        children: <Widget>[
          SegmentedButton<Calendar>(
            showSelectedIcon: false,
            // multiSelectionEnabled: false,
            segments: <ButtonSegment<Calendar>>[
              ButtonSegment<Calendar>(
                value: Calendar.day,
                label: Text(context.tr!.day),
              ),
              ButtonSegment<Calendar>(
                value: Calendar.week,
                label: Text(context.tr!.week),
              ),
              ButtonSegment<Calendar>(
                value: Calendar.month,
                label: Text(context.tr!.month),
              ),
              ButtonSegment<Calendar>(
                value: Calendar.year,
                label: Text(context.tr!.year),
              ),
            ],
            selected: <Calendar>{_selected},
            onSelectionChanged: (Set<Calendar> selected) {
              setState(() {
                _selected = selected.first;
              });
            },
          ),
          SegmentedButton<Calendar>(
            segments: <ButtonSegment<Calendar>>[
              ButtonSegment<Calendar>(
                value: Calendar.day,
                label: Text(context.tr!.day),
                icon: const Icon(Icons.calendar_view_day),
              ),
              ButtonSegment<Calendar>(
                value: Calendar.week,
                icon: const Icon(Icons.calendar_view_week),
                label: Text(context.tr!.week),
              ),
              ButtonSegment<Calendar>(
                value: Calendar.month,
                icon: const Icon(Icons.calendar_view_month),
                label: Text(context.tr!.month),
              ),
              ButtonSegment<Calendar>(
                value: Calendar.year,
                icon: const Icon(Icons.calendar_today),
                label: Text(context.tr!.year),
              ),
            ],
            selected: <Calendar>{_selected},
            onSelectionChanged: (Set<Calendar> selected) {
              setState(() {
                _selected = selected.first;
              });
            },
          ),
          SegmentedButton<Calendar>(
            segments: <ButtonSegment<Calendar>>[
              ButtonSegment<Calendar>(
                value: Calendar.day,
                label: Text(context.tr!.day),
                icon: const Icon(Icons.calendar_view_day),
                enabled: false,
              ),
              ButtonSegment<Calendar>(
                value: Calendar.week,
                icon: const Icon(Icons.calendar_view_week),
                label: Text(context.tr!.week),
              ),
              ButtonSegment<Calendar>(
                value: Calendar.month,
                icon: const Icon(Icons.calendar_view_month),
                label: Text(context.tr!.month),
                enabled: false,
              ),
              ButtonSegment<Calendar>(
                value: Calendar.year,
                icon: const Icon(Icons.calendar_today),
                label: Text(context.tr!.year),
              ),
            ],
            selected: <Calendar>{_selected},
            onSelectionChanged: (Set<Calendar> selected) {
              setState(() {
                _selected = selected.first;
              });
            },
          ),
        ],
      ),
    );
  }
}

class FabShowcase extends StatelessWidget {
  const FabShowcase({super.key});

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        spacing: 8,
        runSpacing: 8,
        children: <Widget>[
          FloatingActionButton.small(
            heroTag: 'FAB small',
            onPressed: () {},
            child: const Icon(Icons.accessibility),
          ),
          FloatingActionButton.extended(
            heroTag: 'FAB extended false',
            isExtended: false,
            onPressed: () {},
            icon: const Icon(Icons.accessibility),
            label: Text(context.tr!.extended),
          ),
          FloatingActionButton.extended(
            heroTag: 'FAB extended true',
            isExtended: true,
            onPressed: () {},
            icon: const Icon(Icons.accessibility),
            label: Text(context.tr!.extended),
          ),
          FloatingActionButton(
            heroTag: 'FAB standard',
            onPressed: () {},
            child: const Icon(Icons.accessibility),
          ),
          FloatingActionButton.large(
            heroTag: 'FAB large',
            onPressed: () {},
            child: const Icon(Icons.accessibility),
          ),
        ],
      ),
    );
  }
}

class SwitchShowcase extends StatefulWidget {
  const SwitchShowcase({super.key});

  @override
  State<SwitchShowcase> createState() => _SwitchShowcaseState();
}

class _SwitchShowcaseState extends State<SwitchShowcase> {
  bool isOn1 = true;
  bool isOn2 = false;

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        spacing: 8,
        runSpacing: 8,
        children: <Widget>[
          Switch(
            value: isOn1,
            onChanged: (bool value) {
              setState(() {
                isOn1 = value;
              });
            },
          ),
          Switch(
            thumbIcon: MaterialStateProperty.resolveWith<Icon?>(
                    (Set<MaterialState> states) {
                  if (states.contains(MaterialState.selected)) {
                    return const Icon(Icons.check);
                  }
                  // All other states will use the default thumbIcon.
                  return const Icon(Icons.close);
                }),
            value: isOn1,
            onChanged: (bool value) {
              setState(() {
                isOn1 = value;
              });
            },
          ),
          Switch(
            value: isOn2,
            onChanged: (bool value) {
              setState(() {
                isOn2 = value;
              });
            },
          ),
          const Switch(
            value: true,
            onChanged: null,
          ),
          const Switch(
            value: false,
            onChanged: null,
          ),
        ],
      ),
    );
  }
}

class CheckboxShowcase extends StatefulWidget {
  const CheckboxShowcase({super.key});

  @override
  State<CheckboxShowcase> createState() => _CheckboxShowcaseState();
}

class _CheckboxShowcaseState extends State<CheckboxShowcase> {
  bool? isSelected1 = true;
  bool? isSelected2;

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        spacing: 8,
        runSpacing: 8,
        children: <Widget>[
          Checkbox(
            value: isSelected1,
            onChanged: (bool? value) {
              setState(() {
                isSelected1 = value;
              });
            },
          ),
          Checkbox(
            tristate: true,
            value: isSelected2,
            onChanged: (bool? value) {
              setState(() {
                isSelected2 = value;
              });
            },
          ),
          Checkbox(
            value: false,
            onChanged: (bool? value) {},
          ),
          const Checkbox(
            value: true,
            onChanged: null,
          ),
          const Checkbox(
            value: null,
            tristate: true,
            onChanged: null,
          ),
          const Checkbox(
            value: false,
            onChanged: null,
          ),
        ],
      ),
    );
  }
}

class RadioShowcase extends StatefulWidget {
  const RadioShowcase({super.key});

  @override
  State<RadioShowcase> createState() => _RadioShowcaseState();
}

class _RadioShowcaseState extends State<RadioShowcase> {
  bool? groupValue = true;

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        spacing: 8,
        runSpacing: 8,
        children: <Widget>[
          Radio<bool>(
            value: true,
            groupValue: groupValue,
            onChanged: (bool? value) {
              setState(() {
                groupValue = value;
              });
            },
          ),
          Radio<bool>(
            value: false,
            groupValue: groupValue,
            onChanged: (bool? value) {
              setState(() {
                groupValue = value;
              });
            },
          ),
          Radio<bool>(
            value: true,
            groupValue: groupValue,
            onChanged: null,
          ),
          Radio<bool>(
            value: false,
            groupValue: groupValue,
            onChanged: null,
          ),
        ],
      ),
    );
  }
}

class SliderShowcase extends StatefulWidget {
  const SliderShowcase({super.key});

  @override
  State<SliderShowcase> createState() => _SliderShowcaseState();
}

class _SliderShowcaseState extends State<SliderShowcase> {
  double value = 5;

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: Column(
        children: <Widget>[
          ListTile(
            dense: true,
            title: Text('${context.tr!.sliderStepped} (${value.toStringAsFixed(0)})'),
            subtitle: Slider(
              max: 30,
              divisions: 31,
              label: value.toStringAsFixed(0),
              value: value,
              onChanged: (double newValue) {
                setState(() {
                  value = newValue.roundToDouble();
                });
              },
            ),
          ),
          ListTile(
            dense: true,
            title: Text('${context.tr!.sliderContinuous} (${value.toStringAsFixed(2)})'),
            subtitle: Slider(
              max: 30,
              label: value.toStringAsFixed(0),
              value: value,
              onChanged: (double newValue) {
                setState(() {
                  value = newValue;
                });
              },
            ),
          ),
          ListTile(
            dense: true,
            title:
            Text('${context.tr!.sliderSteppedDisabled} (${value.toStringAsFixed(0)})'),
            subtitle: Slider(
              max: 30,
              divisions: 31,
              label: value.toStringAsFixed(0),
              value: value,
              onChanged: null,
            ),
          ),
          ListTile(
            dense: true,
            title: Text(
                '${context.tr!.sliderContinuousDisabled} (${value.toStringAsFixed(2)})'),
            subtitle: Slider(
              max: 30,
              label: value.toStringAsFixed(0),
              value: value,
              onChanged: null,
            ),
          ),
        ],
      ),
    );
  }
}

class RangeSliderShowcase extends StatefulWidget {
  const RangeSliderShowcase({super.key});

  @override
  State<RangeSliderShowcase> createState() => _RangeSliderShowcaseState();
}

class _RangeSliderShowcaseState extends State<RangeSliderShowcase> {
  RangeValues values = const RangeValues(5, 12);

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: Column(
        children: <Widget>[
          ListTile(
            dense: true,
            title: Text('${context.tr!.rangeSliderStepped} (${RangeLabels(
              values.start.toStringAsFixed(0),
              values.end.toStringAsFixed(0),
            )})'),
            subtitle: RangeSlider(
              max: 30,
              divisions: 31,
              labels: RangeLabels(
                values.start.toStringAsFixed(0),
                values.end.toStringAsFixed(0),
              ),
              values: values,
              onChanged: (RangeValues newValues) {
                setState(() {
                  values = RangeValues(
                    newValues.start.roundToDouble(),
                    newValues.end.roundToDouble(),
                  );
                });
              },
            ),
          ),
          ListTile(
            dense: true,
            title: Text('${context.tr!.rangeSliderContinuous} (${RangeLabels(
              values.start.toStringAsFixed(2),
              values.end.toStringAsFixed(2),
            )})'),
            subtitle: RangeSlider(
              max: 30,
              labels: RangeLabels(
                values.start.toStringAsFixed(2),
                values.end.toStringAsFixed(2),
              ),
              values: values,
              onChanged: (RangeValues newValues) {
                setState(() {
                  values = newValues;
                });
              },
            ),
          ),
          ListTile(
            dense: true,
            title: Text('${context.tr!.rangeSliderSteppedDisabled} (${RangeLabels(
              values.start.toStringAsFixed(0),
              values.end.toStringAsFixed(0),
            )})'),
            subtitle: RangeSlider(
              max: 30,
              divisions: 31,
              labels: RangeLabels(
                values.start.toStringAsFixed(0),
                values.end.toStringAsFixed(0),
              ),
              values: values,
              onChanged: null,
            ),
          ),
          ListTile(
            dense: true,
            title: Text('${context.tr!.rangeSliderContinuousDisabled} (${RangeLabels(
              values.start.toStringAsFixed(2),
              values.end.toStringAsFixed(2),
            )})'),
            subtitle: RangeSlider(
              max: 30,
              divisions: 31,
              labels: RangeLabels(
                values.start.toStringAsFixed(2),
                values.end.toStringAsFixed(2),
              ),
              values: values,
              onChanged: null,
            ),
          ),
        ],
      ),
    );
  }
}

class PopupMenuButtonsShowcase extends StatelessWidget {
  const PopupMenuButtonsShowcase({super.key, this.explainUsage = true});
  final bool explainUsage;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final TextStyle denseHeader = theme.textTheme.titleMedium!.copyWith(
      fontSize: 13,
    );
    final TextStyle denseBody = theme.textTheme.bodyMedium!
        .copyWith(fontSize: 12, color: theme.textTheme.bodySmall!.color);

    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          if (explainUsage)
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 16, 0, 0),
              child: Text(
                context.tr!.popupMenuButton,
                style: denseHeader,
              ),
            ),
          if (explainUsage)
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 8),
              child: Text(
                context.tr!.materialPopupMenuText,
                style: denseBody,
              ),
            ),
          const Row(
            children: <Widget>[
              PopupMenuButtonShowcase(),
              SizedBox(width: 16),
              PopupMenuButtonTilesShowcase(),
            ],
          ),
        ]);
  }
}

class PopupMenuButtonShowcase extends StatelessWidget {
  const PopupMenuButtonShowcase({super.key});

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: PopupMenuButton<int>(
        onSelected: (_) {},
        position: PopupMenuPosition.under,
        itemBuilder: (BuildContext context) => <PopupMenuItem<int>>[
          PopupMenuItem<int>(value: 1, child: Text('${context.tr!.optionText} 1')),
          PopupMenuItem<int>(value: 2, child: Text('${context.tr!.optionText} 2')),
          PopupMenuItem<int>(value: 3, child: Text('${context.tr!.optionText} 3')),
          PopupMenuItem<int>(value: 4, child: Text('${context.tr!.optionText} 4')),
          PopupMenuItem<int>(value: 5, child: Text('${context.tr!.optionText} 5')),
        ],
        icon: const Icon(Icons.more_vert),
      ),
    );
  }
}

class PopupMenuButtonTilesShowcase extends StatelessWidget {
  const PopupMenuButtonTilesShowcase({super.key});

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: PopupMenuButton<int>(
        onSelected: (_) {},
        position: PopupMenuPosition.under,
        itemBuilder: (BuildContext context) => <PopupMenuItem<int>>[
          PopupMenuItem<int>(
              value: 1,
              child:
              ListTile(leading: const Icon(Icons.alarm), title: Text(context.tr!.alarm))),
          PopupMenuItem<int>(
              value: 2,
              child: ListTile(
                  leading: const Icon(Icons.cabin), title: Text(context.tr!.woodCabin))),
          PopupMenuItem<int>(
              value: 3,
              child: ListTile(
                  leading: const Icon(Icons.camera_outdoor_rounded),
                  title: Text(context.tr!.surveillance))),
          PopupMenuItem<int>(
              value: 4,
              child: ListTile(
                  leading: const Icon(Icons.water_damage),
                  title: Text(context.tr!.waterDamage))),
        ],
        icon: const Icon(Icons.more_horiz),
      ),
    );
  }
}

class _DropDownButton extends StatefulWidget {
  const _DropDownButton();

  @override
  State<_DropDownButton> createState() => _DropDownButtonState();
}

class _DropDownButtonState extends State<_DropDownButton> {
  String selectedItem = 'Dropdown button 1';
  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: DropdownButton<String>(
        value: selectedItem,
        onChanged: (String? value) {
          setState(() {
            selectedItem = value ?? '${context.tr!.dropdownButton} 1';
          });
        },
        items: <String>[
          '${context.tr!.dropdownButton} 1',
          '${context.tr!.dropdownButton} 2',
          '${context.tr!.dropdownButton} 3',
          '${context.tr!.dropdownButton} 4',
          '${context.tr!.dropdownButton} 5'
        ].map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(value),
            ),
          );
        }).toList(),
      ),
    );
  }
}

class DropDownButtonFormField extends StatefulWidget {
  const DropDownButtonFormField({super.key});

  @override
  State<DropDownButtonFormField> createState() =>
      _DropDownButtonFormFieldState();
}

class _DropDownButtonFormFieldState extends State<DropDownButtonFormField> {
  String selectedItem = 'DropDown FormField - Option 1';
  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      value: selectedItem,
      onChanged: (String? value) {
        setState(() {
          selectedItem = value ?? '${context.tr!.dropdownFormFieldOption} 1';
        });
      },
      items: <String>[
        '${context.tr!.dropdownFormFieldOption} 1',
        '${context.tr!.dropdownFormFieldOption} 2',
        '${context.tr!.dropdownFormFieldOption} 3',
        '${context.tr!.dropdownFormFieldOption} 4',
        '${context.tr!.dropdownFormFieldOption} 5',
      ].map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}

class DropDownMenuShowcase extends StatefulWidget {
  const DropDownMenuShowcase({super.key, this.explainUsage = false});
  final bool explainUsage;

  @override
  State<DropDownMenuShowcase> createState() => _DropDownMenuShowcaseState();
}

class _DropDownMenuShowcaseState extends State<DropDownMenuShowcase> {
  String selectedItem = 'one';
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final TextStyle denseHeader = theme.textTheme.titleMedium!.copyWith(
      fontSize: 13,
    );
    final TextStyle denseBody = theme.textTheme.bodyMedium!
        .copyWith(fontSize: 12, color: theme.textTheme.bodySmall!.color);

    return RepaintBoundary(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          if (widget.explainUsage)
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 16, 0, 0),
              child: Text(
                context.tr!.dropdownMenu,
                style: denseHeader,
              ),
            ),
          if (widget.explainUsage)
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 8),
              child: Text(
                context.tr!.dropdownMenuText,
                style: denseBody,
              ),
            ),
          DropdownMenu<String>(
            initialSelection: selectedItem,
            onSelected: (String? value) {
              setState(() {
                selectedItem = value ?? 'one';
              });
            },
            dropdownMenuEntries: <DropdownMenuEntry<String>>[
              DropdownMenuEntry<String>(
                label: context.tr!.labelAlarmSettings,
                leadingIcon: const Icon(Icons.alarm),
                value: 'one',
              ),
              DropdownMenuEntry<String>(
                label: context.tr!.labelDisabledSettings,
                leadingIcon: const Icon(Icons.settings),
                value: 'two',
                enabled: false,
              ),
              DropdownMenuEntry<String>(
                label: context.tr!.labelCabinOverview,
                leadingIcon: const Icon(Icons.cabin),
                value: 'three',
              ),
              DropdownMenuEntry<String>(
                label: context.tr!.labelSurveillanceView,
                leadingIcon: const Icon(Icons.camera_outdoor_rounded),
                value: 'four',
              ),
              DropdownMenuEntry<String>(
                label: context.tr!.labelWaterAlert,
                leadingIcon: const Icon(Icons.water_damage),
                value: 'five',
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class TooltipShowcase extends StatelessWidget {
  const TooltipShowcase({super.key});

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        spacing: 16,
        runSpacing: 4,
        children: <Widget>[
          Tooltip(
            message: context.tr!.tooltipShowcaseMessage1,
            child: Text(context.tr!.tooltipShowcaseText1),
          ),
          Tooltip(
            message: context.tr!.tooltipShowcaseMessage2,
            child: Text(context.tr!.tooltipShowcaseText2),
          ),
          Tooltip(
            message: context.tr!.tooltipShowcaseMessage3,
            child: Text(context.tr!.tooltipShowcaseText3),
          ),
        ],
      ),
    );
  }
}

class IconButtonCircleAvatarDropdownShowcase extends StatefulWidget {
  const IconButtonCircleAvatarDropdownShowcase({super.key});

  @override
  State<IconButtonCircleAvatarDropdownShowcase> createState() =>
      _IconButtonCircleAvatarDropdownShowcaseState();
}

class _IconButtonCircleAvatarDropdownShowcaseState
    extends State<IconButtonCircleAvatarDropdownShowcase> {
  bool isLockOpen = false;

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        spacing: 16,
        runSpacing: 4,
        children: <Widget>[
          Tooltip(
            message: context.tr!.tooltipIcon,
            child: const Icon(Icons.add_circle),
          ),
          Tooltip(
            message: context.tr!.tooltipIcon,
            child: const Icon(Icons.flutter_dash),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: IconButton(
              icon: const Icon(Icons.accessibility),
              tooltip: context.tr!.tooltipIconButton,
              onPressed: () {},
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: IconButton(
              icon: const Icon(Icons.lock_outlined),
              selectedIcon: const Icon(Icons.lock_open_outlined),
              tooltip: isLockOpen
                  ? context.tr!.iconButtonCLoseM3
                  : context.tr!.iconButtonOpenM3,
              isSelected: isLockOpen,
              onPressed: () {
                setState(() {
                  isLockOpen = !isLockOpen;
                });
              },
            ),
          ),
          Tooltip(
            message: context.tr!.tooltipCircleAvatar,
            child: const CircleAvatar(
              child: Text('CA'),
            ),
          ),
          const _DropDownButton(),
        ],
      ),
    );
  }
}

class IconButtonShowcase extends StatelessWidget {
  const IconButtonShowcase({super.key});

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        spacing: 16,
        runSpacing: 4,
        children: <Widget>[
          Column(
            // Standard IconButton
            children: <Widget>[
              IconToggleButton(
                isEnabled: true,
                tooltip: context.tr!.tooltipStandard,
              ),
              const SizedBox(height: 8),
              IconToggleButton(
                isEnabled: false,
                tooltip: context.tr!.tooltipStandardDisabled,
              ),
            ],
          ),
          Column(
            children: <Widget>[
              // Filled IconButton
              IconToggleButton(
                isEnabled: true,
                tooltip: context.tr!.filled,
                getDefaultStyle: enabledFilledButtonStyle,
              ),
              const SizedBox(height: 8),
              IconToggleButton(
                isEnabled: false,
                tooltip: context.tr!.filledDisabled,
                getDefaultStyle: disabledFilledButtonStyle,
              ),
            ],
          ),
          Column(
            children: <Widget>[
              // Filled Tonal IconButton
              IconToggleButton(
                isEnabled: true,
                tooltip: context.tr!.filledTonal,
                getDefaultStyle: enabledFilledTonalButtonStyle,
              ),
              const SizedBox(height: 8),
              IconToggleButton(
                isEnabled: false,
                tooltip: context.tr!.filledTonalDisabled,
                getDefaultStyle: disabledFilledTonalButtonStyle,
              ),
            ],
          ),
          Column(
            children: <Widget>[
              // Outlined IconButton
              IconToggleButton(
                isEnabled: true,
                tooltip: context.tr!.outlined,
                getDefaultStyle: enabledOutlinedButtonStyle,
              ),
              const SizedBox(height: 8),
              IconToggleButton(
                isEnabled: false,
                tooltip: context.tr!.outlinedDisabled,
                getDefaultStyle: disabledOutlinedButtonStyle,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// TODO(rydmike): Add variant IconButtons when available in stable.
// class IconButtonM3Showcase extends StatelessWidget {
//   const IconButtonM3Showcase({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return RepaintBoundary(
//       child: Wrap(
//         crossAxisAlignment: WrapCrossAlignment.center,
//         spacing: 16,
//         runSpacing: 4,
//         children: <Widget>[
//           Column(
//             // Standard IconButton
//             children: const <Widget>[
//               _IconM3ToggleButton(
//                 isEnabled: true,
//                 tooltip: 'Standard',
//                 variant: _IconButtonVariant.standard,
//               ),
//               const SizedBox(height: 8),
//               _IconM3ToggleButton(
//                 isEnabled: false,
//                 tooltip: 'Standard (disabled)',
//                 variant: _IconButtonVariant.standard,
//               ),
//             ],
//           ),
//           Column(
//             children: const <Widget>[
//               // Filled IconButton
//               _IconM3ToggleButton(
//                 isEnabled: true,
//                 tooltip: 'Filled',
//                 variant: _IconButtonVariant.filled,
//               ),
//               const SizedBox(height: 8),
//               _IconM3ToggleButton(
//                 isEnabled: false,
//                 tooltip: 'Filled (disabled)',
//                 variant: _IconButtonVariant.filled,
//               ),
//             ],
//           ),
//           Column(
//             children: const <Widget>[
//               // Filled Tonal IconButton
//               _IconM3ToggleButton(
//                 isEnabled: true,
//                 tooltip: 'Filled tonal',
//                 variant: _IconButtonVariant.filledTonal,
//               ),
//               const SizedBox(height: 8),
//               _IconM3ToggleButton(
//                 isEnabled: false,
//                 tooltip: 'Filled tonal (disabled)',
//                 variant: _IconButtonVariant.filledTonal,
//               ),
//             ],
//           ),
//           Column(
//             children: const <Widget>[
//               // Outlined IconButton
//               _IconM3ToggleButton(
//                 isEnabled: true,
//                 tooltip: 'Outlined',
//                 variant: _IconButtonVariant.outlined,
//               ),
//               const SizedBox(height: 8),
//               _IconM3ToggleButton(
//                 isEnabled: false,
//                 tooltip: 'Outlined (disabled)',
//                 variant: _IconButtonVariant.outlined,
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }

// TODO(rydmike): Add variant IconButtons when available in stable.
//
// enum _IconButtonVariant { standard, filled, filledTonal, outlined }
//
// class _IconM3ToggleButton extends StatefulWidget {
//   const _IconM3ToggleButton({
//     required this.isEnabled,
//     required this.tooltip,
//     required this.variant,
//   });
//
//   final bool isEnabled;
//   final String tooltip;
//   final _IconButtonVariant variant;
//
//   @override
//   State<_IconM3ToggleButton> createState() => _IconM3ToggleButtonState();
// }
//
// class _IconM3ToggleButtonState extends State<_IconM3ToggleButton> {
//   bool selected = false;
//
//   @override
//   Widget build(BuildContext context) {
//     final VoidCallback? onPressed = widget.isEnabled
//         ? () {
//             setState(() {
//               selected = !selected;
//             });
//           }
//         : null;
//
//     switch (widget.variant) {
//       case _IconButtonVariant.standard:
//         {
//           return IconButton(
//             isSelected: selected,
//             tooltip: widget.tooltip,
//             icon: const Icon(Icons.settings_outlined),
//             selectedIcon: const Icon(Icons.settings),
//             onPressed: onPressed,
//           );
//         }
//       case _IconButtonVariant.filled:
//         {
//           return IconButton.filled(
//             isSelected: selected,
//             tooltip: widget.tooltip,
//             icon: const Icon(Icons.settings_outlined),
//             selectedIcon: const Icon(Icons.settings),
//             onPressed: onPressed,
//           );
//         }
//       case _IconButtonVariant.filledTonal:
//         {
//           return IconButton.filledTonal(
//             isSelected: selected,
//             tooltip: widget.tooltip,
//             icon: const Icon(Icons.settings_outlined),
//             selectedIcon: const Icon(Icons.settings),
//             onPressed: onPressed,
//           );
//         }
//       case _IconButtonVariant.outlined:
//         {
//           return IconButton.outlined(
//             isSelected: selected,
//             tooltip: widget.tooltip,
//             icon: const Icon(Icons.settings_outlined),
//             selectedIcon: const Icon(Icons.settings),
//             onPressed: onPressed,
//           );
//         }
//     }
//   }
// }

class IconToggleButton extends StatefulWidget {
  const IconToggleButton({
    required this.isEnabled,
    required this.tooltip,
    this.getDefaultStyle,
    super.key,
  });

  final bool isEnabled;
  final String tooltip;
  final ButtonStyle? Function(bool, ColorScheme)? getDefaultStyle;

  @override
  State<IconToggleButton> createState() => _IconToggleButtonState();
}

class _IconToggleButtonState extends State<IconToggleButton> {
  bool selected = false;

  @override
  Widget build(BuildContext context) {
    final ColorScheme colors = Theme.of(context).colorScheme;
    final VoidCallback? onPressed = widget.isEnabled
        ? () {
      setState(() {
        selected = !selected;
      });
    }
        : null;
    final ButtonStyle? style = widget.getDefaultStyle?.call(selected, colors);

    return IconButton(
      visualDensity: VisualDensity.standard,
      isSelected: selected,
      tooltip: widget.tooltip,
      icon: const Icon(Icons.settings_outlined),
      selectedIcon: const Icon(Icons.settings),
      onPressed: onPressed,
      style: style,
    );
  }
}

ButtonStyle enabledFilledButtonStyle(bool selected, ColorScheme colors) {
  return IconButton.styleFrom(
    foregroundColor: selected ? colors.onPrimary : colors.primary,
    backgroundColor: selected ? colors.primary : colors.surfaceVariant,
    disabledForegroundColor: colors.onSurface.withOpacity(0.38),
    disabledBackgroundColor: colors.onSurface.withOpacity(0.12),
    hoverColor: selected
        ? colors.onPrimary.withOpacity(0.08)
        : colors.primary.withOpacity(0.08),
    focusColor: selected
        ? colors.onPrimary.withOpacity(0.12)
        : colors.primary.withOpacity(0.12),
    highlightColor: selected
        ? colors.onPrimary.withOpacity(0.12)
        : colors.primary.withOpacity(0.12),
  );
}

ButtonStyle disabledFilledButtonStyle(bool selected, ColorScheme colors) {
  return IconButton.styleFrom(
    disabledForegroundColor: colors.onSurface.withOpacity(0.38),
    disabledBackgroundColor: colors.onSurface.withOpacity(0.12),
  );
}

ButtonStyle enabledFilledTonalButtonStyle(bool selected, ColorScheme colors) {
  return IconButton.styleFrom(
    foregroundColor:
    selected ? colors.onSecondaryContainer : colors.onSurfaceVariant,
    backgroundColor:
    selected ? colors.secondaryContainer : colors.surfaceVariant,
    hoverColor: selected
        ? colors.onSecondaryContainer.withOpacity(0.08)
        : colors.onSurfaceVariant.withOpacity(0.08),
    focusColor: selected
        ? colors.onSecondaryContainer.withOpacity(0.12)
        : colors.onSurfaceVariant.withOpacity(0.12),
    highlightColor: selected
        ? colors.onSecondaryContainer.withOpacity(0.12)
        : colors.onSurfaceVariant.withOpacity(0.12),
  );
}

ButtonStyle disabledFilledTonalButtonStyle(bool selected, ColorScheme colors) {
  return IconButton.styleFrom(
    disabledForegroundColor: colors.onSurface.withOpacity(0.38),
    disabledBackgroundColor: colors.onSurface.withOpacity(0.12),
  );
}

ButtonStyle enabledOutlinedButtonStyle(bool selected, ColorScheme colors) {
  return IconButton.styleFrom(
    backgroundColor: selected ? colors.inverseSurface : null,
    hoverColor: selected
        ? colors.onInverseSurface.withOpacity(0.08)
        : colors.onSurfaceVariant.withOpacity(0.08),
    focusColor: selected
        ? colors.onInverseSurface.withOpacity(0.12)
        : colors.onSurfaceVariant.withOpacity(0.12),
    highlightColor: selected
        ? colors.onInverseSurface.withOpacity(0.12)
        : colors.onSurface.withOpacity(0.12),
    side: BorderSide(color: colors.outline),
  ).copyWith(
    foregroundColor:
    MaterialStateProperty.resolveWith((Set<MaterialState> states) {
      if (states.contains(MaterialState.selected)) {
        return colors.onInverseSurface;
      }
      if (states.contains(MaterialState.pressed)) {
        return colors.onSurface;
      }
      return null;
    }),
  );
}

ButtonStyle disabledOutlinedButtonStyle(bool selected, ColorScheme colors) {
  return IconButton.styleFrom(
    disabledForegroundColor: colors.onSurface.withOpacity(0.38),
    disabledBackgroundColor:
    selected ? colors.onSurface.withOpacity(0.12) : null,
    side: selected ? null : BorderSide(color: colors.outline.withOpacity(0.12)),
  );
}

class ProgressIndicatorShowcase extends StatefulWidget {
  const ProgressIndicatorShowcase({super.key});

  @override
  State<ProgressIndicatorShowcase> createState() =>
      _ProgressIndicatorShowcaseState();
}

class _ProgressIndicatorShowcaseState extends State<ProgressIndicatorShowcase> {
  bool playProgressIndicator = false;
  @override
  Widget build(BuildContext context) {
    final double? progressValue = playProgressIndicator ? null : 0.75;

    return RepaintBoundary(
      child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        spacing: 16,
        runSpacing: 16,
        children: <Widget>[
          IconButton(
            isSelected: playProgressIndicator,
            selectedIcon: const Icon(Icons.pause),
            icon: const Icon(Icons.play_arrow),
            onPressed: () {
              setState(() {
                playProgressIndicator = !playProgressIndicator;
              });
            },
          ),
          SizedBox(
            width: 50,
            height: 50,
            child: CircularProgressIndicator(
              value: progressValue,
            ),
          ),
          SizedBox(
              width: 200,
              child: LinearProgressIndicator(
                value: progressValue,
              )),
        ],
      ),
    );
  }
}

class ChipShowcase extends StatelessWidget {
  const ChipShowcase({super.key});

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        spacing: 8,
        runSpacing: 8,
        children: <Widget>[
          Chip(
            label: Text(context.tr!.labelChip),
            onDeleted: () {},
          ),
          Chip(
            label: Text(context.tr!.labelChip),
            avatar: const FlutterLogo(),
          ),
          ActionChip(
            label: Text(context.tr!.labelActionChip),
            avatar: const Icon(Icons.settings),
            onPressed: () {},
          ),
          ActionChip(
            label: Text(context.tr!.labelActionChip),
            avatar: const Icon(Icons.settings),
            onPressed: null,
          ),
          FilterChip(
            label: Text(context.tr!.labelFilterChip),
            selected: true,
            onSelected: (bool value) {},
          ),
          FilterChip(
            label: Text(context.tr!.labelFilterChip),
            selected: true,
            onSelected: null,
          ),
          FilterChip(
            label: Text(context.tr!.labelFilterChip),
            selected: false,
            onSelected: (bool value) {},
          ),
          FilterChip(
            label: Text(context.tr!.labelFilterChip),
            selected: false,
            onSelected: null,
          ),
          ChoiceChip(
            label: Text(context.tr!.labelChoiceChip),
            selected: true,
            onSelected: (bool value) {},
          ),
          ChoiceChip(
            label: Text(context.tr!.labelChoiceChip),
            selected: true,
          ),
          ChoiceChip(
            label: Text(context.tr!.labelChoiceChip),
            selected: false,
            onSelected: (bool value) {},
          ),
          ChoiceChip(
            label: Text(context.tr!.labelChoiceChip),
            selected: false,
            onSelected: null,
          ),
          InputChip(
            selected: true,
            label: Text(context.tr!.labelInputChip),
            onSelected: (bool value) {},
            onDeleted: () {},
          ),
          InputChip(
            selected: true,
            label: Text(context.tr!.labelInputChip),
            isEnabled: false,
            onSelected: (bool value) {},
            onDeleted: () {},
          ),
          InputChip(
            label: Text(context.tr!.labelInputChip),
            onSelected: (bool value) {},
            onDeleted: () {},
          ),
          InputChip(
            label: Text(context.tr!.labelInputChip),
            isEnabled: false,
            onSelected: (bool value) {},
            onDeleted: () {},
            // onDeleted: () {},
          ),
        ],
      ),
    );
  }
}

class TextInputField extends StatefulWidget {
  const TextInputField({super.key});

  @override
  State<TextInputField> createState() => _TextInputFieldState();
}

class _TextInputFieldState extends State<TextInputField> {
  late TextEditingController _textController1;
  late TextEditingController _textController2;
  late TextEditingController _textController3;
  late TextEditingController _textController4;
  bool _errorState1 = false;
  bool _errorState2 = false;
  bool _errorState3 = false;

  @override
  void initState() {
    super.initState();
    _textController1 = TextEditingController();
    _textController2 = TextEditingController();
    _textController3 = TextEditingController();
    _textController4 = TextEditingController();
  }

  @override
  void dispose() {
    _textController1.dispose();
    _textController2.dispose();
    _textController3.dispose();
    _textController4.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: Column(
        children: <Widget>[
          TextField(
            onChanged: (String text) {
              setState(() {
                if (text.contains('a') | text.isEmpty) {
                  _errorState1 = false;
                } else {
                  _errorState1 = true;
                }
              });
            },
            key: const Key('TextField1'),
            controller: _textController1,
            decoration: InputDecoration(
              hintText: context.tr!.showcaseHintText,
              labelText: context.tr!.showcaseLabelTextUnder,
              errorText: _errorState1
                  ? context.tr!.showcaseErrorText
                  : null,
            ),
          ),
          const SizedBox(height: 16),
          TextField(
            onChanged: (String text) {
              setState(() {
                if (text.contains('a') | text.isEmpty) {
                  _errorState2 = false;
                } else {
                  _errorState2 = true;
                }
              });
            },
            key: const Key('TextField2'),
            controller: _textController2,
            decoration: InputDecoration(
              filled: true,
              hintText: context.tr!.showcaseHintText,
              labelText: '${context.tr!.showcaseLabelTextOutline}, '
                  '${context.tr!.filledSetTrue}',
              errorText: _errorState2
                  ? context.tr!.showcaseErrorText
                  : null,
            ),
          ),
          const SizedBox(height: 16),
          TextField(
            onChanged: (String text) {
              setState(() {
                if (text.contains('a') | text.isEmpty) {
                  _errorState3 = false;
                } else {
                  _errorState3 = true;
                }
              });
            },
            key: const Key('TextField3'),
            controller: _textController3,
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              hintText: context.tr!.showcaseHintText,
              labelText: context.tr!.showcaseLabelTextOutline,
              prefixIcon: const Icon(Icons.search),
              suffixIcon: const Icon(Icons.info),
              errorText: _errorState3
                  ? context.tr!.showcaseErrorText
                  : null,
            ),
          ),
          const SizedBox(height: 16),
          TextField(
            key: const Key('TextField4'),
            controller: _textController4,
            decoration: InputDecoration.collapsed(
              hintText: context.tr!.showcaseHintCollapseText,
            ),
          ),
          const SizedBox(height: 16),
          TextField(
            controller: TextEditingController(),
            enabled: false,
            decoration: InputDecoration(
              labelText: context.tr!.labelTextDisabled,
            ),
          ),
          const SizedBox(height: 16),
          TextField(
            controller: TextEditingController(text: 'Disabled with text entry'),
            enabled: false,
            decoration: InputDecoration(
              labelText: context.tr!.labelTextDisabled,
              prefixIcon: const Icon(Icons.search),
              suffixIcon: const Icon(Icons.info),
            ),
          ),
        ],
      ),
    );
  }
}

class AppBarShowcase extends StatelessWidget {
  const AppBarShowcase({super.key});

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: MediaQuery.removePadding(
        context: context,
        removeBottom: true,
        removeTop: true,
        child: Column(
          children: <Widget>[
            Stack(
              alignment: AlignmentDirectional.center,
              children: <Widget>[
                const _BehindAppBar(),
                AppBar(
                  leading: IconButton(
                    icon: const Icon(Icons.menu),
                    onPressed: () {},
                  ),
                  title: Text('${context.tr!.tooltipStandard} ${context.tr!.appBar}'),
                  actions: <Widget>[
                    IconButton(
                      icon: const Icon(Icons.search),
                      onPressed: () {},
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 8),
            // A bit nasty usage of CustomScrollViews and Slivers and
            // shrinkWraps, to show what the SliverAppBars look like, don't
            // do this in a production app. With just a few widgets,
            // we can get away with it.
            Stack(
              alignment: AlignmentDirectional.center,
              children: <Widget>[
                const _BehindAppBar(),
                CustomScrollView(
                  shrinkWrap: true,
                  slivers: <Widget>[
                    SliverAppBar(
                      leading: IconButton(
                        icon: const Icon(Icons.menu),
                        onPressed: () {},
                      ),
                      title: Text(context.tr!.sliverAppBar),
                      actions: <Widget>[
                        IconButton(
                          icon: const Icon(Icons.search),
                          onPressed: () {},
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
            const SizedBox(height: 8),
            Stack(
              alignment: AlignmentDirectional.center,
              children: <Widget>[
                const _BehindAppBar(),
                CustomScrollView(
                  shrinkWrap: true,
                  slivers: <Widget>[
                    SliverAppBar.medium(
                      leading: IconButton(
                        icon: const Icon(Icons.menu),
                        onPressed: () {},
                      ),
                      title: Text(context.tr!.sliverAppBarMedium),
                      actions: <Widget>[
                        IconButton(
                          icon: const Icon(Icons.search),
                          onPressed: () {},
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
            const SizedBox(height: 8),
            Stack(
              alignment: AlignmentDirectional.center,
              children: <Widget>[
                const _BehindAppBar(),
                CustomScrollView(
                  shrinkWrap: true,
                  slivers: <Widget>[
                    SliverAppBar.large(
                      leading: IconButton(
                        icon: const Icon(Icons.menu),
                        onPressed: () {},
                      ),
                      title: Text(context.tr!.sliverAppBarLarge),
                      actions: <Widget>[
                        IconButton(
                          icon: const Icon(Icons.search),
                          onPressed: () {},
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _BehindAppBar extends StatelessWidget {
  const _BehindAppBar();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Wrap(
        spacing: 8,
        runSpacing: 8,
        children: <Widget>[
          Text(context.tr!.behindAppBar),
          CircleAvatar(child: Text(context.tr!.circleAvatarAbrev)),
          InputChip(
            showCheckmark: true,
            selected: true,
            label: Text(context.tr!.labelChipCheck),
            onSelected: (bool value) {},
          ),
        ],
      ),
    );
  }
}

class BottomAppBarShowcase extends StatelessWidget {
  const BottomAppBarShowcase({
    super.key,
    this.explain = true,
  });

  final bool explain;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final TextStyle denseHeader = theme.textTheme.titleMedium!.copyWith(
      fontSize: 13,
    );
    final TextStyle denseBody = theme.textTheme.bodyMedium!
        .copyWith(fontSize: 12, color: theme.textTheme.bodySmall!.color);
    return RepaintBoundary(
      child: MediaQuery.removePadding(
        context: context,
        removeBottom: true,
        removeTop: true,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            BottomAppBar(
              child: Row(
                children: <Widget>[
                  IconButton(
                    tooltip: context.tr!.tooltipOpenNavigationMenu,
                    icon: const Icon(Icons.menu),
                    onPressed: () {},
                  ),
                  const Spacer(),
                  IconButton(
                    tooltip: context.tr!.search,
                    icon: const Icon(Icons.search),
                    onPressed: () {},
                  ),
                  IconButton(
                    tooltip: context.tr!.favorite,
                    icon: const Icon(Icons.favorite),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            if (explain)
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
                child: Text(
                  context.tr!.bottomAppBar,
                  style: denseHeader,
                ),
              ),
            if (explain)
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
                child: Text(
                  context.tr!.explainFlutterM2Color,
                  style: denseBody,
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class TabBarForAppBarShowcase extends StatelessWidget {
  const TabBarForAppBarShowcase({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final bool isDark = theme.brightness == Brightness.dark;
    final bool useM3 = theme.useMaterial3;
    final ColorScheme colorScheme = theme.colorScheme;

    final Color effectiveTabBackground = theme.appBarTheme.backgroundColor ??
        (isDark
            ? colorScheme.surface
            : useM3
            ? colorScheme.surface
            : colorScheme.primary);
    final TextStyle denseHeader = theme.textTheme.titleMedium!.copyWith(
      fontSize: 13,
    );
    final TextStyle denseBody = theme.textTheme.bodyMedium!
        .copyWith(fontSize: 12, color: theme.textTheme.bodySmall!.color);

    return RepaintBoundary(
      child: DefaultTabController(
        length: 3,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Material(
              color: effectiveTabBackground,
              child: SizedBox(
                height: 70,
                child: TabBar(
                  tabs: <Widget>[
                    Tab(
                      text: context.tr!.labelChat,
                      icon: Badge(
                        label: Text(context.tr!.tabBadgeLabel18),
                        child: const Icon(Icons.chat_bubble),
                      ),
                    ),
                    Tab(
                      text: context.tr!.tabTasks,
                      icon: const Icon(Icons.beenhere),
                    ),
                    Tab(
                      text: context.tr!.tabFolder,
                      icon: const Icon(Icons.create_new_folder),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
              child: Text(
                context.tr!.tabBarAppBar,
                style: denseHeader,
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
              child: Text(
                context.tr!.tabBarIfAppBar,
                style: denseBody,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TabBarForBackgroundShowcase extends StatelessWidget {
  const TabBarForBackgroundShowcase({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final TextStyle denseHeader = theme.textTheme.titleMedium!.copyWith(
      fontSize: 13,
    );
    final TextStyle denseBody = theme.textTheme.bodyMedium!
        .copyWith(fontSize: 12, color: theme.textTheme.bodySmall!.color);
    return RepaintBoundary(
      child: DefaultTabController(
        length: 3,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Material(
              color: theme.colorScheme.surface,
              child: SizedBox(
                height: 70,
                child: TabBar(
                  tabs: <Widget>[
                    Tab(
                      text: context.tr!.labelChat,
                      icon: Badge(
                        label: Text(context.tr!.tabBadgeLabel99),
                        child: const Icon(Icons.chat_bubble),
                      ),
                    ),
                    Tab(
                      text: context.tr!.tabTasks,
                      icon: const Icon(Icons.beenhere),
                    ),
                    Tab(
                      text: context.tr!.tabFolder,
                      icon: const Icon(Icons.create_new_folder),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
              child: Text(
                context.tr!.tabBarSurface,
                style: denseHeader,
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
              child: Text(
                context.tr!.tabBarIfSurface,
                style: denseBody,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BottomNavigationBarShowcase extends StatefulWidget {
  const BottomNavigationBarShowcase({super.key, this.explain = true});

  final bool explain;

  @override
  State<BottomNavigationBarShowcase> createState() =>
      _BottomNavigationBarShowcaseState();
}

class _BottomNavigationBarShowcaseState
    extends State<BottomNavigationBarShowcase> {
  int buttonIndex = 0;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final TextStyle denseHeader = theme.textTheme.titleMedium!.copyWith(
      fontSize: 13,
    );
    final TextStyle denseBody = theme.textTheme.bodyMedium!
        .copyWith(fontSize: 12, color: theme.textTheme.bodySmall!.color);
    return RepaintBoundary(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          MediaQuery.removePadding(
            context: context,
            removeBottom: true,
            removeTop: true,
            child: Stack(
              alignment: AlignmentDirectional.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: <Widget>[
                      Text(context.tr!.behindBottom),
                      FloatingActionButton.small(
                        heroTag: context.tr!.behindBottom,
                        onPressed: () {},
                        child: const Icon(Icons.add),
                      ),
                      InputChip(
                        showCheckmark: true,
                        selected: true,
                        label: Text(context.tr!.labelChipCheck),
                        onSelected: (bool value) {},
                      ),
                    ],
                  ),
                ),
                BottomNavigationBar(
                  currentIndex: buttonIndex,
                  onTap: (int value) {
                    setState(() {
                      buttonIndex = value;
                    });
                  },
                  items: <BottomNavigationBarItem>[
                    BottomNavigationBarItem(
                      icon: Badge(
                        label: Text(context.tr!.tabBadgeLabel3),
                        child: const Icon(Icons.chat_bubble),
                      ),
                      label: 'Chat',
                      // title: Text('Item 1'),
                    ),
                    BottomNavigationBarItem(
                      icon: const Icon(Icons.beenhere),
                      label: context.tr!.tabTasks,
                      // title: Text('Item 2'),
                    ),
                    BottomNavigationBarItem(
                      icon: const Icon(Icons.create_new_folder),
                      label: context.tr!.tabFolder,
                      // title: Text('Item 3'),
                    ),
                  ],
                ),
              ],
            ),
          ),
          if (widget.explain)
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
              child: Text(
                context.tr!.bottomNavigationBar,
                style: denseHeader,
              ),
            ),
          if (widget.explain)
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
              child: Text(
                context.tr!.defaultSdkBackgroundColor,
                style: denseBody,
              ),
            ),
        ],
      ),
    );
  }
}

class NavigationBarShowcase extends StatefulWidget {
  const NavigationBarShowcase({super.key, this.explain = true});
  final bool explain;

  @override
  State<NavigationBarShowcase> createState() => _NavigationBarShowcaseState();
}

class _NavigationBarShowcaseState extends State<NavigationBarShowcase> {
  int buttonIndex = 0;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final TextStyle denseHeader = theme.textTheme.titleMedium!.copyWith(
      fontSize: 13,
    );
    final TextStyle denseBody = theme.textTheme.bodyMedium!
        .copyWith(fontSize: 12, color: theme.textTheme.bodySmall!.color);
    return RepaintBoundary(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          MediaQuery.removePadding(
            context: context,
            removeBottom: true,
            removeTop: true,
            child: Stack(
              alignment: AlignmentDirectional.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: <Widget>[
                      Text(context.tr!.behindNavBar),
                      FloatingActionButton.small(
                        heroTag: context.tr!.behindNavBar,
                        onPressed: () {},
                        child: const Icon(Icons.add),
                      ),
                      InputChip(
                        showCheckmark: true,
                        selected: true,
                        label: Text(context.tr!.labelChipCheck),
                        onSelected: (bool value) {},
                      ),
                    ],
                  ),
                ),
                NavigationBar(
                  selectedIndex: buttonIndex,
                  onDestinationSelected: (int value) {
                    setState(() {
                      buttonIndex = value;
                    });
                  },
                  destinations: <NavigationDestination>[
                    NavigationDestination(
                      icon: Badge(
                        label: Text(context.tr!.navBadgeText12),
                        child: const Icon(Icons.chat_bubble),
                      ),
                      label: context.tr!.labelChat,
                    ),
                    NavigationDestination(
                      icon: const Icon(Icons.beenhere),
                      label: context.tr!.tabTasks,
                    ),
                    NavigationDestination(
                      icon: const Icon(Icons.create_new_folder),
                      label: context.tr!.tabFolder,
                    ),
                  ],
                ),
              ],
            ),
          ),
          if (widget.explain)
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
              child: Text(
                context.tr!.navigationBarM3,
                style: denseHeader,
              ),
            ),
          if (widget.explain)
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
              child: Text(
                context.tr!.defaultBackgroundColorSurface,
                style: denseBody,
              ),
            ),
        ],
      ),
    );
  }
}

class NavigationRailShowcase extends StatefulWidget {
  const NavigationRailShowcase({
    super.key,
    this.child,
    this.height = 400,
    this.explain = true,
  });

  /// A child widget that we can use to place controls on the
  /// side of the NavigationRail in the show case widget.
  final Widget? child;

  /// The vertical space for the navigation bar.
  final double height;

  final bool explain;

  @override
  State<NavigationRailShowcase> createState() => _NavigationRailShowcaseState();
}

class _NavigationRailShowcaseState extends State<NavigationRailShowcase> {
  int buttonIndex = 0;
  bool isExtended = false;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final TextStyle denseHeader = theme.textTheme.titleMedium!.copyWith(
      fontSize: 13,
    );
    final TextStyle denseBody = theme.textTheme.bodyMedium!
        .copyWith(fontSize: 12, color: theme.textTheme.bodySmall!.color);

    return RepaintBoundary(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          if (widget.explain)
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
              child: Text(
                context.tr!.navigationRail,
                style: denseHeader,
              ),
            ),
          if (widget.explain)
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
              child: Text(
                context.tr!.flutterBackgroundColor,
                style: denseBody,
              ),
            ),
          const Divider(height: 1),
          SizedBox(
            height: widget.height,
            // If we expand the rail and have a very narrow screen, it will
            // take up a lot of height, more than we want to give to the demo
            // panel, just let it overflow then. This may happen when we place
            // a lot of widgets in the child that no longer fits on a phone
            // with expanded rail.
            child: ClipRect(
              child: OverflowBox(
                alignment: AlignmentDirectional.topStart,
                maxHeight: 1200,
                child: Row(
                  children: <Widget>[
                    MediaQuery.removePadding(
                      context: context,
                      removeBottom: true,
                      removeTop: true,
                      child: NavigationRail(
                        extended: isExtended,
                        minExtendedWidth: 150,
                        labelType:
                        isExtended ? NavigationRailLabelType.none : null,
                        selectedIndex: buttonIndex,
                        onDestinationSelected: (int value) {
                          setState(() {
                            buttonIndex = value;
                          });
                        },
                        destinations: <NavigationRailDestination>[
                          NavigationRailDestination(
                            icon: Badge(
                              label: Text(context.tr!.navBadgeText5),
                              child: const Icon(Icons.chat_bubble),
                            ),
                            label: Text(context.tr!.labelChat),
                          ),
                          NavigationRailDestination(
                            icon: const Icon(Icons.beenhere),
                            label: Text(context.tr!.tabTasks),
                          ),
                          NavigationRailDestination(
                            icon: const Icon(Icons.create_new_folder),
                            label: Text(context.tr!.tabFolder),
                          ),
                          NavigationRailDestination(
                            icon: const Icon(Icons.logout),
                            label: Text(context.tr!.logout),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: <Widget>[
                          SwitchListTile(
                            title: Text(context.tr!.expandCollapseTitle),
                            subtitle:
                            Text(context.tr!.expandCollapseSubTitle),
                            value: isExtended,
                            onChanged: (bool value) {
                              setState(() {
                                isExtended = value;
                              });
                            },
                          ),
                          if (widget.child != null)
                            RepaintBoundary(child: widget.child)
                          else
                            const SizedBox.shrink(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MenuBarShowcase extends StatelessWidget {
  const MenuBarShowcase({
    super.key,
    this.explainUsage = true,
    this.explainIndent = 0,
  });
  final bool explainUsage;
  final double explainIndent;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final TextStyle denseHeader = theme.textTheme.titleMedium!.copyWith(
      fontSize: 13,
    );
    final TextStyle denseBody = theme.textTheme.bodyMedium!
        .copyWith(fontSize: 12, color: theme.textTheme.bodySmall!.color);
    return Shortcuts(
      shortcuts: const <ShortcutActivator, Intent>{
        SingleActivator(LogicalKeyboardKey.keyT, control: true):
        VoidCallbackIntent(debugDumpApp),
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          if (explainUsage)
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(explainIndent, 16, 0, 0),
              child: Text(
                context.tr!.menuBar,
                style: denseHeader,
              ),
            ),
          if (explainUsage)
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(explainIndent, 0, 0, 8),
              child: Text(
                context.tr!.menuBarM3,
                style: denseBody,
              ),
            ),
          Row(
            children: <Widget>[
              Expanded(
                child: MenuBar(
                  children: <Widget>[
                    SubmenuButton(
                      menuChildren: <Widget>[
                        MenuItemButton(
                          onPressed: () {
                            showAboutDialog(
                              context: context,
                              useRootNavigator: false,
                              applicationName: context.tr!.menuBarDemo,
                              applicationVersion: '1.0.0',
                            );
                          },
                          child: MenuAcceleratorLabel('&${context.tr!.about}'),
                        ),
                        SubmenuButton(
                          menuChildren: <Widget>[
                            MenuItemButton(
                              onPressed: () {
                                ScaffoldMessenger.of(context).showSnackBar(
                                   SnackBar(
                                    content: Text('${context.tr!.save}!'),
                                  ),
                                );
                              },
                              child: MenuAcceleratorLabel('&${context.tr!.saveNow}'),
                            ),
                            MenuItemButton(
                              onPressed: () {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text('${context.tr!.load}!'),
                                  ),
                                );
                              },
                              child: MenuAcceleratorLabel('&${context.tr!.loadNow}'),
                            ),
                          ],
                          child: Text(context.tr!.file),
                        ),
                        MenuItemButton(
                          onPressed: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('${context.tr!.quit}!'),
                              ),
                            );
                          },
                          child: MenuAcceleratorLabel('&${context.tr!.quit}'),
                        ),
                      ],
                      child: MenuAcceleratorLabel('&${context.tr!.file}'),
                    ),
                    SubmenuButton(
                      menuChildren: <Widget>[
                        MenuItemButton(
                          onPressed: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('${context.tr!.bold}!'),
                              ),
                            );
                          },
                          child: MenuAcceleratorLabel('&${context.tr!.bold}'),
                        ),
                        MenuItemButton(
                          onPressed: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('${context.tr!.italic}!'),
                              ),
                            );
                          },
                          child: MenuAcceleratorLabel('&${context.tr!.italic}'),
                        ),
                        MenuItemButton(
                          onPressed: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('${context.tr!.underline}!'),
                              ),
                            );
                          },
                          child: MenuAcceleratorLabel('&${context.tr!.underline}'),
                        ),
                      ],
                      child: MenuAcceleratorLabel('&${context.tr!.style}'),
                    ),
                    SubmenuButton(
                      menuChildren: <Widget>[
                        MenuItemButton(
                          onPressed: null,
                          child: MenuAcceleratorLabel('&${context.tr!.disabledItem}'),
                        ),
                        MenuItemButton(
                          onPressed: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('${context.tr!.minify}!'),
                              ),
                            );
                          },
                          child: MenuAcceleratorLabel('&${context.tr!.minify}'),
                        ),
                      ],
                      child: MenuAcceleratorLabel('&${context.tr!.viewTitle}'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class MenuAnchorShowcase extends StatelessWidget {
  const MenuAnchorShowcase({super.key, this.explainUsage = true});
  final bool explainUsage;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final TextStyle denseHeader = theme.textTheme.titleMedium!.copyWith(
      fontSize: 13,
    );
    final TextStyle denseBody = theme.textTheme.bodyMedium!
        .copyWith(fontSize: 12, color: theme.textTheme.bodySmall!.color);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        if (explainUsage)
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 16, 0, 0),
            child: Text(
              context.tr!.menuAnchor,
              style: denseHeader,
            ),
          ),
        if (explainUsage)
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 8),
            child: Text(
              context.tr!.menuAnchorM3Text,
              style: denseBody,
            ),
          ),
        Row(
          children: <Widget>[
            Expanded(
              child: MenuAnchorContextMenu(
                message: context.tr!.menuAnchorM3ctx,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

/// An enhanced enum to define the available menus and their shortcuts.
///
/// Using an enum for menu definition is not required, but this illustrates how
/// they could be used for simple menu systems.
enum MenuEntry {
  about('About'),
  showMessage(
      'Show Message', SingleActivator(LogicalKeyboardKey.keyS, control: true)),
  hideMessage(
      'Hide Message', SingleActivator(LogicalKeyboardKey.keyH, control: true)),
  colorMenu('Color Menu'),
  colorRed('Red', SingleActivator(LogicalKeyboardKey.keyR, control: true)),
  colorGreen('Green', SingleActivator(LogicalKeyboardKey.keyG, control: true)),
  colorBlue('Blue', SingleActivator(LogicalKeyboardKey.keyB, control: true));

  const MenuEntry(this.label, [this.shortcut]);
  final String label;
  final MenuSerializableShortcut? shortcut;
}

class MenuAnchorContextMenu extends StatefulWidget {
  const MenuAnchorContextMenu({super.key, required this.message});

  final String message;

  @override
  State<MenuAnchorContextMenu> createState() => _MenuAnchorContextMenuState();
}

class _MenuAnchorContextMenuState extends State<MenuAnchorContextMenu> {
  MenuEntry? _lastSelection;
  final FocusNode _buttonFocusNode = FocusNode(debugLabel: 'Menu Button');
  final MenuController _menuController = MenuController();
  ShortcutRegistryEntry? _shortcutsEntry;
  bool get showingMessage => _showingMessage;
  bool _showingMessage = false;
  set showingMessage(bool value) {
    if (_showingMessage != value) {
      setState(() {
        _showingMessage = value;
      });
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Dispose of any previously registered shortcuts, since they are about to
    // be replaced.
    _shortcutsEntry?.dispose();
    // Collect the shortcuts from the different menu selections so that they can
    // be registered to apply to the entire app. Menus don't register their
    // shortcuts, they only display the shortcut hint text.
    final Map<ShortcutActivator, Intent> shortcuts =
    <ShortcutActivator, Intent>{
      for (final MenuEntry item in MenuEntry.values)
        if (item.shortcut != null)
          item.shortcut!: VoidCallbackIntent(() => _activate(item)),
    };
    // Register the shortcuts with the ShortcutRegistry so that they are
    // available to the entire application.
    final Map<ShortcutActivator, Intent>? entries =
        ShortcutRegistry.maybeOf(context)?.shortcuts;
    // TODO(rydmike): Potential issue with ShortcutRegistry? Investigate.
    // Workaround to avoid issue of entries being added multiple times, the
    // dispose of them does not seem to work all the time. This widget is in
    // this app potentially shown in many places, the only shortcut entries we
    // should have are the same ones, if it exists and has not been disposed
    // when this is called we can add it, if it exists it is the one we want
    // already. We could also check for the specific entries, but for this case
    // this workaround is enough.
    // The ShortcutRegistry is perhaps intended to be used as one global
    // setting in the app, it should be higher up in the tree, then we would
    // not have this issue, still dispose and create new ones should work.
    if (entries?.isEmpty ?? false) {
      _shortcutsEntry = ShortcutRegistry.of(context).addAll(shortcuts);
    }
  }

  @override
  void dispose() {
    _shortcutsEntry?.dispose();
    _buttonFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return GestureDetector(
      onTapDown: _handleTapDown,
      child: MenuAnchor(
        controller: _menuController,
        anchorTapClosesMenu: true,
        menuChildren: <Widget>[
          MenuItemButton(
            child: Text(MenuEntry.about.label),
            onPressed: () => _activate(MenuEntry.about),
          ),
          MenuItemButton(
            child: Text(context.tr!.disabledItem),
          ),
          if (_showingMessage)
            MenuItemButton(
              onPressed: () => _activate(MenuEntry.hideMessage),
              shortcut: MenuEntry.hideMessage.shortcut,
              child: Text(MenuEntry.hideMessage.label),
            ),
          if (!_showingMessage)
            MenuItemButton(
              onPressed: () => _activate(MenuEntry.showMessage),
              shortcut: MenuEntry.showMessage.shortcut,
              child: Text(MenuEntry.showMessage.label),
            ),
          SubmenuButton(
            menuChildren: <Widget>[
              MenuItemButton(
                onPressed: () => _activate(MenuEntry.colorRed),
                shortcut: MenuEntry.colorRed.shortcut,
                child: Text(MenuEntry.colorRed.label),
              ),
              MenuItemButton(
                onPressed: () => _activate(MenuEntry.colorGreen),
                shortcut: MenuEntry.colorGreen.shortcut,
                child: Text(MenuEntry.colorGreen.label),
              ),
              MenuItemButton(
                onPressed: () => _activate(MenuEntry.colorBlue),
                shortcut: MenuEntry.colorBlue.shortcut,
                child: Text(MenuEntry.colorBlue.label),
              ),
            ],
            child: Text(context.tr!.color),
          ),
        ],
        child: Card(
          margin: EdgeInsets.zero,
          elevation: 1,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  context.tr!.menuAnchorM3ctxClick,
                  textAlign: TextAlign.center,
                ),
                Text(
                  context.tr!.menuKeyboardShortcuts,
                  textAlign: TextAlign.center,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Text(
                    showingMessage ? widget.message : '',
                    style: theme.textTheme.bodyLarge,
                    textAlign: TextAlign.center,
                  ),
                ),
                Text(
                  _lastSelection != null
                      ? '${context.tr!.lastSelected}: ${_lastSelection!.label}'
                      : '',
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _activate(MenuEntry selection) {
    setState(() {
      _lastSelection = selection;
    });
    switch (selection) {
      case MenuEntry.about:
        showAboutDialog(
          context: context,
          useRootNavigator: false,
          applicationName: context.tr!.menuAnchorDemo,
          applicationVersion: '1.0.0',
        );
        break;
      case MenuEntry.showMessage:
      case MenuEntry.hideMessage:
        showingMessage = !showingMessage;
        break;
      case MenuEntry.colorMenu:
        break;
      case MenuEntry.colorRed:
        break;
      case MenuEntry.colorGreen:
        break;
      case MenuEntry.colorBlue:
        break;
    }
  }

  void _handleTapDown(TapDownDetails details) {
    // If you want control CLICK for context menu, uncomment this.
    // if (!HardwareKeyboard.instance.logicalKeysPressed
    //         .contains(LogicalKeyboardKey.controlLeft) &&
    //     !HardwareKeyboard.instance.logicalKeysPressed
    //         .contains(LogicalKeyboardKey.controlRight)) {
    //   return;
    // }
    _menuController.open(position: details.localPosition);
  }
}

class DrawerShowcase extends StatelessWidget {
  const DrawerShowcase({super.key, this.explain = true});
  final bool explain;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final TextStyle denseHeader = theme.textTheme.titleMedium!.copyWith(
      fontSize: 13,
    );
    final TextStyle denseBody = theme.textTheme.bodyMedium!
        .copyWith(fontSize: 12, color: theme.textTheme.bodySmall!.color);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        if (explain)
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
            child: Text(
              context.tr!.drawer,
              style: denseHeader,
            ),
          ),
        if (explain)
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
            child: Text(
              context.tr!.flutterBackgroundColorM3,
              style: denseBody,
            ),
          ),
        SizedBox(
          height: 280,
          child: MediaQuery.removePadding(
            context: context,
            removeBottom: true,
            removeTop: true,
            child: Drawer(
              child: Center(
                child: Text(context.tr!.drawer),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class NavigationDrawerShowcase extends StatefulWidget {
  const NavigationDrawerShowcase({super.key, this.explain = true});

  final bool explain;

  @override
  State<NavigationDrawerShowcase> createState() =>
      _NavigationDrawerShowcaseState();
}

class _NavigationDrawerShowcaseState extends State<NavigationDrawerShowcase> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final TextStyle denseHeader = theme.textTheme.titleMedium!.copyWith(
      fontSize: 13,
    );
    final TextStyle denseBody = theme.textTheme.bodyMedium!
        .copyWith(fontSize: 12, color: theme.textTheme.bodySmall!.color);

    return RepaintBoundary(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          if (widget.explain)
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
              child: Text(
                context.tr!.navigationDrawer,
                style: denseHeader,
              ),
            ),
          if (widget.explain)
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
              child: Text(
                context.tr!.flutterBackgroundColor,
                style: denseBody,
              ),
            ),
          MediaQuery.removePadding(
            context: context,
            removeBottom: true,
            removeTop: true,
            removeLeft: true,
            removeRight: true,
            child: SizedBox(
              height: 280,
              child: NavigationDrawer(
                selectedIndex: selectedIndex,
                onDestinationSelected: (int value) {
                  setState(() {
                    selectedIndex = value;
                  });
                },
                children: <Widget>[
                  const SizedBox(height: 16),
                  NavigationDrawerDestination(
                    icon: Badge(
                      label: Text(context.tr!.navBadgeText26),
                      child: const Icon(Icons.chat_bubble),
                    ),
                    label: Text(context.tr!.labelChat),
                  ),
                  NavigationDrawerDestination(
                    icon: const Icon(Icons.beenhere),
                    label: Text(context.tr!.tabTasks),
                  ),
                  const Divider(),
                  NavigationDrawerDestination(
                    icon: const Icon(Icons.create_new_folder),
                    label: Text(context.tr!.tabFolder),
                  ),
                  NavigationDrawerDestination(
                    icon: const Icon(Icons.logout),
                    label: Text(context.tr!.logout),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ListTileAllShowcase extends StatelessWidget {
  const ListTileAllShowcase({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: <Widget>[
        ListTileShowcase(),
        Divider(height: 1),
        SwitchTileShowcase(),
        Divider(height: 1),
        CheckboxTileShowcase(),
        Divider(height: 1),
        RadioTileShowcase(),
      ],
    );
  }
}

class ListTileShowcase extends StatelessWidget {
  const ListTileShowcase({super.key});

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: Column(
        children: <Widget>[
          ListTile(
            leading: const Icon(Icons.info),
            title: Text(context.tr!.showcaseListTileTitle),
            subtitle: Text(context.tr!.showcaseListTileSubTitle),
            trailing: Text(context.tr!.showcaseListTileTrailing),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.info),
            title: Text(context.tr!.showcaseListTileSelectedTitle),
            subtitle: Text(context.tr!.showcaseListTileSelectedSubTitle),
            trailing: Text(context.tr!.showcaseListTileTrailing),
            selected: true,
            onTap: () {},
          ),
          ListTile(
            enabled: false,
            leading: const Icon(Icons.info),
            title: Text('${context.tr!.showcaseListTileTitle} ${context.tr!.disabledMin}'),
            subtitle: Text(context.tr!.showcaseListTileSelectedSubTitle),
            trailing: Text(context.tr!.showcaseListTileTrailing),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}

class SwitchTileShowcase extends StatelessWidget {
  const SwitchTileShowcase({super.key});

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: Column(
        children: <Widget>[
          SwitchListTile(
            secondary: const Icon(Icons.info),
            title: Text(context.tr!.switchListTileTitle),
            subtitle: Text(context.tr!.switchListTileSubTitleOff),
            value: false,
            onChanged: (bool value) {},
          ),
          SwitchListTile(
            secondary: const Icon(Icons.info),
            title: Text(context.tr!.switchListTileTitle),
            subtitle: Text(context.tr!.switchListTileSubTitleOn),
            value: true,
            onChanged: (bool value) {},
          ),
          SwitchListTile(
            secondary: const Icon(Icons.info),
            title: Text(context.tr!.switchListTileTitleDisabled),
            subtitle: Text(context.tr!.switchListTileSubTitleOn),
            value: true,
            onChanged: null,
          ),
        ],
      ),
    );
  }
}

class CheckboxTileShowcase extends StatelessWidget {
  const CheckboxTileShowcase({super.key});

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: Column(
        children: <Widget>[
          CheckboxListTile(
            secondary: const Icon(Icons.info),
            title: Text(context.tr!.checkboxListTileTitle),
            subtitle: Text(context.tr!.checkboxListTileUnchecked),
            value: false,
            onChanged: (bool? value) {},
          ),
          CheckboxListTile(
            secondary: const Icon(Icons.info),
            title: Text(context.tr!.checkboxListTileTitle),
            subtitle: Text(context.tr!.checkboxListTileChecked),
            value: true,
            onChanged: (bool? value) {},
          ),
          CheckboxListTile(
            secondary: const Icon(Icons.info),
            title: Text(context.tr!.checkboxListTileTitle),
            subtitle: Text(context.tr!.checkboxListTileTristate),
            tristate: true,
            value: null,
            onChanged: (bool? value) {},
          ),
          CheckboxListTile(
            enabled: false,
            secondary: const Icon(Icons.info),
            title: Text(context.tr!.checkboxListTileTitleDisabled),
            subtitle: Text(context.tr!.checkboxListTileChecked),
            value: true,
            onChanged: (bool? value) {},
          ),
        ],
      ),
    );
  }
}

class RadioTileShowcase extends StatelessWidget {
  const RadioTileShowcase({super.key});

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: Column(
        children: <Widget>[
          RadioListTile<int>(
            secondary: const Icon(Icons.info),
            title: Text(context.tr!.radioListTile),
            subtitle: Text(context.tr!.radioOptionUnselected),
            value: 0,
            onChanged: (_) {},
            groupValue: 1,
          ),
          RadioListTile<int>(
            secondary: const Icon(Icons.info),
            title: Text(context.tr!.radioListTile),
            subtitle: Text(context.tr!.radioOptionSelected),
            value: 1,
            onChanged: (_) {},
            groupValue: 1,
          ),
          RadioListTile<int>(
            secondary: const Icon(Icons.info),
            title: Text(context.tr!.radioListTile),
            subtitle: Text(context.tr!.radioOptionListSelected),
            value: 1,
            selected: true,
            onChanged: (_) {},
            groupValue: 1,
          ),
          RadioListTile<int>(
            secondary: const Icon(Icons.info),
            title: Text(context.tr!.radioListTileDisabled),
            subtitle: Text(context.tr!.radioOptionSelected),
            value: 1,
            onChanged: null,
            groupValue: 1,
          ),
        ],
      ),
    );
  }
}

class ExpansionTileShowcase extends StatefulWidget {
  const ExpansionTileShowcase({super.key});

  @override
  State<ExpansionTileShowcase> createState() => _ExpansionTileShowcaseState();
}

class _ExpansionTileShowcaseState extends State<ExpansionTileShowcase> {
  bool _customTileExpanded = false;

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: Column(
        children: <Widget>[
          ExpansionTile(
            title: Text(context.tr!.expansionTileTitle1),
            subtitle: Text(context.tr!.expansionTileSubTitle1),
            children: <Widget>[
              ListTile(title: Text(context.tr!.expansionTileListTitle1)),
            ],
          ),
          ExpansionTile(
            title: Text(context.tr!.expansionTileTitle2),
            subtitle: Text(context.tr!.expansionTileSubTitle2),
            trailing: Icon(
              _customTileExpanded
                  ? Icons.arrow_drop_down_circle
                  : Icons.arrow_drop_down,
            ),
            children: <Widget>[
              ListTile(title: Text(context.tr!.expansionTileListTitle2)),
            ],
            onExpansionChanged: (bool expanded) {
              setState(() => _customTileExpanded = expanded);
            },
          ),
          ExpansionTile(
            title: Text(context.tr!.expansionTileTitle3),
            subtitle: Text(context.tr!.expansionTileSubTitle3),
            controlAffinity: ListTileControlAffinity.leading,
            children: <Widget>[
              ListTile(title: Text(context.tr!.expansionTileListTitle3)),
            ],
          ),
        ],
      ),
    );
  }
}

class ExpansionPanelListShowcase extends StatefulWidget {
  const ExpansionPanelListShowcase({super.key});

  @override
  State<ExpansionPanelListShowcase> createState() =>
      _ExpansionPanelListShowcaseState();
}

class _ExpansionPanelListShowcaseState
    extends State<ExpansionPanelListShowcase> {
  final List<ExpansionPanelShowcaseItems> _items =
  ExpansionPanelShowcaseItems.generateItems(6);

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: ExpansionPanelList(
        expansionCallback: (int index, bool isExpanded) {
          setState(() {
            _items[index].isExpanded = !isExpanded;
          });
        },
        children:
        _items.map<ExpansionPanel>((ExpansionPanelShowcaseItems item) {
          return ExpansionPanel(
            headerBuilder: (BuildContext context, bool isExpanded) {
              return ListTile(
                title: Text(item.headerValue),
              );
            },
            body: ListTile(
              title: Text(item.expandedValue),
              subtitle: item.id > 2
                  ? Text(context.tr!.expansionPanelDelete)
                  : Text(context.tr!.expansionPanelFixed),
              trailing: item.id > 2
                  ? IconButton(
                icon: const Icon(Icons.delete),
                onPressed: () {
                  setState(() {
                    _items.removeWhere(
                            (ExpansionPanelShowcaseItems currentItem) =>
                        item == currentItem);
                  });
                },
              )
                  : null,
            ),
            isExpanded: item.isExpanded,
          );
        }).toList(),
      ),
    );
  }
}

// Stores ExpansionPanel state information
class ExpansionPanelShowcaseItems {
  ExpansionPanelShowcaseItems({
    required this.id,
    required this.expandedValue,
    required this.headerValue,
    this.isExpanded = false,
  });

  final int id;
  final String expandedValue;
  final String headerValue;
  bool isExpanded;

  static List<ExpansionPanelShowcaseItems> generateItems(int numberOfItems) {
    return List<ExpansionPanelShowcaseItems>.generate(numberOfItems,
            (int index) {
          return ExpansionPanelShowcaseItems(
            id: index,
            headerValue: 'ExpansionPanelList tile $index',
            expandedValue: 'This is ExpansionPanel item number $index',
          );
        });
  }
}

class AlertDialogShowcase extends StatelessWidget {
  const AlertDialogShowcase({super.key});

  Future<void> _openDialog(BuildContext context) async {
    await showDialog<void>(
        context: context,
        useRootNavigator: false,
        builder: (BuildContext context) => const _AlertDialogExample());
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const AbsorbPointer(child: _AlertDialogExample()),
        TextButton(
          child: Text(
            '${context.tr!.show} ${context.tr!.alertDialog}',
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          onPressed: () async => _openDialog(context),
        ),
      ],
    );
  }
}

class _AlertDialogExample extends StatelessWidget {
  const _AlertDialogExample();

  @override
  Widget build(BuildContext context) {
    final bool useMaterial3 = Theme.of(context).useMaterial3;
    final String cancel = useMaterial3 ? context.tr!.cancel : context.tr!.cancel.toUpperCase();
    final String allow = useMaterial3 ? context.tr!.allow : context.tr!.allow.toUpperCase();

    return AlertDialog(
      title: Text(context.tr!.allowLocServ),
      content: Text(context.tr!.allowLocServText),
      actions: <Widget>[
        TextButton(
            onPressed: () => context.pop(), child: Text(cancel)),
        TextButton(
            onPressed: () => context.pop(), child: Text(allow)),
      ],
    );
  }
}

class TimePickerDialogShowcase extends StatelessWidget {
  const TimePickerDialogShowcase({super.key});

  Future<void> _openDialog(BuildContext context) async {
    await showDialog<void>(
      context: context,
      useRootNavigator: false,
      builder: (BuildContext context) => TimePickerDialog(
        initialTime: TimeOfDay.now(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        AbsorbPointer(
          child: TimePickerDialog(
            initialTime: TimeOfDay.now(),
          ),
        ),
        TextButton(
          child: Text(
            '${context.tr!.show} ${context.tr!.timePickerDialog}',
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          onPressed: () async => _openDialog(context),
        ),
      ],
    );
  }
}

class DatePickerDialogShowcase extends StatelessWidget {
  const DatePickerDialogShowcase({super.key});

  Future<void> _openDialog(BuildContext context) async {
    await showDialog<void>(
      context: context,
      useRootNavigator: false,
      builder: (BuildContext context) => DatePickerDialog(
        initialDate: DateTime.now(),
        firstDate: DateTime(1930),
        lastDate: DateTime(2050),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        AbsorbPointer(
          child: DatePickerDialog(
            initialDate: DateTime.now(),
            firstDate: DateTime(1930),
            lastDate: DateTime(2050),
          ),
        ),
        TextButton(
          child: Text(
            '${context.tr!.show} ${context.tr!.datePickerDialog}',
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          onPressed: () async => _openDialog(context),
        ),
      ],
    );
  }
}

class BottomSheetShowcase extends StatelessWidget {
  const BottomSheetShowcase({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return AbsorbPointer(
      child: BottomSheet(
        enableDrag: false,
        elevation: theme.bottomSheetTheme.elevation,
        backgroundColor: theme.bottomSheetTheme.backgroundColor,
        onClosing: () {},
        builder: (final BuildContext context) => SizedBox(
          height: 150,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  context.tr!.materialBottomSheet,
                  style: theme.textTheme.titleMedium,
                ),
                Text(
                  context.tr!.materialBottomSheetText,
                  style: theme.textTheme.bodySmall,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class BottomSheetModalShowcase extends StatelessWidget {
  const BottomSheetModalShowcase({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return AbsorbPointer(
      child: BottomSheet(
        elevation: theme.bottomSheetTheme.modalElevation,
        backgroundColor: theme.bottomSheetTheme.modalBackgroundColor,
        enableDrag: false,
        onClosing: () {},
        builder: (final BuildContext context) => SizedBox(
          height: 150,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  context.tr!.materialModalBottomSheet,
                  style: theme.textTheme.titleMedium,
                ),
                Text(
                  context.tr!.materialBottomSheetText,
                  style: theme.textTheme.bodySmall,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class MaterialBannerSnackBarShowcase extends StatelessWidget {
  const MaterialBannerSnackBarShowcase({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SnackBarShowcase(),
        SizedBox(height: 16),
        MaterialBannerShowcase(),
        SizedBox(height: 16),
      ],
    );
  }
}

class SnackBarShowcase extends StatelessWidget {
  const SnackBarShowcase({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final bool useMaterial3 = theme.useMaterial3;
    final ColorScheme colorScheme = theme.colorScheme;
    final bool isLight = theme.brightness == Brightness.light;

    final Color defaultBackgroundColor = isLight
        ? useMaterial3
        ? colorScheme.inverseSurface
        : Color.alphaBlend(
        colorScheme.onSurface.withOpacity(0.80), colorScheme.surface)
        : colorScheme.onSurface;
    final Color snackBackground =
        theme.snackBarTheme.backgroundColor ?? defaultBackgroundColor;

    final Color snackForeground =
    ThemeData.estimateBrightnessForColor(snackBackground) ==
        Brightness.light
        ? Colors.black
        : Colors.white;

    final Color defaultActionColor =
    useMaterial3 ? colorScheme.inversePrimary : colorScheme.secondary;
    final Color snackActionColor =
        theme.snackBarTheme.actionTextColor ?? defaultActionColor;

    final TextStyle snackStyle = theme.snackBarTheme.contentTextStyle ??
        ThemeData(brightness: Brightness.light)
            .textTheme
            .titleMedium!
            .copyWith(color: snackForeground);
    final TextStyle snackActionStyle = theme.snackBarTheme.contentTextStyle
        ?.copyWith(color: snackActionColor) ??
        ThemeData(brightness: Brightness.light)
            .textTheme
            .titleMedium!
            .copyWith(color: snackActionColor);
    final double snackElevation = theme.snackBarTheme.elevation ?? 6;

    final ShapeBorder? shape = theme.snackBarTheme.shape;

    return RepaintBoundary(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Material(
              color: snackBackground,
              elevation: snackElevation,
              shadowColor: colorScheme.shadow,
              shape: shape ??
                  const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(4),
                    ),
                  ),
              child: SizedBox(
                height: 46,
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12.0),
                  child: Row(
                    children: <Widget>[
                      const SizedBox(width: 24),
                      Text(context.tr!.aFloatingSnackBar, style: snackStyle),
                      const Spacer(),
                      Text(context.tr!.close, style: snackActionStyle),
                      const SizedBox(width: 24),
                    ],
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
          Material(
            color: snackBackground,
            elevation: snackElevation,
            shadowColor: colorScheme.shadow,
            shape: shape,
            child: SizedBox(
              height: 46,
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 12.0),
                child: Row(
                  children: <Widget>[
                    const SizedBox(width: 24),
                    Text(context.tr!.aFixedSnackBar, style: snackStyle),
                    const Spacer(),
                    Text(context.tr!.close, style: snackActionStyle),
                    const SizedBox(width: 24),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MaterialBannerShowcase extends StatelessWidget {
  const MaterialBannerShowcase({super.key});

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Divider(height: 1),
          MaterialBanner(
            padding: const EdgeInsets.all(20),
            content: Text(context.tr!.helloMaterialBanner),
            leading: const Icon(Icons.agriculture_outlined),
            actions: <Widget>[
              TextButton(
                child: Text(context.tr!.open.toUpperCase()),
                onPressed: () {},
              ),
              TextButton(
                child: Text(context.tr!.dismiss.toUpperCase()),
                onPressed: () {},
              ),
            ],
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}

class MaterialShowcase extends StatelessWidget {
  const MaterialShowcase({super.key, this.explain = true});
  final bool explain;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final ColorScheme colorScheme = theme.colorScheme;
    final TextStyle denseHeader = theme.textTheme.titleMedium!.copyWith(
      fontSize: 13,
    );
    final TextStyle denseBody = theme.textTheme.bodyMedium!
        .copyWith(fontSize: 12, color: theme.textTheme.bodySmall!.color);

    return RepaintBoundary(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          if (explain) ...<Widget>[
            Text(context.tr!.materialShowcaseText1, style: denseHeader),
            Text(
              context.tr!.materialShowcaseText2,
              style: denseBody,
            ),
            const SizedBox(height: 12),
          ],
          Text(context.tr!.materialShowcaseText3, style: denseHeader),
          Text(
            context.tr!.materialShowcaseText4,
            style: denseBody,
          ),
          const SizedBox(height: 8),
          Material(
            type: MaterialType.canvas,
            elevation: 0,
            child: SizedBox(
              height: 60,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Text(
                    context.tr!.materialShowcaseShadowText1,
                    textAlign: TextAlign.center,
                    style: denseHeader,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
          Material(
            type: MaterialType.canvas,
            elevation: 1,
            child: SizedBox(
              height: 60,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Text(
                    context.tr!.materialShowcaseShadowText2,
                    textAlign: TextAlign.center,
                    style: denseHeader,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 8),
          Material(
            type: MaterialType.canvas,
            elevation: 1,
            surfaceTintColor: colorScheme.surfaceTint,
            shadowColor: Colors.transparent,
            child: SizedBox(
              height: 60,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Text(
                    context.tr!.materialShowcaseSurface,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 8),
          Material(
            type: MaterialType.canvas,
            elevation: 1,
            surfaceTintColor: colorScheme.surfaceTint,
            shadowColor: colorScheme.shadow,
            child: SizedBox(
              height: 60,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Text(
                    context.tr!.materialShowcaseSurfaceShadow,
                    textAlign: TextAlign.center,
                    style: denseHeader,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
          Material(
            type: MaterialType.canvas,
            elevation: 6,
            child: SizedBox(
              height: 60,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Text(
                    context.tr!.materialShowcaseShadowText3,
                    textAlign: TextAlign.center,
                    style: denseHeader,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
          Material(
            type: MaterialType.canvas,
            elevation: 6,
            surfaceTintColor: colorScheme.surfaceTint,
            shadowColor: Colors.transparent,
            child: SizedBox(
              height: 60,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Text(
                    context.tr!.materialShowcaseSurface2,
                    textAlign: TextAlign.center,
                    style: denseHeader,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
          Material(
            type: MaterialType.canvas,
            elevation: 6,
            surfaceTintColor: colorScheme.surfaceTint,
            shadowColor: colorScheme.shadow,
            child: SizedBox(
              height: 60,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Text(
                    context.tr!.materialShowcaseSurfaceShadow2,
                    textAlign: TextAlign.center,
                    style: denseHeader,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 32),
          Text(context.tr!.materialShowcaseTypeCard1, style: denseHeader),
          Text(
            context.tr!.materialShowcaseTypeCard2,
            style: denseBody,
          ),
          const SizedBox(height: 8),
          Material(
            type: MaterialType.card,
            elevation: 0,
            child: SizedBox(
              height: 60,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Text(
                    context.tr!.materialShowcaseTypeCardShadow1,
                    textAlign: TextAlign.center,
                    style: denseHeader,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
          Material(
            type: MaterialType.card,
            elevation: 1,
            child: SizedBox(
              height: 60,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Text(
                    context.tr!.materialShowcaseTypeCardShadow2,
                    textAlign: TextAlign.center,
                    style: denseHeader,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 8),
          Material(
            type: MaterialType.card,
            elevation: 1,
            surfaceTintColor: colorScheme.surfaceTint,
            shadowColor: Colors.transparent,
            child: SizedBox(
              height: 60,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Text(
                    context.tr!.materialShowcaseTypeCardSurface,
                    textAlign: TextAlign.center,
                    style: denseHeader,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 8),
          Material(
            type: MaterialType.card,
            elevation: 1,
            surfaceTintColor: colorScheme.surfaceTint,
            shadowColor: colorScheme.shadow,
            child: SizedBox(
              height: 60,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Text(
                    context.tr!.materialShowcaseTypeCardSurfaceShadow,
                    textAlign: TextAlign.center,
                    style: denseHeader,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
          Material(
            type: MaterialType.card,
            elevation: 6,
            child: SizedBox(
              height: 60,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Text(
                    context.tr!.materialShowcaseTypeCardShadow3,
                    textAlign: TextAlign.center,
                    style: denseHeader,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
          Material(
            type: MaterialType.card,
            elevation: 6,
            surfaceTintColor: colorScheme.surfaceTint,
            shadowColor: Colors.transparent,
            child: SizedBox(
              height: 60,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Text(context.tr!.materialShowcaseTypeCardSurface2,
                    textAlign: TextAlign.center,
                    style: denseHeader,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
          Material(
            type: MaterialType.card,
            elevation: 6,
            surfaceTintColor: colorScheme.surfaceTint,
            shadowColor: colorScheme.shadow,
            child: SizedBox(
              height: 60,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Text(
                    context.tr!.materialShowcaseTypeCardSurfaceShadow2,
                    textAlign: TextAlign.center,
                    style: denseHeader,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }
}

class CardShowcase extends StatelessWidget {
  const CardShowcase({super.key, this.explain = true});
  final bool explain;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final ColorScheme colorScheme = theme.colorScheme;
    final TextStyle denseHeader = theme.textTheme.titleMedium!.copyWith(
      fontSize: 13,
    );
    final TextStyle denseBody = theme.textTheme.bodyMedium!
        .copyWith(fontSize: 12, color: theme.textTheme.bodySmall!.color);
    return RepaintBoundary(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          if (explain)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(context.tr!.labelCard, style: denseHeader),
            ),
          if (explain)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                context.tr!.cardShowcaseText,
                style: denseBody,
              ),
            ),
          Card(
            elevation: 0,
            surfaceTintColor: colorScheme.surfaceTint,
            child: SizedBox(
              height: 60,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Text(
                    context.tr!.cardShowcaseText1,
                    textAlign: TextAlign.center,
                    style: denseHeader,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Card(
            elevation: 1,
            child: SizedBox(
              height: 60,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                    child: Text(
                      context.tr!.cardShowcaseElevate1Text1,
                      textAlign: TextAlign.center,
                      style: denseHeader,
                    )),
              ),
            ),
          ),
          const SizedBox(height: 2),
          Card(
            elevation: 1,
            surfaceTintColor: colorScheme.surfaceTint,
            child: SizedBox(
              height: 60,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Text(
                    context.tr!.cardShowcaseElevate1Text2,
                    textAlign: TextAlign.center,
                    style: denseHeader,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 2),
          Card(
            elevation: 1,
            surfaceTintColor: colorScheme.surfaceTint,
            shadowColor: Colors.transparent,
            child: SizedBox(
              height: 60,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Text(
                    context.tr!.cardShowcaseElevate1Text3,
                    textAlign: TextAlign.center,
                    style: denseHeader,
                  ),
                ),
              ),
            ),
          ),
          const Divider(),
          Card(
            elevation: 4,
            child: SizedBox(
              height: 60,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Text(
                    context.tr!.cardShowcaseElevate4Text1,
                    textAlign: TextAlign.center,
                    style: denseHeader,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 4),
          Card(
            elevation: 4,
            surfaceTintColor: colorScheme.surfaceTint,
            child: SizedBox(
              height: 60,
              child: Center(
                child: Text(
                  context.tr!.cardShowcaseElevate4Text2,
                  textAlign: TextAlign.center,
                  style: denseHeader,
                ),
              ),
            ),
          ),
          const SizedBox(height: 4),
          Card(
            elevation: 4,
            surfaceTintColor: colorScheme.surfaceTint,
            shadowColor: Colors.transparent,
            child: SizedBox(
              height: 60,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Text(
                    context.tr!.cardShowcaseElevate4Text3,
                    textAlign: TextAlign.center,
                    style: denseHeader,
                  ),
                ),
              ),
            ),
          ),
          const Divider(),
          Card(
            elevation: 10,
            child: SizedBox(
              height: 60,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Text(
                    context.tr!.cardShowcaseElevate10Text1,
                    textAlign: TextAlign.center,
                    style: denseHeader,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Card(
            elevation: 10,
            surfaceTintColor: colorScheme.surfaceTint,
            child: SizedBox(
              height: 60,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Text(
                    context.tr!.cardShowcaseElevate10Text2,
                    textAlign: TextAlign.center,
                    style: denseHeader,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Card(
            elevation: 10,
            surfaceTintColor: colorScheme.surfaceTint,
            shadowColor: Colors.transparent,
            child: SizedBox(
              height: 60,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                    child: Text(
                      context.tr!.cardShowcaseElevate10Text3,
                      textAlign: TextAlign.center,
                      style: denseHeader,
                    )),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TextThemeShowcase extends StatelessWidget {
  const TextThemeShowcase({super.key});

  @override
  Widget build(BuildContext context) {
    return TextThemeColumnShowcase(textTheme: Theme.of(context).textTheme);
  }
}

class PrimaryTextThemeShowcase extends StatelessWidget {
  const PrimaryTextThemeShowcase({super.key});

  @override
  Widget build(BuildContext context) {
    return TextThemeColumnShowcase(
        textTheme: Theme.of(context).primaryTextTheme);
  }
}

class TextThemeColumnShowcase extends StatelessWidget {
  const TextThemeColumnShowcase({super.key, required this.textTheme});
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text('${context.tr!.font}: ${textTheme.titleSmall!.fontFamily}',
            style:
            textTheme.titleMedium!.copyWith(fontWeight: FontWeight.w600)),
        Text(
          '${context.tr!.display} ${context.tr!.large} '
              '(${textTheme.displayLarge!.fontSize!.toStringAsFixed(0)})',
          style: textTheme.displayLarge,
        ),
        Text(
          '${context.tr!.display} ${context.tr!.medium} '
              '(${textTheme.displayMedium!.fontSize!.toStringAsFixed(0)})',
          style: textTheme.displayMedium,
        ),
        Text(
          '${context.tr!.display} ${context.tr!.small} '
              '(${textTheme.displaySmall!.fontSize!.toStringAsFixed(0)})',
          style: textTheme.displaySmall,
        ),
        const SizedBox(height: 12),
        Text(
          '${context.tr!.headline} ${context.tr!.large} '
              '(${textTheme.headlineLarge!.fontSize!.toStringAsFixed(0)})',
          style: textTheme.headlineLarge,
        ),
        Text(
          '${context.tr!.headline} ${context.tr!.medium} '
              '(${textTheme.headlineMedium!.fontSize!.toStringAsFixed(0)})',
          style: textTheme.headlineMedium,
        ),
        Text(
          '${context.tr!.headline} ${context.tr!.small} '
              '(${textTheme.headlineSmall!.fontSize!.toStringAsFixed(0)})',
          style: textTheme.headlineSmall,
        ),
        const SizedBox(height: 12),
        Text(
          '${context.tr!.title} ${context.tr!.large} '
              '(${textTheme.titleLarge!.fontSize!.toStringAsFixed(0)})',
          style: textTheme.titleLarge,
        ),
        Text(
          '${context.tr!.title} ${context.tr!.medium} '
              '(${textTheme.titleMedium!.fontSize!.toStringAsFixed(0)})',
          style: textTheme.titleMedium,
        ),
        Text(
          '${context.tr!.title} ${context.tr!.small} '
              '(${textTheme.titleSmall!.fontSize!.toStringAsFixed(0)})',
          style: textTheme.titleSmall,
        ),
        const SizedBox(height: 12),
        Text(
          '${context.tr!.body} ${context.tr!.large} '
              '(${textTheme.bodyLarge!.fontSize!.toStringAsFixed(0)})',
          style: textTheme.bodyLarge,
        ),
        Text(
          '${context.tr!.body} ${context.tr!.medium} '
              '(${textTheme.bodyMedium!.fontSize!.toStringAsFixed(0)})',
          style: textTheme.bodyMedium,
        ),
        Text(
          '${context.tr!.body} ${context.tr!.small} '
              '(${textTheme.bodySmall!.fontSize!.toStringAsFixed(0)})',
          style: textTheme.bodySmall,
        ),
        const SizedBox(height: 12),
        Text(
          '${context.tr!.label} ${context.tr!.large} '
              '(${textTheme.labelLarge!.fontSize!.toStringAsFixed(0)})',
          style: textTheme.labelLarge,
        ),
        Text(
          '${context.tr!.label} ${context.tr!.medium} '
              '(${textTheme.labelMedium!.fontSize!.toStringAsFixed(0)})',
          style: textTheme.labelMedium,
        ),
        Text(
          '${context.tr!.label} ${context.tr!.small} '
              '(${textTheme.labelSmall!.fontSize!.toStringAsFixed(0)})',
          style: textTheme.labelSmall,
        ),
      ],
    );
  }
}
