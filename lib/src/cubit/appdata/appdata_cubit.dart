import 'package:bloc/bloc.dart';
import 'package:jakwisata/src/data/repositories/appdata.dart';
import 'appdata_state.dart';

class AppDataCubit extends Cubit<AppDataListState> {
  final AppDataRepository appDataRepository;

  AppDataCubit({required this.appDataRepository})
      : super(const AppDataListState());

  Future<void> fetchData() async {
    emit(state.copyWith(status: AppDataStatus.loading));
    await Future.delayed(const Duration(seconds: 2));
    try {
      final appData = await appDataRepository.fetchData();
      emit(
        state.copyWith(
          status: AppDataStatus.success,
          appdata: appData,
        ),
      );
    } on Exception catch (exception) {
      emit(
        state.copyWith(
          status: AppDataStatus.failure,
          exception: exception,
        ),
      );
    }
  }
}
