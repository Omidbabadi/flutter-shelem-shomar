part of 'injection_container.dart';

final sl = GetIt.instance;

Future<void> init() async {
  await _cacheInit();
  await _gameInit();
}

Future<void> _cacheInit() async {
  final prefs = await SharedPreferences.getInstance();
  sl
    ..registerLazySingleton(() => CacheHelper(sl()))
    ..registerLazySingleton(() => prefs);
}

Future<void> _gameInit() async {
  final game = sl<CacheHelper>().loadGame();
  sl
    ..registerLazySingleton(() => KingLose(sl()))
    ..registerLazySingleton(() => KingWin(sl()))
    ..registerLazySingleton(() => ShouldKingWin(sl()))
    ..registerLazySingleton(() => SetKingTeam(sl()))
    ..registerLazySingleton<GameRepo>(() => GameRepoImpl(sl()))
    ..registerLazySingleton<GameLocalDatasrc>(() => GameLocalDatasrcImpl(sl()))
    ..registerLazySingleton(() => game);
}
