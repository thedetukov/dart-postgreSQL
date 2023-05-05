import 'package:postgres/postgres.dart';

void main() {
  test_insert_postgres();
  test_select_postgres();
}

Future<void> test_insert_postgres() async {
  final connection = PostgreSQLConnection(
    'localhost',
    5432,
    'devdb',
    username: 'devadmin',
    password: '',
  );

  await connection.open();
  print("Підключення встановлено.");

  await connection.query("""
    INSERT INTO customers(id, firstname, lastname, age)
    VALUES (15, 'kot', 'kot', 123),
           (16, 'gok', 'pok', 234);
  """);

  await connection.close();
  print("Підключення закрито");
}

Future<void> test_select_postgres() async {
  final connection = PostgreSQLConnection(
    'localhost',
    5432,
    'devdb',
    username: 'devadmin',
    password: '',
  );

  await connection.open();
  print("Підключення встановлено.");

  final response = await connection.query(""" SELECT * FROM customers """);
  for (final res in response) {
    print(res);
  }
  // print(response);

  await connection.close();
  print("Підключення закрито");
}
