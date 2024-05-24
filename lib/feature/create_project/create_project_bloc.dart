import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../core/helper/globals.dart';
import '../../core/domain/models/project_model.dart';
import '../../core/domain/models/result_error_model.dart';
import '../../core/domain/services/create_project_service.dart';


part 'create_project_event.dart';
part 'create_project_state.dart';

class CreateProjectBloc extends Bloc<CreateProjectEvent, CreateProjectState> {
  CreateProjectBloc() : super(CreateProjectInitial()) {
    on<CreateProject>((event, emit) async {
      print('-----------------------');
      emit(Loading());
      ResultModel data =
          await ProjectService().createProject(event.projectmodel);
      if (data is ProjectIdModel) {
        emit(Success(id: data.id));
        print('project id is ${data.id}');
        flutterSecureStorage.write(key: 'projectid', value: data.id.toString());
      } else if (data is ErrorModel) {
        emit(Error(errorMessage: data.error));
        print(data.error);
      }
    });
  }
}
