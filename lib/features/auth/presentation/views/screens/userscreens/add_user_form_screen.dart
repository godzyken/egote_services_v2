
import 'package:egote_services_v2/features/auth/domain/entities/entities_extension.dart';
import 'package:egote_services_v2/features/auth/presentation/views/models/userform/add_form_view_model.dart';
import 'package:egote_services_v2/features/common/presentation/extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

class AddUserFormScreen extends ConsumerStatefulWidget {
  final UserEntityModel? userEntityModel;
  
  const AddUserFormScreen({super.key, required this.userEntityModel,});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AddUserFormScreenState();
  
}

class _AddUserFormScreenState extends ConsumerState<AddUserFormScreen> {
  late final AddFormViewModel _viewModel;
  final _formKey = GlobalKey<FormState>();
  final _createDateFormFocusNode = _DisabledFocusNode();
  late TextEditingController _createDateTextFieldController;
  
  _AddUserFormScreenState();


  @override
  void initState() {
    super.initState();
    
    _viewModel = ref.read(addFormViewModelProvider(widget.userEntityModel));
    _createDateTextFieldController = TextEditingController(
      text: DateFormat('yyyy/MM/dd').format(_viewModel.initialCreateValue()),
    );
  }


  @override
  void dispose() {
    _createDateFormFocusNode.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_viewModel.appBarTitle()),
        actions: [
          if(_viewModel.shouldShowDeleteUserIcon()) _buildDeleteUserIconWidget()
        ],
      ),
      body: _buildBodyWidget(),
    );
  }

  Widget _buildBodyWidget() {
    return Container(
      padding: const EdgeInsets.only(left: 16, top: 24, right: 16, bottom: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildFormWidget(),
          _buildSavedButtonWidget(),
        ],
      ),
    );
  }

  Widget _buildSavedButtonWidget() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          final currentState = _formKey.currentState;
          if(currentState != null && currentState.validate()) {
            _viewModel.createOrUpdate();
            context.pop(context);
          }
        },
        child: Text(context.tr!.save),
      ),
    );
  }

  Widget _buildFormWidget() => Form(
      key: _formKey,
      child: Column(
        children: [
          _buildTitleFormWidget(),
          const SizedBox(height: 16),
          _buildRoleFormWidget(),
          const SizedBox(height: 16),
          _buildDueDateFormWidget(),
        ],
      ));


  Widget _buildTitleFormWidget() {
    return TextFormField(
      initialValue: _viewModel.initialTitleValue(),
      maxLength: 20,
      onChanged: (value) => _viewModel.setTitle(value),
      validator: (_) => _viewModel.validateName(),
      decoration: const InputDecoration(
        icon: Icon(Icons.edit),
        labelText: 'Title',
        border: OutlineInputBorder(),
      ),
    );
  }

  Widget _buildRoleFormWidget() {
    return TextFormField(
      initialValue: _viewModel.initialRoleValue(),
      maxLength: 20,
      onChanged: (value) => _viewModel.setRole(value),
      validator: (_) => _viewModel.validateRole(),
      decoration: const InputDecoration(
        icon: Icon(Icons.view_headline),
        labelText: 'Role',
        border: OutlineInputBorder(),
      ),
    );
  }

  Widget _buildDueDateFormWidget() {
    return TextFormField(
      focusNode: _createDateFormFocusNode,
      controller: _createDateTextFieldController,
      maxLength: 50,
      onTap: () => _showDatePicker(context),
      onChanged: (value) => _viewModel.setTitle(value),
      validator: (_) => _viewModel.validateRole(),
      decoration: const InputDecoration(
        icon: Icon(Icons.calendar_today_rounded),
        labelText: 'DueDate',
        helperText: 'Required',
        border: OutlineInputBorder(),
      ),
    );
  }

  Widget _buildDeleteUserIconWidget() {
    return IconButton(
      onPressed: () => _showConfirmDeleteUserDialog(),
      icon: const Icon(Icons.delete),
    );
  }

  Future<DateTime?> _showDatePicker(final BuildContext context) async {
    final selectedDate = await showDatePicker(
      context: context,
      initialDate: _viewModel.initialCreateValue(),
      firstDate: _viewModel.datePickerFirstDate(),
      lastDate: _viewModel.datePickerLastDate(),
    );
    if (selectedDate != null) {
      _createDateTextFieldController.text = DateFormat('yyyy/MM/dd').format(selectedDate);
      _viewModel.setCreate(selectedDate);
    }

    return null;
  }

  _showConfirmDeleteUserDialog() async {
    final bool res = await showDialog(
        context: context,
        builder: (_) => AlertDialog(
          content: Text(context.tr!.deleteBoat),
          actions: [
            TextButton(
                onPressed: () => context.pop([context, false]),
                child: Text(context.tr!.cancel)),
            TextButton(
                onPressed: () =>  context.pop([context, true]),
                child: Text(context.tr!.deleteBoat)),
          ],
        ),
    );
    if (res) {
      _viewModel.deleteUser();

      if (mounted) {
        context.pop(context);
      }
    }
  }
}


class _DisabledFocusNode extends FocusNode {

  @override
  bool get hasFocus => false;
}