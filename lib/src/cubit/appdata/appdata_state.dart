import 'package:jakwisata/src/data/models/appdata.dart';

enum AppDataStatus { initial, loading, success, failure }

class AppDataListState {
  final AppDataStatus status;
  final List<AppData> appdata;
  final Exception? exception;

  const AppDataListState({
    this.status = AppDataStatus.initial,
    this.appdata = const [],
    this.exception,
  });

  AppDataListState copyWith({
    AppDataStatus? status,
    List<AppData>? appdata,
    Exception? exception,
  }) {
    return AppDataListState(
      status: status ?? this.status,
      appdata: appdata ?? this.appdata,
      exception: exception ?? this.exception,
    );
  }
}
