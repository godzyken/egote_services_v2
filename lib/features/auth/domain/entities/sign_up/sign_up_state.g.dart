// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_up_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SignUpState _$SignUpStateFromJson(Map<String, dynamic> json) => _SignUpState(
  status:
      $enumDecodeNullable(_$FormzSubmissionStatusEnumMap, json['status']) ??
      FormzSubmissionStatus.initial,
  errorMessage: json['error_message'] as String?,
);

Map<String, dynamic> _$SignUpStateToJson(_SignUpState instance) =>
    <String, dynamic>{
      'status': _$FormzSubmissionStatusEnumMap[instance.status],
      'error_message': instance.errorMessage,
    };

const _$FormzSubmissionStatusEnumMap = {
  FormzSubmissionStatus.initial: 'initial',
  FormzSubmissionStatus.inProgress: 'inProgress',
  FormzSubmissionStatus.success: 'success',
  FormzSubmissionStatus.failure: 'failure',
  FormzSubmissionStatus.canceled: 'canceled',
};
