import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_es.dart';
import 'app_localizations_fr.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('es'),
    Locale('fr')
  ];

  /// No description provided for @aFixedSnackBar.
  ///
  /// In en, this message translates to:
  /// **'A fixed SnackBar'**
  String get aFixedSnackBar;

  /// No description provided for @aFloatingSnackBar.
  ///
  /// In en, this message translates to:
  /// **'A floating SnackBar'**
  String get aFloatingSnackBar;

  /// No description provided for @about.
  ///
  /// In en, this message translates to:
  /// **'About'**
  String get about;

  /// No description provided for @absent.
  ///
  /// In en, this message translates to:
  /// **'Absent'**
  String get absent;

  /// No description provided for @abstractSettingsDescription.
  ///
  /// In en, this message translates to:
  /// **'UI create to show plugin\\\'s possibilities'**
  String get abstractSettingsDescription;

  /// No description provided for @abstractSettingsTitle.
  ///
  /// In en, this message translates to:
  /// **'Abstract Settings Screen'**
  String get abstractSettingsTitle;

  /// No description provided for @accessibilityDescription.
  ///
  /// In en, this message translates to:
  /// **'Display, interaction, audio'**
  String get accessibilityDescription;

  /// No description provided for @accessibilityTitle.
  ///
  /// In en, this message translates to:
  /// **'Accessibility'**
  String get accessibilityTitle;

  /// No description provided for @addDevis.
  ///
  /// In en, this message translates to:
  /// **'Add a Quotation'**
  String get addDevis;

  /// No description provided for @addRefreshTitle.
  ///
  /// In en, this message translates to:
  /// **'Add Refresh Rate'**
  String get addRefreshTitle;

  /// No description provided for @address.
  ///
  /// In en, this message translates to:
  /// **'Address'**
  String get address;

  /// No description provided for @addressCity.
  ///
  /// In en, this message translates to:
  /// **'City Name'**
  String get addressCity;

  /// No description provided for @addressDescription.
  ///
  /// In en, this message translates to:
  /// **'Include information like phone numbers, email, and shipping addresses'**
  String get addressDescription;

  /// No description provided for @addressDocking.
  ///
  /// In en, this message translates to:
  /// **'Address Docking'**
  String get addressDocking;

  /// No description provided for @addressId.
  ///
  /// In en, this message translates to:
  /// **'Address id'**
  String get addressId;

  /// No description provided for @addressMore.
  ///
  /// In en, this message translates to:
  /// **'Addresses and more'**
  String get addressMore;

  /// No description provided for @addressTitle.
  ///
  /// In en, this message translates to:
  /// **'Save and fill addresses'**
  String get addressTitle;

  /// No description provided for @addressZipCode.
  ///
  /// In en, this message translates to:
  /// **'Address Zip Code'**
  String get addressZipCode;

  /// No description provided for @addressesNameTitle.
  ///
  /// In en, this message translates to:
  /// **'Name, addresses'**
  String get addressesNameTitle;

  /// No description provided for @addressesTitle.
  ///
  /// In en, this message translates to:
  /// **'Addresses'**
  String get addressesTitle;

  /// No description provided for @alarm.
  ///
  /// In en, this message translates to:
  /// **'Alarm'**
  String get alarm;

  /// No description provided for @alertDialog.
  ///
  /// In en, this message translates to:
  /// **'AlertDialog'**
  String get alertDialog;

  /// No description provided for @alertDialogContent.
  ///
  /// In en, this message translates to:
  /// **'theme settings back to their\\ndefault values?\\nPersisted theme settings will also be updated to default\\nvalues.'**
  String get alertDialogContent;

  /// No description provided for @all.
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get all;

  /// No description provided for @allow.
  ///
  /// In en, this message translates to:
  /// **'Allow'**
  String get allow;

  /// No description provided for @allowLocServ.
  ///
  /// In en, this message translates to:
  /// **'Allow location services'**
  String get allowLocServ;

  /// No description provided for @allowLocServText.
  ///
  /// In en, this message translates to:
  /// **'Let us help determine location. This means\\nsending anonymous location data to us'**
  String get allowLocServText;

  /// No description provided for @alreadyHave.
  ///
  /// In en, this message translates to:
  /// **'I already have an account'**
  String get alreadyHave;

  /// No description provided for @androidSettingsTitle.
  ///
  /// In en, this message translates to:
  /// **'Android Settings Screen'**
  String get androidSettingsTitle;

  /// No description provided for @appBar.
  ///
  /// In en, this message translates to:
  /// **'AppBar'**
  String get appBar;

  /// No description provided for @appBarElevation.
  ///
  /// In en, this message translates to:
  /// **'AppBar elevation'**
  String get appBarElevation;

  /// No description provided for @appSettings.
  ///
  /// In en, this message translates to:
  /// **'App settings'**
  String get appSettings;

  /// No description provided for @appearanceTitle.
  ///
  /// In en, this message translates to:
  /// **'APPEARANCE'**
  String get appearanceTitle;

  /// No description provided for @appearanceTitleDark.
  ///
  /// In en, this message translates to:
  /// **'Dark Appearance'**
  String get appearanceTitleDark;

  /// No description provided for @appsDescription.
  ///
  /// In en, this message translates to:
  /// **'Assistant, recent apps, default apps'**
  String get appsDescription;

  /// No description provided for @appsTitle.
  ///
  /// In en, this message translates to:
  /// **'Apps'**
  String get appsTitle;

  /// No description provided for @attachment.
  ///
  /// In en, this message translates to:
  /// **'Attachment'**
  String get attachment;

  /// No description provided for @auth.
  ///
  /// In en, this message translates to:
  /// **'Auth'**
  String get auth;

  /// No description provided for @autoFillTitle.
  ///
  /// In en, this message translates to:
  /// **'Auto-fill'**
  String get autoFillTitle;

  /// No description provided for @available.
  ///
  /// In en, this message translates to:
  /// **'Available'**
  String get available;

  /// No description provided for @avatar.
  ///
  /// In en, this message translates to:
  /// **'Avatar Delete'**
  String get avatar;

  /// No description provided for @avatarDelete.
  ///
  /// In en, this message translates to:
  /// **'Avatar Delete'**
  String get avatarDelete;

  /// No description provided for @avatarUpdate.
  ///
  /// In en, this message translates to:
  /// **'Avatar Update'**
  String get avatarUpdate;

  /// No description provided for @avatarPreview.
  ///
  /// In en, this message translates to:
  /// **'Avatar preview'**
  String get avatarPreview;

  /// No description provided for @avisPage.
  ///
  /// In en, this message translates to:
  /// **'Opinion Page'**
  String get avisPage;

  /// No description provided for @batteryDescription.
  ///
  /// In en, this message translates to:
  /// **'100%'**
  String get batteryDescription;

  /// No description provided for @batteryTitle.
  ///
  /// In en, this message translates to:
  /// **'Battery'**
  String get batteryTitle;

  /// No description provided for @behindAppBar.
  ///
  /// In en, this message translates to:
  /// **'Behind AppBar'**
  String get behindAppBar;

  /// No description provided for @behindBottom.
  ///
  /// In en, this message translates to:
  /// **'Behind Bottom'**
  String get behindBottom;

  /// No description provided for @behindNavBar.
  ///
  /// In en, this message translates to:
  /// **'Behind NavBar'**
  String get behindNavBar;

  /// No description provided for @blendLevelLongText.
  ///
  /// In en, this message translates to:
  /// **'Level blends\\nSurface 1x  Background 1x  Scaffold 1x\\n'**
  String get blendLevelLongText;

  /// No description provided for @blendLevelShortText.
  ///
  /// In en, this message translates to:
  /// **'Flat\\nall at same level'**
  String get blendLevelShortText;

  /// No description provided for @body.
  ///
  /// In en, this message translates to:
  /// **'Body'**
  String get body;

  /// No description provided for @bold.
  ///
  /// In en, this message translates to:
  /// **'Bold'**
  String get bold;

  /// No description provided for @bottomAppBar.
  ///
  /// In en, this message translates to:
  /// **'BottomAppBar'**
  String get bottomAppBar;

  /// No description provided for @bottomNavigationBar.
  ///
  /// In en, this message translates to:
  /// **'BottomNavigationBar (Material 2)'**
  String get bottomNavigationBar;

  /// No description provided for @bubbles.
  ///
  /// In en, this message translates to:
  /// **'Bubbles'**
  String get bubbles;

  /// No description provided for @bubblesActive.
  ///
  /// In en, this message translates to:
  /// **'On / Conservations can appear as floating icons'**
  String get bubblesActive;

  /// No description provided for @byEmail.
  ///
  /// In en, this message translates to:
  /// **'By Email'**
  String get byEmail;

  /// No description provided for @byFacebook.
  ///
  /// In en, this message translates to:
  /// **'By Facebook'**
  String get byFacebook;

  /// No description provided for @byLogin.
  ///
  /// In en, this message translates to:
  /// **'By Login'**
  String get byLogin;

  /// No description provided for @byPhone.
  ///
  /// In en, this message translates to:
  /// **'By Phone number'**
  String get byPhone;

  /// No description provided for @canBeBlank.
  ///
  /// In en, this message translates to:
  /// **'Comment cannot be blank'**
  String get canBeBlank;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @cardShowcaseElevate10Text1.
  ///
  /// In en, this message translates to:
  /// **'Card, elevation 10, default surfaceTint and shadow'**
  String get cardShowcaseElevate10Text1;

  /// No description provided for @cardShowcaseElevate10Text2.
  ///
  /// In en, this message translates to:
  /// **'Card, elevation 10, default surfaceTint and default shadow'**
  String get cardShowcaseElevate10Text2;

  /// No description provided for @cardShowcaseElevate10Text3.
  ///
  /// In en, this message translates to:
  /// **'Card, elevation 10, default surfaceTint and transparent shadow'**
  String get cardShowcaseElevate10Text3;

  /// No description provided for @cardShowcaseElevate1Text1.
  ///
  /// In en, this message translates to:
  /// **'Card, elevation 1, default surfaceTint and shadow'**
  String get cardShowcaseElevate1Text1;

  /// No description provided for @cardShowcaseElevate1Text2.
  ///
  /// In en, this message translates to:
  /// **'Card, elevation 1, assigned surfaceTint and\\ndefault shadow'**
  String get cardShowcaseElevate1Text2;

  /// No description provided for @cardShowcaseElevate1Text3.
  ///
  /// In en, this message translates to:
  /// **'Card, elevation 1, assigned surfaceTint and\\ntransparent shadow'**
  String get cardShowcaseElevate1Text3;

  /// No description provided for @cardShowcaseElevate4Text1.
  ///
  /// In en, this message translates to:
  /// **'Card, elevation 4, default surfaceTint and shadow'**
  String get cardShowcaseElevate4Text1;

  /// No description provided for @cardShowcaseElevate4Text2.
  ///
  /// In en, this message translates to:
  /// **'Card, elevation 4, default surfaceTint and default shadow'**
  String get cardShowcaseElevate4Text2;

  /// No description provided for @cardShowcaseElevate4Text3.
  ///
  /// In en, this message translates to:
  /// **'Card, elevation 4, default surfaceTint and transparent shadow'**
  String get cardShowcaseElevate4Text3;

  /// No description provided for @cardShowcaseText.
  ///
  /// In en, this message translates to:
  /// **'Default background color comes from Material of type card,\\nwhich by default is set to theme colorScheme surface.\\nWhen useMaterial3 is true, Card gets elevation based\\nsurfaceTint. When it is false, surfaceTint has no\\neffect even if specified.'**
  String get cardShowcaseText;

  /// No description provided for @cardShowcaseText1.
  ///
  /// In en, this message translates to:
  /// **'Card, elevation 0, assigned surfaceTint and\\ndefault shadow'**
  String get cardShowcaseText1;

  /// No description provided for @changeEmail.
  ///
  /// In en, this message translates to:
  /// **'Change email'**
  String get changeEmail;

  /// No description provided for @changeGroupName.
  ///
  /// In en, this message translates to:
  /// **'Change group name'**
  String get changeGroupName;

  /// No description provided for @changeLogin.
  ///
  /// In en, this message translates to:
  /// **'Change login'**
  String get changeLogin;

  /// No description provided for @changeName.
  ///
  /// In en, this message translates to:
  /// **'Change name'**
  String get changeName;

  /// No description provided for @changePassword.
  ///
  /// In en, this message translates to:
  /// **'change your password'**
  String get changePassword;

  /// No description provided for @charSet4.
  ///
  /// In en, this message translates to:
  /// **'Enter more than 4 character'**
  String get charSet4;

  /// No description provided for @chatSettings.
  ///
  /// In en, this message translates to:
  /// **'Chat Settings'**
  String get chatSettings;

  /// No description provided for @checkInbox.
  ///
  /// In en, this message translates to:
  /// **'Check your inbox'**
  String get checkInbox;

  /// No description provided for @checkboxListTileChecked.
  ///
  /// In en, this message translates to:
  /// **'The checkbox list tile is checked'**
  String get checkboxListTileChecked;

  /// No description provided for @checkboxListTileTitle.
  ///
  /// In en, this message translates to:
  /// **'CheckboxListTile'**
  String get checkboxListTileTitle;

  /// No description provided for @checkboxListTileTitleDisabled.
  ///
  /// In en, this message translates to:
  /// **'CheckboxListTile disabled'**
  String get checkboxListTileTitleDisabled;

  /// No description provided for @checkboxListTileTristate.
  ///
  /// In en, this message translates to:
  /// **'The checkbox list tile is tristate'**
  String get checkboxListTileTristate;

  /// No description provided for @checkboxListTileUnchecked.
  ///
  /// In en, this message translates to:
  /// **'The checkbox list tile is unchecked'**
  String get checkboxListTileUnchecked;

  /// No description provided for @circleAvatarAbrev.
  ///
  /// In en, this message translates to:
  /// **'AV'**
  String get circleAvatarAbrev;

  /// No description provided for @clearBrowsingDescription.
  ///
  /// In en, this message translates to:
  /// **'Clear history, cookies, cache and more'**
  String get clearBrowsingDescription;

  /// No description provided for @clearBrowsingTitle.
  ///
  /// In en, this message translates to:
  /// **'Clear browsing data'**
  String get clearBrowsingTitle;

  /// No description provided for @close.
  ///
  /// In en, this message translates to:
  /// **'Close'**
  String get close;

  /// No description provided for @codeResent.
  ///
  /// In en, this message translates to:
  /// **'Code resent'**
  String get codeResent;

  /// No description provided for @color.
  ///
  /// In en, this message translates to:
  /// **'Color'**
  String get color;

  /// No description provided for @colorBlue.
  ///
  /// In en, this message translates to:
  /// **'Blue'**
  String get colorBlue;

  /// No description provided for @colorDark.
  ///
  /// In en, this message translates to:
  /// **'Dark'**
  String get colorDark;

  /// No description provided for @colorGreen.
  ///
  /// In en, this message translates to:
  /// **'Green'**
  String get colorGreen;

  /// No description provided for @colorGrey.
  ///
  /// In en, this message translates to:
  /// **'Grey'**
  String get colorGrey;

  /// No description provided for @colorOrange.
  ///
  /// In en, this message translates to:
  /// **'Orange'**
  String get colorOrange;

  /// No description provided for @colorPurple.
  ///
  /// In en, this message translates to:
  /// **'Purple'**
  String get colorPurple;

  /// No description provided for @colorRed.
  ///
  /// In en, this message translates to:
  /// **'Red'**
  String get colorRed;

  /// No description provided for @colorScheme.
  ///
  /// In en, this message translates to:
  /// **'ColorScheme Colors'**
  String get colorScheme;

  /// No description provided for @colorYellow.
  ///
  /// In en, this message translates to:
  /// **'Yellow'**
  String get colorYellow;

  /// No description provided for @colors.
  ///
  /// In en, this message translates to:
  /// **'Colors'**
  String get colors;

  /// No description provided for @comment.
  ///
  /// In en, this message translates to:
  /// **'Write a comment...'**
  String get comment;

  /// No description provided for @componentColors.
  ///
  /// In en, this message translates to:
  /// **'Component colors'**
  String get componentColors;

  /// No description provided for @componentTheme.
  ///
  /// In en, this message translates to:
  /// **'Component Theme'**
  String get componentTheme;

  /// No description provided for @computeDarkSchemeColors.
  ///
  /// In en, this message translates to:
  /// **'Compute dark scheme colors'**
  String get computeDarkSchemeColors;

  /// No description provided for @confirmDeleteUser.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete current user?'**
  String get confirmDeleteUser;

  /// No description provided for @confirmLeaveDial.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to leave this dialog?'**
  String get confirmLeaveDial;

  /// No description provided for @confirmLogout.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want logout current user'**
  String get confirmLogout;

  /// No description provided for @connectedDevices.
  ///
  /// In en, this message translates to:
  /// **'Connected devices'**
  String get connectedDevices;

  /// No description provided for @connectedDevicesDescription.
  ///
  /// In en, this message translates to:
  /// **'Bluetooth, pairing'**
  String get connectedDevicesDescription;

  /// No description provided for @conservation.
  ///
  /// In en, this message translates to:
  /// **'Conservation'**
  String get conservation;

  /// No description provided for @conservations.
  ///
  /// In en, this message translates to:
  /// **'Conservations'**
  String get conservations;

  /// No description provided for @conservationsNoP.
  ///
  /// In en, this message translates to:
  /// **'No priority conservations'**
  String get conservationsNoP;

  /// No description provided for @contactDetails.
  ///
  /// In en, this message translates to:
  /// **'Contact details'**
  String get contactDetails;

  /// No description provided for @contacts.
  ///
  /// In en, this message translates to:
  /// **'Contacts'**
  String get contacts;

  /// No description provided for @controlNotifications.
  ///
  /// In en, this message translates to:
  /// **'Control notifications from individual apps'**
  String get controlNotifications;

  /// No description provided for @cookiesOtherDescription.
  ///
  /// In en, this message translates to:
  /// **'Third-party cookies are blocked in Incognito mode'**
  String get cookiesOtherDescription;

  /// No description provided for @cookiesOtherTitle.
  ///
  /// In en, this message translates to:
  /// **'Cookies and other site data'**
  String get cookiesOtherTitle;

  /// No description provided for @copiedClipBoard.
  ///
  /// In en, this message translates to:
  /// **'Copied your clip board'**
  String get copiedClipBoard;

  /// No description provided for @create.
  ///
  /// In en, this message translates to:
  /// **'Create'**
  String get create;

  /// No description provided for @createAccount.
  ///
  /// In en, this message translates to:
  /// **'Create an Account'**
  String get createAccount;

  /// No description provided for @createContact.
  ///
  /// In en, this message translates to:
  /// **'Create Contact'**
  String get createContact;

  /// No description provided for @createDialog.
  ///
  /// In en, this message translates to:
  /// **'Create Dialog'**
  String get createDialog;

  /// No description provided for @createGroupChat.
  ///
  /// In en, this message translates to:
  /// **'Create group chat'**
  String get createGroupChat;

  /// No description provided for @createPrivateChat.
  ///
  /// In en, this message translates to:
  /// **'Create private chat'**
  String get createPrivateChat;

  /// No description provided for @createPublicChat.
  ///
  /// In en, this message translates to:
  /// **'Create public chat'**
  String get createPublicChat;

  /// No description provided for @created.
  ///
  /// In en, this message translates to:
  /// **'Created'**
  String get created;

  /// No description provided for @cubeUserId.
  ///
  /// In en, this message translates to:
  /// **'Cube User Id'**
  String get cubeUserId;

  /// No description provided for @cubeUserName.
  ///
  /// In en, this message translates to:
  /// **'enter CubeUser Name'**
  String get cubeUserName;

  /// No description provided for @darkAppBarOpacity.
  ///
  /// In en, this message translates to:
  /// **'Dark AppBar opacity'**
  String get darkAppBarOpacity;

  /// No description provided for @darkAppBarStyle.
  ///
  /// In en, this message translates to:
  /// **'Dark AppBar style'**
  String get darkAppBarStyle;

  /// No description provided for @darkSchemeText.
  ///
  /// In en, this message translates to:
  /// **'Dark scheme colors are computed from the light scheme, instead of '**
  String get darkSchemeText;

  /// No description provided for @darkSchemeTextSuit.
  ///
  /// In en, this message translates to:
  /// **'using defined dark scheme colors.'**
  String get darkSchemeTextSuit;

  /// No description provided for @darkSurfaceBlendSubTitle.
  ///
  /// In en, this message translates to:
  /// **'Adjust the surface, background and \\nscaffold blends'**
  String get darkSurfaceBlendSubTitle;

  /// No description provided for @darkSurfaceBlendTitle.
  ///
  /// In en, this message translates to:
  /// **'Dark surface blend'**
  String get darkSurfaceBlendTitle;

  /// No description provided for @darkThemeSurfaceMode.
  ///
  /// In en, this message translates to:
  /// **'Dark theme surface mode'**
  String get darkThemeSurfaceMode;

  /// No description provided for @datePickerDialog.
  ///
  /// In en, this message translates to:
  /// **'Date Picker Dialog'**
  String get datePickerDialog;

  /// No description provided for @day.
  ///
  /// In en, this message translates to:
  /// **'Day'**
  String get day;

  /// No description provided for @defaultBackgroundColorSurface.
  ///
  /// In en, this message translates to:
  /// **'Default background color is surface with an onSurface overlay\\ncolor in M2, and primary in M3, with elevation 3.\\nFlexColorScheme component theme default is color scheme\\nbackground, with used surface blend and elevation 0.'**
  String get defaultBackgroundColorSurface;

  /// No description provided for @defaultLabel.
  ///
  /// In en, this message translates to:
  /// **'Default'**
  String get defaultLabel;

  /// No description provided for @defaultSdkBackgroundColor.
  ///
  /// In en, this message translates to:
  /// **'Default SDK background color is theme canvasColor via\\nMaterial. The canvasColor is typically\\ncolorScheme.background, elevation is 8. FCS sub-theme default\\nis colorScheme.background and elevation 0.'**
  String get defaultSdkBackgroundColor;

  /// No description provided for @delete.
  ///
  /// In en, this message translates to:
  /// **'delete'**
  String get delete;

  /// No description provided for @deleteAvatar.
  ///
  /// In en, this message translates to:
  /// **'Delete Avatar'**
  String get deleteAvatar;

  /// No description provided for @deleteContact.
  ///
  /// In en, this message translates to:
  /// **'Delete contact'**
  String get deleteContact;

  /// No description provided for @deleteFactor.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete this factor? You will be signed out of the app upon removing the factor.'**
  String get deleteFactor;

  /// No description provided for @deleteUser.
  ///
  /// In en, this message translates to:
  /// **'delete user'**
  String get deleteUser;

  /// No description provided for @description.
  ///
  /// In en, this message translates to:
  /// **'Description'**
  String get description;

  /// No description provided for @developerNavBar.
  ///
  /// In en, this message translates to:
  /// **'Developer'**
  String get developerNavBar;

  /// No description provided for @dialog.
  ///
  /// In en, this message translates to:
  /// **'Dialog'**
  String get dialog;

  /// No description provided for @dialogUnknown.
  ///
  /// In en, this message translates to:
  /// **'Unknown dialog'**
  String get dialogUnknown;

  /// No description provided for @disabledItem.
  ///
  /// In en, this message translates to:
  /// **'Disabled item'**
  String get disabledItem;

  /// No description provided for @disabledMin.
  ///
  /// In en, this message translates to:
  /// **'disabled'**
  String get disabledMin;

  /// No description provided for @disabledTextEntry.
  ///
  /// In en, this message translates to:
  /// **'Disabled with text entry'**
  String get disabledTextEntry;

  /// No description provided for @dismiss.
  ///
  /// In en, this message translates to:
  /// **'Dismiss'**
  String get dismiss;

  /// No description provided for @display.
  ///
  /// In en, this message translates to:
  /// **'Display'**
  String get display;

  /// No description provided for @displayDescription.
  ///
  /// In en, this message translates to:
  /// **'Dark theme, font size, brightness'**
  String get displayDescription;

  /// No description provided for @displayTitleZoom.
  ///
  /// In en, this message translates to:
  /// **'Display zoom'**
  String get displayTitleZoom;

  /// No description provided for @doNotDisturb.
  ///
  /// In en, this message translates to:
  /// **'Do Not Disturb'**
  String get doNotDisturb;

  /// No description provided for @doNotDisturbDescription.
  ///
  /// In en, this message translates to:
  /// **'Off / 1 schedule can turn on automatically'**
  String get doNotDisturbDescription;

  /// No description provided for @done.
  ///
  /// In en, this message translates to:
  /// **'Done'**
  String get done;

  /// No description provided for @drawer.
  ///
  /// In en, this message translates to:
  /// **'Drawer'**
  String get drawer;

  /// No description provided for @drawerTheme.
  ///
  /// In en, this message translates to:
  /// **'Drawer theme'**
  String get drawerTheme;

  /// No description provided for @dropdownButton.
  ///
  /// In en, this message translates to:
  /// **'Dropdown button'**
  String get dropdownButton;

  /// No description provided for @dropdownFormFieldOption.
  ///
  /// In en, this message translates to:
  /// **'Dropdown FormField - Option'**
  String get dropdownFormFieldOption;

  /// No description provided for @dropdownMenu.
  ///
  /// In en, this message translates to:
  /// **'DropdownMenu'**
  String get dropdownMenu;

  /// No description provided for @dropdownMenuText.
  ///
  /// In en, this message translates to:
  /// **'The new M3 DropdownMenu shares building blocks with MenuBar\\nand MenuAnchor, also uses InputDecorator for text entry.'**
  String get dropdownMenuText;

  /// No description provided for @dueDate.
  ///
  /// In en, this message translates to:
  /// **'Due Date'**
  String get dueDate;

  /// No description provided for @duration.
  ///
  /// In en, this message translates to:
  /// **'duration'**
  String get duration;

  /// No description provided for @egoteServicesTitle.
  ///
  /// In en, this message translates to:
  /// **'Egote services'**
  String get egoteServicesTitle;

  /// No description provided for @elevatedButton.
  ///
  /// In en, this message translates to:
  /// **'Elevated button'**
  String get elevatedButton;

  /// No description provided for @elevatedIcon.
  ///
  /// In en, this message translates to:
  /// **'Elevated Icon'**
  String get elevatedIcon;

  /// No description provided for @elevation.
  ///
  /// In en, this message translates to:
  /// **'Elevation'**
  String get elevation;

  /// No description provided for @email.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get email;

  /// No description provided for @emailInvalid.
  ///
  /// In en, this message translates to:
  /// **'Invalid email'**
  String get emailInvalid;

  /// No description provided for @empty.
  ///
  /// In en, this message translates to:
  /// **'Empty'**
  String get empty;

  /// No description provided for @english.
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get english;

  /// No description provided for @enterAddressCity.
  ///
  /// In en, this message translates to:
  /// **'enter a City Name'**
  String get enterAddressCity;

  /// No description provided for @enterAddressZipCode.
  ///
  /// In en, this message translates to:
  /// **'enter a Zip Code'**
  String get enterAddressZipCode;

  /// No description provided for @enterCode.
  ///
  /// In en, this message translates to:
  /// **'Enter Code'**
  String get enterCode;

  /// No description provided for @enterCodeSent.
  ///
  /// In en, this message translates to:
  /// **'Enter the code shown in your authentication app.'**
  String get enterCodeSent;

  /// No description provided for @enterDuration.
  ///
  /// In en, this message translates to:
  /// **'enter duration'**
  String get enterDuration;

  /// No description provided for @enterLogin.
  ///
  /// In en, this message translates to:
  /// **'Enter your login'**
  String get enterLogin;

  /// No description provided for @enterPassword.
  ///
  /// In en, this message translates to:
  /// **'Enter your password'**
  String get enterPassword;

  /// No description provided for @enterUserEmail.
  ///
  /// In en, this message translates to:
  /// **'Enter User Email'**
  String get enterUserEmail;

  /// No description provided for @enterUserPassword.
  ///
  /// In en, this message translates to:
  /// **'Enter User Password'**
  String get enterUserPassword;

  /// No description provided for @enterUsername.
  ///
  /// In en, this message translates to:
  /// **'Enter Username'**
  String get enterUsername;

  /// No description provided for @expandCollapseSubTitle.
  ///
  /// In en, this message translates to:
  /// **'ON to expand  OFF to collapse\\n\\nOnly used for local control of Rail\\npresentation.'**
  String get expandCollapseSubTitle;

  /// No description provided for @expandCollapseTitle.
  ///
  /// In en, this message translates to:
  /// **'Expand and collapse'**
  String get expandCollapseTitle;

  /// No description provided for @expansionPanelDelete.
  ///
  /// In en, this message translates to:
  /// **'To delete this panel, tap the trash can icon'**
  String get expansionPanelDelete;

  /// No description provided for @expansionPanelFixed.
  ///
  /// In en, this message translates to:
  /// **'This panel is fixed here and cannot be removed. Items\\nnumbered 3 and higher can be removed.'**
  String get expansionPanelFixed;

  /// No description provided for @expansionTileListTitle.
  ///
  /// In en, this message translates to:
  /// **'This is tile number'**
  String get expansionTileListTitle;

  /// No description provided for @expansionTileSubTitle1.
  ///
  /// In en, this message translates to:
  /// **'Trailing expansion arrow icon'**
  String get expansionTileSubTitle1;

  /// No description provided for @expansionTileSubTitle2.
  ///
  /// In en, this message translates to:
  /// **'Custom expansion arrow icon'**
  String get expansionTileSubTitle2;

  /// No description provided for @expansionTileSubTitle3.
  ///
  /// In en, this message translates to:
  /// **'Leading expansion arrow icon'**
  String get expansionTileSubTitle3;

  /// No description provided for @expansionTileTitle.
  ///
  /// In en, this message translates to:
  /// **'ExpansionTile'**
  String get expansionTileTitle;

  /// No description provided for @explainFlutterM2Color.
  ///
  /// In en, this message translates to:
  /// **'Flutter M2 past default color was\\nThemeData.bottomAppBarColor. It was deprecated in\\nFlutter 3.7. New default is colorScheme.surface and\\nelevation 8. In M3 it defaults to colorScheme.surface\\ncolor, elevation 3, no shadow, but with surface elevation\\ntint.'**
  String get explainFlutterM2Color;

  /// No description provided for @explainUsedColors1.
  ///
  /// In en, this message translates to:
  /// **'Material 3 ColorScheme seeding from key colors is OFF and not\\nused. The ColorScheme is based directly on the selected theme'**
  String get explainUsedColors1;

  /// No description provided for @explainUsedColors2.
  ///
  /// In en, this message translates to:
  /// **'Light theme Primary color is used to generate the Colorscheme.\\nThis is like using Flutter ColorScheme.fromSeed with the Primary\\ncolor as seed color'**
  String get explainUsedColors2;

  /// No description provided for @explainUsedColors3.
  ///
  /// In en, this message translates to:
  /// **'Tonal palettes for the ColorScheme, are made with light theme\\nPrimary and Secondary colors as seed keys. Tertiary key is computed\\nfrom Primary color'**
  String get explainUsedColors3;

  /// No description provided for @explainUsedColors4.
  ///
  /// In en, this message translates to:
  /// **'Tonal palettes for the ColorScheme, are made with light theme\\nPrimary and Tertiary colors as seed keys, Secondary key is computed\\nfrom Primary color'**
  String get explainUsedColors4;

  /// No description provided for @explainUsedColors5.
  ///
  /// In en, this message translates to:
  /// **'Light theme Primary, Secondary and Tertiary colors are used as\\nkeys to generate tonal palettes that define the ColorScheme'**
  String get explainUsedColors5;

  /// No description provided for @extended.
  ///
  /// In en, this message translates to:
  /// **'Extended'**
  String get extended;

  /// No description provided for @fastAppTerminationDescription.
  ///
  /// In en, this message translates to:
  /// **'Terminate instead of suspending apps when backgrounded to\\nforce apps to be relaunched when tray \\nare foregrounded.'**
  String get fastAppTerminationDescription;

  /// No description provided for @fastAppTerminationTitle.
  ///
  /// In en, this message translates to:
  /// **'Fast App Termination'**
  String get fastAppTerminationTitle;

  /// No description provided for @faultyUrl.
  ///
  /// In en, this message translates to:
  /// **'Faulty URL!'**
  String get faultyUrl;

  /// No description provided for @favorite.
  ///
  /// In en, this message translates to:
  /// **'Favorite'**
  String get favorite;

  /// No description provided for @favourites.
  ///
  /// In en, this message translates to:
  /// **'Favourites'**
  String get favourites;

  /// No description provided for @file.
  ///
  /// In en, this message translates to:
  /// **'File'**
  String get file;

  /// No description provided for @fillRate.
  ///
  /// In en, this message translates to:
  /// **'Fill Rate'**
  String get fillRate;

  /// No description provided for @filled.
  ///
  /// In en, this message translates to:
  /// **'Filled'**
  String get filled;

  /// No description provided for @filledButton.
  ///
  /// In en, this message translates to:
  /// **'Filled button'**
  String get filledButton;

  /// No description provided for @filledDisabled.
  ///
  /// In en, this message translates to:
  /// **'Filled (disabled)'**
  String get filledDisabled;

  /// No description provided for @filledIcon.
  ///
  /// In en, this message translates to:
  /// **'Filled Icon'**
  String get filledIcon;

  /// No description provided for @filledSetTrue.
  ///
  /// In en, this message translates to:
  /// **'filled set true by Widget'**
  String get filledSetTrue;

  /// No description provided for @filledTonal.
  ///
  /// In en, this message translates to:
  /// **'Filled tonal'**
  String get filledTonal;

  /// No description provided for @filledTonalButton.
  ///
  /// In en, this message translates to:
  /// **'Filled tonal button'**
  String get filledTonalButton;

  /// No description provided for @filledTonalDisabled.
  ///
  /// In en, this message translates to:
  /// **'Filled tonal (disabled)'**
  String get filledTonalDisabled;

  /// No description provided for @filledTonalIcon.
  ///
  /// In en, this message translates to:
  /// **'Filled tonal icon'**
  String get filledTonalIcon;

  /// No description provided for @flexTonesTitle1.
  ///
  /// In en, this message translates to:
  /// **'FlexTones setup'**
  String get flexTonesTitle1;

  /// No description provided for @flexTonesTitle2.
  ///
  /// In en, this message translates to:
  /// **'FlexTones setup with CAM16 chroma'**
  String get flexTonesTitle2;

  /// No description provided for @flutterBackgroundColor.
  ///
  /// In en, this message translates to:
  /// **'Flutter default background color is colorScheme.surface.\\nFlexColorScheme sub-theme default is colorScheme.background.'**
  String get flutterBackgroundColor;

  /// No description provided for @flutterBackgroundColorM3.
  ///
  /// In en, this message translates to:
  /// **'Default Flutter background color in M3 is colorScheme.surface,\\nwith elevation tint and no shadow. In M2 it has shadow and\\nuses color theme.canvasColor, that is typically set\\nto colorScheme.background.'**
  String get flutterBackgroundColorM3;

  /// No description provided for @flutterBackgroundColorSurface.
  ///
  /// In en, this message translates to:
  /// **'Default Flutter background color is colorScheme.surface,\\nwith addition of elevation tint in Material 3 mode.'**
  String get flutterBackgroundColorSurface;

  /// No description provided for @font.
  ///
  /// In en, this message translates to:
  /// **'Font'**
  String get font;

  /// No description provided for @forTesting.
  ///
  /// In en, this message translates to:
  /// **'For testing, not persisted.'**
  String get forTesting;

  /// No description provided for @fullPhoto.
  ///
  /// In en, this message translates to:
  /// **'Full photo'**
  String get fullPhoto;

  /// No description provided for @general.
  ///
  /// In en, this message translates to:
  /// **'General'**
  String get general;

  /// No description provided for @geo.
  ///
  /// In en, this message translates to:
  /// **'Geolocation'**
  String get geo;

  /// No description provided for @groupConf.
  ///
  /// In en, this message translates to:
  /// **'Group configuration...'**
  String get groupConf;

  /// No description provided for @groupDetails.
  ///
  /// In en, this message translates to:
  /// **'Group details'**
  String get groupDetails;

  /// No description provided for @groupName.
  ///
  /// In en, this message translates to:
  /// **'Group Name...'**
  String get groupName;

  /// No description provided for @groupProvide.
  ///
  /// In en, this message translates to:
  /// **'Please provide a group name and an optional group icon'**
  String get groupProvide;

  /// No description provided for @haveAccount.
  ///
  /// In en, this message translates to:
  /// **'Have an account? Click here to login.'**
  String get haveAccount;

  /// No description provided for @haventAccount.
  ///
  /// In en, this message translates to:
  /// **'Don\\\'t have an account? Tap here to register.'**
  String get haventAccount;

  /// No description provided for @headline.
  ///
  /// In en, this message translates to:
  /// **'Headline'**
  String get headline;

  /// No description provided for @helloMaterialBanner.
  ///
  /// In en, this message translates to:
  /// **'Hello, I am a MaterialBanner'**
  String get helloMaterialBanner;

  /// No description provided for @hideMessage.
  ///
  /// In en, this message translates to:
  /// **'Hide Message'**
  String get hideMessage;

  /// No description provided for @hideSilentTile.
  ///
  /// In en, this message translates to:
  /// **'Hide silent notifications in status bar'**
  String get hideSilentTile;

  /// No description provided for @highBackgroundLowScaffoldLongText.
  ///
  /// In en, this message translates to:
  /// **'High background, low scaffold\\nSurface 1x  Background 3/2x  Scaffold 1/2x\\n'**
  String get highBackgroundLowScaffoldLongText;

  /// No description provided for @highBackgroundLowScaffoldShortText.
  ///
  /// In en, this message translates to:
  /// **'High background\\nlow scaffold'**
  String get highBackgroundLowScaffoldShortText;

  /// No description provided for @highScaffoldLevelSurfaceLongText.
  ///
  /// In en, this message translates to:
  /// **'Very high scaffold, high background, level surface\\nSurface 1x  Background 2x  Scaffold 3x\\n'**
  String get highScaffoldLevelSurfaceLongText;

  /// No description provided for @highScaffoldLevelSurfaceShortText.
  ///
  /// In en, this message translates to:
  /// **'High scaffold\\nlevel surface'**
  String get highScaffoldLevelSurfaceShortText;

  /// No description provided for @highScaffoldLowSurfaceLongText.
  ///
  /// In en, this message translates to:
  /// **'Very high scaffold, low surface\\nSurface 1/2x  Background 1x  Scaffold 3x\\n'**
  String get highScaffoldLowSurfaceLongText;

  /// No description provided for @highScaffoldLowSurfaceShortText.
  ///
  /// In en, this message translates to:
  /// **'VHigh scaffold\\nlow surface'**
  String get highScaffoldLowSurfaceShortText;

  /// No description provided for @highScaffoldLowSurfacesLongText.
  ///
  /// In en, this message translates to:
  /// **'Very high scaffold, low surface and background\\nSurface 1/2x  Background 1/2x  Scaffold 3x\\n'**
  String get highScaffoldLowSurfacesLongText;

  /// No description provided for @highScaffoldLowSurfacesShortText.
  ///
  /// In en, this message translates to:
  /// **'High scaffold\\nlow surfaces'**
  String get highScaffoldLowSurfacesShortText;

  /// No description provided for @highScaffoldLowSurfacesVariantDialogLongText.
  ///
  /// In en, this message translates to:
  /// **'Tertiary container dialog, very high scaffold\\nSurface 1/2x  Background 1/2x  Scaffold 3x\\nDialog 1/2x blend of tertiary container color'**
  String get highScaffoldLowSurfacesVariantDialogLongText;

  /// No description provided for @highScaffoldLowSurfacesVariantDialogShortText.
  ///
  /// In en, this message translates to:
  /// **'High scaffold\\ntertiaryContainer dialog'**
  String get highScaffoldLowSurfacesVariantDialogShortText;

  /// No description provided for @highSurfaceLowScaffoldLongText.
  ///
  /// In en, this message translates to:
  /// **'High surface, low scaffold\\nSurface 3/2x  Background 1x  Scaffold 1/2x\\n'**
  String get highSurfaceLowScaffoldLongText;

  /// No description provided for @highSurfaceLowScaffoldShortText.
  ///
  /// In en, this message translates to:
  /// **'High surface\\nlow scaffold'**
  String get highSurfaceLowScaffoldShortText;

  /// No description provided for @hive.
  ///
  /// In en, this message translates to:
  /// **'Hive'**
  String get hive;

  /// No description provided for @home.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get home;

  /// No description provided for @httpThree.
  ///
  /// In en, this message translates to:
  /// **'HTTP/3'**
  String get httpThree;

  /// No description provided for @iadDevTitle.
  ///
  /// In en, this message translates to:
  /// **'IAD developer app testing'**
  String get iadDevTitle;

  /// No description provided for @iconButtonCLoseM3.
  ///
  /// In en, this message translates to:
  /// **'This is an IconButton\\nIn M3 tap to close lock'**
  String get iconButtonCLoseM3;

  /// No description provided for @iconButtonOpenM3.
  ///
  /// In en, this message translates to:
  /// **'This is an IconButton\\nIn M3 tap to open lock'**
  String get iconButtonOpenM3;

  /// No description provided for @info.
  ///
  /// In en, this message translates to:
  /// **'Info'**
  String get info;

  /// No description provided for @infoThemeSettings.
  ///
  /// In en, this message translates to:
  /// **'FlexColorScheme persisted theme demo. Theme settings \'\n\'widgets using Riverpod controllers can be used anywhere in \'\n\'the app. On this page, in the Drawer and in a BottomSheet \'\n\'to control persisted theme settings.'**
  String get infoThemeSettings;

  /// No description provided for @initCode.
  ///
  /// In en, this message translates to:
  /// **'000000'**
  String get initCode;

  /// No description provided for @iosDevTitle.
  ///
  /// In en, this message translates to:
  /// **'iOS Developer Screen'**
  String get iosDevTitle;

  /// No description provided for @italic.
  ///
  /// In en, this message translates to:
  /// **'Italic'**
  String get italic;

  /// No description provided for @label.
  ///
  /// In en, this message translates to:
  /// **'Label'**
  String get label;

  /// No description provided for @labelActionChip.
  ///
  /// In en, this message translates to:
  /// **'ActionChip'**
  String get labelActionChip;

  /// No description provided for @labelAlarmSettings.
  ///
  /// In en, this message translates to:
  /// **'Alarm settings'**
  String get labelAlarmSettings;

  /// No description provided for @labelAndroid.
  ///
  /// In en, this message translates to:
  /// **'Google Android'**
  String get labelAndroid;

  /// No description provided for @labelApple.
  ///
  /// In en, this message translates to:
  /// **'Apple iOS'**
  String get labelApple;

  /// No description provided for @labelArchive.
  ///
  /// In en, this message translates to:
  /// **'Archive'**
  String get labelArchive;

  /// No description provided for @labelBackground.
  ///
  /// In en, this message translates to:
  /// **'Background'**
  String get labelBackground;

  /// No description provided for @labelBottomNaviBarBackground.
  ///
  /// In en, this message translates to:
  /// **'Bottom\\nNaviBar\\nBackground'**
  String get labelBottomNaviBarBackground;

  /// No description provided for @labelBottomNaviBarSelected.
  ///
  /// In en, this message translates to:
  /// **'Bottom\\nNaviBar\\nSelected'**
  String get labelBottomNaviBarSelected;

  /// No description provided for @labelCabinOverview.
  ///
  /// In en, this message translates to:
  /// **'Cabin overview'**
  String get labelCabinOverview;

  /// No description provided for @labelCanvas.
  ///
  /// In en, this message translates to:
  /// **'Canvas'**
  String get labelCanvas;

  /// No description provided for @labelCard.
  ///
  /// In en, this message translates to:
  /// **'Card'**
  String get labelCard;

  /// No description provided for @labelChat.
  ///
  /// In en, this message translates to:
  /// **'Chat'**
  String get labelChat;

  /// No description provided for @labelCheckbox.
  ///
  /// In en, this message translates to:
  /// **'Checkbox'**
  String get labelCheckbox;

  /// No description provided for @labelChip.
  ///
  /// In en, this message translates to:
  /// **'Chip'**
  String get labelChip;

  /// No description provided for @labelChipCheck.
  ///
  /// In en, this message translates to:
  /// **'Chip check'**
  String get labelChipCheck;

  /// No description provided for @labelChips.
  ///
  /// In en, this message translates to:
  /// **'Chips'**
  String get labelChips;

  /// No description provided for @labelChoiceChip.
  ///
  /// In en, this message translates to:
  /// **'ChoiceChip'**
  String get labelChoiceChip;

  /// No description provided for @labelCircleAvatar.
  ///
  /// In en, this message translates to:
  /// **'Circle\\nAvatar'**
  String get labelCircleAvatar;

  /// No description provided for @labelDialogBackground.
  ///
  /// In en, this message translates to:
  /// **'Dialog\\nBackground'**
  String get labelDialogBackground;

  /// No description provided for @labelDisabledColor.
  ///
  /// In en, this message translates to:
  /// **'Disabled\\nColor'**
  String get labelDisabledColor;

  /// No description provided for @labelDisabledSettings.
  ///
  /// In en, this message translates to:
  /// **'Disabled settings'**
  String get labelDisabledSettings;

  /// No description provided for @labelDividerColor.
  ///
  /// In en, this message translates to:
  /// **'Divider\\nColor'**
  String get labelDividerColor;

  /// No description provided for @labelElevatedButton.
  ///
  /// In en, this message translates to:
  /// **'Elevated\\nButton'**
  String get labelElevatedButton;

  /// No description provided for @labelError.
  ///
  /// In en, this message translates to:
  /// **'Error'**
  String get labelError;

  /// No description provided for @labelErrorContainer.
  ///
  /// In en, this message translates to:
  /// **'Error\\nContainer'**
  String get labelErrorContainer;

  /// No description provided for @labelFilterChip.
  ///
  /// In en, this message translates to:
  /// **'FilterChip'**
  String get labelFilterChip;

  /// No description provided for @labelFloatingActionButton.
  ///
  /// In en, this message translates to:
  /// **'Floating\\nAction\\nButton'**
  String get labelFloatingActionButton;

  /// No description provided for @labelFocusColor.
  ///
  /// In en, this message translates to:
  /// **'Focus\\nColor'**
  String get labelFocusColor;

  /// No description provided for @labelFuchsia.
  ///
  /// In en, this message translates to:
  /// **'Google Fuchsia'**
  String get labelFuchsia;

  /// No description provided for @labelHighlightColor.
  ///
  /// In en, this message translates to:
  /// **'Highlight\\nColor'**
  String get labelHighlightColor;

  /// No description provided for @labelHintColor.
  ///
  /// In en, this message translates to:
  /// **'Hint\\nColor'**
  String get labelHintColor;

  /// No description provided for @labelHoverColor.
  ///
  /// In en, this message translates to:
  /// **'Hover\\nColor'**
  String get labelHoverColor;

  /// No description provided for @labelIndicatorColor.
  ///
  /// In en, this message translates to:
  /// **'Indicator\\nColor'**
  String get labelIndicatorColor;

  /// No description provided for @labelInputChip.
  ///
  /// In en, this message translates to:
  /// **'InputChip'**
  String get labelInputChip;

  /// No description provided for @labelInputDecorator.
  ///
  /// In en, this message translates to:
  /// **'Input\\nDecorator'**
  String get labelInputDecorator;

  /// No description provided for @labelInversePrimary.
  ///
  /// In en, this message translates to:
  /// **'Inverse\\nPrimary'**
  String get labelInversePrimary;

  /// No description provided for @labelInverseSurface.
  ///
  /// In en, this message translates to:
  /// **'Inverse\\nSurface'**
  String get labelInverseSurface;

  /// No description provided for @labelLinux.
  ///
  /// In en, this message translates to:
  /// **'Linux'**
  String get labelLinux;

  /// No description provided for @labelMacOs.
  ///
  /// In en, this message translates to:
  /// **'Apple MacOS'**
  String get labelMacOs;

  /// No description provided for @labelNavigationBarBackground.
  ///
  /// In en, this message translates to:
  /// **'Navigation\\nBar\\nBackground'**
  String get labelNavigationBarBackground;

  /// No description provided for @labelNavigationBarIndicator.
  ///
  /// In en, this message translates to:
  /// **'Navigation\\nBar\\nIndicator'**
  String get labelNavigationBarIndicator;

  /// No description provided for @labelNavigationBarSelected.
  ///
  /// In en, this message translates to:
  /// **'Navigation\\nBar\\nSelected'**
  String get labelNavigationBarSelected;

  /// No description provided for @labelNavigationRailBackground.
  ///
  /// In en, this message translates to:
  /// **'Navigation\\nRail\\nBackground'**
  String get labelNavigationRailBackground;

  /// No description provided for @labelNavigationRailIndicator.
  ///
  /// In en, this message translates to:
  /// **'Navigation\\nRail\\nIndicator'**
  String get labelNavigationRailIndicator;

  /// No description provided for @labelNavigationRailSelected.
  ///
  /// In en, this message translates to:
  /// **'Navigation\\nRail\\nSelected'**
  String get labelNavigationRailSelected;

  /// No description provided for @labelOnBackground.
  ///
  /// In en, this message translates to:
  /// **'on\\nBackground'**
  String get labelOnBackground;

  /// No description provided for @labelOnError.
  ///
  /// In en, this message translates to:
  /// **'on\\nError'**
  String get labelOnError;

  /// No description provided for @labelOnErrorContainer.
  ///
  /// In en, this message translates to:
  /// **'onError\\nContainer'**
  String get labelOnErrorContainer;

  /// No description provided for @labelOnInverseSurface.
  ///
  /// In en, this message translates to:
  /// **'onInverse\\nSurface'**
  String get labelOnInverseSurface;

  /// No description provided for @labelOnPrimary.
  ///
  /// In en, this message translates to:
  /// **'on\\nPrimary'**
  String get labelOnPrimary;

  /// No description provided for @labelOnPrimaryContainer.
  ///
  /// In en, this message translates to:
  /// **'onPrimary\\nContainer'**
  String get labelOnPrimaryContainer;

  /// No description provided for @labelOnSecondary.
  ///
  /// In en, this message translates to:
  /// **'on\\nSecondary'**
  String get labelOnSecondary;

  /// No description provided for @labelOnSecondaryContainer.
  ///
  /// In en, this message translates to:
  /// **'on\\nSecondary\\nContainer'**
  String get labelOnSecondaryContainer;

  /// No description provided for @labelOnSurface.
  ///
  /// In en, this message translates to:
  /// **'on\\nSurface'**
  String get labelOnSurface;

  /// No description provided for @labelOnSurfaceVariant.
  ///
  /// In en, this message translates to:
  /// **'onSurface\\nVariant'**
  String get labelOnSurfaceVariant;

  /// No description provided for @labelOnTertiary.
  ///
  /// In en, this message translates to:
  /// **'on\\nTertiary'**
  String get labelOnTertiary;

  /// No description provided for @labelOnTertiaryContainer.
  ///
  /// In en, this message translates to:
  /// **'on\\nTertiary\\nContainer'**
  String get labelOnTertiaryContainer;

  /// No description provided for @labelOutline.
  ///
  /// In en, this message translates to:
  /// **'Outline'**
  String get labelOutline;

  /// No description provided for @labelOutlineButton.
  ///
  /// In en, this message translates to:
  /// **'Outlined\\nButton'**
  String get labelOutlineButton;

  /// No description provided for @labelPrimary.
  ///
  /// In en, this message translates to:
  /// **'Primary'**
  String get labelPrimary;

  /// No description provided for @labelPrimaryColor.
  ///
  /// In en, this message translates to:
  /// **'Primary\\nColor'**
  String get labelPrimaryColor;

  /// No description provided for @labelPrimaryContainer.
  ///
  /// In en, this message translates to:
  /// **'Primary\\nContainer'**
  String get labelPrimaryContainer;

  /// No description provided for @labelPrimaryDark.
  ///
  /// In en, this message translates to:
  /// **'Primary\\nDark'**
  String get labelPrimaryDark;

  /// No description provided for @labelPrimaryLight.
  ///
  /// In en, this message translates to:
  /// **'Primary\\nLight'**
  String get labelPrimaryLight;

  /// No description provided for @labelPrimaryTextTheme.
  ///
  /// In en, this message translates to:
  /// **'PrimaryText\\nTheme'**
  String get labelPrimaryTextTheme;

  /// No description provided for @labelRadio.
  ///
  /// In en, this message translates to:
  /// **'Radio'**
  String get labelRadio;

  /// No description provided for @labelScaffoldBackground.
  ///
  /// In en, this message translates to:
  /// **'Scaffold\\nBackground'**
  String get labelScaffoldBackground;

  /// No description provided for @labelSecondary.
  ///
  /// In en, this message translates to:
  /// **'Secondary'**
  String get labelSecondary;

  /// No description provided for @labelSecondaryContainer.
  ///
  /// In en, this message translates to:
  /// **'Secondary\\nContainer'**
  String get labelSecondaryContainer;

  /// No description provided for @labelSecondaryHeader.
  ///
  /// In en, this message translates to:
  /// **'Secondary\\nHeader'**
  String get labelSecondaryHeader;

  /// No description provided for @labelShadow.
  ///
  /// In en, this message translates to:
  /// **'Shadow'**
  String get labelShadow;

  /// No description provided for @labelShadowColor.
  ///
  /// In en, this message translates to:
  /// **'Shadow\\nColor'**
  String get labelShadowColor;

  /// No description provided for @labelSnackBarBackground.
  ///
  /// In en, this message translates to:
  /// **'SnackBar\\nBackground'**
  String get labelSnackBarBackground;

  /// No description provided for @labelSplashColor.
  ///
  /// In en, this message translates to:
  /// **'Splash\\nColor'**
  String get labelSplashColor;

  /// No description provided for @labelSurface.
  ///
  /// In en, this message translates to:
  /// **'Surface'**
  String get labelSurface;

  /// No description provided for @labelSurfaceVariant.
  ///
  /// In en, this message translates to:
  /// **'Surface\\nVariant'**
  String get labelSurfaceVariant;

  /// No description provided for @labelSurveillanceView.
  ///
  /// In en, this message translates to:
  /// **'Sight monitoring'**
  String get labelSurveillanceView;

  /// No description provided for @labelSwitch.
  ///
  /// In en, this message translates to:
  /// **'Switch'**
  String get labelSwitch;

  /// No description provided for @labelTabBarIndicator.
  ///
  /// In en, this message translates to:
  /// **'TabBar\\nIndicator'**
  String get labelTabBarIndicator;

  /// No description provided for @labelTabBarItem.
  ///
  /// In en, this message translates to:
  /// **'TabBar\\nItem'**
  String get labelTabBarItem;

  /// No description provided for @labelTasks.
  ///
  /// In en, this message translates to:
  /// **'Tasks'**
  String get labelTasks;

  /// No description provided for @labelTertiary.
  ///
  /// In en, this message translates to:
  /// **'Tertiary'**
  String get labelTertiary;

  /// No description provided for @labelTertiaryContainer.
  ///
  /// In en, this message translates to:
  /// **'Tertiary\\nContainer'**
  String get labelTertiaryContainer;

  /// No description provided for @labelTextButton.
  ///
  /// In en, this message translates to:
  /// **'Text\\nButton'**
  String get labelTextButton;

  /// No description provided for @labelTextDisabled.
  ///
  /// In en, this message translates to:
  /// **'TextField - Disabled label'**
  String get labelTextDisabled;

  /// No description provided for @labelTextTheme.
  ///
  /// In en, this message translates to:
  /// **'Text\\nTheme'**
  String get labelTextTheme;

  /// No description provided for @labelToggleButtons.
  ///
  /// In en, this message translates to:
  /// **'Toggle\\nButtons'**
  String get labelToggleButtons;

  /// No description provided for @labelTonalButton.
  ///
  /// In en, this message translates to:
  /// **'Tonal\\nButton'**
  String get labelTonalButton;

  /// No description provided for @labelTooltip.
  ///
  /// In en, this message translates to:
  /// **'Tooltip'**
  String get labelTooltip;

  /// No description provided for @labelUnselectedWidget.
  ///
  /// In en, this message translates to:
  /// **'Unselected\\nWidget'**
  String get labelUnselectedWidget;

  /// No description provided for @labelWaterAlert.
  ///
  /// In en, this message translates to:
  /// **'Water alert'**
  String get labelWaterAlert;

  /// No description provided for @labelWindows.
  ///
  /// In en, this message translates to:
  /// **'Microsoft Windows'**
  String get labelWindows;

  /// No description provided for @languageSettingsScreen.
  ///
  /// In en, this message translates to:
  /// **'Language Settings Screen'**
  String get languageSettingsScreen;

  /// No description provided for @large.
  ///
  /// In en, this message translates to:
  /// **'Large'**
  String get large;

  /// No description provided for @lastLogin.
  ///
  /// In en, this message translates to:
  /// **'Last login'**
  String get lastLogin;

  /// No description provided for @lastSelected.
  ///
  /// In en, this message translates to:
  /// **'Last Selected'**
  String get lastSelected;

  /// No description provided for @leaveDialog.
  ///
  /// In en, this message translates to:
  /// **'Leave Dialog'**
  String get leaveDialog;

  /// No description provided for @level.
  ///
  /// In en, this message translates to:
  /// **'Level'**
  String get level;

  /// No description provided for @levelSurfacesLowScaffoldLongText.
  ///
  /// In en, this message translates to:
  /// **'Level surface and background, low scaffold\\nSurface 1x  Background 1x  Scaffold 1/2x\\n'**
  String get levelSurfacesLowScaffoldLongText;

  /// No description provided for @levelSurfacesLowScaffoldVariantDialogLongText.
  ///
  /// In en, this message translates to:
  /// **'Tertiary container dialog, low scaffold\\nSurface 1x  Background 1x  Scaffold 1/2x\\nDialog 1x blend of tertiary container color'**
  String get levelSurfacesLowScaffoldVariantDialogLongText;

  /// No description provided for @levelSurfacesLowScaffoldVariantDialogShortText.
  ///
  /// In en, this message translates to:
  /// **'Low scaffold\\nTertiaryContainer dialog'**
  String get levelSurfacesLowScaffoldVariantDialogShortText;

  /// No description provided for @lightAppBarOpacity.
  ///
  /// In en, this message translates to:
  /// **'Light AppBar opacity'**
  String get lightAppBarOpacity;

  /// No description provided for @lightAppBarStyle.
  ///
  /// In en, this message translates to:
  /// **'Light AppBar style'**
  String get lightAppBarStyle;

  /// No description provided for @lightThemeSurfaceBlend.
  ///
  /// In en, this message translates to:
  /// **'Light theme surface blend'**
  String get lightThemeSurfaceBlend;

  /// No description provided for @lightThemeSurfaceBlendSubTitle.
  ///
  /// In en, this message translates to:
  /// **'Adjust the surface, background and\\nscaffold blends'**
  String get lightThemeSurfaceBlendSubTitle;

  /// No description provided for @lightThemeSurfaceMode.
  ///
  /// In en, this message translates to:
  /// **'Light theme surface mode'**
  String get lightThemeSurfaceMode;

  /// No description provided for @listContacts.
  ///
  /// In en, this message translates to:
  /// **'List of Contacts'**
  String get listContacts;

  /// No description provided for @listMfa.
  ///
  /// In en, this message translates to:
  /// **'List of Multi Factor Authentication'**
  String get listMfa;

  /// No description provided for @load.
  ///
  /// In en, this message translates to:
  /// **'Load'**
  String get load;

  /// No description provided for @loadNow.
  ///
  /// In en, this message translates to:
  /// **'Load now'**
  String get loadNow;

  /// No description provided for @loading.
  ///
  /// In en, this message translates to:
  /// **'Loading...'**
  String get loading;

  /// No description provided for @location.
  ///
  /// In en, this message translates to:
  /// **'location'**
  String get location;

  /// No description provided for @locationDescription.
  ///
  /// In en, this message translates to:
  /// **'On - 3 apps have access to location'**
  String get locationDescription;

  /// No description provided for @login.
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get login;

  /// No description provided for @logout.
  ///
  /// In en, this message translates to:
  /// **'Logout'**
  String get logout;

  /// No description provided for @manage.
  ///
  /// In en, this message translates to:
  /// **'Manage'**
  String get manage;

  /// No description provided for @materialBottomSheet.
  ///
  /// In en, this message translates to:
  /// **'Material BottomSheet'**
  String get materialBottomSheet;

  /// No description provided for @materialBottomSheetText.
  ///
  /// In en, this message translates to:
  /// **'Uses Material of type canvas as default background.\\nColorScheme background in M2, but surface in M3.'**
  String get materialBottomSheetText;

  /// No description provided for @materialModalBottomSheet.
  ///
  /// In en, this message translates to:
  /// **'Material Modal BottomSheet'**
  String get materialModalBottomSheet;

  /// No description provided for @materialPopupMenuText.
  ///
  /// In en, this message translates to:
  /// **'The classic Material popup menu.'**
  String get materialPopupMenuText;

  /// No description provided for @materialShowcaseShadowText1.
  ///
  /// In en, this message translates to:
  /// **'Material type canvas, elevation 0, default\\ntint and shadow'**
  String get materialShowcaseShadowText1;

  /// No description provided for @materialShowcaseShadowText2.
  ///
  /// In en, this message translates to:
  /// **'Material type canvas, elevation 1, default tint\\nand shadow'**
  String get materialShowcaseShadowText2;

  /// No description provided for @materialShowcaseShadowText3.
  ///
  /// In en, this message translates to:
  /// **'Material type canvas, elevation 6, default tint\\nand shadow'**
  String get materialShowcaseShadowText3;

  /// No description provided for @materialShowcaseSurface.
  ///
  /// In en, this message translates to:
  /// **'Material type canvas, elevation 1,\\nassigned surfaceTint and no shadow\''**
  String get materialShowcaseSurface;

  /// No description provided for @materialShowcaseSurface2.
  ///
  /// In en, this message translates to:
  /// **'Material type canvas, elevation 6,\\nassigned surfaceTint and no shadow\''**
  String get materialShowcaseSurface2;

  /// No description provided for @materialShowcaseSurfaceShadow.
  ///
  /// In en, this message translates to:
  /// **'Material type canvas, elevation 1, default tint\\nand shadow'**
  String get materialShowcaseSurfaceShadow;

  /// No description provided for @materialShowcaseSurfaceShadow2.
  ///
  /// In en, this message translates to:
  /// **'Material type canvas, elevation 6,\\nassigned surfaceTint and shadow'**
  String get materialShowcaseSurfaceShadow2;

  /// No description provided for @materialShowcaseText1.
  ///
  /// In en, this message translates to:
  /// **'Material elevation and tint'**
  String get materialShowcaseText1;

  /// No description provided for @materialShowcaseText2.
  ///
  /// In en, this message translates to:
  /// **'MMaterial can also specify surfaceTint color,\\nwhich is applied when Material is elevated, but only in\\nMaterial 3 mode.'**
  String get materialShowcaseText2;

  /// No description provided for @materialShowcaseText3.
  ///
  /// In en, this message translates to:
  /// **'Material type canvas'**
  String get materialShowcaseText3;

  /// No description provided for @materialShowcaseText4.
  ///
  /// In en, this message translates to:
  /// **'Default background color is theme canvasColor, and\\ntheme canvasColor is set to theme colorScheme background. The\\ncolor canvasColor is going to be deprecated in Flutter.'**
  String get materialShowcaseText4;

  /// No description provided for @materialShowcaseTypeCard1.
  ///
  /// In en, this message translates to:
  /// **'Material type card'**
  String get materialShowcaseTypeCard1;

  /// No description provided for @materialShowcaseTypeCard2.
  ///
  /// In en, this message translates to:
  /// **'Default background color is theme cardColor, and\\ntheme cardColor is set to theme colorScheme surface. The\\ncolor cardColor is going to be deprecated in Flutter.'**
  String get materialShowcaseTypeCard2;

  /// No description provided for @materialShowcaseTypeCardShadow1.
  ///
  /// In en, this message translates to:
  /// **'Material type card, elevation 0, default tint and shadow'**
  String get materialShowcaseTypeCardShadow1;

  /// No description provided for @materialShowcaseTypeCardShadow2.
  ///
  /// In en, this message translates to:
  /// **'Material type card, elevation 1, default tint and shadow'**
  String get materialShowcaseTypeCardShadow2;

  /// No description provided for @materialShowcaseTypeCardShadow3.
  ///
  /// In en, this message translates to:
  /// **'Material type card, elevation 6, default tint and shadow'**
  String get materialShowcaseTypeCardShadow3;

  /// No description provided for @materialShowcaseTypeCardSurface.
  ///
  /// In en, this message translates to:
  /// **'Material type card, elevation 1,\\nassigned surfaceTint and no shadow'**
  String get materialShowcaseTypeCardSurface;

  /// No description provided for @materialShowcaseTypeCardSurface2.
  ///
  /// In en, this message translates to:
  /// **'Material type card, elevation 6,\\nassigned surfaceTint and no shadow'**
  String get materialShowcaseTypeCardSurface2;

  /// No description provided for @materialShowcaseTypeCardSurfaceShadow.
  ///
  /// In en, this message translates to:
  /// **'Material type card, elevation 1,\\nassigned surfaceTint and shadow'**
  String get materialShowcaseTypeCardSurfaceShadow;

  /// No description provided for @materialShowcaseTypeCardSurfaceShadow2.
  ///
  /// In en, this message translates to:
  /// **'Material type card, elevation 6,\\nassigned surfaceTint and shadow'**
  String get materialShowcaseTypeCardSurfaceShadow2;

  /// No description provided for @medium.
  ///
  /// In en, this message translates to:
  /// **'Medium'**
  String get medium;

  /// No description provided for @mem.
  ///
  /// In en, this message translates to:
  /// **'Mem'**
  String get mem;

  /// No description provided for @members.
  ///
  /// In en, this message translates to:
  /// **'Members'**
  String get members;

  /// No description provided for @menuAnchor.
  ///
  /// In en, this message translates to:
  /// **'MenuAnchor'**
  String get menuAnchor;

  /// No description provided for @menuAnchorDemo.
  ///
  /// In en, this message translates to:
  /// **'MenuAnchor Demo'**
  String get menuAnchorDemo;

  /// No description provided for @menuAnchorM3Text.
  ///
  /// In en, this message translates to:
  /// **'The new M3 MenuAnchor used on a Container as a context menu.'**
  String get menuAnchorM3Text;

  /// No description provided for @menuAnchorM3ctx.
  ///
  /// In en, this message translates to:
  /// **'The new M3 MenuAnchor is cool!'**
  String get menuAnchorM3ctx;

  /// No description provided for @menuAnchorM3ctxClick.
  ///
  /// In en, this message translates to:
  /// **'Click anywhere on this container to show the\\nMenuAnchor context menu.'**
  String get menuAnchorM3ctxClick;

  /// No description provided for @menuBar.
  ///
  /// In en, this message translates to:
  /// **'MenuBar'**
  String get menuBar;

  /// No description provided for @menuBarDemo.
  ///
  /// In en, this message translates to:
  /// **'MenuBar Demo'**
  String get menuBarDemo;

  /// No description provided for @menuBarM3.
  ///
  /// In en, this message translates to:
  /// **'The new M3 menus can be used in a MenuBar via SubMenuButton\\nand its MenuItemButton, but they can also be used in a\\nMenuAnchor anywhere.'**
  String get menuBarM3;

  /// No description provided for @menuKeyboardShortcuts.
  ///
  /// In en, this message translates to:
  /// **'Menu keyboard shortcuts also work.'**
  String get menuKeyboardShortcuts;

  /// No description provided for @mfaConnect.
  ///
  /// In en, this message translates to:
  /// **'Multi Factor Authentication Connection'**
  String get mfaConnect;

  /// No description provided for @minify.
  ///
  /// In en, this message translates to:
  /// **'Minify'**
  String get minify;

  /// No description provided for @missVerification.
  ///
  /// In en, this message translates to:
  /// **'Missing the verification code'**
  String get missVerification;

  /// No description provided for @month.
  ///
  /// In en, this message translates to:
  /// **'Month'**
  String get month;

  /// No description provided for @multiPathNetworking.
  ///
  /// In en, this message translates to:
  /// **'MultiPath Networking'**
  String get multiPathNetworking;

  /// No description provided for @name.
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get name;

  /// No description provided for @navBadgeText12.
  ///
  /// In en, this message translates to:
  /// **'12'**
  String get navBadgeText12;

  /// No description provided for @navBadgeText26.
  ///
  /// In en, this message translates to:
  /// **'26'**
  String get navBadgeText26;

  /// No description provided for @navBadgeText5.
  ///
  /// In en, this message translates to:
  /// **'5'**
  String get navBadgeText5;

  /// No description provided for @navigationBarM3.
  ///
  /// In en, this message translates to:
  /// **'NavigationBar (Material 3)'**
  String get navigationBarM3;

  /// No description provided for @navigationDrawer.
  ///
  /// In en, this message translates to:
  /// **'NavigationDrawer'**
  String get navigationDrawer;

  /// No description provided for @navigationRail.
  ///
  /// In en, this message translates to:
  /// **'NavigationRail'**
  String get navigationRail;

  /// No description provided for @networkInternet.
  ///
  /// In en, this message translates to:
  /// **'Network & internet'**
  String get networkInternet;

  /// No description provided for @networkInternetDescription.
  ///
  /// In en, this message translates to:
  /// **'Mobile, Wi-Fi, hotspot'**
  String get networkInternetDescription;

  /// No description provided for @newDialog.
  ///
  /// In en, this message translates to:
  /// **'New dialog'**
  String get newDialog;

  /// No description provided for @noData.
  ///
  /// In en, this message translates to:
  /// **'No data !'**
  String get noData;

  /// No description provided for @noDialogYet.
  ///
  /// In en, this message translates to:
  /// **'No dialogs yet'**
  String get noDialogYet;

  /// No description provided for @noNetwork.
  ///
  /// In en, this message translates to:
  /// **'No network'**
  String get noNetwork;

  /// No description provided for @normalTextTheme.
  ///
  /// In en, this message translates to:
  /// **'Normal TextTheme'**
  String get normalTextTheme;

  /// No description provided for @notImage.
  ///
  /// In en, this message translates to:
  /// **'This file is not an image'**
  String get notImage;

  /// No description provided for @nothingSend.
  ///
  /// In en, this message translates to:
  /// **'Nothing to send'**
  String get nothingSend;

  /// No description provided for @nothingToSave.
  ///
  /// In en, this message translates to:
  /// **'Nothing to save'**
  String get nothingToSave;

  /// No description provided for @notifications.
  ///
  /// In en, this message translates to:
  /// **'Notifications'**
  String get notifications;

  /// No description provided for @notificationsDescription.
  ///
  /// In en, this message translates to:
  /// **'Notification history, conversations'**
  String get notificationsDescription;

  /// No description provided for @notificationsDeviceApp.
  ///
  /// In en, this message translates to:
  /// **'Device & app notifications'**
  String get notificationsDeviceApp;

  /// No description provided for @notificationsDeviceAppDescription.
  ///
  /// In en, this message translates to:
  /// **'Control which apps and devices can read notifications'**
  String get notificationsDeviceAppDescription;

  /// No description provided for @notificationsDot.
  ///
  /// In en, this message translates to:
  /// **'Notification dot on app icon'**
  String get notificationsDot;

  /// No description provided for @notificationsEnable.
  ///
  /// In en, this message translates to:
  /// **'Enable notifications'**
  String get notificationsEnable;

  /// No description provided for @notificationsEnableDescription.
  ///
  /// In en, this message translates to:
  /// **'Get suggested actions, replies and more'**
  String get notificationsEnableDescription;

  /// No description provided for @notificationsHistory.
  ///
  /// In en, this message translates to:
  /// **'Notification history'**
  String get notificationsHistory;

  /// No description provided for @notificationsHistoryText.
  ///
  /// In en, this message translates to:
  /// **'Show recent and snoozed notifications'**
  String get notificationsHistoryText;

  /// No description provided for @notificationsLockScreen.
  ///
  /// In en, this message translates to:
  /// **'Notifications on lock screen'**
  String get notificationsLockScreen;

  /// No description provided for @notificationsLockScreenDescription.
  ///
  /// In en, this message translates to:
  /// **'Show conversations, default, and silent'**
  String get notificationsLockScreenDescription;

  /// No description provided for @notificationsSnoozing.
  ///
  /// In en, this message translates to:
  /// **'Allow notification snoozing'**
  String get notificationsSnoozing;

  /// No description provided for @nowSetTo.
  ///
  /// In en, this message translates to:
  /// **'Now set to '**
  String get nowSetTo;

  /// No description provided for @occupants.
  ///
  /// In en, this message translates to:
  /// **'tenants'**
  String get occupants;

  /// No description provided for @occupantsIds.
  ///
  /// In en, this message translates to:
  /// **'tenants_ids'**
  String get occupantsIds;

  /// No description provided for @ok.
  ///
  /// In en, this message translates to:
  /// **'Ok'**
  String get ok;

  /// No description provided for @open.
  ///
  /// In en, this message translates to:
  /// **'Open'**
  String get open;

  /// No description provided for @openDialog.
  ///
  /// In en, this message translates to:
  /// **'Open Dialog'**
  String get openDialog;

  /// No description provided for @openViaQr.
  ///
  /// In en, this message translates to:
  /// **'Open your authentication app and add this app via QR code or by pasting the code below.'**
  String get openViaQr;

  /// No description provided for @optionText.
  ///
  /// In en, this message translates to:
  /// **'Option'**
  String get optionText;

  /// No description provided for @or.
  ///
  /// In en, this message translates to:
  /// **'or'**
  String get or;

  /// No description provided for @organizationName.
  ///
  /// In en, this message translates to:
  /// **'Organization name'**
  String get organizationName;

  /// No description provided for @organizationNameNotEmpty.
  ///
  /// In en, this message translates to:
  /// **'Organization name must not be empty'**
  String get organizationNameNotEmpty;

  /// No description provided for @outlined.
  ///
  /// In en, this message translates to:
  /// **'Outlined'**
  String get outlined;

  /// No description provided for @outlinedButton.
  ///
  /// In en, this message translates to:
  /// **'Outlined button'**
  String get outlinedButton;

  /// No description provided for @outlinedDisabled.
  ///
  /// In en, this message translates to:
  /// **'Outlined (disabled)'**
  String get outlinedDisabled;

  /// No description provided for @outlinedIcon.
  ///
  /// In en, this message translates to:
  /// **'Outlined icon'**
  String get outlinedIcon;

  /// No description provided for @owner.
  ///
  /// In en, this message translates to:
  /// **'Owner'**
  String get owner;

  /// No description provided for @ownerContact.
  ///
  /// In en, this message translates to:
  /// **'owner contact'**
  String get ownerContact;

  /// No description provided for @ownerId.
  ///
  /// In en, this message translates to:
  /// **'Owner Id'**
  String get ownerId;

  /// No description provided for @ownerName.
  ///
  /// In en, this message translates to:
  /// **'Owner Name'**
  String get ownerName;

  /// No description provided for @ownerPhone.
  ///
  /// In en, this message translates to:
  /// **'Owner Phone'**
  String get ownerPhone;

  /// No description provided for @password.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get password;

  /// No description provided for @passwords.
  ///
  /// In en, this message translates to:
  /// **'Passwords'**
  String get passwords;

  /// No description provided for @paymentMethods.
  ///
  /// In en, this message translates to:
  /// **'Payment methods'**
  String get paymentMethods;

  /// No description provided for @percent.
  ///
  /// In en, this message translates to:
  /// **'%'**
  String get percent;

  /// No description provided for @persistence.
  ///
  /// In en, this message translates to:
  /// **'Persistence'**
  String get persistence;

  /// No description provided for @persistenceMemoryDescription.
  ///
  /// In en, this message translates to:
  /// **'You can use volatile memory or Shared\\nPreferences and Hive to persist the settings. You can\\ntoggle the used implementation dynamically in the app.'**
  String get persistenceMemoryDescription;

  /// No description provided for @phoneNumber.
  ///
  /// In en, this message translates to:
  /// **'Phone number'**
  String get phoneNumber;

  /// No description provided for @photo.
  ///
  /// In en, this message translates to:
  /// **'Photo'**
  String get photo;

  /// No description provided for @pickImage.
  ///
  /// In en, this message translates to:
  /// **'Pick Image'**
  String get pickImage;

  /// No description provided for @popupMenuButton.
  ///
  /// In en, this message translates to:
  /// **'PopupMenuButton'**
  String get popupMenuButton;

  /// No description provided for @prefs.
  ///
  /// In en, this message translates to:
  /// **'Prefs'**
  String get prefs;

  /// No description provided for @primaryTextTheme.
  ///
  /// In en, this message translates to:
  /// **'Primary TextTheme'**
  String get primaryTextTheme;

  /// No description provided for @privacy.
  ///
  /// In en, this message translates to:
  /// **'Privacy'**
  String get privacy;

  /// No description provided for @privacyDescription.
  ///
  /// In en, this message translates to:
  /// **'Trial features are on'**
  String get privacyDescription;

  /// No description provided for @privacySandBoxTitle.
  ///
  /// In en, this message translates to:
  /// **'Privacy Sandbox'**
  String get privacySandBoxTitle;

  /// No description provided for @privacySecTitle.
  ///
  /// In en, this message translates to:
  /// **'Privacy and security'**
  String get privacySecTitle;

  /// No description provided for @profile.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get profile;

  /// No description provided for @quit.
  ///
  /// In en, this message translates to:
  /// **'Quit'**
  String get quit;

  /// No description provided for @radioListTile.
  ///
  /// In en, this message translates to:
  /// **'RadioListTile'**
  String get radioListTile;

  /// No description provided for @radioListTileDisabled.
  ///
  /// In en, this message translates to:
  /// **'RadioListTile disabled'**
  String get radioListTileDisabled;

  /// No description provided for @radioOptionListSelected.
  ///
  /// In en, this message translates to:
  /// **'The radio option and list tile is selected'**
  String get radioOptionListSelected;

  /// No description provided for @radioOptionSelected.
  ///
  /// In en, this message translates to:
  /// **'The radio option is selected'**
  String get radioOptionSelected;

  /// No description provided for @radioOptionUnselected.
  ///
  /// In en, this message translates to:
  /// **'The radio option is unselected'**
  String get radioOptionUnselected;

  /// No description provided for @rangeSliderContinuous.
  ///
  /// In en, this message translates to:
  /// **'RangeSlider continuous'**
  String get rangeSliderContinuous;

  /// No description provided for @rangeSliderContinuousDisabled.
  ///
  /// In en, this message translates to:
  /// **'RangeSlider continuous disabled'**
  String get rangeSliderContinuousDisabled;

  /// No description provided for @rangeSliderStepped.
  ///
  /// In en, this message translates to:
  /// **'RangeSlider stepped'**
  String get rangeSliderStepped;

  /// No description provided for @rangeSliderSteppedDisabled.
  ///
  /// In en, this message translates to:
  /// **'RangeSlider stepped disabled'**
  String get rangeSliderSteppedDisabled;

  /// No description provided for @refresh.
  ///
  /// In en, this message translates to:
  /// **'Refresh'**
  String get refresh;

  /// No description provided for @register.
  ///
  /// In en, this message translates to:
  /// **'Register'**
  String get register;

  /// No description provided for @rentalDate.
  ///
  /// In en, this message translates to:
  /// **'rental date'**
  String get rentalDate;

  /// No description provided for @rentalDateStart.
  ///
  /// In en, this message translates to:
  /// **'rent start'**
  String get rentalDateStart;

  /// No description provided for @rentalDateStop.
  ///
  /// In en, this message translates to:
  /// **'return date'**
  String get rentalDateStop;

  /// No description provided for @replications.
  ///
  /// In en, this message translates to:
  /// **'Replications'**
  String get replications;

  /// No description provided for @required.
  ///
  /// In en, this message translates to:
  /// **'required'**
  String get required;

  /// No description provided for @reset.
  ///
  /// In en, this message translates to:
  /// **'Reset'**
  String get reset;

  /// No description provided for @resetAll.
  ///
  /// In en, this message translates to:
  /// **'Reset all'**
  String get resetAll;

  /// No description provided for @resetSettingsTitle.
  ///
  /// In en, this message translates to:
  /// **'Reset settings'**
  String get resetSettingsTitle;

  /// No description provided for @role.
  ///
  /// In en, this message translates to:
  /// **'Role'**
  String get role;

  /// No description provided for @save.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get save;

  /// No description provided for @saveNow.
  ///
  /// In en, this message translates to:
  /// **'Save now'**
  String get saveNow;

  /// No description provided for @scanWithApp.
  ///
  /// In en, this message translates to:
  /// **'Scan with your app'**
  String get scanWithApp;

  /// No description provided for @screenWidth.
  ///
  /// In en, this message translates to:
  /// **'Screen width'**
  String get screenWidth;

  /// No description provided for @search.
  ///
  /// In en, this message translates to:
  /// **'Search'**
  String get search;

  /// No description provided for @searchUsers.
  ///
  /// In en, this message translates to:
  /// **'Search Users'**
  String get searchUsers;

  /// No description provided for @secret.
  ///
  /// In en, this message translates to:
  /// **'Secret'**
  String get secret;

  /// No description provided for @securityDescription.
  ///
  /// In en, this message translates to:
  /// **'Screen lock, Find My Device, app security'**
  String get securityDescription;

  /// No description provided for @securitySafeBrowsingDescription.
  ///
  /// In en, this message translates to:
  /// **'Safe Browsing (protection from dangerous sites) and other security settings'**
  String get securitySafeBrowsingDescription;

  /// No description provided for @securityTitle.
  ///
  /// In en, this message translates to:
  /// **'Security'**
  String get securityTitle;

  /// No description provided for @selectDialog.
  ///
  /// In en, this message translates to:
  /// **'Select dialog'**
  String get selectDialog;

  /// No description provided for @selectUserGuess.
  ///
  /// In en, this message translates to:
  /// **'select a guess User'**
  String get selectUserGuess;

  /// No description provided for @settings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settings;

  /// No description provided for @show.
  ///
  /// In en, this message translates to:
  /// **'Show'**
  String get show;

  /// No description provided for @showMessage.
  ///
  /// In en, this message translates to:
  /// **'Show Message'**
  String get showMessage;

  /// No description provided for @showcase.
  ///
  /// In en, this message translates to:
  /// **'Showcase'**
  String get showcase;

  /// No description provided for @showcaseErrorText.
  ///
  /// In en, this message translates to:
  /// **'Any entry without an \'a\' will trigger this error'**
  String get showcaseErrorText;

  /// No description provided for @showcaseHintCollapseText.
  ///
  /// In en, this message translates to:
  /// **'Hint: Collapsed TextField...'**
  String get showcaseHintCollapseText;

  /// No description provided for @showcaseHintText.
  ///
  /// In en, this message translates to:
  /// **'Hint: Write something...'**
  String get showcaseHintText;

  /// No description provided for @showcaseLabelTextOutline.
  ///
  /// In en, this message translates to:
  /// **'Label: Outline border by default if not defined'**
  String get showcaseLabelTextOutline;

  /// No description provided for @showcaseLabelTextUnder.
  ///
  /// In en, this message translates to:
  /// **'Label: Underline border by default if not defined'**
  String get showcaseLabelTextUnder;

  /// No description provided for @showcaseListTileSelectedSubTitle.
  ///
  /// In en, this message translates to:
  /// **'Selected list tile sub title'**
  String get showcaseListTileSelectedSubTitle;

  /// No description provided for @showcaseListTileSelectedTitle.
  ///
  /// In en, this message translates to:
  /// **'ListTile selected'**
  String get showcaseListTileSelectedTitle;

  /// No description provided for @showcaseListTileSubTitle.
  ///
  /// In en, this message translates to:
  /// **'List tile sub title'**
  String get showcaseListTileSubTitle;

  /// No description provided for @showcaseListTileTitle.
  ///
  /// In en, this message translates to:
  /// **'ListTile'**
  String get showcaseListTileTitle;

  /// No description provided for @showcaseListTileTrailing.
  ///
  /// In en, this message translates to:
  /// **'Trailing'**
  String get showcaseListTileTrailing;

  /// No description provided for @showSecretManually.
  ///
  /// In en, this message translates to:
  /// **'Show Secret Manually'**
  String get showSecretManually;

  /// No description provided for @signInWithEmailPassword.
  ///
  /// In en, this message translates to:
  /// **'Sign In With Email and Password'**
  String get signInWithEmailPassword;

  /// No description provided for @signInWithGoogle.
  ///
  /// In en, this message translates to:
  /// **'Sign In With Google'**
  String get signInWithGoogle;

  /// No description provided for @signOut.
  ///
  /// In en, this message translates to:
  /// **'sign out'**
  String get signOut;

  /// No description provided for @siteSettingsDescription.
  ///
  /// In en, this message translates to:
  /// **'Controls what information sites can use and show (location, camera, pop-ups and more)'**
  String get siteSettingsDescription;

  /// No description provided for @siteSettingsTitle.
  ///
  /// In en, this message translates to:
  /// **'Site settings'**
  String get siteSettingsTitle;

  /// No description provided for @sliderContinuous.
  ///
  /// In en, this message translates to:
  /// **'Slider continuous'**
  String get sliderContinuous;

  /// No description provided for @sliderContinuousDisabled.
  ///
  /// In en, this message translates to:
  /// **'Slider continuous disabled'**
  String get sliderContinuousDisabled;

  /// No description provided for @sliderStepped.
  ///
  /// In en, this message translates to:
  /// **'Slider stepped'**
  String get sliderStepped;

  /// No description provided for @sliderSteppedDisabled.
  ///
  /// In en, this message translates to:
  /// **'Slider stepped disabled'**
  String get sliderSteppedDisabled;

  /// No description provided for @sliverAppBar.
  ///
  /// In en, this message translates to:
  /// **'SliverAppBar'**
  String get sliverAppBar;

  /// No description provided for @sliverAppBarLarge.
  ///
  /// In en, this message translates to:
  /// **'SliverAppBar.large'**
  String get sliverAppBarLarge;

  /// No description provided for @sliverAppBarMedium.
  ///
  /// In en, this message translates to:
  /// **'SliverAppBar.medium'**
  String get sliverAppBarMedium;

  /// No description provided for @small.
  ///
  /// In en, this message translates to:
  /// **'Small'**
  String get small;

  /// No description provided for @somethingWentWrong.
  ///
  /// In en, this message translates to:
  /// **'Something went wrong'**
  String get somethingWentWrong;

  /// No description provided for @soundVibrationDescription.
  ///
  /// In en, this message translates to:
  /// **'Volume, haptics, Do Not Disturb'**
  String get soundVibrationDescription;

  /// No description provided for @soundVibrationTitle.
  ///
  /// In en, this message translates to:
  /// **'Sound & vibration'**
  String get soundVibrationTitle;

  /// No description provided for @startDialog.
  ///
  /// In en, this message translates to:
  /// **'Start dialog'**
  String get startDialog;

  /// No description provided for @stateResSettings.
  ///
  /// In en, this message translates to:
  /// **'State restoration testing'**
  String get stateResSettings;

  /// No description provided for @storage.
  ///
  /// In en, this message translates to:
  /// **'Storage'**
  String get storage;

  /// No description provided for @storageDescription.
  ///
  /// In en, this message translates to:
  /// **'30% used - 5.60 GB free'**
  String get storageDescription;

  /// No description provided for @style.
  ///
  /// In en, this message translates to:
  /// **'Style'**
  String get style;

  /// No description provided for @submit.
  ///
  /// In en, this message translates to:
  /// **'Submit'**
  String get submit;

  /// No description provided for @success.
  ///
  /// In en, this message translates to:
  /// **'Success'**
  String get success;

  /// No description provided for @successSignedUp.
  ///
  /// In en, this message translates to:
  /// **'Successfully signed up'**
  String get successSignedUp;

  /// No description provided for @surfaceArea.
  ///
  /// In en, this message translates to:
  /// **'enter surface area'**
  String get surfaceArea;

  /// No description provided for @surveillance.
  ///
  /// In en, this message translates to:
  /// **'Monitoring'**
  String get surveillance;

  /// No description provided for @swapColors.
  ///
  /// In en, this message translates to:
  /// **'Swap colors'**
  String get swapColors;

  /// No description provided for @swapPrimarySecondaryDarkColors.
  ///
  /// In en, this message translates to:
  /// **'Swap primary and secondary dark colors'**
  String get swapPrimarySecondaryDarkColors;

  /// No description provided for @swapPrimarySecondaryLightColors.
  ///
  /// In en, this message translates to:
  /// **'Swap primary and secondary light colors'**
  String get swapPrimarySecondaryLightColors;

  /// No description provided for @switchHave.
  ///
  /// In en, this message translates to:
  /// **'Already Have one? Sign In'**
  String get switchHave;

  /// No description provided for @switchHavent.
  ///
  /// In en, this message translates to:
  /// **'Don\'t have account? Sign Up'**
  String get switchHavent;

  /// No description provided for @switchListTileSubTitleOff.
  ///
  /// In en, this message translates to:
  /// **'The switch list tile is OFF'**
  String get switchListTileSubTitleOff;

  /// No description provided for @switchListTileSubTitleOn.
  ///
  /// In en, this message translates to:
  /// **'The switch list tile is ON'**
  String get switchListTileSubTitleOn;

  /// No description provided for @switchListTileTitle.
  ///
  /// In en, this message translates to:
  /// **'SwitchListTile'**
  String get switchListTileTitle;

  /// No description provided for @switchListTileTitleDisabled.
  ///
  /// In en, this message translates to:
  /// **'SwitchListTile disabled'**
  String get switchListTileTitleDisabled;

  /// No description provided for @switchNoStatusBar.
  ///
  /// In en, this message translates to:
  /// **'Only affects Android top status bar'**
  String get switchNoStatusBar;

  /// No description provided for @tabBadgeLabel18.
  ///
  /// In en, this message translates to:
  /// **'18'**
  String get tabBadgeLabel18;

  /// No description provided for @tabBadgeLabel3.
  ///
  /// In en, this message translates to:
  /// **'3'**
  String get tabBadgeLabel3;

  /// No description provided for @tabBadgeLabel99.
  ///
  /// In en, this message translates to:
  /// **'99'**
  String get tabBadgeLabel99;

  /// No description provided for @tabBarAppBar.
  ///
  /// In en, this message translates to:
  /// **'TabBar in an AppBar'**
  String get tabBarAppBar;

  /// No description provided for @tabBarIfAppBar.
  ///
  /// In en, this message translates to:
  /// **'If the TabBar will always be used in an AppBar, then use\\nstyle FlexTabBarStyle forAppBar (default),\\nit will fit contrast wise here'**
  String get tabBarIfAppBar;

  /// No description provided for @tabBarIfSurface.
  ///
  /// In en, this message translates to:
  /// **'If the TabBar will always be used on background and surface\\ncolors, then use style FlexTabBarStyle forBackground,\\nit will fit contrast wise here'**
  String get tabBarIfSurface;

  /// No description provided for @tabBarSurface.
  ///
  /// In en, this message translates to:
  /// **'TabBar in an Surface'**
  String get tabBarSurface;

  /// No description provided for @tabFolder.
  ///
  /// In en, this message translates to:
  /// **'Folder'**
  String get tabFolder;

  /// No description provided for @tenantId.
  ///
  /// In en, this message translates to:
  /// **'Tenant ID'**
  String get tenantId;

  /// No description provided for @termsOfService.
  ///
  /// In en, this message translates to:
  /// **'Terms of Service | Privacy Policy'**
  String get termsOfService;

  /// No description provided for @textIcon.
  ///
  /// In en, this message translates to:
  /// **'Text icon'**
  String get textIcon;

  /// No description provided for @theme.
  ///
  /// In en, this message translates to:
  /// **'Theme'**
  String get theme;

  /// No description provided for @themeColors.
  ///
  /// In en, this message translates to:
  /// **'Theme Colors'**
  String get themeColors;

  /// No description provided for @themeDataColors.
  ///
  /// In en, this message translates to:
  /// **'ThemeData Colors'**
  String get themeDataColors;

  /// No description provided for @themeModeTitle.
  ///
  /// In en, this message translates to:
  /// **'Theme mode'**
  String get themeModeTitle;

  /// No description provided for @themeSettings.
  ///
  /// In en, this message translates to:
  /// **'Theme Settings'**
  String get themeSettings;

  /// No description provided for @themeShowcase.
  ///
  /// In en, this message translates to:
  /// **'Theme Showcase'**
  String get themeShowcase;

  /// No description provided for @themeShowcaseText.
  ///
  /// In en, this message translates to:
  /// **'Shows theme colors and the FlexColorScheme based theme\\napplied on common widgets.\\nIt also has a NavigationBar and TabBar in the AppBar,\\nto show what they look like, but they don\'t do anything.'**
  String get themeShowcaseText;

  /// No description provided for @timePickerDialog.
  ///
  /// In en, this message translates to:
  /// **'TimePickerDialog'**
  String get timePickerDialog;

  /// No description provided for @title.
  ///
  /// In en, this message translates to:
  /// **'Title'**
  String get title;

  /// No description provided for @toYourEmailAddress.
  ///
  /// In en, this message translates to:
  /// **'to your email address'**
  String get toYourEmailAddress;

  /// No description provided for @token.
  ///
  /// In en, this message translates to:
  /// **'token'**
  String get token;

  /// No description provided for @tooHigh.
  ///
  /// In en, this message translates to:
  /// **'\\nTOO HIGH'**
  String get tooHigh;

  /// No description provided for @tooltipCA.
  ///
  /// In en, this message translates to:
  /// **'CA'**
  String get tooltipCA;

  /// No description provided for @tooltipCircleAvatar.
  ///
  /// In en, this message translates to:
  /// **'This is a\\nCircleAvatar'**
  String get tooltipCircleAvatar;

  /// No description provided for @tooltipIcon.
  ///
  /// In en, this message translates to:
  /// **'This is\\nan Icon'**
  String get tooltipIcon;

  /// No description provided for @tooltipIconButton.
  ///
  /// In en, this message translates to:
  /// **'This is an\\nIconButton'**
  String get tooltipIconButton;

  /// No description provided for @tooltipIconComment.
  ///
  /// In en, this message translates to:
  /// **'Comment Icon'**
  String get tooltipIconComment;

  /// No description provided for @tooltipIconMenu.
  ///
  /// In en, this message translates to:
  /// **'Menu Icon'**
  String get tooltipIconMenu;

  /// No description provided for @tooltipIconSettings.
  ///
  /// In en, this message translates to:
  /// **'Settings Icon'**
  String get tooltipIconSettings;

  /// No description provided for @tooltipMessageLevelSurfaces.
  ///
  /// In en, this message translates to:
  /// **'Level surfaces\\nlow scaffold'**
  String get tooltipMessageLevelSurfaces;

  /// No description provided for @tooltipMessageScaffold.
  ///
  /// In en, this message translates to:
  /// **'High scaffold\\nlow surface'**
  String get tooltipMessageScaffold;

  /// No description provided for @tooltipMessageSurface.
  ///
  /// In en, this message translates to:
  /// **'High surface\\nlow scaffold'**
  String get tooltipMessageSurface;

  /// No description provided for @tooltipMessageTertiaryContainerDialog.
  ///
  /// In en, this message translates to:
  /// **'Tertiary container dialog\\nlow scaffold'**
  String get tooltipMessageTertiaryContainerDialog;

  /// No description provided for @tooltipOpenNavigationMenu.
  ///
  /// In en, this message translates to:
  /// **'Open navigation menu'**
  String get tooltipOpenNavigationMenu;

  /// No description provided for @tooltipShowcaseMessage1.
  ///
  /// In en, this message translates to:
  /// **'Current tooltip theme'**
  String get tooltipShowcaseMessage1;

  /// No description provided for @tooltipShowcaseMessage2.
  ///
  /// In en, this message translates to:
  /// **'Current tooltip theme.\\nThis a two row tooltip.'**
  String get tooltipShowcaseMessage2;

  /// No description provided for @tooltipShowcaseMessage3.
  ///
  /// In en, this message translates to:
  /// **'Current tooltip theme.\\nThis tooltip is too long.\\nTry to keep them short.'**
  String get tooltipShowcaseMessage3;

  /// No description provided for @tooltipShowcaseText1.
  ///
  /// In en, this message translates to:
  /// **'Text with tooltip'**
  String get tooltipShowcaseText1;

  /// No description provided for @tooltipShowcaseText2.
  ///
  /// In en, this message translates to:
  /// **'Text with two row tooltip'**
  String get tooltipShowcaseText2;

  /// No description provided for @tooltipShowcaseText3.
  ///
  /// In en, this message translates to:
  /// **'Text with three row tooltip'**
  String get tooltipShowcaseText3;

  /// No description provided for @tooltipStandard.
  ///
  /// In en, this message translates to:
  /// **'Standard'**
  String get tooltipStandard;

  /// No description provided for @tooltipStandardDisabled.
  ///
  /// In en, this message translates to:
  /// **'Standard (disabled)'**
  String get tooltipStandardDisabled;

  /// No description provided for @uiAutomationEnable.
  ///
  /// In en, this message translates to:
  /// **'Enable UI Automation'**
  String get uiAutomationEnable;

  /// No description provided for @uiAutomationTitle.
  ///
  /// In en, this message translates to:
  /// **'UI Automation'**
  String get uiAutomationTitle;

  /// No description provided for @ukctbTooltipMessP.
  ///
  /// In en, this message translates to:
  /// **'Use light theme Primary color\\nas key color to seed your ColorScheme'**
  String get ukctbTooltipMessP;

  /// No description provided for @ukctbTooltipMessS.
  ///
  /// In en, this message translates to:
  /// **'Use light theme Secondary color\\nas key color to seed your ColorScheme'**
  String get ukctbTooltipMessS;

  /// No description provided for @ukctbTooltipMessT.
  ///
  /// In en, this message translates to:
  /// **'Use light theme Tertiary color\\nas key color to seed your ColorScheme'**
  String get ukctbTooltipMessT;

  /// No description provided for @unAvailable.
  ///
  /// In en, this message translates to:
  /// **'Unavailable'**
  String get unAvailable;

  /// No description provided for @unEnroll.
  ///
  /// In en, this message translates to:
  /// **'Unenroll MFA'**
  String get unEnroll;

  /// No description provided for @underline.
  ///
  /// In en, this message translates to:
  /// **'Underline'**
  String get underline;

  /// No description provided for @unlimitedAdPresentation.
  ///
  /// In en, this message translates to:
  /// **'Unlimited Ad Presentation\''**
  String get unlimitedAdPresentation;

  /// No description provided for @update.
  ///
  /// In en, this message translates to:
  /// **'Update'**
  String get update;

  /// No description provided for @updateAddress.
  ///
  /// In en, this message translates to:
  /// **'update address'**
  String get updateAddress;

  /// No description provided for @updateContact.
  ///
  /// In en, this message translates to:
  /// **'Update Contact'**
  String get updateContact;

  /// No description provided for @updateDialog.
  ///
  /// In en, this message translates to:
  /// **'Update Dialog'**
  String get updateDialog;

  /// No description provided for @updateImage.
  ///
  /// In en, this message translates to:
  /// **'Update Image'**
  String get updateImage;

  /// No description provided for @updateOwner.
  ///
  /// In en, this message translates to:
  /// **'update owner'**
  String get updateOwner;

  /// No description provided for @updateProfile.
  ///
  /// In en, this message translates to:
  /// **'Update Profile'**
  String get updateProfile;

  /// No description provided for @useLevelZero.
  ///
  /// In en, this message translates to:
  /// **'. With seeded ColorScheme, for a pure M3 surface design, use level 0'**
  String get useLevelZero;

  /// No description provided for @useLightThemeColors.
  ///
  /// In en, this message translates to:
  /// **'Use light theme colors to seed the ColorScheme'**
  String get useLightThemeColors;

  /// No description provided for @useMaterial3Title.
  ///
  /// In en, this message translates to:
  /// **'Use Material 3'**
  String get useMaterial3Title;

  /// No description provided for @useSeedSubTitle.
  ///
  /// In en, this message translates to:
  /// **'Use FlexTones to configure which tone from\\ngenerated palettes each color in the ColorScheme use.\\nSet limits on used CAM16 chroma values\\nfor the three colors used as keys for primary,\\nsecondary and tertiary TonalPalettes.\\nIn this app you can choose between the default Material 3\\ntone mapping plus six pre-defined custom FlexTones setups.'**
  String get useSeedSubTitle;

  /// No description provided for @useSubThemesSubTitle.
  ///
  /// In en, this message translates to:
  /// **'Enable FlexColorScheme opinionated sub themes'**
  String get useSubThemesSubTitle;

  /// No description provided for @useSubThemesTitle.
  ///
  /// In en, this message translates to:
  /// **'Use component themes'**
  String get useSubThemesTitle;

  /// No description provided for @useThemesSubTitle.
  ///
  /// In en, this message translates to:
  /// **'Default setting uses mostly Material 3 design\\nvalues, where radius spec varies per component.\\nMaterial 2 design uses 4 on all components.'**
  String get useThemesSubTitle;

  /// No description provided for @useThemesTitle.
  ///
  /// In en, this message translates to:
  /// **'Global border radius on components'**
  String get useThemesTitle;

  /// No description provided for @useTrueBlack.
  ///
  /// In en, this message translates to:
  /// **'Use true black'**
  String get useTrueBlack;

  /// No description provided for @usedPlatformMechanics.
  ///
  /// In en, this message translates to:
  /// **'Used platform mechanics'**
  String get usedPlatformMechanics;

  /// No description provided for @userAnonymous.
  ///
  /// In en, this message translates to:
  /// **'User is anonymous'**
  String get userAnonymous;

  /// No description provided for @userFirstName.
  ///
  /// In en, this message translates to:
  /// **'User First Name'**
  String get userFirstName;

  /// No description provided for @userId.
  ///
  /// In en, this message translates to:
  /// **'UserId'**
  String get userId;

  /// No description provided for @userInfo.
  ///
  /// In en, this message translates to:
  /// **'User info'**
  String get userInfo;

  /// No description provided for @userName.
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get userName;

  /// No description provided for @userNotFound.
  ///
  /// In en, this message translates to:
  /// **'Couldn\'t find user'**
  String get userNotFound;

  /// No description provided for @validateMfa.
  ///
  /// In en, this message translates to:
  /// **'Validate MFA'**
  String get validateMfa;

  /// No description provided for @valueFive.
  ///
  /// In en, this message translates to:
  /// **'five'**
  String get valueFive;

  /// No description provided for @valueFour.
  ///
  /// In en, this message translates to:
  /// **'four'**
  String get valueFour;

  /// No description provided for @valueOne.
  ///
  /// In en, this message translates to:
  /// **'one'**
  String get valueOne;

  /// No description provided for @valueThree.
  ///
  /// In en, this message translates to:
  /// **'three'**
  String get valueThree;

  /// No description provided for @valueTwo.
  ///
  /// In en, this message translates to:
  /// **'two'**
  String get valueTwo;

  /// No description provided for @verification.
  ///
  /// In en, this message translates to:
  /// **'Verification'**
  String get verification;

  /// No description provided for @verificationCode.
  ///
  /// In en, this message translates to:
  /// **'Verification code'**
  String get verificationCode;

  /// No description provided for @verificationCodeSent.
  ///
  /// In en, this message translates to:
  /// **'Enter the verification code sent'**
  String get verificationCodeSent;

  /// No description provided for @verified.
  ///
  /// In en, this message translates to:
  /// **'verified'**
  String get verified;

  /// No description provided for @verify.
  ///
  /// In en, this message translates to:
  /// **'Verify'**
  String get verify;

  /// No description provided for @viewDescription.
  ///
  /// In en, this message translates to:
  /// **'Choose a view for iPhone.\\nZoomed shadows larger controls.\\nStandard shows more content.'**
  String get viewDescription;

  /// No description provided for @viewTitle.
  ///
  /// In en, this message translates to:
  /// **'View'**
  String get viewTitle;

  /// No description provided for @volume.
  ///
  /// In en, this message translates to:
  /// **'Volume'**
  String get volume;

  /// No description provided for @wallpaperStyleDescription.
  ///
  /// In en, this message translates to:
  /// **'Colors, themed icons, app grid'**
  String get wallpaperStyleDescription;

  /// No description provided for @wallpaperStyleTitle.
  ///
  /// In en, this message translates to:
  /// **'Wallpaper & style'**
  String get wallpaperStyleTitle;

  /// No description provided for @waterDamage.
  ///
  /// In en, this message translates to:
  /// **'Water damage'**
  String get waterDamage;

  /// No description provided for @webSettingsTitle.
  ///
  /// In en, this message translates to:
  /// **'Web Settings'**
  String get webSettingsTitle;

  /// No description provided for @week.
  ///
  /// In en, this message translates to:
  /// **'Week'**
  String get week;

  /// No description provided for @welcome.
  ///
  /// In en, this message translates to:
  /// **'WelCome'**
  String get welcome;

  /// No description provided for @welcomeBack.
  ///
  /// In en, this message translates to:
  /// **'WelCome Back'**
  String get welcomeBack;

  /// No description provided for @wirelessAlert.
  ///
  /// In en, this message translates to:
  /// **'Wireless emergency alerts'**
  String get wirelessAlert;

  /// No description provided for @woodCabin.
  ///
  /// In en, this message translates to:
  /// **'Wood cabin'**
  String get woodCabin;

  /// No description provided for @year.
  ///
  /// In en, this message translates to:
  /// **'Year'**
  String get year;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en', 'es', 'fr'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en': return AppLocalizationsEn();
    case 'es': return AppLocalizationsEs();
    case 'fr': return AppLocalizationsFr();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
