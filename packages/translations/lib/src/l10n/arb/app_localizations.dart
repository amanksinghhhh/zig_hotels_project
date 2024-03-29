import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'arb/app_localizations.dart';
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

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
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
    Locale('en')
  ];

  /// No description provided for @app_title.
  ///
  /// In en, this message translates to:
  /// **'ZigHotels'**
  String get app_title;

  /// No description provided for @slogan.
  ///
  /// In en, this message translates to:
  /// **'Your Comfort, Our Commitment'**
  String get slogan;

  /// No description provided for @login.
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get login;

  /// No description provided for @welcome.
  ///
  /// In en, this message translates to:
  /// **'Welcome'**
  String get welcome;

  /// No description provided for @loginToExperience.
  ///
  /// In en, this message translates to:
  /// **'Login to experience  best guest service'**
  String get loginToExperience;

  /// No description provided for @roomNumber.
  ///
  /// In en, this message translates to:
  /// **'Room Number'**
  String get roomNumber;

  /// No description provided for @lastName.
  ///
  /// In en, this message translates to:
  /// **'Last Name'**
  String get lastName;

  /// No description provided for @invalidCredentials.
  ///
  /// In en, this message translates to:
  /// **'Invalid credentials or Not Checked In'**
  String get invalidCredentials;

  /// No description provided for @room.
  ///
  /// In en, this message translates to:
  /// **'Room'**
  String get room;

  /// No description provided for @home.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get home;

  /// No description provided for @roomControl.
  ///
  /// In en, this message translates to:
  /// **'Room Control'**
  String get roomControl;

  /// No description provided for @entertainment.
  ///
  /// In en, this message translates to:
  /// **'Entertainment'**
  String get entertainment;

  /// No description provided for @more.
  ///
  /// In en, this message translates to:
  /// **'More'**
  String get more;

  /// No description provided for @roomServices.
  ///
  /// In en, this message translates to:
  /// **'Room Services'**
  String get roomServices;

  /// No description provided for @roomDining.
  ///
  /// In en, this message translates to:
  /// **'Room Dining'**
  String get roomDining;

  /// No description provided for @restaurantsBars.
  ///
  /// In en, this message translates to:
  /// **'Restaurants & Bars'**
  String get restaurantsBars;

  /// No description provided for @whereToGo.
  ///
  /// In en, this message translates to:
  /// **'Where to go ?'**
  String get whereToGo;

  /// No description provided for @spa.
  ///
  /// In en, this message translates to:
  /// **'Spa & Massage'**
  String get spa;

  /// No description provided for @checkIn.
  ///
  /// In en, this message translates to:
  /// **'Check In'**
  String get checkIn;

  /// No description provided for @checkOut.
  ///
  /// In en, this message translates to:
  /// **'Check Out'**
  String get checkOut;

  /// No description provided for @nights.
  ///
  /// In en, this message translates to:
  /// **'Nights'**
  String get nights;

  /// No description provided for @quickServices.
  ///
  /// In en, this message translates to:
  /// **'Quick Services'**
  String get quickServices;

  /// No description provided for @roomMakeUp.
  ///
  /// In en, this message translates to:
  /// **'Room Make-up'**
  String get roomMakeUp;

  /// No description provided for @laundryAndDry.
  ///
  /// In en, this message translates to:
  /// **'Laundry & Dry Cleaning'**
  String get laundryAndDry;

  /// No description provided for @minibarRefill.
  ///
  /// In en, this message translates to:
  /// **'Minibar Refill'**
  String get minibarRefill;

  /// No description provided for @extraPillow.
  ///
  /// In en, this message translates to:
  /// **'Extra Pillow'**
  String get extraPillow;

  /// No description provided for @trayRemoval.
  ///
  /// In en, this message translates to:
  /// **'Tray Removal'**
  String get trayRemoval;

  /// No description provided for @luggageService.
  ///
  /// In en, this message translates to:
  /// **'Luggage service'**
  String get luggageService;

  /// No description provided for @hours24.
  ///
  /// In en, this message translates to:
  /// **'24 hours'**
  String get hours24;

  /// No description provided for @time8To22.
  ///
  /// In en, this message translates to:
  /// **'08:00-22:00'**
  String get time8To22;

  /// No description provided for @restaurantsAndBar.
  ///
  /// In en, this message translates to:
  /// **'Restaurants & Bar'**
  String get restaurantsAndBar;

  /// No description provided for @spaAndFitness.
  ///
  /// In en, this message translates to:
  /// **'Spa & Fitness'**
  String get spaAndFitness;

  /// No description provided for @indianRes.
  ///
  /// In en, this message translates to:
  /// **'Indian Restaurant'**
  String get indianRes;

  /// No description provided for @italianCafe.
  ///
  /// In en, this message translates to:
  /// **'The Italian Cafe'**
  String get italianCafe;

  /// No description provided for @heavenBar.
  ///
  /// In en, this message translates to:
  /// **'Heaven Bar'**
  String get heavenBar;

  /// No description provided for @lobbyBar.
  ///
  /// In en, this message translates to:
  /// **'Lobby Bar'**
  String get lobbyBar;

  /// No description provided for @massageAndBeauty.
  ///
  /// In en, this message translates to:
  /// **'Massage & Beauty Treatments'**
  String get massageAndBeauty;

  /// No description provided for @spaRitualBy.
  ///
  /// In en, this message translates to:
  /// **'SPA Ritual by L\'Occitane'**
  String get spaRitualBy;

  /// No description provided for @gym.
  ///
  /// In en, this message translates to:
  /// **'Gym'**
  String get gym;

  /// No description provided for @sauna.
  ///
  /// In en, this message translates to:
  /// **'Sauna'**
  String get sauna;

  /// No description provided for @hotelInfo.
  ///
  /// In en, this message translates to:
  /// **'Hotel Information'**
  String get hotelInfo;

  /// No description provided for @myOrders.
  ///
  /// In en, this message translates to:
  /// **'My Orders'**
  String get myOrders;

  /// No description provided for @feedback.
  ///
  /// In en, this message translates to:
  /// **'Feedback'**
  String get feedback;

  /// No description provided for @logout.
  ///
  /// In en, this message translates to:
  /// **'Logout'**
  String get logout;

  /// No description provided for @settings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settings;

  /// No description provided for @viewBills.
  ///
  /// In en, this message translates to:
  /// **'View Bills'**
  String get viewBills;

  /// No description provided for @viewMenu.
  ///
  /// In en, this message translates to:
  /// **'View Menu'**
  String get viewMenu;

  /// No description provided for @configure.
  ///
  /// In en, this message translates to:
  /// **'Configure'**
  String get configure;

  /// No description provided for @continueAction.
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get continueAction;

  /// No description provided for @notCheckedIn.
  ///
  /// In en, this message translates to:
  /// **'Please check in to continue!'**
  String get notCheckedIn;

  /// No description provided for @required.
  ///
  /// In en, this message translates to:
  /// **'Required'**
  String get required;

  /// No description provided for @backAgainToExit.
  ///
  /// In en, this message translates to:
  /// **'Please back again to exit!'**
  String get backAgainToExit;

  /// No description provided for @confirm.
  ///
  /// In en, this message translates to:
  /// **'Confirm'**
  String get confirm;

  /// No description provided for @deliveryTime.
  ///
  /// In en, this message translates to:
  /// **'Delivery Time'**
  String get deliveryTime;

  /// No description provided for @selectTime.
  ///
  /// In en, this message translates to:
  /// **'Select Time'**
  String get selectTime;

  /// No description provided for @optional.
  ///
  /// In en, this message translates to:
  /// **'Optional'**
  String get optional;

  /// No description provided for @specialRequest.
  ///
  /// In en, this message translates to:
  /// **'Special request'**
  String get specialRequest;

  /// No description provided for @confirmOrder.
  ///
  /// In en, this message translates to:
  /// **'CONFIRM ORDER'**
  String get confirmOrder;

  /// No description provided for @serviceAvailable.
  ///
  /// In en, this message translates to:
  /// **'Service will be available for this'**
  String get serviceAvailable;

  /// No description provided for @timeOnly.
  ///
  /// In en, this message translates to:
  /// **'time only'**
  String get timeOnly;

  /// No description provided for @selectDateTime.
  ///
  /// In en, this message translates to:
  /// **'Please select a date and time'**
  String get selectDateTime;

  /// No description provided for @serviceBooked.
  ///
  /// In en, this message translates to:
  /// **'Service Booked'**
  String get serviceBooked;

  /// No description provided for @internetNotAvailable.
  ///
  /// In en, this message translates to:
  /// **'Internet not available !'**
  String get internetNotAvailable;

  /// No description provided for @details.
  ///
  /// In en, this message translates to:
  /// **'Details'**
  String get details;

  /// No description provided for @cancelOrder.
  ///
  /// In en, this message translates to:
  /// **'Cancel Order'**
  String get cancelOrder;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @close.
  ///
  /// In en, this message translates to:
  /// **'Close'**
  String get close;

  /// No description provided for @orderCancelledMsg.
  ///
  /// In en, this message translates to:
  /// **'Your order has been cancelled'**
  String get orderCancelledMsg;

  /// No description provided for @questionForCancelOrder.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to Cancel Order?'**
  String get questionForCancelOrder;

  /// No description provided for @noOrders.
  ///
  /// In en, this message translates to:
  /// **'No Orders'**
  String get noOrders;

  /// No description provided for @somethingWentWrong.
  ///
  /// In en, this message translates to:
  /// **'Something went wrong'**
  String get somethingWentWrong;

  /// No description provided for @loading.
  ///
  /// In en, this message translates to:
  /// **'Loading'**
  String get loading;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en': return AppLocalizationsEn();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
