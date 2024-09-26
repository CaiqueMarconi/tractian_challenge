import 'package:tractian_challenge/app/core/failures/app_failure/i_app_failure.dart';

class AppFailure extends IAppFailure {
  AppFailure({required super.message, super.stackTrace});
}
