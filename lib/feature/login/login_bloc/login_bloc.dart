import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:project_managment_bloc_riverpod/feature/shares/sign_up_container.dart';

import '../../../core/helper/globals.dart';
import '../../../core/domain/models/result_error_model.dart';
import '../../../core/domain/models/signin_model.dart';
import '../../../core/domain/services/login_service.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on<Login>((event, emit) async {
      emit(Loading());
      ResultModel result = await LoginService().login(event.signInModel);
      if (result is TokenModel) {
        print(result.token);

        if (rememberme == true){
          token=result.token;
          flutterSecureStorage.write(key: 'token', value: result.token);
        }else
          {
            token=result.token;
          }
        emit(LoggedIn());
      } else {
        emit(ErrorState());
      }
    });
  }
}
