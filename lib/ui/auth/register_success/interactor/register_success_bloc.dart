import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../base/interactor/page_command.dart';
import '../../../base/interactor/page_states.dart';

part 'register_success_event.dart';
part 'register_success_state.dart';

class RegisterSuccessBloc extends Bloc<RegisterSuccessEvent, RegisterSuccessState> {
  RegisterSuccessBloc() : super(const RegisterSuccessState(error: '', status: PageState.loading));
}
