import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../core/helper/globals.dart';
import '../../../core/domain/models/result_error_model.dart';
import '../../../core/domain/models/signup_model.dart';
import '../../../core/domain/services/signup_service.dart';
import '../../shares/sign_up_container.dart';


part 'sign_up_event.dart';
part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  SignUpBloc() : super(SignUpInitial()) {
    on<SignUp>((event, emit) async {
      emit(LoadingStateSignup());
      ResultModel data = await SignUpService().singUp(event.signupModel);
      print(data);
      if (data is TokenModel) {
        print(data.token);
        if (rememberme == false) {
          token = data.token;
        } else {
          token = data.token;
          flutterSecureStorage.write(key: 'token', value: data.token);
        }

        emit(SuccessStateSignup());
      } else
        emit(ErrorStateSignup());
    });
  }
}
