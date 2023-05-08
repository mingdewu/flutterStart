enum ReceiptStatus { sent, deliverred, read }

extension EnumParsing on ReceiptStatus {
  String value() {
    return this.toString().split('.').last;
  }
  static ReceiptStatus fromString(String status){
    return ReceiptStatus.values.firstWhere((element) => element.value() == status)
  }
}

class Receipt {
  final String recipient;
  final String messageId;
  final ReceiptStatus status;
  final DateTime timestamp;
  String _id;
  String get id => _id;
}
