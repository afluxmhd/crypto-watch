class ResponseModel {
  ResponseModel(this._isSuccess, this._message);
  final bool _isSuccess;
  final String _message;
  String get message => _message;
  bool get isSuccess => _isSuccess;
}
