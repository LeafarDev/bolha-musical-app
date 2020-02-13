import 'dart:collection';

class ValidationError {
  Map<String, List> _errors = new HashMap();

  bool has(field) {
    return _errors.containsKey(field);
  }

  any() {
    this._errors.length > 0;
  }

  get(field) {
    if (has(field)) {
      return _errors[field][0];
    }
  }

  record(List errorList) {
    errorList.forEach((item) {
      _errors[item.keys.first] = item[item.keys.first];
    });
  }

  clearField(field) {
    if (has(field)) {
      _errors.remove(field);
    }
  }

  clearAll() {
    _errors = new HashMap();
  }
}
