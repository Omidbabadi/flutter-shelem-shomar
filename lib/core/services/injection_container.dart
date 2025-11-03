import 'package:get_it/get_it.dart';
import 'package:myapp/core/common/app/cache_helper.dart';
import 'package:myapp/src/game/data/datasrc/game_datasrc.dart';
import 'package:myapp/src/game/data/repo/game_repo_impl.dart';
import 'package:myapp/src/game/domain/repo/game_repo.dart';
import 'package:myapp/src/game/domain/usecase/king_win.dart';
import 'package:myapp/src/game/domain/usecase/should_king_win.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../src/game/domain/usecase/king_loses';

part 'injection_container.main.dart';