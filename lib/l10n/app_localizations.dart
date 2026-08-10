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
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

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
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('es'),
    Locale('fr'),
  ];

  /// No description provided for @aFixedSnackBar.
  ///
  /// In fr, this message translates to:
  /// **'Un SnackBar fixe'**
  String get aFixedSnackBar;

  /// No description provided for @aFloatingSnackBar.
  ///
  /// In fr, this message translates to:
  /// **'Un snack-bar flottant'**
  String get aFloatingSnackBar;

  /// No description provided for @about.
  ///
  /// In fr, this message translates to:
  /// **'À propos'**
  String get about;

  /// No description provided for @absent.
  ///
  /// In fr, this message translates to:
  /// **'Absent'**
  String get absent;

  /// No description provided for @abstractSettingsDescription.
  ///
  /// In fr, this message translates to:
  /// **'Création d\'une interface utilisateur pour montrer les possibilités du plugin'**
  String get abstractSettingsDescription;

  /// No description provided for @abstractSettingsTitle.
  ///
  /// In fr, this message translates to:
  /// **'Écran des paramètres abstraits'**
  String get abstractSettingsTitle;

  /// No description provided for @accessibilityDescription.
  ///
  /// In fr, this message translates to:
  /// **'Affichage, interaction, audio'**
  String get accessibilityDescription;

  /// No description provided for @accessibilityTitle.
  ///
  /// In fr, this message translates to:
  /// **'Accessibilité'**
  String get accessibilityTitle;

  /// No description provided for @addDevis.
  ///
  /// In fr, this message translates to:
  /// **'Ajouter un devis'**
  String get addDevis;

  /// No description provided for @addRefreshTitle.
  ///
  /// In fr, this message translates to:
  /// **'Ajouter le taux de rafraîchissement'**
  String get addRefreshTitle;

  /// No description provided for @address.
  ///
  /// In fr, this message translates to:
  /// **'Adresse'**
  String get address;

  /// No description provided for @addressCity.
  ///
  /// In fr, this message translates to:
  /// **'Nom de la ville'**
  String get addressCity;

  /// No description provided for @addressDescription.
  ///
  /// In fr, this message translates to:
  /// **'Inclure des informations telles que les numéros de téléphone, les adresses électroniques et les adresses de livraison.'**
  String get addressDescription;

  /// No description provided for @addressDocking.
  ///
  /// In fr, this message translates to:
  /// **'Adresser a\'amarrage'**
  String get addressDocking;

  /// No description provided for @addressId.
  ///
  /// In fr, this message translates to:
  /// **'Identité de l\'adresse'**
  String get addressId;

  /// No description provided for @addressMore.
  ///
  /// In fr, this message translates to:
  /// **'Adresses et autres'**
  String get addressMore;

  /// No description provided for @addressTitle.
  ///
  /// In fr, this message translates to:
  /// **'Enregistrer et remplir les adresses'**
  String get addressTitle;

  /// No description provided for @addressZipCode.
  ///
  /// In fr, this message translates to:
  /// **'Code postal'**
  String get addressZipCode;

  /// No description provided for @addressesNameTitle.
  ///
  /// In fr, this message translates to:
  /// **'Nom, adresses'**
  String get addressesNameTitle;

  /// No description provided for @addressesTitle.
  ///
  /// In fr, this message translates to:
  /// **'Adresses'**
  String get addressesTitle;

  /// No description provided for @alarm.
  ///
  /// In fr, this message translates to:
  /// **'Alarme'**
  String get alarm;

  /// No description provided for @alertDialog.
  ///
  /// In fr, this message translates to:
  /// **'Dialogue d\'alerte'**
  String get alertDialog;

  /// No description provided for @alertDialogContent.
  ///
  /// In fr, this message translates to:
  /// **'Les paramètres du thème reviennent à leurs valeurs par défaut ? Les paramètres du thème persistants seront également mis à jour aux valeurs par défaut.'**
  String get alertDialogContent;

  /// No description provided for @all.
  ///
  /// In fr, this message translates to:
  /// **'Tous'**
  String get all;

  /// No description provided for @allow.
  ///
  /// In fr, this message translates to:
  /// **'Autoriser'**
  String get allow;

  /// No description provided for @allowLocServ.
  ///
  /// In fr, this message translates to:
  /// **'Autoriser les services de localisation'**
  String get allowLocServ;

  /// No description provided for @allowLocServText.
  ///
  /// In fr, this message translates to:
  /// **'Laissez-nous vous aider à déterminer votre position. Cela signifie que vous nous envoyez des données de localisation anonymes.'**
  String get allowLocServText;

  /// No description provided for @alreadyHave.
  ///
  /// In fr, this message translates to:
  /// **'J\'ai déjà un compte'**
  String get alreadyHave;

  /// No description provided for @androidSettingsTitle.
  ///
  /// In fr, this message translates to:
  /// **'Écran des paramètres Android'**
  String get androidSettingsTitle;

  /// No description provided for @appBar.
  ///
  /// In fr, this message translates to:
  /// **'Barre d\'application'**
  String get appBar;

  /// No description provided for @appBarElevation.
  ///
  /// In fr, this message translates to:
  /// **'élévation de la barre d\'application'**
  String get appBarElevation;

  /// No description provided for @appSettings.
  ///
  /// In fr, this message translates to:
  /// **'Paramètres de l\'application'**
  String get appSettings;

  /// No description provided for @appearanceTitle.
  ///
  /// In fr, this message translates to:
  /// **'APPARENCE'**
  String get appearanceTitle;

  /// No description provided for @appearanceTitleDark.
  ///
  /// In fr, this message translates to:
  /// **'Apparence sombre'**
  String get appearanceTitleDark;

  /// No description provided for @appsDescription.
  ///
  /// In fr, this message translates to:
  /// **'Assistant, applications récentes, applications par défaut'**
  String get appsDescription;

  /// No description provided for @appsTitle.
  ///
  /// In fr, this message translates to:
  /// **'Applications'**
  String get appsTitle;

  /// No description provided for @attachment.
  ///
  /// In fr, this message translates to:
  /// **'Pièce jointe'**
  String get attachment;

  /// No description provided for @auth.
  ///
  /// In fr, this message translates to:
  /// **'Auth'**
  String get auth;

  /// No description provided for @autoFillTitle.
  ///
  /// In fr, this message translates to:
  /// **'Remplissage automatique'**
  String get autoFillTitle;

  /// No description provided for @available.
  ///
  /// In fr, this message translates to:
  /// **'Disponible'**
  String get available;

  /// No description provided for @avisPage.
  ///
  /// In fr, this message translates to:
  /// **'Page d\'Avis'**
  String get avisPage;

  /// No description provided for @batteryDescription.
  ///
  /// In fr, this message translates to:
  /// **'100%'**
  String get batteryDescription;

  /// No description provided for @batteryTitle.
  ///
  /// In fr, this message translates to:
  /// **'Batterie'**
  String get batteryTitle;

  /// No description provided for @behindAppBar.
  ///
  /// In fr, this message translates to:
  /// **'Derrière l\'AppBar'**
  String get behindAppBar;

  /// No description provided for @behindBottom.
  ///
  /// In fr, this message translates to:
  /// **'Derrière le fond'**
  String get behindBottom;

  /// No description provided for @behindNavBar.
  ///
  /// In fr, this message translates to:
  /// **'Derrière la NavBar'**
  String get behindNavBar;

  /// No description provided for @blendLevelLongText.
  ///
  /// In fr, this message translates to:
  /// **'Niveau de mélange Surface 1x Arrière-plan 1x Échafaudage 1x Échafaudage'**
  String get blendLevelLongText;

  /// No description provided for @blendLevelShortText.
  ///
  /// In fr, this message translates to:
  /// **'Tous les plats sont au même niveau'**
  String get blendLevelShortText;

  /// No description provided for @body.
  ///
  /// In fr, this message translates to:
  /// **'Corps'**
  String get body;

  /// No description provided for @bold.
  ///
  /// In fr, this message translates to:
  /// **'Gras'**
  String get bold;

  /// No description provided for @bottomAppBar.
  ///
  /// In fr, this message translates to:
  /// **'Barre d\'application inférieure'**
  String get bottomAppBar;

  /// No description provided for @bottomNavigationBar.
  ///
  /// In fr, this message translates to:
  /// **'Barre de navigation inférieure (Material 2)'**
  String get bottomNavigationBar;

  /// No description provided for @bubbles.
  ///
  /// In fr, this message translates to:
  /// **'Bulles'**
  String get bubbles;

  /// No description provided for @bubblesActive.
  ///
  /// In fr, this message translates to:
  /// **'On / Les conservations peuvent apparaître sous forme d\'icônes flottantes'**
  String get bubblesActive;

  /// No description provided for @byEmail.
  ///
  /// In fr, this message translates to:
  /// **'Par courrier électronique'**
  String get byEmail;

  /// No description provided for @byFacebook.
  ///
  /// In fr, this message translates to:
  /// **'Par Facebook'**
  String get byFacebook;

  /// No description provided for @byLogin.
  ///
  /// In fr, this message translates to:
  /// **'Par Login'**
  String get byLogin;

  /// No description provided for @byPhone.
  ///
  /// In fr, this message translates to:
  /// **'Par numéro de téléphone'**
  String get byPhone;

  /// No description provided for @canBeBlank.
  ///
  /// In fr, this message translates to:
  /// **'Le commentaire ne peut pas être vide'**
  String get canBeBlank;

  /// No description provided for @cancel.
  ///
  /// In fr, this message translates to:
  /// **'Annuler'**
  String get cancel;

  /// No description provided for @cardShowcaseElevate10Text1.
  ///
  /// In fr, this message translates to:
  /// **'Carte, élévation 10, surface par défaut Teinte et ombre'**
  String get cardShowcaseElevate10Text1;

  /// No description provided for @cardShowcaseElevate10Text2.
  ///
  /// In fr, this message translates to:
  /// **'Carte, élévation 10, surface par défaut Teinte et ombre par défaut'**
  String get cardShowcaseElevate10Text2;

  /// No description provided for @cardShowcaseElevate10Text3.
  ///
  /// In fr, this message translates to:
  /// **'Carte, élévation 10, surface par défaut Teinte et ombre transparente'**
  String get cardShowcaseElevate10Text3;

  /// No description provided for @cardShowcaseElevate1Text1.
  ///
  /// In fr, this message translates to:
  /// **'Carte, élévation 1, surface par défaut Teinte et ombre'**
  String get cardShowcaseElevate1Text1;

  /// No description provided for @cardShowcaseElevate1Text2.
  ///
  /// In fr, this message translates to:
  /// **'Carte, élévation 1, surface attribuée Teinte et ombre par défaut'**
  String get cardShowcaseElevate1Text2;

  /// No description provided for @cardShowcaseElevate1Text3.
  ///
  /// In fr, this message translates to:
  /// **'Carte, élévation 1, surface attribuée Teinte et ombre transparente'**
  String get cardShowcaseElevate1Text3;

  /// No description provided for @cardShowcaseElevate4Text1.
  ///
  /// In fr, this message translates to:
  /// **'Carte, élévation 4, surface par défaut Teinte et ombre'**
  String get cardShowcaseElevate4Text1;

  /// No description provided for @cardShowcaseElevate4Text2.
  ///
  /// In fr, this message translates to:
  /// **'Carte, élévation 4, surface par défaut Teinte et ombre par défaut'**
  String get cardShowcaseElevate4Text2;

  /// No description provided for @cardShowcaseElevate4Text3.
  ///
  /// In fr, this message translates to:
  /// **'Carte, élévation 4, surface par défaut Teinte et ombre transparente'**
  String get cardShowcaseElevate4Text3;

  /// No description provided for @cardShowcaseText.
  ///
  /// In fr, this message translates to:
  /// **'La couleur d\'arrière-plan par défaut provient du matériau de type card qui, par défaut, est défini sur le thème colorScheme surface. Lorsque useMaterial3 est vrai, Card obtient une teinte de surface basée sur l\'élévation. Lorsqu\'elle est fausse, la teinte de surface n\'a aucun effet, même si elle est spécifiée.'**
  String get cardShowcaseText;

  /// No description provided for @cardShowcaseText1.
  ///
  /// In fr, this message translates to:
  /// **'Carte, élévation 0, surface attribuée Teinte et ombre par défaut'**
  String get cardShowcaseText1;

  /// No description provided for @changeEmail.
  ///
  /// In fr, this message translates to:
  /// **'Modifier l\'adresse électronique'**
  String get changeEmail;

  /// No description provided for @changeGroupName.
  ///
  /// In fr, this message translates to:
  /// **'Modifier le nom du groupe'**
  String get changeGroupName;

  /// No description provided for @changeLogin.
  ///
  /// In fr, this message translates to:
  /// **'Modifier le login'**
  String get changeLogin;

  /// No description provided for @changeName.
  ///
  /// In fr, this message translates to:
  /// **'Modifier le nom'**
  String get changeName;

  /// No description provided for @changePassword.
  ///
  /// In fr, this message translates to:
  /// **'Modifier le votre mot de pass'**
  String get changePassword;

  /// No description provided for @charSet4.
  ///
  /// In fr, this message translates to:
  /// **'Saisir plus de 4 caractères'**
  String get charSet4;

  /// No description provided for @chatSettings.
  ///
  /// In fr, this message translates to:
  /// **'Paramètres du chat'**
  String get chatSettings;

  /// No description provided for @checkInbox.
  ///
  /// In fr, this message translates to:
  /// **'Vérifiez votre boîte de réception'**
  String get checkInbox;

  /// No description provided for @checkboxListTileChecked.
  ///
  /// In fr, this message translates to:
  /// **'La Liste des cases à cocher est cochée'**
  String get checkboxListTileChecked;

  /// No description provided for @checkboxListTileTitle.
  ///
  /// In fr, this message translates to:
  /// **'Liste de cases à cocher'**
  String get checkboxListTileTitle;

  /// No description provided for @checkboxListTileTitleDisabled.
  ///
  /// In fr, this message translates to:
  /// **'Liste de cases à cocher désactivé'**
  String get checkboxListTileTitleDisabled;

  /// No description provided for @checkboxListTileTristate.
  ///
  /// In fr, this message translates to:
  /// **'Liste de cases à cocher peut avoir une valeur vrai'**
  String get checkboxListTileTristate;

  /// No description provided for @checkboxListTileUnchecked.
  ///
  /// In fr, this message translates to:
  /// **'La liste des cases à cocher n\'est pas cochée'**
  String get checkboxListTileUnchecked;

  /// No description provided for @circleAvatarAbrev.
  ///
  /// In fr, this message translates to:
  /// **'AV'**
  String get circleAvatarAbrev;

  /// No description provided for @clearBrowsingDescription.
  ///
  /// In fr, this message translates to:
  /// **'Effacer l\'historique, les cookies, le cache et plus encore'**
  String get clearBrowsingDescription;

  /// No description provided for @clearBrowsingTitle.
  ///
  /// In fr, this message translates to:
  /// **'Effacer les données de navigation'**
  String get clearBrowsingTitle;

  /// No description provided for @close.
  ///
  /// In fr, this message translates to:
  /// **'Fermer'**
  String get close;

  /// No description provided for @codeResent.
  ///
  /// In fr, this message translates to:
  /// **'Renvoi du code'**
  String get codeResent;

  /// No description provided for @color.
  ///
  /// In fr, this message translates to:
  /// **'Couleur'**
  String get color;

  /// No description provided for @colorBlue.
  ///
  /// In fr, this message translates to:
  /// **'Bleu'**
  String get colorBlue;

  /// No description provided for @colorDark.
  ///
  /// In fr, this message translates to:
  /// **'Sombre'**
  String get colorDark;

  /// No description provided for @colorGreen.
  ///
  /// In fr, this message translates to:
  /// **'Vert'**
  String get colorGreen;

  /// No description provided for @colorGrey.
  ///
  /// In fr, this message translates to:
  /// **'Gris'**
  String get colorGrey;

  /// No description provided for @colorOrange.
  ///
  /// In fr, this message translates to:
  /// **'Orange'**
  String get colorOrange;

  /// No description provided for @colorPurple.
  ///
  /// In fr, this message translates to:
  /// **'Violet'**
  String get colorPurple;

  /// No description provided for @colorRed.
  ///
  /// In fr, this message translates to:
  /// **'Rouge'**
  String get colorRed;

  /// No description provided for @colorScheme.
  ///
  /// In fr, this message translates to:
  /// **'Schéma de couleurs'**
  String get colorScheme;

  /// No description provided for @colorYellow.
  ///
  /// In fr, this message translates to:
  /// **'Jaune'**
  String get colorYellow;

  /// No description provided for @colors.
  ///
  /// In fr, this message translates to:
  /// **'Couleurs'**
  String get colors;

  /// No description provided for @comment.
  ///
  /// In fr, this message translates to:
  /// **'Ecrire un commentaire...'**
  String get comment;

  /// No description provided for @componentColors.
  ///
  /// In fr, this message translates to:
  /// **'Couleurs des composants'**
  String get componentColors;

  /// No description provided for @componentTheme.
  ///
  /// In fr, this message translates to:
  /// **'Thème des composants'**
  String get componentTheme;

  /// No description provided for @computeDarkSchemeColors.
  ///
  /// In fr, this message translates to:
  /// **'Calculer les couleurs du schéma sombre'**
  String get computeDarkSchemeColors;

  /// No description provided for @confirmDeleteUser.
  ///
  /// In fr, this message translates to:
  /// **'Êtes-vous sûr de vouloir supprimer l\'utilisateur actuel ?'**
  String get confirmDeleteUser;

  /// No description provided for @confirmLeaveDial.
  ///
  /// In fr, this message translates to:
  /// **'Êtes-vous sûr de vouloir quitter ce dialogue ?'**
  String get confirmLeaveDial;

  /// No description provided for @confirmLogout.
  ///
  /// In fr, this message translates to:
  /// **'Êtes-vous sûr de vouloir déconnecter l\'utilisateur actuel ?'**
  String get confirmLogout;

  /// No description provided for @connectedDevices.
  ///
  /// In fr, this message translates to:
  /// **'Dispositifs connectés'**
  String get connectedDevices;

  /// No description provided for @connectedDevicesDescription.
  ///
  /// In fr, this message translates to:
  /// **'Bluetooth, jumelage'**
  String get connectedDevicesDescription;

  /// No description provided for @conservation.
  ///
  /// In fr, this message translates to:
  /// **'Conservation'**
  String get conservation;

  /// No description provided for @conservations.
  ///
  /// In fr, this message translates to:
  /// **'Conservations'**
  String get conservations;

  /// No description provided for @conservationsNoP.
  ///
  /// In fr, this message translates to:
  /// **'Aucune conservation prioritaire'**
  String get conservationsNoP;

  /// No description provided for @contactDetails.
  ///
  /// In fr, this message translates to:
  /// **'Coordonnées de contact'**
  String get contactDetails;

  /// No description provided for @contacts.
  ///
  /// In fr, this message translates to:
  /// **'Contacts'**
  String get contacts;

  /// No description provided for @controlNotifications.
  ///
  /// In fr, this message translates to:
  /// **'Contrôler les notifications des différentes applications'**
  String get controlNotifications;

  /// No description provided for @cookiesOtherDescription.
  ///
  /// In fr, this message translates to:
  /// **'Les cookies tiers sont bloqués en mode Incognito'**
  String get cookiesOtherDescription;

  /// No description provided for @cookiesOtherTitle.
  ///
  /// In fr, this message translates to:
  /// **'Cookies et autres données du site'**
  String get cookiesOtherTitle;

  /// No description provided for @copiedClipBoard.
  ///
  /// In fr, this message translates to:
  /// **'Copie du presse-papiers'**
  String get copiedClipBoard;

  /// No description provided for @create.
  ///
  /// In fr, this message translates to:
  /// **'Créer'**
  String get create;

  /// No description provided for @createAccount.
  ///
  /// In fr, this message translates to:
  /// **'Créer un compte'**
  String get createAccount;

  /// No description provided for @createContact.
  ///
  /// In fr, this message translates to:
  /// **'Créer un contact'**
  String get createContact;

  /// No description provided for @createDialog.
  ///
  /// In fr, this message translates to:
  /// **'Créer un dialogue'**
  String get createDialog;

  /// No description provided for @createGroupChat.
  ///
  /// In fr, this message translates to:
  /// **'Créer un group de chat'**
  String get createGroupChat;

  /// No description provided for @createPrivateChat.
  ///
  /// In fr, this message translates to:
  /// **'Créer un chat privé'**
  String get createPrivateChat;

  /// No description provided for @createPublicChat.
  ///
  /// In fr, this message translates to:
  /// **'Créer un chat public'**
  String get createPublicChat;

  /// No description provided for @created.
  ///
  /// In fr, this message translates to:
  /// **'Créé'**
  String get created;

  /// No description provided for @cubeUserId.
  ///
  /// In fr, this message translates to:
  /// **'ID utilisateur du cube'**
  String get cubeUserId;

  /// No description provided for @cubeUserName.
  ///
  /// In fr, this message translates to:
  /// **'saisir le nom de l\'utilisateur du cube'**
  String get cubeUserName;

  /// No description provided for @darkAppBarOpacity.
  ///
  /// In fr, this message translates to:
  /// **'Opacité de l\'AppBar sombre'**
  String get darkAppBarOpacity;

  /// No description provided for @darkAppBarStyle.
  ///
  /// In fr, this message translates to:
  /// **'Style sombre de l\'AppBar'**
  String get darkAppBarStyle;

  /// No description provided for @darkSchemeText.
  ///
  /// In fr, this message translates to:
  /// **'Les couleurs du schéma sombre sont calculées à partir du schéma clair, au lieu de '**
  String get darkSchemeText;

  /// No description provided for @darkSchemeTextSuit.
  ///
  /// In fr, this message translates to:
  /// **'en utilisant des couleurs sombres définies.'**
  String get darkSchemeTextSuit;

  /// No description provided for @darkSurfaceBlendSubTitle.
  ///
  /// In fr, this message translates to:
  /// **'Ajuster les mélanges de surface, de fond et d\'échafaudage'**
  String get darkSurfaceBlendSubTitle;

  /// No description provided for @darkSurfaceBlendTitle.
  ///
  /// In fr, this message translates to:
  /// **'Mélange de surfaces foncées'**
  String get darkSurfaceBlendTitle;

  /// No description provided for @darkThemeSurfaceMode.
  ///
  /// In fr, this message translates to:
  /// **'Thème sombre du mode surface'**
  String get darkThemeSurfaceMode;

  /// No description provided for @datePickerDialog.
  ///
  /// In fr, this message translates to:
  /// **'Sélecteur de Date'**
  String get datePickerDialog;

  /// No description provided for @day.
  ///
  /// In fr, this message translates to:
  /// **'Jour'**
  String get day;

  /// No description provided for @defaultBackgroundColorSurface.
  ///
  /// In fr, this message translates to:
  /// **'La couleur d\'arrière-plan par défaut est une couleur de surface avec une couleur de recouvrement onSurface en M2, et une couleur primaire en M3, avec une élévation de 3. Le thème par défaut du composant FlexColorScheme est le schéma de couleurs d\'arrière-plan, avec un mélange de surface utilisé et une élévation de 0.'**
  String get defaultBackgroundColorSurface;

  /// No description provided for @defaultLabel.
  ///
  /// In fr, this message translates to:
  /// **'Défaut'**
  String get defaultLabel;

  /// No description provided for @defaultSdkBackgroundColor.
  ///
  /// In fr, this message translates to:
  /// **'La couleur d\'arrière-plan par défaut du SDK est la couleur du canevas du thème via Material. La couleur du canevas est généralement colorScheme.background, l\'élévation est de 8. Le sous-thème FCS est par défaut colorScheme.background et l\'élévation est de 0.'**
  String get defaultSdkBackgroundColor;

  /// No description provided for @delete.
  ///
  /// In fr, this message translates to:
  /// **'Supprimer'**
  String get delete;

  /// No description provided for @deleteContact.
  ///
  /// In fr, this message translates to:
  /// **'Supprimer un contact'**
  String get deleteContact;

  /// No description provided for @deleteFactor.
  ///
  /// In fr, this message translates to:
  /// **'Êtes-vous sûr de vouloir supprimer ce facteur ? Vous serez déconnecté de l\'application après avoir supprimé le facteur.'**
  String get deleteFactor;

  /// No description provided for @deleteUser.
  ///
  /// In fr, this message translates to:
  /// **'supprimer l\'utilisateur'**
  String get deleteUser;

  /// No description provided for @description.
  ///
  /// In fr, this message translates to:
  /// **'Description'**
  String get description;

  /// No description provided for @developerNavBar.
  ///
  /// In fr, this message translates to:
  /// **'Développeur'**
  String get developerNavBar;

  /// No description provided for @dialog.
  ///
  /// In fr, this message translates to:
  /// **'Dialoguer'**
  String get dialog;

  /// No description provided for @dialogUnknown.
  ///
  /// In fr, this message translates to:
  /// **'Dialogue inconnu'**
  String get dialogUnknown;

  /// No description provided for @disabledItem.
  ///
  /// In fr, this message translates to:
  /// **'Article désactivé'**
  String get disabledItem;

  /// No description provided for @disabledMin.
  ///
  /// In fr, this message translates to:
  /// **'désactivé'**
  String get disabledMin;

  /// No description provided for @disabledTextEntry.
  ///
  /// In fr, this message translates to:
  /// **'Désactivé avec saisie de texte'**
  String get disabledTextEntry;

  /// No description provided for @dismiss.
  ///
  /// In fr, this message translates to:
  /// **'Rejeter'**
  String get dismiss;

  /// No description provided for @display.
  ///
  /// In fr, this message translates to:
  /// **'Afficher'**
  String get display;

  /// No description provided for @displayDescription.
  ///
  /// In fr, this message translates to:
  /// **'Thème sombre, taille des caractères, luminosité'**
  String get displayDescription;

  /// No description provided for @displayTitleZoom.
  ///
  /// In fr, this message translates to:
  /// **'zoom de l\'affichage'**
  String get displayTitleZoom;

  /// No description provided for @doNotDisturb.
  ///
  /// In fr, this message translates to:
  /// **'Ne pas déranger'**
  String get doNotDisturb;

  /// No description provided for @doNotDisturbDescription.
  ///
  /// In fr, this message translates to:
  /// **'Désactivé / 1 horaire peut être activé automatiquement'**
  String get doNotDisturbDescription;

  /// No description provided for @done.
  ///
  /// In fr, this message translates to:
  /// **'Terminé'**
  String get done;

  /// No description provided for @drawer.
  ///
  /// In fr, this message translates to:
  /// **'Tiroir'**
  String get drawer;

  /// No description provided for @drawerTheme.
  ///
  /// In fr, this message translates to:
  /// **'Thème du tiroir'**
  String get drawerTheme;

  /// No description provided for @dropdownButton.
  ///
  /// In fr, this message translates to:
  /// **'Bouton de la liste déroulante'**
  String get dropdownButton;

  /// No description provided for @dropdownFormFieldOption.
  ///
  /// In fr, this message translates to:
  /// **'Champ de formulaire déroulant - Option'**
  String get dropdownFormFieldOption;

  /// No description provided for @dropdownMenu.
  ///
  /// In fr, this message translates to:
  /// **'Menu déroulant'**
  String get dropdownMenu;

  /// No description provided for @dropdownMenuText.
  ///
  /// In fr, this message translates to:
  /// **'Le nouveau M3 DropdownMenu partage des blocs de construction avec la barre de menu et l\'ancre de menu, et utilise également le décorateur d\'entrée pour la saisie de texte.'**
  String get dropdownMenuText;

  /// No description provided for @dueDate.
  ///
  /// In fr, this message translates to:
  /// **'Date d\'échéance'**
  String get dueDate;

  /// No description provided for @duration.
  ///
  /// In fr, this message translates to:
  /// **'durée'**
  String get duration;

  /// No description provided for @egoteServicesTitle.
  ///
  /// In fr, this message translates to:
  /// **'Egote services'**
  String get egoteServicesTitle;

  /// No description provided for @elevatedButton.
  ///
  /// In fr, this message translates to:
  /// **'Bouton surélevé'**
  String get elevatedButton;

  /// No description provided for @elevatedIcon.
  ///
  /// In fr, this message translates to:
  /// **'Icône élevée'**
  String get elevatedIcon;

  /// No description provided for @elevation.
  ///
  /// In fr, this message translates to:
  /// **'Élévation'**
  String get elevation;

  /// No description provided for @email.
  ///
  /// In fr, this message translates to:
  /// **'Courriel'**
  String get email;

  /// No description provided for @emailInvalid.
  ///
  /// In fr, this message translates to:
  /// **'Courriel non valide'**
  String get emailInvalid;

  /// No description provided for @empty.
  ///
  /// In fr, this message translates to:
  /// **'Vide'**
  String get empty;

  /// No description provided for @english.
  ///
  /// In fr, this message translates to:
  /// **'Anglais'**
  String get english;

  /// No description provided for @enterAddressCity.
  ///
  /// In fr, this message translates to:
  /// **'saisir un nom de ville'**
  String get enterAddressCity;

  /// No description provided for @enterAddressZipCode.
  ///
  /// In fr, this message translates to:
  /// **'saisir un code postal'**
  String get enterAddressZipCode;

  /// No description provided for @enterCode.
  ///
  /// In fr, this message translates to:
  /// **'Entrer le code'**
  String get enterCode;

  /// No description provided for @enterCodeSent.
  ///
  /// In fr, this message translates to:
  /// **'Saisissez le code indiqué dans votre application d\'authentification.'**
  String get enterCodeSent;

  /// No description provided for @enterDuration.
  ///
  /// In fr, this message translates to:
  /// **'saisir la durée'**
  String get enterDuration;

  /// No description provided for @enterLogin.
  ///
  /// In fr, this message translates to:
  /// **'Entrez votre login'**
  String get enterLogin;

  /// No description provided for @enterPassword.
  ///
  /// In fr, this message translates to:
  /// **'Entrez votre mot de passe'**
  String get enterPassword;

  /// No description provided for @enterUserEmail.
  ///
  /// In fr, this message translates to:
  /// **'Saisir l\'e-mail de l\'utilisateur'**
  String get enterUserEmail;

  /// No description provided for @enterUserPassword.
  ///
  /// In fr, this message translates to:
  /// **'Saisir le mot de passe de l\'utilisateur'**
  String get enterUserPassword;

  /// No description provided for @enterUsername.
  ///
  /// In fr, this message translates to:
  /// **'Entrer le nom d\'utilisateur'**
  String get enterUsername;

  /// No description provided for @expandCollapseSubTitle.
  ///
  /// In fr, this message translates to:
  /// **'ON pour Agrandir OFF pour réduire la taille de l\'appareil Seulement utilisé pour le contrôle local de la présentation des chemins de fer.'**
  String get expandCollapseSubTitle;

  /// No description provided for @expandCollapseTitle.
  ///
  /// In fr, this message translates to:
  /// **'Agrandir et réduire'**
  String get expandCollapseTitle;

  /// No description provided for @expansionPanelDelete.
  ///
  /// In fr, this message translates to:
  /// **'Pour supprimer ce panneau, appuyez sur l\'icône de la corbeille'**
  String get expansionPanelDelete;

  /// No description provided for @expansionPanelFixed.
  ///
  /// In fr, this message translates to:
  /// **'Ce panneau est fixé ici et ne peut pas être enlevé. Les éléments numérotés 3 et plus peuvent être retirés.'**
  String get expansionPanelFixed;

  /// No description provided for @expansionTileListTitle.
  ///
  /// In fr, this message translates to:
  /// **'Il s\'agit du numéro de tuile'**
  String get expansionTileListTitle;

  /// No description provided for @expansionTileSubTitle1.
  ///
  /// In fr, this message translates to:
  /// **'Icône de la flèche d\'expansion arrière'**
  String get expansionTileSubTitle1;

  /// No description provided for @expansionTileSubTitle2.
  ///
  /// In fr, this message translates to:
  /// **'Icône de flèche d\'expansion personnalisée'**
  String get expansionTileSubTitle2;

  /// No description provided for @expansionTileSubTitle3.
  ///
  /// In fr, this message translates to:
  /// **'Icône de la flèche d\'expansion'**
  String get expansionTileSubTitle3;

  /// No description provided for @expansionTileTitle.
  ///
  /// In fr, this message translates to:
  /// **'Tuile d\'expansion'**
  String get expansionTileTitle;

  /// No description provided for @explainFlutterM2Color.
  ///
  /// In fr, this message translates to:
  /// **'L\'ancienne couleur par défaut de Flutter M2 était ThemeData.bottomAppBarColor. Elle a été supprimée dans Flutter 3.7. La nouvelle couleur par défaut est colorScheme.surface et l\'élévation 8. Dans M3, la couleur par défaut est colorScheme.surface, élévation 3, sans ombre, mais avec une teinte d\'élévation de la surface.'**
  String get explainFlutterM2Color;

  /// No description provided for @explainUsedColors1.
  ///
  /// In fr, this message translates to:
  /// **'Matériau 3 L\'ensemencement de la palette de couleurs à partir des couleurs clés est désactivé et n\'est pas utilisé. La palette de couleurs est basée directement sur le thème sélectionné.'**
  String get explainUsedColors1;

  /// No description provided for @explainUsedColors2.
  ///
  /// In fr, this message translates to:
  /// **'La couleur primaire du thème de la lumière est utilisée pour générer le modèle de couleurs. Cela revient à utiliser Flutter Color Scheme.fromSeed avec la couleur primaire comme couleur de départ.'**
  String get explainUsedColors2;

  /// No description provided for @explainUsedColors3.
  ///
  /// In fr, this message translates to:
  /// **'Les palettes tonales du ColorScheme sont créées à partir des couleurs primaires et secondaires du thème de la lumière. La clé tertiaire est calculée à partir de la couleur primaire.'**
  String get explainUsedColors3;

  /// No description provided for @explainUsedColors4.
  ///
  /// In fr, this message translates to:
  /// **'Les palettes de tons pour le ColorScheme sont créées avec des thèmes clairs. Les couleurs primaires et tertiaires servent de clés de départ, la clé secondaire est calculée à partir de la couleur primaire.'**
  String get explainUsedColors4;

  /// No description provided for @explainUsedColors5.
  ///
  /// In fr, this message translates to:
  /// **'Les couleurs primaires, secondaires et tertiaires du thème de la lumière sont utilisées comme clés pour générer des palettes de tons qui définissent le schéma de couleurs.'**
  String get explainUsedColors5;

  /// No description provided for @extended.
  ///
  /// In fr, this message translates to:
  /// **'Prolongé'**
  String get extended;

  /// No description provided for @fastAppTerminationDescription.
  ///
  /// In fr, this message translates to:
  /// **'Terminer au lieu de suspendre les applications lorsqu\'elles sont en arrière-plan pour forcer les applications à être relancées lorsque les plateaux sont en avant-plan.'**
  String get fastAppTerminationDescription;

  /// No description provided for @fastAppTerminationTitle.
  ///
  /// In fr, this message translates to:
  /// **'Fin rapide de l\'application'**
  String get fastAppTerminationTitle;

  /// No description provided for @faultyUrl.
  ///
  /// In fr, this message translates to:
  /// **'URL erroné !'**
  String get faultyUrl;

  /// No description provided for @favorite.
  ///
  /// In fr, this message translates to:
  /// **'Favoris'**
  String get favorite;

  /// No description provided for @favourites.
  ///
  /// In fr, this message translates to:
  /// **'Favoris'**
  String get favourites;

  /// No description provided for @file.
  ///
  /// In fr, this message translates to:
  /// **'Fichier'**
  String get file;

  /// No description provided for @fillRate.
  ///
  /// In fr, this message translates to:
  /// **'Taux de remplissage'**
  String get fillRate;

  /// No description provided for @filled.
  ///
  /// In fr, this message translates to:
  /// **'Remplis'**
  String get filled;

  /// No description provided for @filledButton.
  ///
  /// In fr, this message translates to:
  /// **'Bouton de remplissage'**
  String get filledButton;

  /// No description provided for @filledDisabled.
  ///
  /// In fr, this message translates to:
  /// **'Rempli (désactivé)'**
  String get filledDisabled;

  /// No description provided for @filledIcon.
  ///
  /// In fr, this message translates to:
  /// **'Icône de remplissage'**
  String get filledIcon;

  /// No description provided for @filledSetTrue.
  ///
  /// In fr, this message translates to:
  /// **'rempli par le Widget (true)'**
  String get filledSetTrue;

  /// No description provided for @filledTonal.
  ///
  /// In fr, this message translates to:
  /// **'Tonalité de remplissage'**
  String get filledTonal;

  /// No description provided for @filledTonalButton.
  ///
  /// In fr, this message translates to:
  /// **'Bouton de couleur rempli'**
  String get filledTonalButton;

  /// No description provided for @filledTonalDisabled.
  ///
  /// In fr, this message translates to:
  /// **'Tonalité remplie (désactivée)'**
  String get filledTonalDisabled;

  /// No description provided for @filledTonalIcon.
  ///
  /// In fr, this message translates to:
  /// **'Icône de tonalité remplie'**
  String get filledTonalIcon;

  /// No description provided for @flexTonesTitle1.
  ///
  /// In fr, this message translates to:
  /// **'Configuration des FlexTones'**
  String get flexTonesTitle1;

  /// No description provided for @flexTonesTitle2.
  ///
  /// In fr, this message translates to:
  /// **'Configuration des FlexTones avec CAM16 chroma'**
  String get flexTonesTitle2;

  /// No description provided for @flutterBackgroundColor.
  ///
  /// In fr, this message translates to:
  /// **'La couleur d\'arrière-plan par défaut de Flutter est la couleur Scheme surface. La couleur d\'arrière-plan par défaut du sous-thème FlexColor Scheme est la couleur Scheme.'**
  String get flutterBackgroundColor;

  /// No description provided for @flutterBackgroundColorM3.
  ///
  /// In fr, this message translates to:
  /// **'La couleur d\'arrière-plan par défaut de Flutter dans M3 est la couleur Scheme surface, avec une teinte d\'élévation et sans ombre. En M2, elle a une ombre et utilise le thème de couleur canvas Color, qui est généralement défini sur colorScheme.background.'**
  String get flutterBackgroundColorM3;

  /// No description provided for @flutterBackgroundColorSurface.
  ///
  /// In fr, this message translates to:
  /// **'La couleur d\'arrière-plan par défaut de Flutter est la couleur de la surface du schéma, avec l\'ajout d\'une teinte d\'élévation en mode Material 3.'**
  String get flutterBackgroundColorSurface;

  /// No description provided for @font.
  ///
  /// In fr, this message translates to:
  /// **'Police'**
  String get font;

  /// No description provided for @forTesting.
  ///
  /// In fr, this message translates to:
  /// **'Pour les tests, non persistants.'**
  String get forTesting;

  /// No description provided for @fullPhoto.
  ///
  /// In fr, this message translates to:
  /// **'Photo intégrale'**
  String get fullPhoto;

  /// No description provided for @general.
  ///
  /// In fr, this message translates to:
  /// **'General'**
  String get general;

  /// No description provided for @geo.
  ///
  /// In fr, this message translates to:
  /// **'Géolocalisation'**
  String get geo;

  /// No description provided for @groupConf.
  ///
  /// In fr, this message translates to:
  /// **'Configuration du groupe...'**
  String get groupConf;

  /// No description provided for @groupDetails.
  ///
  /// In fr, this message translates to:
  /// **'Informations sur le groupe'**
  String get groupDetails;

  /// No description provided for @groupName.
  ///
  /// In fr, this message translates to:
  /// **'Nom du groupe...'**
  String get groupName;

  /// No description provided for @groupProvide.
  ///
  /// In fr, this message translates to:
  /// **'Veuillez fournir un nom de groupe et une icône de groupe facultative.'**
  String get groupProvide;

  /// No description provided for @haveAccount.
  ///
  /// In fr, this message translates to:
  /// **'Vous avez un compte ? Cliquez ici pour vous connecter.'**
  String get haveAccount;

  /// No description provided for @haventAccount.
  ///
  /// In fr, this message translates to:
  /// **'Vous n\'avez pas de compte ? Cliquez ici pour vous inscrire.'**
  String get haventAccount;

  /// No description provided for @headline.
  ///
  /// In fr, this message translates to:
  /// **'À la une'**
  String get headline;

  /// No description provided for @helloMaterialBanner.
  ///
  /// In fr, this message translates to:
  /// **'Bonjour, je suis une Bannière Matérielle'**
  String get helloMaterialBanner;

  /// No description provided for @hideMessage.
  ///
  /// In fr, this message translates to:
  /// **'Masquer le message'**
  String get hideMessage;

  /// No description provided for @hideSilentTile.
  ///
  /// In fr, this message translates to:
  /// **'Masquer les notifications silencieuses dans la barre d\'état'**
  String get hideSilentTile;

  /// No description provided for @highBackgroundLowScaffoldLongText.
  ///
  /// In fr, this message translates to:
  /// **'Fond élevé, échafaudage faible Surface 1x Fond 3/2x Echafaudage 1/2x\\n'**
  String get highBackgroundLowScaffoldLongText;

  /// No description provided for @highBackgroundLowScaffoldShortText.
  ///
  /// In fr, this message translates to:
  /// **'Fond élevé faible échafaudage'**
  String get highBackgroundLowScaffoldShortText;

  /// No description provided for @highScaffoldLevelSurfaceLongText.
  ///
  /// In fr, this message translates to:
  /// **'Échafaudage très haut, arrière-plan haut, surface plane Surface 1x arrière-plan 2x échafaudage 3x\\n'**
  String get highScaffoldLevelSurfaceLongText;

  /// No description provided for @highScaffoldLevelSurfaceShortText.
  ///
  /// In fr, this message translates to:
  /// **'Échafaudage en hauteur\\nsurface plane'**
  String get highScaffoldLevelSurfaceShortText;

  /// No description provided for @highScaffoldLowSurfaceLongText.
  ///
  /// In fr, this message translates to:
  /// **'Échafaudage très haut, surface basse Surface 1/2x Fond 1x Échafaudage 3x\\n'**
  String get highScaffoldLowSurfaceLongText;

  /// No description provided for @highScaffoldLowSurfaceShortText.
  ///
  /// In fr, this message translates to:
  /// **'Très haut échafaudage et faible surface'**
  String get highScaffoldLowSurfaceShortText;

  /// No description provided for @highScaffoldLowSurfacesLongText.
  ///
  /// In fr, this message translates to:
  /// **'Échafaudage très haut, surface et arrière-plan bas Surface 1/2x Arrière-plan 1/2x Échafaudage 3x\\n'**
  String get highScaffoldLowSurfacesLongText;

  /// No description provided for @highScaffoldLowSurfacesShortText.
  ///
  /// In fr, this message translates to:
  /// **'Echafaudage haut Surfaces basses'**
  String get highScaffoldLowSurfacesShortText;

  /// No description provided for @highScaffoldLowSurfacesVariantDialogLongText.
  ///
  /// In fr, this message translates to:
  /// **'Dialogue sur les conteneurs tertiaires, échafaudage très élevé Surface 1/2x Fond 1/2x Echafaudage 3x Dialogue 1/2x mélange de couleurs des conteneurs tertiaires'**
  String get highScaffoldLowSurfacesVariantDialogLongText;

  /// No description provided for @highScaffoldLowSurfacesVariantDialogShortText.
  ///
  /// In fr, this message translates to:
  /// **'Dialogue sur les conteneurs tertiaires à haut échafaudage'**
  String get highScaffoldLowSurfacesVariantDialogShortText;

  /// No description provided for @highSurfaceLowScaffoldLongText.
  ///
  /// In fr, this message translates to:
  /// **'Surface élevée, faible échafaudage Surface 3/2x Arrière-plan 1x Echafaudage 1/2x\\n'**
  String get highSurfaceLowScaffoldLongText;

  /// No description provided for @highSurfaceLowScaffoldShortText.
  ///
  /// In fr, this message translates to:
  /// **'Échafaudage à grande surface et à faible hauteur'**
  String get highSurfaceLowScaffoldShortText;

  /// No description provided for @hive.
  ///
  /// In fr, this message translates to:
  /// **'Ruche'**
  String get hive;

  /// No description provided for @home.
  ///
  /// In fr, this message translates to:
  /// **'Accueil'**
  String get home;

  /// No description provided for @httpThree.
  ///
  /// In fr, this message translates to:
  /// **'HTTP/3'**
  String get httpThree;

  /// No description provided for @iadDevTitle.
  ///
  /// In fr, this message translates to:
  /// **'Développeur IAD testant l\'application'**
  String get iadDevTitle;

  /// No description provided for @iconButtonCLoseM3.
  ///
  /// In fr, this message translates to:
  /// **'Il s\'agit d\'un bouton IconButton In M3 qui permet de fermer le verrou.'**
  String get iconButtonCLoseM3;

  /// No description provided for @iconButtonOpenM3.
  ///
  /// In fr, this message translates to:
  /// **'Il s\'agit d\'un bouton IconButton In M3 à utiliser pour ouvrir la serrure.'**
  String get iconButtonOpenM3;

  /// No description provided for @info.
  ///
  /// In fr, this message translates to:
  /// **'Info'**
  String get info;

  /// No description provided for @infoThemeSettings.
  ///
  /// In fr, this message translates to:
  /// **'Démonstration du thème persistant FlexColor Scheme. Les widgets de configuration du thème utilisant les contrôleurs Riverpod peuvent être utilisés n\'importe où dans l\'application. Sur cette page, dans le tiroir et dans une feuille inférieure pour contrôler les paramètres persistants du thème.'**
  String get infoThemeSettings;

  /// No description provided for @initCode.
  ///
  /// In fr, this message translates to:
  /// **'000000'**
  String get initCode;

  /// No description provided for @iosDevTitle.
  ///
  /// In fr, this message translates to:
  /// **'Écran pour développeur iOS'**
  String get iosDevTitle;

  /// No description provided for @italic.
  ///
  /// In fr, this message translates to:
  /// **'Italique'**
  String get italic;

  /// No description provided for @label.
  ///
  /// In fr, this message translates to:
  /// **'Label'**
  String get label;

  /// No description provided for @labelActionChip.
  ///
  /// In fr, this message translates to:
  /// **'Jeton d\'action'**
  String get labelActionChip;

  /// No description provided for @labelAlarmSettings.
  ///
  /// In fr, this message translates to:
  /// **'Réglages de l\'alarme'**
  String get labelAlarmSettings;

  /// No description provided for @labelAndroid.
  ///
  /// In fr, this message translates to:
  /// **'Google Android'**
  String get labelAndroid;

  /// No description provided for @labelApple.
  ///
  /// In fr, this message translates to:
  /// **'Apple iOS'**
  String get labelApple;

  /// No description provided for @labelArchive.
  ///
  /// In fr, this message translates to:
  /// **'Archives'**
  String get labelArchive;

  /// No description provided for @labelBackground.
  ///
  /// In fr, this message translates to:
  /// **'Fond d\'écran'**
  String get labelBackground;

  /// No description provided for @labelBottomNaviBarBackground.
  ///
  /// In fr, this message translates to:
  /// **'Arrière-plan de la barre de navigation inférieure'**
  String get labelBottomNaviBarBackground;

  /// No description provided for @labelBottomNaviBarSelected.
  ///
  /// In fr, this message translates to:
  /// **'Barre de navigation inférieure sélectionnée'**
  String get labelBottomNaviBarSelected;

  /// No description provided for @labelCabinOverview.
  ///
  /// In fr, this message translates to:
  /// **'Vue d\'ensemble de la cabine'**
  String get labelCabinOverview;

  /// No description provided for @labelCanvas.
  ///
  /// In fr, this message translates to:
  /// **'Toiles'**
  String get labelCanvas;

  /// No description provided for @labelCard.
  ///
  /// In fr, this message translates to:
  /// **'Carte'**
  String get labelCard;

  /// No description provided for @labelChat.
  ///
  /// In fr, this message translates to:
  /// **'Chat'**
  String get labelChat;

  /// No description provided for @labelCheckbox.
  ///
  /// In fr, this message translates to:
  /// **'Case à cocher'**
  String get labelCheckbox;

  /// No description provided for @labelChip.
  ///
  /// In fr, this message translates to:
  /// **'Puce'**
  String get labelChip;

  /// No description provided for @labelChipCheck.
  ///
  /// In fr, this message translates to:
  /// **'Contrôle des puces'**
  String get labelChipCheck;

  /// No description provided for @labelChips.
  ///
  /// In fr, this message translates to:
  /// **'Puces'**
  String get labelChips;

  /// No description provided for @labelChoiceChip.
  ///
  /// In fr, this message translates to:
  /// **'Choix de la puce'**
  String get labelChoiceChip;

  /// No description provided for @labelCircleAvatar.
  ///
  /// In fr, this message translates to:
  /// **'Cercle Avatar'**
  String get labelCircleAvatar;

  /// No description provided for @labelDialogBackground.
  ///
  /// In fr, this message translates to:
  /// **'Arrière-plan du dialogue'**
  String get labelDialogBackground;

  /// No description provided for @labelDisabledColor.
  ///
  /// In fr, this message translates to:
  /// **'Couleur désactivée'**
  String get labelDisabledColor;

  /// No description provided for @labelDisabledSettings.
  ///
  /// In fr, this message translates to:
  /// **'Paramètres désactivés'**
  String get labelDisabledSettings;

  /// No description provided for @labelDividerColor.
  ///
  /// In fr, this message translates to:
  /// **'Couleur du séparateur'**
  String get labelDividerColor;

  /// No description provided for @labelElevatedButton.
  ///
  /// In fr, this message translates to:
  /// **'Bouton surélevé'**
  String get labelElevatedButton;

  /// No description provided for @labelError.
  ///
  /// In fr, this message translates to:
  /// **'Erreur'**
  String get labelError;

  /// No description provided for @labelErrorContainer.
  ///
  /// In fr, this message translates to:
  /// **'Conteneur d\'erreurs'**
  String get labelErrorContainer;

  /// No description provided for @labelFilterChip.
  ///
  /// In fr, this message translates to:
  /// **'Filtre à puce'**
  String get labelFilterChip;

  /// No description provided for @labelFloatingActionButton.
  ///
  /// In fr, this message translates to:
  /// **'Bouton d\'action flottant'**
  String get labelFloatingActionButton;

  /// No description provided for @labelFocusColor.
  ///
  /// In fr, this message translates to:
  /// **'Couleur de la mise au point'**
  String get labelFocusColor;

  /// No description provided for @labelFuchsia.
  ///
  /// In fr, this message translates to:
  /// **'Google Fuchsia'**
  String get labelFuchsia;

  /// No description provided for @labelHighlightColor.
  ///
  /// In fr, this message translates to:
  /// **'Couleur de mise en évidence'**
  String get labelHighlightColor;

  /// No description provided for @labelHintColor.
  ///
  /// In fr, this message translates to:
  /// **'Couleur de l\'indice'**
  String get labelHintColor;

  /// No description provided for @labelHoverColor.
  ///
  /// In fr, this message translates to:
  /// **'Couleur au survol'**
  String get labelHoverColor;

  /// No description provided for @labelIndicatorColor.
  ///
  /// In fr, this message translates to:
  /// **'Couleur de l\'indicateur'**
  String get labelIndicatorColor;

  /// No description provided for @labelInputChip.
  ///
  /// In fr, this message translates to:
  /// **'Champ de saisie'**
  String get labelInputChip;

  /// No description provided for @labelInputDecorator.
  ///
  /// In fr, this message translates to:
  /// **'Décorateur de saisie'**
  String get labelInputDecorator;

  /// No description provided for @labelInversePrimary.
  ///
  /// In fr, this message translates to:
  /// **'Primaire inversé'**
  String get labelInversePrimary;

  /// No description provided for @labelInverseSurface.
  ///
  /// In fr, this message translates to:
  /// **'Surface inversée'**
  String get labelInverseSurface;

  /// No description provided for @labelLinux.
  ///
  /// In fr, this message translates to:
  /// **'Linux'**
  String get labelLinux;

  /// No description provided for @labelMacOs.
  ///
  /// In fr, this message translates to:
  /// **'Apple MacOS'**
  String get labelMacOs;

  /// No description provided for @labelNavigationBarBackground.
  ///
  /// In fr, this message translates to:
  /// **'Arrière-plan de la barre de navigation'**
  String get labelNavigationBarBackground;

  /// No description provided for @labelNavigationBarIndicator.
  ///
  /// In fr, this message translates to:
  /// **'Indicateur de la barre de navigation'**
  String get labelNavigationBarIndicator;

  /// No description provided for @labelNavigationBarSelected.
  ///
  /// In fr, this message translates to:
  /// **'Barre de navigation sélectionnée'**
  String get labelNavigationBarSelected;

  /// No description provided for @labelNavigationRailBackground.
  ///
  /// In fr, this message translates to:
  /// **'Rail de navigation Fond d\'écran'**
  String get labelNavigationRailBackground;

  /// No description provided for @labelNavigationRailIndicator.
  ///
  /// In fr, this message translates to:
  /// **'Indicateur de rail de navigation'**
  String get labelNavigationRailIndicator;

  /// No description provided for @labelNavigationRailSelected.
  ///
  /// In fr, this message translates to:
  /// **'Rail de navigation sélectionné'**
  String get labelNavigationRailSelected;

  /// No description provided for @labelOnBackground.
  ///
  /// In fr, this message translates to:
  /// **'sur l\'arrière-plan'**
  String get labelOnBackground;

  /// No description provided for @labelOnError.
  ///
  /// In fr, this message translates to:
  /// **'en cas d\'erreur'**
  String get labelOnError;

  /// No description provided for @labelOnErrorContainer.
  ///
  /// In fr, this message translates to:
  /// **'sur le conteneur d\'erreurs'**
  String get labelOnErrorContainer;

  /// No description provided for @labelOnInverseSurface.
  ///
  /// In fr, this message translates to:
  /// **'sur la surface inverse'**
  String get labelOnInverseSurface;

  /// No description provided for @labelOnPrimary.
  ///
  /// In fr, this message translates to:
  /// **'sur le primaire'**
  String get labelOnPrimary;

  /// No description provided for @labelOnPrimaryContainer.
  ///
  /// In fr, this message translates to:
  /// **'sur le conteneur primaire'**
  String get labelOnPrimaryContainer;

  /// No description provided for @labelOnSecondary.
  ///
  /// In fr, this message translates to:
  /// **'sur le secondaire'**
  String get labelOnSecondary;

  /// No description provided for @labelOnSecondaryContainer.
  ///
  /// In fr, this message translates to:
  /// **'sur le conteneur secondaire'**
  String get labelOnSecondaryContainer;

  /// No description provided for @labelOnSurface.
  ///
  /// In fr, this message translates to:
  /// **'sur la surface'**
  String get labelOnSurface;

  /// No description provided for @labelOnSurfaceVariant.
  ///
  /// In fr, this message translates to:
  /// **'sur la variante de surface'**
  String get labelOnSurfaceVariant;

  /// No description provided for @labelOnTertiary.
  ///
  /// In fr, this message translates to:
  /// **'sur le tertiaire'**
  String get labelOnTertiary;

  /// No description provided for @labelOnTertiaryContainer.
  ///
  /// In fr, this message translates to:
  /// **'sur le conteneur tertiaire'**
  String get labelOnTertiaryContainer;

  /// No description provided for @labelOutline.
  ///
  /// In fr, this message translates to:
  /// **'Contour'**
  String get labelOutline;

  /// No description provided for @labelOutlineButton.
  ///
  /// In fr, this message translates to:
  /// **'Bouton souligné'**
  String get labelOutlineButton;

  /// No description provided for @labelPrimary.
  ///
  /// In fr, this message translates to:
  /// **'Primaire'**
  String get labelPrimary;

  /// No description provided for @labelPrimaryColor.
  ///
  /// In fr, this message translates to:
  /// **'Couleur primaire'**
  String get labelPrimaryColor;

  /// No description provided for @labelPrimaryContainer.
  ///
  /// In fr, this message translates to:
  /// **'Conteneur primaire'**
  String get labelPrimaryContainer;

  /// No description provided for @labelPrimaryDark.
  ///
  /// In fr, this message translates to:
  /// **'Primaire foncé'**
  String get labelPrimaryDark;

  /// No description provided for @labelPrimaryLight.
  ///
  /// In fr, this message translates to:
  /// **'Lumière primaire'**
  String get labelPrimaryLight;

  /// No description provided for @labelPrimaryTextTheme.
  ///
  /// In fr, this message translates to:
  /// **'Thème du texte primaire'**
  String get labelPrimaryTextTheme;

  /// No description provided for @labelRadio.
  ///
  /// In fr, this message translates to:
  /// **'Radio'**
  String get labelRadio;

  /// No description provided for @labelScaffoldBackground.
  ///
  /// In fr, this message translates to:
  /// **'Contexte de l\'échafaudage'**
  String get labelScaffoldBackground;

  /// No description provided for @labelSecondary.
  ///
  /// In fr, this message translates to:
  /// **'Secondaire'**
  String get labelSecondary;

  /// No description provided for @labelSecondaryContainer.
  ///
  /// In fr, this message translates to:
  /// **'Conteneur secondaire'**
  String get labelSecondaryContainer;

  /// No description provided for @labelSecondaryHeader.
  ///
  /// In fr, this message translates to:
  /// **'En-tête secondaire'**
  String get labelSecondaryHeader;

  /// No description provided for @labelShadow.
  ///
  /// In fr, this message translates to:
  /// **'Ombre'**
  String get labelShadow;

  /// No description provided for @labelShadowColor.
  ///
  /// In fr, this message translates to:
  /// **'Couleur de l\'ombre'**
  String get labelShadowColor;

  /// No description provided for @labelSnackBarBackground.
  ///
  /// In fr, this message translates to:
  /// **'Fond du SnackBar'**
  String get labelSnackBarBackground;

  /// No description provided for @labelSplashColor.
  ///
  /// In fr, this message translates to:
  /// **'Splash Color'**
  String get labelSplashColor;

  /// No description provided for @labelSurface.
  ///
  /// In fr, this message translates to:
  /// **'Surface'**
  String get labelSurface;

  /// No description provided for @labelSurfaceVariant.
  ///
  /// In fr, this message translates to:
  /// **'Surface Variante'**
  String get labelSurfaceVariant;

  /// No description provided for @labelSurveillanceView.
  ///
  /// In fr, this message translates to:
  /// **'Surveillance visuelle'**
  String get labelSurveillanceView;

  /// No description provided for @labelSwitch.
  ///
  /// In fr, this message translates to:
  /// **'Commutateur'**
  String get labelSwitch;

  /// No description provided for @labelTabBarIndicator.
  ///
  /// In fr, this message translates to:
  /// **'Indicateur de barre d\'outils'**
  String get labelTabBarIndicator;

  /// No description provided for @labelTabBarItem.
  ///
  /// In fr, this message translates to:
  /// **'Élément de la barre d\'outils'**
  String get labelTabBarItem;

  /// No description provided for @labelTasks.
  ///
  /// In fr, this message translates to:
  /// **'Tâches'**
  String get labelTasks;

  /// No description provided for @labelTertiary.
  ///
  /// In fr, this message translates to:
  /// **'Tertiaire'**
  String get labelTertiary;

  /// No description provided for @labelTertiaryContainer.
  ///
  /// In fr, this message translates to:
  /// **'Conteneur tertiaire'**
  String get labelTertiaryContainer;

  /// No description provided for @labelTextButton.
  ///
  /// In fr, this message translates to:
  /// **'Bouton de texte'**
  String get labelTextButton;

  /// No description provided for @labelTextDisabled.
  ///
  /// In fr, this message translates to:
  /// **'TextField - Label désactivé'**
  String get labelTextDisabled;

  /// No description provided for @labelTextTheme.
  ///
  /// In fr, this message translates to:
  /// **'Thème de texte'**
  String get labelTextTheme;

  /// No description provided for @labelToggleButtons.
  ///
  /// In fr, this message translates to:
  /// **'Boutons de basculement'**
  String get labelToggleButtons;

  /// No description provided for @labelTonalButton.
  ///
  /// In fr, this message translates to:
  /// **'Bouton tonal'**
  String get labelTonalButton;

  /// No description provided for @labelTooltip.
  ///
  /// In fr, this message translates to:
  /// **'Info-bulle'**
  String get labelTooltip;

  /// No description provided for @labelUnselectedWidget.
  ///
  /// In fr, this message translates to:
  /// **'Widget non sélectionné'**
  String get labelUnselectedWidget;

  /// No description provided for @labelWaterAlert.
  ///
  /// In fr, this message translates to:
  /// **'Alerte à la pollution de l\'eau'**
  String get labelWaterAlert;

  /// No description provided for @labelWindows.
  ///
  /// In fr, this message translates to:
  /// **'Microsoft Windows'**
  String get labelWindows;

  /// No description provided for @languageSettingsScreen.
  ///
  /// In fr, this message translates to:
  /// **'Écran des paramètres linguistiques'**
  String get languageSettingsScreen;

  /// No description provided for @large.
  ///
  /// In fr, this message translates to:
  /// **'Grande'**
  String get large;

  /// No description provided for @lastLogin.
  ///
  /// In fr, this message translates to:
  /// **'Dernière connexion'**
  String get lastLogin;

  /// No description provided for @lastSelected.
  ///
  /// In fr, this message translates to:
  /// **'Dernier sélectionné'**
  String get lastSelected;

  /// No description provided for @leaveDialog.
  ///
  /// In fr, this message translates to:
  /// **'Leave Dialog'**
  String get leaveDialog;

  /// No description provided for @level.
  ///
  /// In fr, this message translates to:
  /// **'Niveau'**
  String get level;

  /// No description provided for @levelSurfacesLowScaffoldLongText.
  ///
  /// In fr, this message translates to:
  /// **'Surface et arrière-plan de niveau, échafaudage bas Surface 1x arrière-plan 1x échafaudage 1/2x\\n'**
  String get levelSurfacesLowScaffoldLongText;

  /// No description provided for @levelSurfacesLowScaffoldVariantDialogLongText.
  ///
  /// In fr, this message translates to:
  /// **'Dialogue sur les conteneurs tertiaires, faible échafaudage Surface 1x arrière-plan 1x échafaudage 1/2x dialogue 1x mélange de couleurs pour les conteneurs tertiaires'**
  String get levelSurfacesLowScaffoldVariantDialogLongText;

  /// No description provided for @levelSurfacesLowScaffoldVariantDialogShortText.
  ///
  /// In fr, this message translates to:
  /// **'Échafaudage bas Dialogue sur les conteneurs tertiaires'**
  String get levelSurfacesLowScaffoldVariantDialogShortText;

  /// No description provided for @lightAppBarOpacity.
  ///
  /// In fr, this message translates to:
  /// **'Opacité de l\'AppBar légère'**
  String get lightAppBarOpacity;

  /// No description provided for @lightAppBarStyle.
  ///
  /// In fr, this message translates to:
  /// **'Style AppBar léger'**
  String get lightAppBarStyle;

  /// No description provided for @lightThemeSurfaceBlend.
  ///
  /// In fr, this message translates to:
  /// **'Mélange de surfaces sur le thème de la lumière'**
  String get lightThemeSurfaceBlend;

  /// No description provided for @lightThemeSurfaceBlendSubTitle.
  ///
  /// In fr, this message translates to:
  /// **'Ajuster les mélanges de surface, d\'arrière-plan et d\'échafaudage'**
  String get lightThemeSurfaceBlendSubTitle;

  /// No description provided for @lightThemeSurfaceMode.
  ///
  /// In fr, this message translates to:
  /// **'Thème lumineux mode surface'**
  String get lightThemeSurfaceMode;

  /// No description provided for @listContacts.
  ///
  /// In fr, this message translates to:
  /// **'Liste de contacts'**
  String get listContacts;

  /// No description provided for @listMfa.
  ///
  /// In fr, this message translates to:
  /// **'Liste des authentifications multi-facteurs'**
  String get listMfa;

  /// No description provided for @load.
  ///
  /// In fr, this message translates to:
  /// **'Chargement'**
  String get load;

  /// No description provided for @loadNow.
  ///
  /// In fr, this message translates to:
  /// **'Télécharger maintenant'**
  String get loadNow;

  /// No description provided for @loading.
  ///
  /// In fr, this message translates to:
  /// **'Chargement...'**
  String get loading;

  /// No description provided for @location.
  ///
  /// In fr, this message translates to:
  /// **'emplacement'**
  String get location;

  /// No description provided for @locationDescription.
  ///
  /// In fr, this message translates to:
  /// **'Activé - 3 applications ont accès à la localisation'**
  String get locationDescription;

  /// No description provided for @login.
  ///
  /// In fr, this message translates to:
  /// **'Se connecter'**
  String get login;

  /// No description provided for @logout.
  ///
  /// In fr, this message translates to:
  /// **'Se déconnecter'**
  String get logout;

  /// No description provided for @manage.
  ///
  /// In fr, this message translates to:
  /// **'Manage'**
  String get manage;

  /// No description provided for @materialBottomSheet.
  ///
  /// In fr, this message translates to:
  /// **'Feuille de fond Material'**
  String get materialBottomSheet;

  /// No description provided for @materialBottomSheetText.
  ///
  /// In fr, this message translates to:
  /// **'Utilise un matériau de type toile comme arrière-plan par défaut. Fond ColorScheme en M2, mais surface en M3.'**
  String get materialBottomSheetText;

  /// No description provided for @materialModalBottomSheet.
  ///
  /// In fr, this message translates to:
  /// **'Alèse modale Material'**
  String get materialModalBottomSheet;

  /// No description provided for @materialPopupMenuText.
  ///
  /// In fr, this message translates to:
  /// **'Le menu contextuel classique de Material.'**
  String get materialPopupMenuText;

  /// No description provided for @materialShowcaseShadowText1.
  ///
  /// In fr, this message translates to:
  /// **'Material: type de toile, élévation 0, teinte par défaut et ombre'**
  String get materialShowcaseShadowText1;

  /// No description provided for @materialShowcaseShadowText2.
  ///
  /// In fr, this message translates to:
  /// **'Material: type de toile, élévation 1, teinte par défaut et ombre'**
  String get materialShowcaseShadowText2;

  /// No description provided for @materialShowcaseShadowText3.
  ///
  /// In fr, this message translates to:
  /// **'Material: type de toile, élévation 6, teinte par défaut et ombre'**
  String get materialShowcaseShadowText3;

  /// No description provided for @materialShowcaseSurface.
  ///
  /// In fr, this message translates to:
  /// **'Material: type toile, élévation 1, surface attribuée Teinte et pas d\'ombre'**
  String get materialShowcaseSurface;

  /// No description provided for @materialShowcaseSurface2.
  ///
  /// In fr, this message translates to:
  /// **'Material: type toile, élévation 6, surface attribuée Teinte et pas d\'ombre'**
  String get materialShowcaseSurface2;

  /// No description provided for @materialShowcaseSurfaceShadow.
  ///
  /// In fr, this message translates to:
  /// **'Material: type de toile, élévation 1, teinte et ombre par défaut'**
  String get materialShowcaseSurfaceShadow;

  /// No description provided for @materialShowcaseSurfaceShadow2.
  ///
  /// In fr, this message translates to:
  /// **'Material: type toile, élévation 6, surface attribuée Teinte et ombre'**
  String get materialShowcaseSurfaceShadow2;

  /// No description provided for @materialShowcaseText1.
  ///
  /// In fr, this message translates to:
  /// **'Material: élévation et teinte'**
  String get materialShowcaseText1;

  /// No description provided for @materialShowcaseText2.
  ///
  /// In fr, this message translates to:
  /// **'MMaterial: peut également spécifier la couleur surfaceTint, qui est appliquée lorsque le matériau est élevé, mais uniquement en mode matériau 3.'**
  String get materialShowcaseText2;

  /// No description provided for @materialShowcaseText3.
  ///
  /// In fr, this message translates to:
  /// **'Material: type toile'**
  String get materialShowcaseText3;

  /// No description provided for @materialShowcaseText4.
  ///
  /// In fr, this message translates to:
  /// **'La couleur d\'arrière-plan par défaut est la couleur du canevas du thème, et la couleur du canevas du thème est définie sur l\'arrière-plan du thème colorScheme. La couleur du canevas du thème sera obsolète dans Flutter.'**
  String get materialShowcaseText4;

  /// No description provided for @materialShowcaseTypeCard1.
  ///
  /// In fr, this message translates to:
  /// **'Material: type carte'**
  String get materialShowcaseTypeCard1;

  /// No description provided for @materialShowcaseTypeCard2.
  ///
  /// In fr, this message translates to:
  /// **'La couleur d\'arrière-plan par défaut est la couleur de la carte de thème, et la couleur de la carte de thème est définie sur la surface du schéma de couleur du thème. La carte de couleur Color sera obsolète dans Flutter.'**
  String get materialShowcaseTypeCard2;

  /// No description provided for @materialShowcaseTypeCardShadow1.
  ///
  /// In fr, this message translates to:
  /// **'Material: type de carte, élévation 0, teinte et ombre par défaut'**
  String get materialShowcaseTypeCardShadow1;

  /// No description provided for @materialShowcaseTypeCardShadow2.
  ///
  /// In fr, this message translates to:
  /// **'Material: type de carte, élévation 1, teinte et ombre par défaut'**
  String get materialShowcaseTypeCardShadow2;

  /// No description provided for @materialShowcaseTypeCardShadow3.
  ///
  /// In fr, this message translates to:
  /// **'Material: type de carte, élévation 6, teinte et ombre par défaut'**
  String get materialShowcaseTypeCardShadow3;

  /// No description provided for @materialShowcaseTypeCardSurface.
  ///
  /// In fr, this message translates to:
  /// **'Material: type de carte, élévation 1, surface attribuée Tint et pas d\'ombre'**
  String get materialShowcaseTypeCardSurface;

  /// No description provided for @materialShowcaseTypeCardSurface2.
  ///
  /// In fr, this message translates to:
  /// **'Material: type de carte, élévation 6, surface attribuée Tint et pas d\'ombre'**
  String get materialShowcaseTypeCardSurface2;

  /// No description provided for @materialShowcaseTypeCardSurfaceShadow.
  ///
  /// In fr, this message translates to:
  /// **'Material: type de carte, élévation 1, surface attribuée Teinte et ombre'**
  String get materialShowcaseTypeCardSurfaceShadow;

  /// No description provided for @materialShowcaseTypeCardSurfaceShadow2.
  ///
  /// In fr, this message translates to:
  /// **'Material: type de carte, élévation 6, surface attribuée Teinte et ombre'**
  String get materialShowcaseTypeCardSurfaceShadow2;

  /// No description provided for @medium.
  ///
  /// In fr, this message translates to:
  /// **'Moyen'**
  String get medium;

  /// No description provided for @mem.
  ///
  /// In fr, this message translates to:
  /// **'Mem'**
  String get mem;

  /// No description provided for @members.
  ///
  /// In fr, this message translates to:
  /// **'Membres'**
  String get members;

  /// No description provided for @menuAnchor.
  ///
  /// In fr, this message translates to:
  /// **'Menu Ancre'**
  String get menuAnchor;

  /// No description provided for @menuAnchorDemo.
  ///
  /// In fr, this message translates to:
  /// **'Menu Ancre Démo'**
  String get menuAnchorDemo;

  /// No description provided for @menuAnchorM3Text.
  ///
  /// In fr, this message translates to:
  /// **'Le nouvel ancrage du menu M3 est utilisé sur un conteneur en tant que menu contextuel.'**
  String get menuAnchorM3Text;

  /// No description provided for @menuAnchorM3ctx.
  ///
  /// In fr, this message translates to:
  /// **'Le nouvel ancrage du menu M3 est cool !'**
  String get menuAnchorM3ctx;

  /// No description provided for @menuAnchorM3ctxClick.
  ///
  /// In fr, this message translates to:
  /// **'Cliquez n\'importe où dans ce conteneur pour afficher le menu contextuel de l\'ancre de menu.'**
  String get menuAnchorM3ctxClick;

  /// No description provided for @menuBar.
  ///
  /// In fr, this message translates to:
  /// **'Barre de menu'**
  String get menuBar;

  /// No description provided for @menuBarDemo.
  ///
  /// In fr, this message translates to:
  /// **'Barre de menu Démo'**
  String get menuBarDemo;

  /// No description provided for @menuBarM3.
  ///
  /// In fr, this message translates to:
  /// **'Les nouveaux menus M3 peuvent être utilisés dans une barre de menu via le bouton de sous-menu et son bouton d\'élément de menu, mais ils peuvent également être utilisés dans une ancre de menu n\'importe où.'**
  String get menuBarM3;

  /// No description provided for @menuKeyboardShortcuts.
  ///
  /// In fr, this message translates to:
  /// **'Les raccourcis clavier du menu fonctionnent également.'**
  String get menuKeyboardShortcuts;

  /// No description provided for @mfaConnect.
  ///
  /// In fr, this message translates to:
  /// **'Connexion par authentification multi-facteurs'**
  String get mfaConnect;

  /// No description provided for @minify.
  ///
  /// In fr, this message translates to:
  /// **'Minifier'**
  String get minify;

  /// No description provided for @missVerification.
  ///
  /// In fr, this message translates to:
  /// **'Code de vérification manquant'**
  String get missVerification;

  /// No description provided for @month.
  ///
  /// In fr, this message translates to:
  /// **'Mois'**
  String get month;

  /// No description provided for @multiPathNetworking.
  ///
  /// In fr, this message translates to:
  /// **'Réseaux à chemins multiples'**
  String get multiPathNetworking;

  /// No description provided for @name.
  ///
  /// In fr, this message translates to:
  /// **'Nom'**
  String get name;

  /// No description provided for @navBadgeText12.
  ///
  /// In fr, this message translates to:
  /// **'12'**
  String get navBadgeText12;

  /// No description provided for @navBadgeText26.
  ///
  /// In fr, this message translates to:
  /// **'26'**
  String get navBadgeText26;

  /// No description provided for @navBadgeText5.
  ///
  /// In fr, this message translates to:
  /// **'5'**
  String get navBadgeText5;

  /// No description provided for @navigationBarM3.
  ///
  /// In fr, this message translates to:
  /// **'Barre de navigation (Material 3)'**
  String get navigationBarM3;

  /// No description provided for @navigationDrawer.
  ///
  /// In fr, this message translates to:
  /// **'Tiroir de navigation'**
  String get navigationDrawer;

  /// No description provided for @navigationRail.
  ///
  /// In fr, this message translates to:
  /// **'Rail de navigation'**
  String get navigationRail;

  /// No description provided for @networkInternet.
  ///
  /// In fr, this message translates to:
  /// **'Réseau et internet'**
  String get networkInternet;

  /// No description provided for @networkInternetDescription.
  ///
  /// In fr, this message translates to:
  /// **'Mobile, Wi-Fi, point d\'accès'**
  String get networkInternetDescription;

  /// No description provided for @newDialog.
  ///
  /// In fr, this message translates to:
  /// **'Nouveau dialogue'**
  String get newDialog;

  /// No description provided for @noData.
  ///
  /// In fr, this message translates to:
  /// **'Aucune donnée !'**
  String get noData;

  /// No description provided for @noDialogYet.
  ///
  /// In fr, this message translates to:
  /// **'Aucun dialogue pour l\'instant'**
  String get noDialogYet;

  /// No description provided for @noNetwork.
  ///
  /// In fr, this message translates to:
  /// **'Pas de réseau'**
  String get noNetwork;

  /// No description provided for @normalTextTheme.
  ///
  /// In fr, this message translates to:
  /// **'Thème de texte normal'**
  String get normalTextTheme;

  /// No description provided for @notImage.
  ///
  /// In fr, this message translates to:
  /// **'Ce fichier n\'est pas une image'**
  String get notImage;

  /// No description provided for @nothingSend.
  ///
  /// In fr, this message translates to:
  /// **'Rien à transmettre'**
  String get nothingSend;

  /// No description provided for @nothingToSave.
  ///
  /// In fr, this message translates to:
  /// **'Il n\'y a rien à sauver'**
  String get nothingToSave;

  /// No description provided for @notifications.
  ///
  /// In fr, this message translates to:
  /// **'Notifications'**
  String get notifications;

  /// No description provided for @notificationsDescription.
  ///
  /// In fr, this message translates to:
  /// **'Historique des notifications, conversations'**
  String get notificationsDescription;

  /// No description provided for @notificationsDeviceApp.
  ///
  /// In fr, this message translates to:
  /// **'Notifications d\'appareils et d\'applications'**
  String get notificationsDeviceApp;

  /// No description provided for @notificationsDeviceAppDescription.
  ///
  /// In fr, this message translates to:
  /// **'Contrôler les applications et les appareils qui peuvent lire les notifications'**
  String get notificationsDeviceAppDescription;

  /// No description provided for @notificationsDot.
  ///
  /// In fr, this message translates to:
  /// **'Point de notification sur l\'icône de l\'application'**
  String get notificationsDot;

  /// No description provided for @notificationsEnable.
  ///
  /// In fr, this message translates to:
  /// **'Activer les notifications'**
  String get notificationsEnable;

  /// No description provided for @notificationsEnableDescription.
  ///
  /// In fr, this message translates to:
  /// **'Obtenir des suggestions d\'actions, de réponses et plus encore'**
  String get notificationsEnableDescription;

  /// No description provided for @notificationsHistory.
  ///
  /// In fr, this message translates to:
  /// **'Historique des notifications'**
  String get notificationsHistory;

  /// No description provided for @notificationsHistoryText.
  ///
  /// In fr, this message translates to:
  /// **'Afficher les notifications récentes et les notifications en attente'**
  String get notificationsHistoryText;

  /// No description provided for @notificationsLockScreen.
  ///
  /// In fr, this message translates to:
  /// **'Notifications sur l\'écran de verrouillage'**
  String get notificationsLockScreen;

  /// No description provided for @notificationsLockScreenDescription.
  ///
  /// In fr, this message translates to:
  /// **'Afficher les conversations, les messages par défaut et les messages silencieux'**
  String get notificationsLockScreenDescription;

  /// No description provided for @notificationsSnoozing.
  ///
  /// In fr, this message translates to:
  /// **'Autoriser la mise en veille des notifications'**
  String get notificationsSnoozing;

  /// No description provided for @nowSetTo.
  ///
  /// In fr, this message translates to:
  /// **'Réglé maintenant sur '**
  String get nowSetTo;

  /// No description provided for @occupants.
  ///
  /// In fr, this message translates to:
  /// **'occupants'**
  String get occupants;

  /// No description provided for @occupantsIds.
  ///
  /// In fr, this message translates to:
  /// **'occupants_ids'**
  String get occupantsIds;

  /// No description provided for @ok.
  ///
  /// In fr, this message translates to:
  /// **'Ok'**
  String get ok;

  /// No description provided for @open.
  ///
  /// In fr, this message translates to:
  /// **'Ouvrir'**
  String get open;

  /// No description provided for @openDialog.
  ///
  /// In fr, this message translates to:
  /// **'Ouvrir la boîte de dialogue'**
  String get openDialog;

  /// No description provided for @openViaQr.
  ///
  /// In fr, this message translates to:
  /// **'Ouvrez votre application d\'authentification et ajoutez cette application via le code QR ou en collant le code ci-dessous.'**
  String get openViaQr;

  /// No description provided for @optionText.
  ///
  /// In fr, this message translates to:
  /// **'Option'**
  String get optionText;

  /// No description provided for @or.
  ///
  /// In fr, this message translates to:
  /// **'ou'**
  String get or;

  /// No description provided for @organizationName.
  ///
  /// In fr, this message translates to:
  /// **'Nom de l\'organisation'**
  String get organizationName;

  /// No description provided for @organizationNameNotEmpty.
  ///
  /// In fr, this message translates to:
  /// **'Le nom de l\'organisation ne doit pas être vide'**
  String get organizationNameNotEmpty;

  /// No description provided for @outlined.
  ///
  /// In fr, this message translates to:
  /// **'Contour'**
  String get outlined;

  /// No description provided for @outlinedButton.
  ///
  /// In fr, this message translates to:
  /// **'contour du bouton'**
  String get outlinedButton;

  /// No description provided for @outlinedDisabled.
  ///
  /// In fr, this message translates to:
  /// **'contour (désactivé)'**
  String get outlinedDisabled;

  /// No description provided for @outlinedIcon.
  ///
  /// In fr, this message translates to:
  /// **'contour d\'icône'**
  String get outlinedIcon;

  /// No description provided for @owner.
  ///
  /// In fr, this message translates to:
  /// **'Propriétaire'**
  String get owner;

  /// No description provided for @ownerContact.
  ///
  /// In fr, this message translates to:
  /// **'contact du Propriétaire'**
  String get ownerContact;

  /// No description provided for @ownerId.
  ///
  /// In fr, this message translates to:
  /// **'Id du Propriétaire'**
  String get ownerId;

  /// No description provided for @ownerName.
  ///
  /// In fr, this message translates to:
  /// **'Nom  du Propriétaire'**
  String get ownerName;

  /// No description provided for @ownerPhone.
  ///
  /// In fr, this message translates to:
  /// **'Numéro de téléphone du Propriétaire'**
  String get ownerPhone;

  /// No description provided for @password.
  ///
  /// In fr, this message translates to:
  /// **'Mot de passe'**
  String get password;

  /// No description provided for @passwords.
  ///
  /// In fr, this message translates to:
  /// **'Mots de passe'**
  String get passwords;

  /// No description provided for @paymentMethods.
  ///
  /// In fr, this message translates to:
  /// **'Modes de paiement'**
  String get paymentMethods;

  /// No description provided for @percent.
  ///
  /// In fr, this message translates to:
  /// **'%'**
  String get percent;

  /// No description provided for @persistence.
  ///
  /// In fr, this message translates to:
  /// **'Persistance'**
  String get persistence;

  /// No description provided for @persistenceMemoryDescription.
  ///
  /// In fr, this message translates to:
  /// **'Vous pouvez utiliser la mémoire volatile ou les préférences partagées et Hive pour conserver les paramètres. Vous pouvez basculer l\'implémentation utilisée dynamiquement dans l\'application.'**
  String get persistenceMemoryDescription;

  /// No description provided for @phoneNumber.
  ///
  /// In fr, this message translates to:
  /// **'N° de téléphone'**
  String get phoneNumber;

  /// No description provided for @photo.
  ///
  /// In fr, this message translates to:
  /// **'Photo'**
  String get photo;

  /// No description provided for @pickImage.
  ///
  /// In fr, this message translates to:
  /// **'Sélectionner une image'**
  String get pickImage;

  /// No description provided for @popupMenuButton.
  ///
  /// In fr, this message translates to:
  /// **'Bouton du menu popup'**
  String get popupMenuButton;

  /// No description provided for @prefs.
  ///
  /// In fr, this message translates to:
  /// **'Prefs'**
  String get prefs;

  /// No description provided for @primaryTextTheme.
  ///
  /// In fr, this message translates to:
  /// **'Thème de texte primaire'**
  String get primaryTextTheme;

  /// No description provided for @privacy.
  ///
  /// In fr, this message translates to:
  /// **'Privé'**
  String get privacy;

  /// No description provided for @privacyDescription.
  ///
  /// In fr, this message translates to:
  /// **'Les fonctions d\'essai sont en place'**
  String get privacyDescription;

  /// No description provided for @privacySandBoxTitle.
  ///
  /// In fr, this message translates to:
  /// **'Sandbox Privé'**
  String get privacySandBoxTitle;

  /// No description provided for @privacySecTitle.
  ///
  /// In fr, this message translates to:
  /// **'Protection de la vie privée et sécurité'**
  String get privacySecTitle;

  /// No description provided for @profile.
  ///
  /// In fr, this message translates to:
  /// **'Profil'**
  String get profile;

  /// No description provided for @quit.
  ///
  /// In fr, this message translates to:
  /// **'Quitter'**
  String get quit;

  /// No description provided for @radioListTile.
  ///
  /// In fr, this message translates to:
  /// **'RadioListe'**
  String get radioListTile;

  /// No description provided for @radioListTileDisabled.
  ///
  /// In fr, this message translates to:
  /// **'RadioListe désactivé'**
  String get radioListTileDisabled;

  /// No description provided for @radioOptionListSelected.
  ///
  /// In fr, this message translates to:
  /// **'La liste de bouton radio et la tuile de liste sont sélectionnées'**
  String get radioOptionListSelected;

  /// No description provided for @radioOptionSelected.
  ///
  /// In fr, this message translates to:
  /// **'L\'option radio est sélectionnée'**
  String get radioOptionSelected;

  /// No description provided for @radioOptionUnselected.
  ///
  /// In fr, this message translates to:
  /// **'L\'option radio est désélectionnée'**
  String get radioOptionUnselected;

  /// No description provided for @rangeSliderContinuous.
  ///
  /// In fr, this message translates to:
  /// **'Curseur de gamme continu'**
  String get rangeSliderContinuous;

  /// No description provided for @rangeSliderContinuousDisabled.
  ///
  /// In fr, this message translates to:
  /// **'Curseur de gamme continu désactivé'**
  String get rangeSliderContinuousDisabled;

  /// No description provided for @rangeSliderStepped.
  ///
  /// In fr, this message translates to:
  /// **'RangeSlider en escalier'**
  String get rangeSliderStepped;

  /// No description provided for @rangeSliderSteppedDisabled.
  ///
  /// In fr, this message translates to:
  /// **'RangeSlider en escalier désactivé'**
  String get rangeSliderSteppedDisabled;

  /// No description provided for @refresh.
  ///
  /// In fr, this message translates to:
  /// **'Rafraîchir'**
  String get refresh;

  /// No description provided for @register.
  ///
  /// In fr, this message translates to:
  /// **'Enregistrer'**
  String get register;

  /// No description provided for @rentalDate.
  ///
  /// In fr, this message translates to:
  /// **'date de location'**
  String get rentalDate;

  /// No description provided for @rentalDateStart.
  ///
  /// In fr, this message translates to:
  /// **'Début de la location'**
  String get rentalDateStart;

  /// No description provided for @rentalDateStop.
  ///
  /// In fr, this message translates to:
  /// **'date de retour'**
  String get rentalDateStop;

  /// No description provided for @replications.
  ///
  /// In fr, this message translates to:
  /// **'Reproductions'**
  String get replications;

  /// No description provided for @required.
  ///
  /// In fr, this message translates to:
  /// **'requis'**
  String get required;

  /// No description provided for @reset.
  ///
  /// In fr, this message translates to:
  /// **'Réinitialiser'**
  String get reset;

  /// No description provided for @resetAll.
  ///
  /// In fr, this message translates to:
  /// **'Tout réinitialiser'**
  String get resetAll;

  /// No description provided for @resetSettingsTitle.
  ///
  /// In fr, this message translates to:
  /// **'Réinitialiser les paramètres'**
  String get resetSettingsTitle;

  /// No description provided for @role.
  ///
  /// In fr, this message translates to:
  /// **'Rôle'**
  String get role;

  /// No description provided for @save.
  ///
  /// In fr, this message translates to:
  /// **'Sauvegarder'**
  String get save;

  /// No description provided for @saveNow.
  ///
  /// In fr, this message translates to:
  /// **'Sauvegarder maintenant'**
  String get saveNow;

  /// No description provided for @screenWidth.
  ///
  /// In fr, this message translates to:
  /// **'Largeur d\'écran'**
  String get screenWidth;

  /// No description provided for @search.
  ///
  /// In fr, this message translates to:
  /// **'Recherche'**
  String get search;

  /// No description provided for @searchUsers.
  ///
  /// In fr, this message translates to:
  /// **'Recherche d\'utilisateurs'**
  String get searchUsers;

  /// No description provided for @secret.
  ///
  /// In fr, this message translates to:
  /// **'Secret'**
  String get secret;

  /// No description provided for @securityDescription.
  ///
  /// In fr, this message translates to:
  /// **'Verrouillage d\'écran, Find My Device, sécurité des applications'**
  String get securityDescription;

  /// No description provided for @securitySafeBrowsingDescription.
  ///
  /// In fr, this message translates to:
  /// **'Safe Browsing (protection contre les sites dangereux) et autres paramètres de sécurité'**
  String get securitySafeBrowsingDescription;

  /// No description provided for @securityTitle.
  ///
  /// In fr, this message translates to:
  /// **'Sécurité'**
  String get securityTitle;

  /// No description provided for @selectDialog.
  ///
  /// In fr, this message translates to:
  /// **'Sélectionner le dialogue'**
  String get selectDialog;

  /// No description provided for @selectUserGuess.
  ///
  /// In fr, this message translates to:
  /// **'sélectionner un utilisateur fictif'**
  String get selectUserGuess;

  /// No description provided for @settings.
  ///
  /// In fr, this message translates to:
  /// **'Paramètres'**
  String get settings;

  /// No description provided for @show.
  ///
  /// In fr, this message translates to:
  /// **'Afficher'**
  String get show;

  /// No description provided for @showMessage.
  ///
  /// In fr, this message translates to:
  /// **'Afficher le message'**
  String get showMessage;

  /// No description provided for @showcase.
  ///
  /// In fr, this message translates to:
  /// **'Présentation'**
  String get showcase;

  /// No description provided for @showcaseErrorText.
  ///
  /// In fr, this message translates to:
  /// **'Toute entrée sans \"a\" déclenchera cette erreur.'**
  String get showcaseErrorText;

  /// No description provided for @showcaseHintCollapseText.
  ///
  /// In fr, this message translates to:
  /// **'Indice : champ de texte réduit...'**
  String get showcaseHintCollapseText;

  /// No description provided for @showcaseHintText.
  ///
  /// In fr, this message translates to:
  /// **'Conseil : Écrivez quelque chose...'**
  String get showcaseHintText;

  /// No description provided for @showcaseLabelTextOutline.
  ///
  /// In fr, this message translates to:
  /// **'Label: Bordure de contour par défaut si elle n\'est pas définie'**
  String get showcaseLabelTextOutline;

  /// No description provided for @showcaseLabelTextUnder.
  ///
  /// In fr, this message translates to:
  /// **'Label: Bordure soulignée par défaut si elle n\'est pas définie'**
  String get showcaseLabelTextUnder;

  /// No description provided for @showcaseListTileSelectedSubTitle.
  ///
  /// In fr, this message translates to:
  /// **'Sous-titre de la Liste sélectionnée'**
  String get showcaseListTileSelectedSubTitle;

  /// No description provided for @showcaseListTileSelectedTitle.
  ///
  /// In fr, this message translates to:
  /// **'Liste sélectionné'**
  String get showcaseListTileSelectedTitle;

  /// No description provided for @showcaseListTileSubTitle.
  ///
  /// In fr, this message translates to:
  /// **'Sous-titre de la Liste'**
  String get showcaseListTileSubTitle;

  /// No description provided for @showcaseListTileTitle.
  ///
  /// In fr, this message translates to:
  /// **'Liste'**
  String get showcaseListTileTitle;

  /// No description provided for @showcaseListTileTrailing.
  ///
  /// In fr, this message translates to:
  /// **'Arrière'**
  String get showcaseListTileTrailing;

  /// No description provided for @signInWithEmailPassword.
  ///
  /// In fr, this message translates to:
  /// **'Se connecter avec email et mot de passe'**
  String get signInWithEmailPassword;

  /// No description provided for @signInWithGoogle.
  ///
  /// In fr, this message translates to:
  /// **'Se connecter avec Google'**
  String get signInWithGoogle;

  /// No description provided for @signOut.
  ///
  /// In fr, this message translates to:
  /// **'Se déconnecter'**
  String get signOut;

  /// No description provided for @siteSettingsDescription.
  ///
  /// In fr, this message translates to:
  /// **'Contrôle les informations que les sites peuvent utiliser et afficher (emplacement, appareil photo, fenêtres pop-up, etc.)'**
  String get siteSettingsDescription;

  /// No description provided for @siteSettingsTitle.
  ///
  /// In fr, this message translates to:
  /// **'Paramètres du site'**
  String get siteSettingsTitle;

  /// No description provided for @sliderContinuous.
  ///
  /// In fr, this message translates to:
  /// **'Curseur continu'**
  String get sliderContinuous;

  /// No description provided for @sliderContinuousDisabled.
  ///
  /// In fr, this message translates to:
  /// **'Curseur continu désactivé'**
  String get sliderContinuousDisabled;

  /// No description provided for @sliderStepped.
  ///
  /// In fr, this message translates to:
  /// **'Curseur continu en escalier'**
  String get sliderStepped;

  /// No description provided for @sliderSteppedDisabled.
  ///
  /// In fr, this message translates to:
  /// **'Curseur continu en escalier désactivé'**
  String get sliderSteppedDisabled;

  /// No description provided for @sliverAppBar.
  ///
  /// In fr, this message translates to:
  /// **'Barre d\'applications argentée'**
  String get sliverAppBar;

  /// No description provided for @sliverAppBarLarge.
  ///
  /// In fr, this message translates to:
  /// **'AppBar de couleur argentée grand format'**
  String get sliverAppBarLarge;

  /// No description provided for @sliverAppBarMedium.
  ///
  /// In fr, this message translates to:
  /// **'AppBar de couleur argentée moyen format'**
  String get sliverAppBarMedium;

  /// No description provided for @small.
  ///
  /// In fr, this message translates to:
  /// **'Petit'**
  String get small;

  /// No description provided for @somethingWentWrong.
  ///
  /// In fr, this message translates to:
  /// **'Quelque chose n\'a pas fonctionné'**
  String get somethingWentWrong;

  /// No description provided for @soundVibrationDescription.
  ///
  /// In fr, this message translates to:
  /// **'Volume, haptique, ne pas déranger'**
  String get soundVibrationDescription;

  /// No description provided for @soundVibrationTitle.
  ///
  /// In fr, this message translates to:
  /// **'Son & vibrations'**
  String get soundVibrationTitle;

  /// No description provided for @startDialog.
  ///
  /// In fr, this message translates to:
  /// **'Commencer le dialogue'**
  String get startDialog;

  /// No description provided for @stateResSettings.
  ///
  /// In fr, this message translates to:
  /// **'Test de restauration de l\'État'**
  String get stateResSettings;

  /// No description provided for @storage.
  ///
  /// In fr, this message translates to:
  /// **'Stockage'**
  String get storage;

  /// No description provided for @storageDescription.
  ///
  /// In fr, this message translates to:
  /// **'30% utilisé - 5.60 GB libre'**
  String get storageDescription;

  /// No description provided for @style.
  ///
  /// In fr, this message translates to:
  /// **'Style'**
  String get style;

  /// No description provided for @submit.
  ///
  /// In fr, this message translates to:
  /// **'Soumettre'**
  String get submit;

  /// No description provided for @success.
  ///
  /// In fr, this message translates to:
  /// **'Réussite'**
  String get success;

  /// No description provided for @successSignedUp.
  ///
  /// In fr, this message translates to:
  /// **'L\'inscription a été effectuée avec succès'**
  String get successSignedUp;

  /// No description provided for @surfaceArea.
  ///
  /// In fr, this message translates to:
  /// **'saisir la surface'**
  String get surfaceArea;

  /// No description provided for @surveillance.
  ///
  /// In fr, this message translates to:
  /// **'Surveillance'**
  String get surveillance;

  /// No description provided for @swapColors.
  ///
  /// In fr, this message translates to:
  /// **'Échange de couleurs'**
  String get swapColors;

  /// No description provided for @swapPrimarySecondaryDarkColors.
  ///
  /// In fr, this message translates to:
  /// **'Échanger les couleurs primaires et secondaires foncées'**
  String get swapPrimarySecondaryDarkColors;

  /// No description provided for @swapPrimarySecondaryLightColors.
  ///
  /// In fr, this message translates to:
  /// **'Échanger les couleurs primaires et secondaires'**
  String get swapPrimarySecondaryLightColors;

  /// No description provided for @switchHave.
  ///
  /// In fr, this message translates to:
  /// **'Vous en avez déjà un ? S\'identifier'**
  String get switchHave;

  /// No description provided for @switchHavent.
  ///
  /// In fr, this message translates to:
  /// **'Vous n\'avez pas de compte ? S\'inscrire'**
  String get switchHavent;

  /// No description provided for @switchListTileSubTitleOff.
  ///
  /// In fr, this message translates to:
  /// **'La liste d\'interrupteurs est inactif'**
  String get switchListTileSubTitleOff;

  /// No description provided for @switchListTileSubTitleOn.
  ///
  /// In fr, this message translates to:
  /// **'La liste d\'interrupteurs est activée'**
  String get switchListTileSubTitleOn;

  /// No description provided for @switchListTileTitle.
  ///
  /// In fr, this message translates to:
  /// **'La liste d\'interrupteurs'**
  String get switchListTileTitle;

  /// No description provided for @switchListTileTitleDisabled.
  ///
  /// In fr, this message translates to:
  /// **'La liste d\'interrupteurs désactivé'**
  String get switchListTileTitleDisabled;

  /// No description provided for @switchNoStatusBar.
  ///
  /// In fr, this message translates to:
  /// **'Ne concerne que la barre d\'état supérieure d\'Android'**
  String get switchNoStatusBar;

  /// No description provided for @tabBadgeLabel18.
  ///
  /// In fr, this message translates to:
  /// **'18'**
  String get tabBadgeLabel18;

  /// No description provided for @tabBadgeLabel3.
  ///
  /// In fr, this message translates to:
  /// **'3'**
  String get tabBadgeLabel3;

  /// No description provided for @tabBadgeLabel99.
  ///
  /// In fr, this message translates to:
  /// **'99'**
  String get tabBadgeLabel99;

  /// No description provided for @tabBarAppBar.
  ///
  /// In fr, this message translates to:
  /// **'TabBar dans une AppBar'**
  String get tabBarAppBar;

  /// No description provided for @tabBarIfAppBar.
  ///
  /// In fr, this message translates to:
  /// **'Si la barre d\'onglets est toujours utilisée dans une barre d\'application, utilisez le style FlexTabBar Style pour AppBar (par défaut), il s\'adaptera ici en fonction du contraste.'**
  String get tabBarIfAppBar;

  /// No description provided for @tabBarIfSurface.
  ///
  /// In fr, this message translates to:
  /// **'Si la barre d\'onglets est toujours utilisée avec des couleurs d\'arrière-plan et de surface, utilisez le style FlexTabBarStyle pour l\'arrière-plan.'**
  String get tabBarIfSurface;

  /// No description provided for @tabBarSurface.
  ///
  /// In fr, this message translates to:
  /// **'TabBar dans une Surface'**
  String get tabBarSurface;

  /// No description provided for @tabFolder.
  ///
  /// In fr, this message translates to:
  /// **'Dossier'**
  String get tabFolder;

  /// No description provided for @tenantId.
  ///
  /// In fr, this message translates to:
  /// **'Tenant ID'**
  String get tenantId;

  /// No description provided for @termsOfService.
  ///
  /// In fr, this message translates to:
  /// **'Conditions d\'utilisation | Politique de confidentialité'**
  String get termsOfService;

  /// No description provided for @textIcon.
  ///
  /// In fr, this message translates to:
  /// **'Icône texte'**
  String get textIcon;

  /// No description provided for @theme.
  ///
  /// In fr, this message translates to:
  /// **'Thème'**
  String get theme;

  /// No description provided for @themeColors.
  ///
  /// In fr, this message translates to:
  /// **'Thème Couleurs'**
  String get themeColors;

  /// No description provided for @themeDataColors.
  ///
  /// In fr, this message translates to:
  /// **'Couleurs des données du thème'**
  String get themeDataColors;

  /// No description provided for @themeModeTitle.
  ///
  /// In fr, this message translates to:
  /// **'Mode thématique'**
  String get themeModeTitle;

  /// No description provided for @themeSettings.
  ///
  /// In fr, this message translates to:
  /// **'Paramètres du thème'**
  String get themeSettings;

  /// No description provided for @themeShowcase.
  ///
  /// In fr, this message translates to:
  /// **'Présentation du thème'**
  String get themeShowcase;

  /// No description provided for @themeShowcaseText.
  ///
  /// In fr, this message translates to:
  /// **'Montre les couleurs du thème et le thème basé sur FlexColorScheme appliqué aux widgets communs. Il y a aussi une NavigationBar et une TabBar dans l\'AppBar, pour montrer à quoi elles ressemblent, mais elles ne font rien.'**
  String get themeShowcaseText;

  /// No description provided for @timePickerDialog.
  ///
  /// In fr, this message translates to:
  /// **'Boîte de dialogue de sélection de l\'heure'**
  String get timePickerDialog;

  /// No description provided for @title.
  ///
  /// In fr, this message translates to:
  /// **'Titre'**
  String get title;

  /// No description provided for @toYourEmailAddress.
  ///
  /// In fr, this message translates to:
  /// **'à votre adresse électronique'**
  String get toYourEmailAddress;

  /// No description provided for @token.
  ///
  /// In fr, this message translates to:
  /// **'jeton'**
  String get token;

  /// No description provided for @tooHigh.
  ///
  /// In fr, this message translates to:
  /// **'\\nTrop élevé'**
  String get tooHigh;

  /// No description provided for @tooltipCA.
  ///
  /// In fr, this message translates to:
  /// **'CA'**
  String get tooltipCA;

  /// No description provided for @tooltipCircleAvatar.
  ///
  /// In fr, this message translates to:
  /// **'Il s\'agit d\'un avatar circulaire'**
  String get tooltipCircleAvatar;

  /// No description provided for @tooltipIcon.
  ///
  /// In fr, this message translates to:
  /// **'C\'est une icône'**
  String get tooltipIcon;

  /// No description provided for @tooltipIconButton.
  ///
  /// In fr, this message translates to:
  /// **'Il s\'agit d\'un bouton icône'**
  String get tooltipIconButton;

  /// No description provided for @tooltipIconComment.
  ///
  /// In fr, this message translates to:
  /// **'Icône de commentaire'**
  String get tooltipIconComment;

  /// No description provided for @tooltipIconMenu.
  ///
  /// In fr, this message translates to:
  /// **'Icône de menu'**
  String get tooltipIconMenu;

  /// No description provided for @tooltipIconSettings.
  ///
  /// In fr, this message translates to:
  /// **'Icône des paramètres'**
  String get tooltipIconSettings;

  /// No description provided for @tooltipMessageLevelSurfaces.
  ///
  /// In fr, this message translates to:
  /// **'Surfaces planes échafaudage bas'**
  String get tooltipMessageLevelSurfaces;

  /// No description provided for @tooltipMessageScaffold.
  ///
  /// In fr, this message translates to:
  /// **'Échafaudage élevé surface basse'**
  String get tooltipMessageScaffold;

  /// No description provided for @tooltipMessageSurface.
  ///
  /// In fr, this message translates to:
  /// **'Surface élevée, échafaudage bas'**
  String get tooltipMessageSurface;

  /// No description provided for @tooltipMessageTertiaryContainerDialog.
  ///
  /// In fr, this message translates to:
  /// **'Dialogue sur le contenant tertiaire échafaudage bas'**
  String get tooltipMessageTertiaryContainerDialog;

  /// No description provided for @tooltipOpenNavigationMenu.
  ///
  /// In fr, this message translates to:
  /// **'Ouvrir le menu de navigation'**
  String get tooltipOpenNavigationMenu;

  /// No description provided for @tooltipShowcaseMessage1.
  ///
  /// In fr, this message translates to:
  /// **'Thème actuel de l\'info-bulle'**
  String get tooltipShowcaseMessage1;

  /// No description provided for @tooltipShowcaseMessage2.
  ///
  /// In fr, this message translates to:
  /// **'Thème actuel de l\'info-bulle. Il s\'agit d\'une info-bulle à deux lignes.'**
  String get tooltipShowcaseMessage2;

  /// No description provided for @tooltipShowcaseMessage3.
  ///
  /// In fr, this message translates to:
  /// **'Thème actuel de l\'info-bulle. Cette info-bulle est trop longue. Essayez de les raccourcir.'**
  String get tooltipShowcaseMessage3;

  /// No description provided for @tooltipShowcaseText1.
  ///
  /// In fr, this message translates to:
  /// **'Texte avec info-bulle'**
  String get tooltipShowcaseText1;

  /// No description provided for @tooltipShowcaseText2.
  ///
  /// In fr, this message translates to:
  /// **'Texte avec info-bulle sur deux rangs'**
  String get tooltipShowcaseText2;

  /// No description provided for @tooltipShowcaseText3.
  ///
  /// In fr, this message translates to:
  /// **'Texte avec info-bulle à trois rangs'**
  String get tooltipShowcaseText3;

  /// No description provided for @tooltipStandard.
  ///
  /// In fr, this message translates to:
  /// **'Standard'**
  String get tooltipStandard;

  /// No description provided for @tooltipStandardDisabled.
  ///
  /// In fr, this message translates to:
  /// **'Standard (désactivé)'**
  String get tooltipStandardDisabled;

  /// No description provided for @uiAutomationEnable.
  ///
  /// In fr, this message translates to:
  /// **'Activer l\'automatisation de l\'IU'**
  String get uiAutomationEnable;

  /// No description provided for @uiAutomationTitle.
  ///
  /// In fr, this message translates to:
  /// **'Automatisation de l\'interface utilisateur'**
  String get uiAutomationTitle;

  /// No description provided for @ukctbTooltipMessP.
  ///
  /// In fr, this message translates to:
  /// **'Utilisez la couleur primaire du thème de la lumière comme couleur clé pour initier votre ColorScheme.'**
  String get ukctbTooltipMessP;

  /// No description provided for @ukctbTooltipMessS.
  ///
  /// In fr, this message translates to:
  /// **'Utiliser le thème de lumière Couleur secondaire Couleur clé pour ensemencer votre ColorScheme'**
  String get ukctbTooltipMessS;

  /// No description provided for @ukctbTooltipMessT.
  ///
  /// In fr, this message translates to:
  /// **'Utiliser le thème de la lumière Couleur tertiaire Couleur clé pour ensemencer votre ColorScheme'**
  String get ukctbTooltipMessT;

  /// No description provided for @unAvailable.
  ///
  /// In fr, this message translates to:
  /// **'Indisponible'**
  String get unAvailable;

  /// No description provided for @unEnroll.
  ///
  /// In fr, this message translates to:
  /// **'Désinscription de l\'AMF'**
  String get unEnroll;

  /// No description provided for @underline.
  ///
  /// In fr, this message translates to:
  /// **'Souligner'**
  String get underline;

  /// No description provided for @unlimitedAdPresentation.
  ///
  /// In fr, this message translates to:
  /// **'Présentation illimitée des annonces'**
  String get unlimitedAdPresentation;

  /// No description provided for @update.
  ///
  /// In fr, this message translates to:
  /// **'Mise à jour'**
  String get update;

  /// No description provided for @updateAddress.
  ///
  /// In fr, this message translates to:
  /// **'actualiser l\'adresse'**
  String get updateAddress;

  /// No description provided for @updateContact.
  ///
  /// In fr, this message translates to:
  /// **'Actualiser le contact'**
  String get updateContact;

  /// No description provided for @updateDialog.
  ///
  /// In fr, this message translates to:
  /// **'Actualiser la boîte de dialogue'**
  String get updateDialog;

  /// No description provided for @updateOwner.
  ///
  /// In fr, this message translates to:
  /// **'mettre à jour du propriétaire'**
  String get updateOwner;

  /// No description provided for @updateProfile.
  ///
  /// In fr, this message translates to:
  /// **'Actualiser le profil'**
  String get updateProfile;

  /// No description provided for @useLevelZero.
  ///
  /// In fr, this message translates to:
  /// **'. Avec le ColorScheme semé, pour un design de surface M3 pur, utilisez le niveau 0.'**
  String get useLevelZero;

  /// No description provided for @useLightThemeColors.
  ///
  /// In fr, this message translates to:
  /// **'Utiliser les couleurs claires du thème pour ensemencer le ColorScheme'**
  String get useLightThemeColors;

  /// No description provided for @useMaterial3Title.
  ///
  /// In fr, this message translates to:
  /// **'Utiliser Material 3'**
  String get useMaterial3Title;

  /// No description provided for @useSeedSubTitle.
  ///
  /// In fr, this message translates to:
  /// **'Utilisez les FlexTones pour configurer le ton des palettes générées que chaque couleur du ColorScheme utilise. Définissez les limites des valeurs chromatiques CAM16 utilisées pour les trois couleurs utilisées comme clés pour les palettes tonales primaires, secondaires et tertiaires. Dans cette application, vous pouvez choisir entre le mappage de tons par défaut de Material 3 et six configurations FlexTones personnalisées prédéfinies.'**
  String get useSeedSubTitle;

  /// No description provided for @useSubThemesSubTitle.
  ///
  /// In fr, this message translates to:
  /// **'Activer le schéma FlexColor pour les sous-thèmes d\'opinion'**
  String get useSubThemesSubTitle;

  /// No description provided for @useSubThemesTitle.
  ///
  /// In fr, this message translates to:
  /// **'Utiliser les thèmes des composants'**
  String get useSubThemesTitle;

  /// No description provided for @useThemesSubTitle.
  ///
  /// In fr, this message translates to:
  /// **'Le réglage par défaut utilise principalement les valeurs de conception du matériau 3, où les spécifications de rayon varient selon les composants. La conception du matériau 2 utilise la valeur 4 pour tous les composants.'**
  String get useThemesSubTitle;

  /// No description provided for @useThemesTitle.
  ///
  /// In fr, this message translates to:
  /// **'Rayon de la bordure globale sur les composants'**
  String get useThemesTitle;

  /// No description provided for @useTrueBlack.
  ///
  /// In fr, this message translates to:
  /// **'Utiliser le noir véritable'**
  String get useTrueBlack;

  /// No description provided for @usedPlatformMechanics.
  ///
  /// In fr, this message translates to:
  /// **'utilisée la platform mechanics'**
  String get usedPlatformMechanics;

  /// No description provided for @userAnonymous.
  ///
  /// In fr, this message translates to:
  /// **'L\'utilisateur est anonyme'**
  String get userAnonymous;

  /// No description provided for @userFirstName.
  ///
  /// In fr, this message translates to:
  /// **'Prénom de l\'utilisateur'**
  String get userFirstName;

  /// No description provided for @userId.
  ///
  /// In fr, this message translates to:
  /// **'Identifiant de l\'utilisateur'**
  String get userId;

  /// No description provided for @userInfo.
  ///
  /// In fr, this message translates to:
  /// **'Info utilisateur'**
  String get userInfo;

  /// No description provided for @userName.
  ///
  /// In fr, this message translates to:
  /// **'Nom'**
  String get userName;

  /// No description provided for @userNotFound.
  ///
  /// In fr, this message translates to:
  /// **'Impossible de trouver l\'utilisateur'**
  String get userNotFound;

  /// No description provided for @valueFive.
  ///
  /// In fr, this message translates to:
  /// **'cinq'**
  String get valueFive;

  /// No description provided for @valueFour.
  ///
  /// In fr, this message translates to:
  /// **'quatre'**
  String get valueFour;

  /// No description provided for @valueOne.
  ///
  /// In fr, this message translates to:
  /// **'un'**
  String get valueOne;

  /// No description provided for @valueThree.
  ///
  /// In fr, this message translates to:
  /// **'trois'**
  String get valueThree;

  /// No description provided for @valueTwo.
  ///
  /// In fr, this message translates to:
  /// **'deux'**
  String get valueTwo;

  /// No description provided for @verification.
  ///
  /// In fr, this message translates to:
  /// **'Vérification'**
  String get verification;

  /// No description provided for @verificationCode.
  ///
  /// In fr, this message translates to:
  /// **'Code de vérification'**
  String get verificationCode;

  /// No description provided for @verificationCodeSent.
  ///
  /// In fr, this message translates to:
  /// **'Saisir le code de vérification envoyé'**
  String get verificationCodeSent;

  /// No description provided for @verified.
  ///
  /// In fr, this message translates to:
  /// **'vérifié'**
  String get verified;

  /// No description provided for @verify.
  ///
  /// In fr, this message translates to:
  /// **'Vérification'**
  String get verify;

  /// No description provided for @viewDescription.
  ///
  /// In fr, this message translates to:
  /// **'Choisissez une vue pour l\'iPhone. L\'agrandissement permet d\'afficher des commandes plus grandes. La version standard affiche plus de contenu.'**
  String get viewDescription;

  /// No description provided for @viewTitle.
  ///
  /// In fr, this message translates to:
  /// **'Vue'**
  String get viewTitle;

  /// No description provided for @volume.
  ///
  /// In fr, this message translates to:
  /// **'Volume'**
  String get volume;

  /// No description provided for @wallpaperStyleDescription.
  ///
  /// In fr, this message translates to:
  /// **'Couleurs, icônes thématiques, grille d\'application'**
  String get wallpaperStyleDescription;

  /// No description provided for @wallpaperStyleTitle.
  ///
  /// In fr, this message translates to:
  /// **'Papier peint et style'**
  String get wallpaperStyleTitle;

  /// No description provided for @waterDamage.
  ///
  /// In fr, this message translates to:
  /// **'Dégâts des eaux'**
  String get waterDamage;

  /// No description provided for @webSettingsTitle.
  ///
  /// In fr, this message translates to:
  /// **'Paramètres Web'**
  String get webSettingsTitle;

  /// No description provided for @week.
  ///
  /// In fr, this message translates to:
  /// **'Semaine'**
  String get week;

  /// No description provided for @welcome.
  ///
  /// In fr, this message translates to:
  /// **'Bienvenue'**
  String get welcome;

  /// No description provided for @welcomeBack.
  ///
  /// In fr, this message translates to:
  /// **'Bon retour'**
  String get welcomeBack;

  /// No description provided for @wirelessAlert.
  ///
  /// In fr, this message translates to:
  /// **'Alertes d\'urgence sans fil'**
  String get wirelessAlert;

  /// No description provided for @woodCabin.
  ///
  /// In fr, this message translates to:
  /// **'Cabine en bois'**
  String get woodCabin;

  /// No description provided for @year.
  ///
  /// In fr, this message translates to:
  /// **'Année'**
  String get year;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'es', 'fr'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'es':
      return AppLocalizationsEs();
    case 'fr':
      return AppLocalizationsFr();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
