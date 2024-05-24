import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:project_managment_bloc_riverpod/core/domain/models/result_error_model.dart';
import 'package:project_managment_bloc_riverpod/core/domain/services/logout_service.dart';
import 'package:project_managment_bloc_riverpod/core/helper/globals.dart';

part 'logout_event.dart';
part 'logout_state.dart';

class LogoutBloc extends Bloc<LogoutEvent, LogoutState> {
  LogoutBloc() : super(LogoutInitial()) {
    on<Logout>((event, emit) async {
      ResultModel response = await LogoutService().logout();
      if (response is LogoutSuccess) {
        emit(Success());
        flutterSecureStorage.delete(key: 'token');
      } else {
        emit(Error());
      }
    });
  }
}
