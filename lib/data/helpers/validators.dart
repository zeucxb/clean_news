abstract class Validator {
  bool call(dynamic);
}

class StringValidator implements Validator {
  @override
  bool call(dynamic value) {
    if (value is String) {
      if (value.trim().isEmpty) {
        return false;
      }

      return true;
    }

    return false;
  }
}
