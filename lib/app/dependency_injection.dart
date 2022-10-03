
// ignore_for_file: unused_import

import 'package:val/app/authtication_bloc/authentication_bloc.dart';
import 'package:val/app/notification_bloc/notifications_bloc.dart';
import 'package:val/data/data_source/local_data_source.dart';
import 'package:val/data/data_source/remote_data_source.dart';
import 'package:val/data/network/api_client.dart';
import 'package:val/data/network/cancel_tokens.dart';
import 'package:val/data/network/dio_factory.dart';
import 'package:val/data/network/network_info.dart';
import 'package:val/data/repository_impl/authentication_repository_impl.dart';
import 'package:val/domain/repository/repository.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app_prefs.dart';

final getIt = GetIt.instance;



//di for all the app must be lazy and for specific module has to be factory so we use new instance every time




Future<void> initAppModules() async {

  //shared prefs
  final _prefs = await SharedPreferences.getInstance();
  getIt.registerLazySingleton<SharedPreferences>(() => _prefs);


  //app prefs
  final _appPreferences = AppPreferences(getIt<SharedPreferences>());
  getIt.registerLazySingleton<AppPreferences>(() => _appPreferences);

  //network info
  getIt.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl());

  //dio Factoty
  getIt.registerLazySingleton(() => DioFactory(getIt<AppPreferences>()));

  final dio = await getIt<DioFactory>().getDio();

  //api client
  getIt.registerLazySingleton<ApiClient>(() => ApiClientImpl(dio,CancelTokenHandler()));

  //remote data source

  getIt.registerLazySingleton<RemoteDataSource>(() => RemoteDataSourceImpl(getIt<ApiClient>()));


  //local

  getIt.registerLazySingleton<LocalDataSource>(() => LocalDataSourceImpl());

/////////////////////
//Authentication
  getIt.registerLazySingleton<AuthenticationRepository>(() => AuthenticationRepositoryImpl(getIt<RemoteDataSource>(),
      getIt<NetworkInfo>(),
      getIt<LocalDataSource>()
  ));

  ///////////////////////////////////////



  //notifications
  // getIt.registerLazySingleton<NotificationsBloc>(() => NotificationsBloc(NotificationService()));




  //repository






}




AuthenticationBloc registerAuthBloc (){
  if(!getIt.isRegistered<AuthenticationBloc>())
    getIt.registerLazySingleton<AuthenticationBloc>(() => AuthenticationBloc(getIt<AuthenticationRepository>()));
  return getIt<AuthenticationBloc>();
}

