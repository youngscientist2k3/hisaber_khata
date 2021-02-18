class StorageUtility {
  int id;
  final String date;
  final String description;
  final double amount;
  final String selection;

  StorageUtility(
      {this.id, this.date, this.description, this.amount, this.selection});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'date': date,
      'description': description,
      'amount': amount,
      'selection': selection,
    };
  }

  @override
  String toString() {
    return 'Data{id: $id date: $date, description: $description, amount: $amount, selection:$selection}';
  }
}
