class DataTableEntry {
  int id;
  final String date;
  final String description;
  final String amount;
  final String selection;

  DataTableEntry(
      {this.id, this.date, this.description, this.amount, this.selection});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'date': date,
      'description': description,
      'amount': amount,
    };
  }

  @override
  String toString() {
    return 'Data{id: $id date: $date, description: $description, amount: $amount}';
  }
}