import 'package:injectable/injectable.dart';
import 'package:talker_bloc_logger/talker_bloc_logger.dart';
import 'package:talker_flutter/talker_flutter.dart';

@lazySingleton
class AppBlocObserver extends TalkerBlocObserver {
  AppBlocObserver(Talker talker) : super(talker: talker);
}
