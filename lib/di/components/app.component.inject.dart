import 'app.component.dart' as _i1;
import '../../module_localization/service/localization_service/localization_service.dart'
    as _i2;
import '../../utils/logger/logger.dart' as _i3;
import 'dart:async' as _i4;
import '../../main.dart' as _i5;
import '../../module_theme/service/theme_service/theme_service.dart' as _i6;
import '../../module_theme/pressistance/theme_preferences_helper.dart' as _i7;
import '../../module_localization/presistance/localization_preferences_helper/localization_preferences_helper.dart'
    as _i8;
import '../../module_init/init_module.dart' as _i9;
import '../../module_init/stat_manager/init/init_state_manager.dart' as _i10;
import '../../module_init/presistance/init_prefs_helper.dart' as _i11;
import '../../module_home/home_module.dart' as _i12;
import '../../module_home/state_manager/home/home_state_manager.dart' as _i13;
import '../../module_home/service/home_service/home_service.dart' as _i14;
import '../../module_home/manager/home_manager/home_manager.dart' as _i15;
import '../../module_home/repository/home/home_repository.dart' as _i16;
import '../../module_network/http_client/http_client.dart' as _i17;
import '../../module_splash/splash_module.dart' as _i18;
import '../../module_splash/ui/screen/splash_screen.dart' as _i19;

class AppComponent$Injector implements _i1.AppComponent {
  AppComponent$Injector._();

  _i2.LocalizationService _singletonLocalizationService;

  _i3.Logger _singletonLogger;

  static _i4.Future<_i1.AppComponent> create() async {
    final injector = AppComponent$Injector._();

    return injector;
  }

  _i5.MyApp _createMyApp() => _i5.MyApp(
      _createAppThemeDataService(),
      _createLocalizationService(),
      _createInitModule(),
      _createHomeModule(),
      _createSplashModule());
  _i6.AppThemeDataService _createAppThemeDataService() =>
      _i6.AppThemeDataService(_createThemePreferencesHelper());
  _i7.ThemePreferencesHelper _createThemePreferencesHelper() =>
      _i7.ThemePreferencesHelper();
  _i2.LocalizationService _createLocalizationService() =>
      _singletonLocalizationService ??=
          _i2.LocalizationService(_createLocalizationPreferencesHelper());
  _i8.LocalizationPreferencesHelper _createLocalizationPreferencesHelper() =>
      _i8.LocalizationPreferencesHelper();
  _i9.InitModule _createInitModule() =>
      _i9.InitModule(_createInitStateManager());
  _i10.InitStateManager _createInitStateManager() =>
      _i10.InitStateManager(_createInitPrefsHelper());
  _i11.InitPrefsHelper _createInitPrefsHelper() => _i11.InitPrefsHelper();
  _i12.HomeModule _createHomeModule() =>
      _i12.HomeModule(_createHomeStateManager());
  _i13.HomeStateManager _createHomeStateManager() =>
      _i13.HomeStateManager(_createInitPrefsHelper(), _createHomeService());
  _i14.HomeService _createHomeService() =>
      _i14.HomeService(_createInitPrefsHelper(), _createHomeManager());
  _i15.HomeManager _createHomeManager() =>
      _i15.HomeManager(_createHomeRepository());
  _i16.HomeRepository _createHomeRepository() =>
      _i16.HomeRepository(_createApiClient());
  _i17.ApiClient _createApiClient() => _i17.ApiClient(_createLogger());
  _i3.Logger _createLogger() => _singletonLogger ??= _i3.Logger();
  _i18.SplashModule _createSplashModule() =>
      _i18.SplashModule(_createSplashScreen());
  _i19.SplashScreen _createSplashScreen() =>
      _i19.SplashScreen(_createInitPrefsHelper());
  @override
  _i5.MyApp get app => _createMyApp();
}
