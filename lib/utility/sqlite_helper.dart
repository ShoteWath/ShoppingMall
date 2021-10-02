class SQLiteHelper {
  final String nameDatabase = 'shoppingmall.db';
  final int version = 1;
  final String tableDatabase = 'tableOrder';
  final String columnId = 'id';
  final String columnIdSeller = 'idSeller';
  final String columnIdProduct = 'idProduct';
  final String columnName = 'name';
  final String columnPricc = 'price';
  final String columnAmount = 'Amount';
  final String columnSum = 'sum';

  SQLiteHelper() {
    initisDatabase();
  }

  Future<Null> initisDatabase() async {}
}
