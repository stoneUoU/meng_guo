// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `No Network`
  String get common_no_network_title {
    return Intl.message(
      'No Network',
      name: 'common_no_network_title',
      desc: '',
      args: [],
    );
  }

  /// `Please check your network settings`
  String get common_no_network_msg {
    return Intl.message(
      'Please check your network settings',
      name: 'common_no_network_msg',
      desc: '',
      args: [],
    );
  }

  /// `No content found`
  String get common_no_data_title {
    return Intl.message(
      'No content found',
      name: 'common_no_data_title',
      desc: '',
      args: [],
    );
  }

  /// `Please try another city`
  String get common_no_data_sub_title {
    return Intl.message(
      'Please try another city',
      name: 'common_no_data_sub_title',
      desc: '',
      args: [],
    );
  }

  /// `No Data Found`
  String get common_empty_data {
    return Intl.message(
      'No Data Found',
      name: 'common_empty_data',
      desc: '',
      args: [],
    );
  }

  /// `No message data`
  String get common_no_message_data {
    return Intl.message(
      'No message data',
      name: 'common_no_message_data',
      desc: '',
      args: [],
    );
  }

  /// `No Data`
  String get common_no_data {
    return Intl.message(
      'No Data',
      name: 'common_no_data',
      desc: '',
      args: [],
    );
  }

  /// `Please allow access to your photos in the Settings - Privacy - Photos option`
  String get common_album_permission_title {
    return Intl.message(
      'Please allow access to your photos in the Settings - Privacy - Photos option',
      name: 'common_album_permission_title',
      desc: '',
      args: [],
    );
  }

  /// `Please allow access to your camera in the Settings - Privacy - Camera option`
  String get common_camera_permission_title {
    return Intl.message(
      'Please allow access to your camera in the Settings - Privacy - Camera option',
      name: 'common_camera_permission_title',
      desc: '',
      args: [],
    );
  }

  /// `OK`
  String get common_permission_ok {
    return Intl.message(
      'OK',
      name: 'common_permission_ok',
      desc: '',
      args: [],
    );
  }

  /// `Setting`
  String get common_permission_go {
    return Intl.message(
      'Setting',
      name: 'common_permission_go',
      desc: '',
      args: [],
    );
  }

  /// `There is a network connection problem, please check your network settings`
  String get common_error_net_error_msg {
    return Intl.message(
      'There is a network connection problem, please check your network settings',
      name: 'common_error_net_error_msg',
      desc: '',
      args: [],
    );
  }

  /// `Please try again later`
  String get common_empty_sub_data {
    return Intl.message(
      'Please try again later',
      name: 'common_empty_sub_data',
      desc: '',
      args: [],
    );
  }

  /// `Retry`
  String get common_retry {
    return Intl.message(
      'Retry',
      name: 'common_retry',
      desc: '',
      args: [],
    );
  }

  /// `Send`
  String get common_send {
    return Intl.message(
      'Send',
      name: 'common_send',
      desc: '',
      args: [],
    );
  }

  /// `YES`
  String get common_yes {
    return Intl.message(
      'YES',
      name: 'common_yes',
      desc: '',
      args: [],
    );
  }

  /// `NO`
  String get common_no {
    return Intl.message(
      'NO',
      name: 'common_no',
      desc: '',
      args: [],
    );
  }

  /// `Know it`
  String get common_i_know {
    return Intl.message(
      'Know it',
      name: 'common_i_know',
      desc: '',
      args: [],
    );
  }

  /// `Next`
  String get common_next_step {
    return Intl.message(
      'Next',
      name: 'common_next_step',
      desc: '',
      args: [],
    );
  }

  /// `Back`
  String get common_previous_step {
    return Intl.message(
      'Back',
      name: 'common_previous_step',
      desc: '',
      args: [],
    );
  }

  /// `No internet connection, click and refresh`
  String get common_footer_retry {
    return Intl.message(
      'No internet connection, click and refresh',
      name: 'common_footer_retry',
      desc: '',
      args: [],
    );
  }

  /// `Please try again`
  String get common_error_net_no_data {
    return Intl.message(
      'Please try again',
      name: 'common_error_net_no_data',
      desc: '',
      args: [],
    );
  }

  /// `service is not available`
  String get common_server_not_available {
    return Intl.message(
      'service is not available',
      name: 'common_server_not_available',
      desc: '',
      args: [],
    );
  }

  /// `loading`
  String get common_load_more {
    return Intl.message(
      'loading',
      name: 'common_load_more',
      desc: '',
      args: [],
    );
  }

  /// `- That's all for now! -`
  String get common_load_no_more {
    return Intl.message(
      '- That\'s all for now! -',
      name: 'common_load_no_more',
      desc: '',
      args: [],
    );
  }

  /// `The load is complete`
  String get common_load_no_more2 {
    return Intl.message(
      'The load is complete',
      name: 'common_load_no_more2',
      desc: '',
      args: [],
    );
  }

  /// `All have been loaded`
  String get common_load_finish {
    return Intl.message(
      'All have been loaded',
      name: 'common_load_finish',
      desc: '',
      args: [],
    );
  }

  /// `Stay tuned`
  String get common_stay_tuned {
    return Intl.message(
      'Stay tuned',
      name: 'common_stay_tuned',
      desc: '',
      args: [],
    );
  }

  /// `Copy success`
  String get common_copy_success {
    return Intl.message(
      'Copy success',
      name: 'common_copy_success',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get common_cancel {
    return Intl.message(
      'Cancel',
      name: 'common_cancel',
      desc: '',
      args: [],
    );
  }

  /// `Delete`
  String get common_delete {
    return Intl.message(
      'Delete',
      name: 'common_delete',
      desc: '',
      args: [],
    );
  }

  /// `Delete success`
  String get common_delete_success {
    return Intl.message(
      'Delete success',
      name: 'common_delete_success',
      desc: '',
      args: [],
    );
  }

  /// `OK`
  String get common_ok {
    return Intl.message(
      'OK',
      name: 'common_ok',
      desc: '',
      args: [],
    );
  }

  /// `Done`
  String get common_done {
    return Intl.message(
      'Done',
      name: 'common_done',
      desc: '',
      args: [],
    );
  }

  /// `Reject`
  String get common_reject {
    return Intl.message(
      'Reject',
      name: 'common_reject',
      desc: '',
      args: [],
    );
  }

  /// `Pass`
  String get common_pass {
    return Intl.message(
      'Pass',
      name: 'common_pass',
      desc: '',
      args: [],
    );
  }

  /// `Detail`
  String get common_detail {
    return Intl.message(
      'Detail',
      name: 'common_detail',
      desc: '',
      args: [],
    );
  }

  /// `Detail`
  String get common_detail2 {
    return Intl.message(
      'Detail',
      name: 'common_detail2',
      desc: '',
      args: [],
    );
  }

  /// `Continue`
  String get common_continue {
    return Intl.message(
      'Continue',
      name: 'common_continue',
      desc: '',
      args: [],
    );
  }

  /// `Today`
  String get common_today {
    return Intl.message(
      'Today',
      name: 'common_today',
      desc: '',
      args: [],
    );
  }

  /// `More`
  String get common_see_more {
    return Intl.message(
      'More',
      name: 'common_see_more',
      desc: '',
      args: [],
    );
  }

  /// `Your payment is successful`
  String get common_pay_success {
    return Intl.message(
      'Your payment is successful',
      name: 'common_pay_success',
      desc: '',
      args: [],
    );
  }

  /// `Payment failed`
  String get common_pay_fail {
    return Intl.message(
      'Payment failed',
      name: 'common_pay_fail',
      desc: '',
      args: [],
    );
  }

  /// `Your payment timeout.`
  String get common_pay_timeout {
    return Intl.message(
      'Your payment timeout.',
      name: 'common_pay_timeout',
      desc: '',
      args: [],
    );
  }

  /// `The captcha is incorrect. Please try again`
  String get common_check_fail {
    return Intl.message(
      'The captcha is incorrect. Please try again',
      name: 'common_check_fail',
      desc: '',
      args: [],
    );
  }

  /// `All`
  String get common_all {
    return Intl.message(
      'All',
      name: 'common_all',
      desc: '',
      args: [],
    );
  }

  /// `From`
  String get common_price_suffix {
    return Intl.message(
      'From',
      name: 'common_price_suffix',
      desc: '',
      args: [],
    );
  }

  /// `Edit`
  String get common_edit {
    return Intl.message(
      'Edit',
      name: 'common_edit',
      desc: '',
      args: [],
    );
  }

  /// `首页`
  String get common_tab_home {
    return Intl.message(
      '首页',
      name: 'common_tab_home',
      desc: '',
      args: [],
    );
  }

  /// `发现`
  String get common_tab_discover {
    return Intl.message(
      '发现',
      name: 'common_tab_discover',
      desc: '',
      args: [],
    );
  }

  /// `消息`
  String get common_tab_message {
    return Intl.message(
      '消息',
      name: 'common_tab_message',
      desc: '',
      args: [],
    );
  }

  /// `我的`
  String get common_tab_my {
    return Intl.message(
      '我的',
      name: 'common_tab_my',
      desc: '',
      args: [],
    );
  }

  /// `Info cannot be empty`
  String get common_info_not_empty {
    return Intl.message(
      'Info cannot be empty',
      name: 'common_info_not_empty',
      desc: '',
      args: [],
    );
  }

  /// `Please enter the correct phone number`
  String get common_phone_illegal {
    return Intl.message(
      'Please enter the correct phone number',
      name: 'common_phone_illegal',
      desc: '',
      args: [],
    );
  }

  /// `Camera`
  String get common_bottom_sheet_photo {
    return Intl.message(
      'Camera',
      name: 'common_bottom_sheet_photo',
      desc: '',
      args: [],
    );
  }

  /// `Choose from Album`
  String get common_bottom_sheet_album {
    return Intl.message(
      'Choose from Album',
      name: 'common_bottom_sheet_album',
      desc: '',
      args: [],
    );
  }

  /// `Long-term effective`
  String get common_bottom_sheet_long {
    return Intl.message(
      'Long-term effective',
      name: 'common_bottom_sheet_long',
      desc: '',
      args: [],
    );
  }

  /// `Non-long-term effect`
  String get common_bottom_sheet_short {
    return Intl.message(
      'Non-long-term effect',
      name: 'common_bottom_sheet_short',
      desc: '',
      args: [],
    );
  }

  /// `Please select`
  String get common_bottom_sheet_select_city_title {
    return Intl.message(
      'Please select',
      name: 'common_bottom_sheet_select_city_title',
      desc: '',
      args: [],
    );
  }

  /// `Please select date`
  String get common_bottom_sheet_select_date_title {
    return Intl.message(
      'Please select date',
      name: 'common_bottom_sheet_select_date_title',
      desc: '',
      args: [],
    );
  }

  /// `yyyy-MM-dd-`
  String get calendar_cn_format {
    return Intl.message(
      'yyyy-MM-dd-',
      name: 'calendar_cn_format',
      desc: '',
      args: [],
    );
  }

  /// `MM-dd`
  String get calendar_mm_cn_format {
    return Intl.message(
      'MM-dd',
      name: 'calendar_mm_cn_format',
      desc: '',
      args: [],
    );
  }

  /// `en_US`
  String get calendar_month_format_language {
    return Intl.message(
      'en_US',
      name: 'calendar_month_format_language',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'zh'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
