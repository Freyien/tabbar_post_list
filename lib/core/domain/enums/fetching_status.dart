enum FetchingStatus { initial, loading, success, failed }

extension FetchingStatusExtensions on FetchingStatus {
  bool get isInitial => this == FetchingStatus.initial;
  bool get isLoading => this == FetchingStatus.loading;
  bool get isFailed => this == FetchingStatus.failed;
  bool get isSuccess => this == FetchingStatus.success;
  bool get isInitialOrLoading => isInitial || isLoading;
}
