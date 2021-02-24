
class Validity {
  final int validThruMonth;
  final int validThruYear;
  final int? validFromMonth;
  final int? validFromYear;

  Validity({
    required this.validThruMonth,
    required this.validThruYear,
    this.validFromMonth,
    this.validFromYear,
  }) {
    if (validFromMonth != null || validFromYear != null) {
      assert(validFromMonth != null);
      assert(validFromYear != null);
    }
  }
}
