import 'package:rethinkdb_dart/rethinkdb_dart.dart';

Future<void> createDb(Rethinkdb r, Connection) async {
  await r.dbCreate("test").run(Connection).catchError((err) => {});
  await r.tableCreate('users').run(Connection).catchError((err) => {});
}

Future<void> cleanDb(Rethinkdb r, Connection connection) async {
  await r.table("user").delete().run(connection);
}
