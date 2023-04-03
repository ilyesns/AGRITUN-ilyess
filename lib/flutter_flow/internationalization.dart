import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'ar', 'fr'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? enText = '',
    String? arText = '',
    String? frText = '',
  }) =>
      [enText, arText, frText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    final language = locale.toString();
    return FFLocalizations.languages().contains(
      language.endsWith('_')
          ? language.substring(0, language.length - 1)
          : language,
    );
  }

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // loginPage
  {
    '4jyk2wx9': {
      'en': 'Login',
      'ar': 'تسجيل الدخول',
      'fr': 'Connexion',
    },
    'rjgq9egz': {
      'en': 'Email Address',
      'ar': 'عنوان البريد الالكترونى',
      'fr': 'Adresse e-mail',
    },
    'pfhobyyk': {
      'en': 'Enter your email...',
      'ar': 'أدخل بريدك الإلكتروني ...',
      'fr': 'Entrer votre Email...',
    },
    '5ittcjvj': {
      'en': 'Password',
      'ar': 'كلمة المرور',
      'fr': 'Mot de passe',
    },
    'd2tgohj1': {
      'en': 'Enter your password...',
      'ar': 'ادخل كلمة السر...',
      'fr': 'Tapez votre mot de passe...',
    },
    '0xowvohp': {
      'en': 'Login',
      'ar': 'تسجيل الدخول',
      'fr': 'Connexion',
    },
    'c6skj922': {
      'en': 'Forgot Password',
      'ar': 'هل نسيت كلمة السر',
      'fr': 'Mot de passe oublié',
    },
    'g28gddv0': {
      'en': 'Or use a social account to login',
      'ar': 'أو استخدم حسابًا اجتماعيًا لتسجيل الدخول',
      'fr': 'Ou utilisez un compte social pour vous connecter',
    },
    '3n8f3ix7': {
      'en': 'Privacy Policy',
      'ar': '',
      'fr': '',
    },
    'ybl5yiyz': {
      'en': 'Register',
      'ar': 'تسجيل حساب جديد ',
      'fr': 's\'inscrire',
    },
    'k26gmnzy': {
      'en': 'Email Address',
      'ar': 'عنوان البريد الالكترونى',
      'fr': 'Adresse e-mail',
    },
    'oyvp17zr': {
      'en': 'Enter your email...',
      'ar': 'أدخل بريدك الإلكتروني ...',
      'fr': 'Entrer votre Email...',
    },
    'i8i3v1b5': {
      'en': 'Password',
      'ar': 'كلمة المرور',
      'fr': 'Mot de passe',
    },
    '6krw9f49': {
      'en': 'Enter your password...',
      'ar': 'ادخل كلمة السر...',
      'fr': 'Tapez votre mot de passe...',
    },
    'n1b2i3oz': {
      'en': 'Confirm Password',
      'ar': 'تأكيد كلمة المرور',
      'fr': 'Confirmez le mot de passe',
    },
    '2wzw2hnr': {
      'en': 'Enter your password...',
      'ar': 'ادخل كلمة السر...',
      'fr': 'Tapez votre mot de passe...',
    },
    'kixq8a7n': {
      'en': 'Create Account',
      'ar': 'إنشاء حساب ',
      'fr': 'Créer un compte',
    },
    'udlgcq9a': {
      'en': 'Or use a social account to login',
      'ar': 'أو استخدم حسابًا اجتماعيًا لتسجيل الدخول',
      'fr': 'Ou utilisez un compte social pour vous connecter',
    },
    'hukwexsq': {
      'en': 'Privacy Policy',
      'ar': '',
      'fr': '',
    },
    'g8uusqxr': {
      'en': 'Home',
      'ar': 'عنوان',
      'fr': 'Adresse',
    },
  },
  // completeProfile
  {
    '8ieon313': {
      'en': 'Complete Profile',
      'ar': 'الملف الشخصي الكامل',
      'fr': 'Profil complet',
    },
    'h7zt3fej': {
      'en': 'Upload a photo',
      'ar': 'قم بتحميل صورة.',
      'fr': 'Téléchargez une photo .',
    },
    'h996q16c': {
      'en': 'Your Name',
      'ar': 'اسمك',
      'fr': 'votre nom',
    },
    'varw0sgh': {
      'en': 'Please enter your name',
      'ar': 'رجاء ادخل اسما صحيحا...',
      'fr': 's\'il vous plait, entrez un nom valide...',
    },
    '4e7h7b68': {
      'en': 'Email Address',
      'ar': 'عنوان البريد الالكترونى',
      'fr': 'Adresse e-mail',
    },
    'yj5o2zqt': {
      'en': 'Your email',
      'ar': 'بريدك الالكتروني',
      'fr': 'Votre e-mail',
    },
    'wbmv6gp4': {
      'en': 'Your phone',
      'ar': 'هاتفك',
      'fr': 'Ton téléphone',
    },
    '49x4g676': {
      'en': 'i.e. +21612345678',
      'ar': 'أي +21612345678',
      'fr': 'c\'est-à-dire +21612345678',
    },
    'syce7pss': {
      'en': 'Your Age',
      'ar': 'عمرك',
      'fr': 'Ton âge',
    },
    '76dr6yf5': {
      'en': 'i.e. 20',
      'ar': 'أي 20',
      'fr': 'c\'est-à-dire 20',
    },
    'rzu7ssd9': {
      'en': 'Field is required',
      'ar': 'مطلوب',
      'fr': 'Champ requis',
    },
    'dtqsnbk0': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'الرجاء تحديد خيار من القائمة المنسدلة',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    '36gxw1ch': {
      'en': 'Field is required',
      'ar': 'مطلوب',
      'fr': 'Champ requis',
    },
    'hqrvapme': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'الرجاء تحديد خيار من القائمة المنسدلة',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    's9qvhe17': {
      'en': 'Field is required',
      'ar': 'مطلوب',
      'fr': 'Champ requis',
    },
    'd0t0ufp2': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'الرجاء تحديد خيار من القائمة المنسدلة',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    'r7bjv96a': {
      'en': 'Choose your location',
      'ar': 'اختر موقعك',
      'fr': 'Choisissez votre emplacement',
    },
    '86h536jf': {
      'en': 'Set location',
      'ar': 'تحديد المكان',
      'fr': 'Définir l\'emplacement',
    },
    'akkovrfi': {
      'en': 'Farmer',
      'ar': 'مزارع',
      'fr': 'Agriculteur',
    },
    'nonyvidq': {
      'en': 'Farmer',
      'ar': 'مزارع',
      'fr': 'Agriculteur',
    },
    'ed27to1p': {
      'en': 'Investor',
      'ar': 'المستثمر',
      'fr': 'Investisseur',
    },
    'ktn4epo2': {
      'en': 'Association',
      'ar': 'منظمة',
      'fr': 'Association',
    },
    'qckwcc40': {
      'en': 'Company',
      'ar': 'شركة',
      'fr': 'Compagnie',
    },
    'pdwpr658': {
      'en': 'Other',
      'ar': 'آخر',
      'fr': 'Autre',
    },
    '4ucjsg2h': {
      'en': 'Please select...',
      'ar': 'الرجاء تحديد ...',
      'fr': 'Veuillez sélectionner...',
    },
    'uzh8flum': {
      'en': 'Add Another Profile',
      'ar': 'إضافة ملف تعريف آخر',
      'fr': 'Ajouter un autre profil',
    },
    'akjj7xur': {
      'en': 'Save',
      'ar': 'حفظ',
      'fr': 'sauvegarder',
    },
    'ub49ybem': {
      'en': 'Home',
      'ar': 'مسكن',
      'fr': 'Maison',
    },
  },
  // forgotPassword
  {
    'qd0qqar9': {
      'en': 'Forgot Password',
      'ar': 'هل نسيت كلمة السر',
      'fr': 'Mot de passe oublié',
    },
    'i11hfga5': {
      'en':
          'Enter the email associated with your account and we will send you a verification code.',
      'ar': 'أدخل البريد الإلكتروني المرتبط بحسابك وسنرسل لك رمز التحقق.',
      'fr':
          'Entrez l\'e-mail associé à votre compte et nous vous enverrons un code de vérification.',
    },
    '1n0d6h0n': {
      'en': 'Email Address',
      'ar': 'عنوان البريد الالكترونى',
      'fr': 'Adresse e-mail',
    },
    '1dbx58s6': {
      'en': 'Enter your email...',
      'ar': 'أدخل بريدك الإلكتروني ...',
      'fr': 'Entrer votre Email...',
    },
    'gjayhq13': {
      'en': 'Send Reset Link',
      'ar': 'أرسل رابط إعادة التعيين',
      'fr': 'Envoyer le lien de réinitialisation',
    },
    'y4z5w9cl': {
      'en': 'Home',
      'ar': 'مسكن',
      'fr': 'Maison',
    },
  },
  // profilePage
  {
    '712nghwf': {
      'en': 'Address',
      'ar': 'العنوان',
      'fr': 'Adresse',
    },
    '325j5yj4': {
      'en': 'Switch to Dark Mode',
      'ar': 'قم بالتبديل إلى الوضع الداكن',
      'fr': 'Passer en mode sombre',
    },
    'hic81ukl': {
      'en': 'Switch to Light Mode',
      'ar': 'قم بالتبديل إلى وضع الإضاءة',
      'fr': 'Passer en mode lumière',
    },
    'b30pg99t': {
      'en': 'Privacy Policy',
      'ar': '',
      'fr': '',
    },
    '15dt70dz': {
      'en': '•',
      'ar': '•',
      'fr': '•',
    },
  },
  // homePage
  {
    '58nlq1u0': {
      'en': '1',
      'ar': '1',
      'fr': '1',
    },
    '72sb06xe': {
      'en': 'YAGRI',
      'ar': 'YAGRI',
      'fr': 'YAGRI',
    },
    'mehfxrmb': {
      'en': 'Good Morning',
      'ar': 'صباح الخير',
      'fr': 'Bonjour',
    },
    'kvbg1ixz': {
      'en': 'Dashboard',
      'ar': 'لوحة القيادة',
      'fr': 'Tableau de bord',
    },
    'dhhsdu0y': {
      'en': 'Weather forecast',
      'ar': 'النشرة الجوية',
      'fr': 'Prévisions météorologiques',
    },
    'fnhlg4o0': {
      'en': '°C',
      'ar': 'درجة مئوية',
      'fr': '°C',
    },
    'x3nfeqtd': {
      'en': '%',
      'ar': '٪',
      'fr': '%',
    },
    'c4m2go26': {
      'en': 'm/s',
      'ar': 'تصلب متعدد',
      'fr': 'Mme',
    },
    'n8wqv7v0': {
      'en': 'Current tasks',
      'ar': 'المهام الحالية',
      'fr': 'Tâches en cours',
    },
    'bew9113s': {
      'en': 'Let\'s start :',
      'ar': 'لنبدأ :',
      'fr': 'Commençons :',
    },
    'j9yj3qn2': {
      'en': '•',
      'ar': '•',
      'fr': '•',
    },
  },
  // taskDetails
  {
    'w52zovxq': {
      'en': 'Details',
      'ar': 'تفاصيل',
      'fr': 'Détails',
    },
    'o4ect3o3': {
      'en': 'Edit task',
      'ar': 'تغيير المهمة',
      'fr': 'Modifier la tâche',
    },
    'ucwoez1a': {
      'en': 'For',
      'ar': 'إلى عن على',
      'fr': 'Pour',
    },
    'ky80ft3n': {
      'en': 'When',
      'ar': 'متي',
      'fr': 'Lorsque',
    },
    'b852evnq': {
      'en': 'Reschedule',
      'ar': 'إعادة الجدولة',
      'fr': 'Reprogrammer',
    },
    '2cn4n8dh': {
      'en': 'Cancel Task',
      'ar': 'إلغاء المهمة',
      'fr': 'Annuler la tâche',
    },
    '94lkqvcg': {
      'en': 'Home',
      'ar': 'مسكن',
      'fr': 'Maison',
    },
  },
  // editProfile
  {
    'npgo9a14': {
      'en': 'Edit Profile',
      'ar': 'تعديل الملف الشخصي',
      'fr': 'Editer le profil',
    },
    'vqcq3xwb': {
      'en': 'Change Photo',
      'ar': 'غير الصوره',
      'fr': 'Changer la photo',
    },
    'ijtkloca': {
      'en': 'Your Name',
      'ar': 'اسمك',
      'fr': 'votre nom',
    },
    'ome10sju': {
      'en': 'Please enter a valid number...',
      'ar': 'من فضلك أدخل رقما صحيحا...',
      'fr': 's\'il vous plait, entrez un nombre valide...',
    },
    'htintbo7': {
      'en': 'Email Address',
      'ar': 'عنوان البريد الالكترونى',
      'fr': 'Adresse e-mail',
    },
    'wnf731fc': {
      'en': 'Your email',
      'ar': 'بريدك الالكتروني',
      'fr': 'Votre e-mail',
    },
    'ugy8vxxk': {
      'en': 'Your Age',
      'ar': 'عمرك',
      'fr': 'Ton âge',
    },
    'pmqqnhu2': {
      'en': 'i.e. 34',
      'ar': 'أي 34',
      'fr': 'c\'est-à-dire 34',
    },
    '2qefnqac': {
      'en': 'Farmer',
      'ar': 'مزارع',
      'fr': 'Agriculteur',
    },
    'meg8m95r': {
      'en': 'Farmer',
      'ar': 'مزارع',
      'fr': 'Agriculteur',
    },
    'abnbzku7': {
      'en': 'Investor',
      'ar': 'المستثمر',
      'fr': 'Investisseur',
    },
    '4lzufr2p': {
      'en': 'Association',
      'ar': 'منظمة',
      'fr': 'Association',
    },
    'qyu9om6n': {
      'en': 'Company',
      'ar': 'شركة',
      'fr': 'Compagnie',
    },
    'y626imq8': {
      'en': 'Other',
      'ar': 'آخر',
      'fr': 'Autre',
    },
    'ulymheyk': {
      'en': 'Please select...',
      'ar': 'الرجاء تحديد ...',
      'fr': 'Veuillez sélectionner...',
    },
    'zggmj0vg': {
      'en': 'Modify your location',
      'ar': 'تعديل موقعك',
      'fr': 'Modifier votre emplacement',
    },
    '5suxyb8o': {
      'en': 'Set location',
      'ar': 'تحديد المكان',
      'fr': 'Définir l\'emplacement',
    },
    's1o4xpp5': {
      'en': 'Save Changes',
      'ar': 'حفظ التغييرات',
      'fr': 'Sauvegarder les modifications',
    },
    'a594l13m': {
      'en': 'Home',
      'ar': 'مسكن',
      'fr': 'Maison',
    },
  },
  // platformDetails
  {
    't2fpz5cd': {
      'en': 'Details',
      'ar': 'تفاصيل',
      'fr': 'Détails',
    },
    'tj4ue3c0': {
      'en': '',
      'ar': '',
      'fr': '',
    },
    'r25r1pls': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
      'fr': 'Champ requis',
    },
    '70838u9i': {
      'en': 'List of devices',
      'ar': 'قائمة الأجهزة',
      'fr': 'Liste des appareils',
    },
    'y9i0gnv0': {
      'en': 'Add Other devices',
      'ar': 'أضف أجهزة أخرى',
      'fr': 'Ajouter d\'autres appareils',
    },
    'r5tk24oy': {
      'en': 'Confirm',
      'ar': 'تأكيد',
      'fr': 'Confirmer',
    },
    'mgptvqa1': {
      'en': 'Home',
      'ar': 'مسكن',
      'fr': 'Maison',
    },
  },
  // tasks
  {
    '8le7mih8': {
      'en': 'Tasks',
      'ar': 'مهام',
      'fr': 'Tâches',
    },
    '01e16uri': {
      'en': 'My Tasks',
      'ar': 'مهامي',
      'fr': 'Mes tâches',
    },
    '7t93rccd': {
      'en': 'Start timer',
      'ar': 'بدء الموقت',
      'fr': 'Démarrer la minuterie',
    },
    '8rf7ooby': {
      'en': 'End timer',
      'ar': 'مؤقت الإنهاء',
      'fr': 'Minuterie de fin',
    },
    '7okqyhyn': {
      'en': '•',
      'ar': '•',
      'fr': '•',
    },
  },
  // WeatherPage
  {
    'igz2999e': {
      'en': 'Today',
      'ar': 'اليوم',
      'fr': 'Aujourd\'hui',
    },
    'sikd1i8y': {
      'en': '°',
      'ar': '°',
      'fr': '°',
    },
    '44r6oz6r': {
      'en': 'Today',
      'ar': 'اليوم',
      'fr': 'Aujourd\'hui',
    },
    'ea4d02rp': {
      'en': '°',
      'ar': '°',
      'fr': '°',
    },
    'w14o2op4': {
      'en': '°',
      'ar': '°',
      'fr': '°',
    },
    'lcgt6ypj': {
      'en': '°',
      'ar': '°',
      'fr': '°',
    },
    'hovct56k': {
      'en': '°',
      'ar': '°',
      'fr': '°',
    },
    'nlw3b08q': {
      'en': 'm/s',
      'ar': 'm/s',
      'fr': 'm/s',
    },
    'vllp2gq8': {
      'en': 'Wind',
      'ar': 'ريح',
      'fr': 'Vent',
    },
    'd2znpmbw': {
      'en': '%',
      'ar': '٪',
      'fr': '%',
    },
    'j7qthvxj': {
      'en': 'Humidity',
      'ar': 'رطوبة',
      'fr': 'Humidité',
    },
    'pucmt1tz': {
      'en': 'km',
      'ar': 'كم',
      'fr': 'kilomètres',
    },
    'olpdggio': {
      'en': 'Visibility',
      'ar': 'الرؤية',
      'fr': 'Visibilité',
    },
    '1lxea9sm': {
      'en': '•',
      'ar': '•',
      'fr': '•',
    },
  },
  // MessagePage
  {
    'vsmgpojt': {
      'en': 'All Chats',
      'ar': 'كل الدردشات',
      'fr': 'Tous les chats',
    },
  },
  // InviteUser
  {
    'cut9pwsg': {
      'en': 'Invite User',
      'ar': 'دعوة المستخدم',
      'fr': 'Inviter un utilisateur',
    },
  },
  // listdevice
  {
    'bz111zc4': {
      'en': 'Devices',
      'ar': 'الأجهزة',
      'fr': 'Dispositifs',
    },
    'yna04pj5': {
      'en': 'Offline',
      'ar': '',
      'fr': '',
    },
    'yna04pj6': {
      'en': 'Online',
      'ar': '',
      'fr': '',
    },
    '1p73p8ip': {
      'en': '•',
      'ar': '•',
      'fr': '•',
    },
  },
  // PhonePage
  {
    '66rchl94': {
      'en': 'Phone Sign In',
      'ar': 'تسجيل الدخول عبر الهاتف',
      'fr': 'Connexion par téléphone',
    },
    'i7x9ukfz': {
      'en': 'Type in your phone number below to register.',
      'ar': 'اكتب رقم هاتفك أدناه للتسجيل.',
      'fr': 'Tapez votre numéro de téléphone ci-dessous pour vous inscrire.',
    },
    'mdoccanj': {
      'en': 'Please enter a valid number',
      'ar': 'رقم تليفونك',
      'fr': 'Votre numéro de téléphone',
    },
    '3oiqc3qz': {
      'en': 'Ex : +216 12 345678',
      'ar': 'من فضلك أدخل رقما صحيح...',
      'fr': 'S\'il vous plait, entrez un nombre valide...',
    },
    'bywp2rhf': {
      'en': 'Sign In with Phone',
      'ar': 'تسجيل الدخول باستخدام الهاتف',
      'fr': 'Se connecter avec le téléphone',
    },
    '769lpzee': {
      'en': 'Home',
      'ar': 'مسكن',
      'fr': 'Maison',
    },
  },
  // VerifyCodePhone
  {
    'nf8hsjbe': {
      'en': 'Verify Code',
      'ar': 'التحقق من كود',
      'fr': 'Vérifier le code',
    },
    'wj8m4oxx': {
      'en': 'Enter the code SMS for Sign in',
      'ar': 'أدخل رمز SMS لتسجيل الدخول.',
      'fr': 'Entrez le code SMS pour vous connecter',
    },
    'mtquxpow': {
      'en': 'Phone Code',
      'ar': 'كود الهاتف',
      'fr': 'Indicatif téléphonique',
    },
    'haizzvz6': {
      'en': 'Enter your code',
      'ar': 'ادخل كود',
      'fr': 'entrez votre code',
    },
    'dobom28w': {
      'en': 'Verify Code',
      'ar': 'التحقق من كود',
      'fr': 'Vérifier le code',
    },
    '7hc29dwe': {
      'en': 'Home',
      'ar': 'مسكن',
      'fr': 'Maison',
    },
  },
  // EmptyList
  {
    'wltogevw': {
      'en': 'No Tasks!',
      'ar': 'لا توجد مهام!',
      'fr': 'Aucune tâche !',
    },
    'i103d8zw': {
      'en': ' No tasks scheduled, need an task? Schedule one now.',
      'ar': 'لا توجد مهام مجدولة ، تحتاج إلى مهمة؟ حدد موعدًا واحدًا الآن.',
      'fr':
          'Aucune tâche planifiée, besoin d&#39;une tâche ? Planifiez-en un maintenant.',
    },
    'xmsekc6r': {
      'en': 'Schedule',
      'ar': 'برنامج',
      'fr': 'Programme',
    },
  },
  // CreateTask
  {
    'c5j8y2o6': {
      'en': 'Add Task',
      'ar': 'إضافة مهمة',
      'fr': 'Ajouter une tâche',
    },
    '0hj3m03m': {
      'en': 'Fill out the information below in order to task',
      'ar': 'املأ المعلومات أدناه لمهمة جديدة.',
      'fr': 'Remplissez les informations ci-dessous pour un nouveau tâche.',
    },
    'buv85sc4': {
      'en': 'Task name',
      'ar': 'اسم المهمة',
      'fr': 'Nom de la tâche',
    },
    'glmtsi09': {
      'en': 'Task description',
      'ar': 'وصف المهمة',
      'fr': 'Description de la tâche',
    },
    '9zyue9or': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
      'fr': 'Champ requis',
    },
    'ckpwgwz9': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
      'fr': 'Champ requis',
    },
    'j0d7uni7': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
      'fr': 'Champ requis',
    },
    'ggnv5om8': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
      'fr': 'Champ requis',
    },
    'hq50pkh6': {
      'en': 'Cancel',
      'ar': 'يلغي',
      'fr': 'Annuler',
    },
    'fay80n6l': {
      'en': 'Add task',
      'ar': 'إضافة مهمة',
      'fr': 'Ajouter une tâche',
    },
  },
  // EmptyListDevice
  {
    'qodx4inp': {
      'en': 'Add device',
      'ar': 'اضف جهاز',
      'fr': 'Ajouter un appareil',
    },
  },
  // EmptyHometask
  {
    '3mn9mxkl': {
      'en': 'Add new task ',
      'ar': 'أضف مهمة جديدة',
      'fr': 'Ajouter une nouvelle tâche',
    },
  },
  // editDevice
  {
    'sa5bl1v8': {
      'en': 'Edit Device',
      'ar': 'تغيير الجهاز',
      'fr': 'Modifier l\'appareil',
    },
    'xi3b3m35': {
      'en': 'Device name',
      'ar': 'اسم الجهاز',
      'fr': 'Nom de l&#39;appareil',
    },
    'bvoadnvg': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
      'fr': 'Champ requis',
    },
    'w3x4c5tf': {
      'en': 'Cancel',
      'ar': 'يلغي',
      'fr': 'Annuler',
    },
    'nsti999h': {
      'en': 'Edit Device',
      'ar': 'تغيير الجهاز',
      'fr': 'Modifier l\'appareil',
    },
  },
  // addDevice
  {
    'growau6m': {
      'en': 'Add Device',
      'ar': 'اضف جهاز',
      'fr': 'Ajouter un appareil',
    },
    '12d3i134': {
      'en': 'Name device',
      'ar': 'اسم الجهاز',
      'fr': 'Nom de l&#39;appareil',
    },
    'b8e4pm8r': {
      'en': 'Enter serial number',
      'ar': 'اسم الجهاز',
      'fr': 'Nom de l&#39;appareil',
    },
    'nln67zk6': {
      'en': 'Field is required',
      'ar': '',
      'fr': '',
    },
    '4pkhhsf3': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
      'fr': '',
    },
    'r6yk6o97': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
      'fr': 'Champ requis',
    },
    'xea9ouxh': {
      'en': 'Cancel',
      'ar': 'يلغي',
      'fr': 'Annuler',
    },
    'ef20lt6a': {
      'en': 'Add Device',
      'ar': 'اضف جهاز',
      'fr': 'Ajouter un appareil',
    },
  },
  // EmptyPlatformList
  {
    '4h8a37cq': {
      'en': 'No Platform!',
      'ar': 'لا يوجد منصة!',
      'fr': 'Pas de plate-forme !',
    },
    '5cpq9anv': {
      'en': ' No Platform , need a Platform? Add one now.',
      'ar': 'لا يوجد منصة ، تحتاج إلى منصة؟ أضف واحدة الآن.',
      'fr':
          'Pas de plateforme, besoin d&#39;une plateforme ? Ajoutez-en un maintenant.',
    },
    'n4p9ll3j': {
      'en': 'Add Platform',
      'ar': 'أضف منصة',
      'fr': 'Ajouter une plate-forme',
    },
  },
  // locationCard
  {
    '01s036wf': {
      'en': 'Cancel',
      'ar': 'يلغي',
      'fr': 'Annuler',
    },
    '1jo5j16y': {
      'en': 'Confirm',
      'ar': 'يتأكد',
      'fr': 'Confirmer',
    },
  },
  // EmptyPlatformDev
  {
    'bdwgpsd9': {
      'en': 'Add new device',
      'ar': 'أضف جهازًا جديدًا',
      'fr': 'Ajouter un nouvel appareil',
    },
  },
  // popUpdp
  {
    'pws4g004': {
      'en': 'Add new  device',
      'ar': 'أضف جهازًا جديدًا',
      'fr': 'Ajouter un nouvel appareil',
    },
    'oxel6f2p': {
      'en': 'Select device from another platform',
      'ar': 'اختر جهازًا من منصة أخرى',
      'fr': 'Sélectionnez un appareil sur une autre plate-forme',
    },
  },
  // SelectDevice
  {
    'jdpxk1qu': {
      'en': 'Select Device',
      'ar': 'اختر جهاز',
      'fr': 'Choisir un appareil',
    },
    'wtx7x76h': {
      'en': 'Select device from another platform',
      'ar': 'املأ المعلومات أدناه من أجل حجز موعدك مع مكتبنا.',
      'fr':
          'Remplissez les informations ci-dessous afin de réserver votre rendez-vous avec notre bureau.',
    },
    'zj2pnr1k': {
      'en': 'My devices',
      'ar': 'أجهزتي',
      'fr': 'Mes appareils',
    },
    'scu46eug': {
      'en': 'Please select...',
      'ar': 'الرجاء تحديد ...',
      'fr': 'Veuillez sélectionner...',
    },
    'lsc0s46i': {
      'en': 'Cancel',
      'ar': 'يلغي',
      'fr': 'Annuler',
    },
    'xl5h6yr1': {
      'en': 'Add to platform',
      'ar': 'أضف إلى المنصة',
      'fr': 'Ajouter à la plateforme',
    },
  },
  // Addplatform
  {
    'uq5qg3di': {
      'en': 'Add Platform',
      'ar': 'أضف منصة',
      'fr': 'Ajouter une plate-forme',
    },
    'y6kjcsu6': {
      'en': 'The name must be unique',
      'ar': 'الاسم يجب ان يكون فريدا من نوعه',
      'fr': 'Le nom doit être unique',
    },
    'qw4a07uz': {
      'en': 'Platform name',
      'ar': 'اسم منصة ',
      'fr': 'Nom de la plate-forme',
    },
    'jcvt4ej7': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
      'fr': 'Champ requis',
    },
    '7ogr0gmb': {
      'en': '',
      'ar': '',
      'fr': '',
    },
    'i7viwwq2': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'الرجاء تحديد خيار من القائمة المنسدلة',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    '9feqkfnz': {
      'en': 'Cancel',
      'ar': 'يلغي',
      'fr': 'Annuler',
    },
    'cy24hlbw': {
      'en': 'Add Platform',
      'ar': 'أضف منصة',
      'fr': 'Ajouter une plate-forme',
    },
  },
  // setLocation
  {
    'vez18y65': {
      'en': 'You didn\'t set location yet!',
      'ar': 'لم تحدد الموقع بعد!',
      'fr': 'Vous n&#39;avez pas encore défini de lieu !',
    },
    'w9fqg1rn': {
      'en': 'Set location',
      'ar': 'تحديد المكان',
      'fr': 'Définir l&#39;emplacement',
    },
  },
  // popupwarning
  {
    'htcbh7of': {
      'en': 'Cancel',
      'ar': 'يلغي',
      'fr': 'Annuler',
    },
    'sk1sq7ib': {
      'en': 'Confirm',
      'ar': 'يتأكد',
      'fr': 'Confirmer',
    },
  },
  // EditTask
  {
    '4hup7592': {
      'en': 'Edit Task',
      'ar': 'إضافة مهمة',
      'fr': 'Ajouter une tâche',
    },
    '11g7z2jc': {
      'en': 'Fill out the information below in order to task.',
      'ar': 'املأ المعلومات أدناه من أجل حجز موعدك مع مكتبنا.',
      'fr':
          'Remplissez les informations ci-dessous afin de réserver votre rendez-vous avec notre bureau.',
    },
    'ne95v98s': {
      'en': 'Task name',
      'ar': 'اسم المهمة',
      'fr': 'Nom de la tâche',
    },
    'kuv27cm8': {
      'en': 'Task description',
      'ar': 'وصف المهمة',
      'fr': 'Description de la tâche',
    },
    'ayv7i51v': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
      'fr': 'Champ requis',
    },
    'mx70bujn': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
      'fr': 'Champ requis',
    },
    '336q98s0': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
      'fr': 'Champ requis',
    },
    's6uk36ja': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
      'fr': 'Champ requis',
    },
    'rm9x24pk': {
      'en': 'Cancel',
      'ar': 'يلغي',
      'fr': 'Annuler',
    },
    'apoqqxc9': {
      'en': 'Edit task',
      'ar': 'إضافة مهمة',
      'fr': 'Ajouter une tâche',
    },
  },
  // popuplogout
  {
    'x6vxicfn': {
      'en': 'Cancel',
      'ar': 'يلغي',
      'fr': 'Annuler',
    },
    'fb4x6luw': {
      'en': 'Confirm',
      'ar': 'يتأكد',
      'fr': 'Confirmer',
    },
  },
  // DeviceDetails
  {
    '773155ra': {
      'en': 'Device Details',
      'ar': 'أضف منصة',
      'fr': 'Ajouter une plate-forme',
    },
    'wj27swbb': {
      'en': 'device name',
      'ar': '',
      'fr': '',
    },
    'mqe5a4ph': {
      'en': 'On',
      'ar': 'يشتغل',
      'fr': 'en marche',
    },
    '4zy89gp9': {
      'en': 'Off',
      'ar': 'توقف',
      'fr': 'arrêté',
    },
    'xnlwb8w1': {
      'en': 'SSid',
      'ar': '',
      'fr': '',
    },
    'uzrfpw8c': {
      'en': 'Today',
      'ar': '',
      'fr': '',
    },
    'wxkwd0os': {
      'en': 'Total',
      'ar': '',
      'fr': '',
    },
    'pxatbgwd': {
      'en': 'Voltage',
      'ar': '',
      'fr': '',
    },
    '6pp08bgu': {
      'en': 'Today',
      'ar': '',
      'fr': '',
    },
    '3alwt5ml': {
      'en': 'Total',
      'ar': '',
      'fr': '',
    },
    'd76ryx67': {
      'en': 'Voltage',
      'ar': '',
      'fr': '',
    },
  },
  // ffNotification
  {
    'oyf8a277': {
      'en': 'Notification ',
      'ar': 'اضف جهاز',
      'fr': 'Ajouter un appareil',
    },
  },
  // Miscellaneous
  {
    '4acxx292': {
      'en': '',
      'ar': '',
      'fr': '',
    },
    '7nw5m8cq': {
      'en': '',
      'ar': '',
      'fr': '',
    },
    't3h89rnf': {
      'en': '',
      'ar': '',
      'fr': '',
    },
    'fh6ktz3n': {
      'en': '',
      'ar': '',
      'fr': '',
    },
    'lx1qtcra': {
      'en': '',
      'ar': '',
      'fr': '',
    },
    'mwuig4yg': {
      'en': '',
      'ar': '',
      'fr': '',
    },
    'o6jcg96l': {
      'en': '',
      'ar': '',
      'fr': '',
    },
    'ys6fwirr': {
      'en': '',
      'ar': '',
      'fr': '',
    },
    'ozhnda0d': {
      'en': '',
      'ar': '',
      'fr': '',
    },
    'f2zp19sz': {
      'en': '',
      'ar': '',
      'fr': '',
    },
    '9jx706u8': {
      'en': '',
      'ar': '',
      'fr': '',
    },
    '0t6shauj': {
      'en': '',
      'ar': '',
      'fr': '',
    },
    'z16xi354': {
      'en': '',
      'ar': '',
      'fr': '',
    },
    'jfkk684w': {
      'en': '',
      'ar': '',
      'fr': '',
    },
    'i23ekmrt': {
      'en': '',
      'ar': '',
      'fr': '',
    },
    'x9haxgah': {
      'en': '',
      'ar': '',
      'fr': '',
    },
    '3q3wsaxw': {
      'en': '',
      'ar': '',
      'fr': '',
    },
    'hsxey182': {
      'en': '',
      'ar': '',
      'fr': '',
    },
    'txk9ajwc': {
      'en': '',
      'ar': '',
      'fr': '',
    },
    'u1q60sqz': {
      'en': '',
      'ar': '',
      'fr': '',
    },
    'bwkkqe02': {
      'en': '',
      'ar': '',
      'fr': '',
    },
    '0yhuoe0p': {
      'en': '',
      'ar': '',
      'fr': '',
    },
    'ajlklhhd': {
      'en': '',
      'ar': '',
      'fr': '',
    },
  },
].reduce((a, b) => a..addAll(b));