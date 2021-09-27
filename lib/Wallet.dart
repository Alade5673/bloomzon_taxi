import 'package:flutter/material.dart';
import 'Balance.dart';
import 'Services.dart';

class BalanceTable extends StatefulWidget{
  BalanceTable() : super ();
  final String title = 'Wallet Balance';

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }
}



// import 'dart:convert';
// import 'package:syncfusion_flutter_datagrid/datagrid.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'dart:io';
//
// class WalletList extends StatefulWidget {
//   const WalletList({Key? key}) : super(key: key);
//
//   @override
//   _WalletListState createState() => _WalletListState();
// }
//
// class _WalletListState extends State<WalletList> {
//
//   late WalletDataSource walletDataSource;
//   late List<GridColumn> _columns;
//
//   Future<Object> generateWalletList() async {
//
//     // Give your sever URL of get_employees_details.php file
//     var url = 'https://bloomzon.com/driver/wallet.php';
//
//
//     final response = await http.get(Uri.parse(url));
//     var list = json.decode(response.body);
//
//     List<Wallet> _wallet =
//     await list.map<Wallet>((json) => Wallet.fromJson(json)).toList();
//     walletDataSource = WalletDataSource(_wallet);
//     return _wallet;
//   }
//
//   List<GridColumn> getColumns() {
//     return <GridColumn>[
//       GridColumn(
//           columnName: 'id',
//           width: 70,
//           label: Container(
//               padding: EdgeInsets.all(16.0),
//               alignment: Alignment.center,
//               child: Text(
//                 'ID',
//               ))),
//       GridColumn(
//           columnName: 'name',
//           width: 80,
//           label: Container(
//               padding: EdgeInsets.all(8.0),
//               alignment: Alignment.center,
//               child: Text('Name'))),
//       GridColumn(
//           columnName: 'email',
//           width: 120,
//           label: Container(
//               padding: EdgeInsets.all(8.0),
//               alignment: Alignment.center,
//               child: Text(
//                 'Email',
//                 overflow: TextOverflow.ellipsis,
//               ))),
//       GridColumn(
//           columnName: 'phone',
//           label: Container(
//               padding: EdgeInsets.all(8.0),
//               alignment: Alignment.center,
//               child: Text('Phone'))),
//
//       GridColumn(
//           columnName: 'wallet',
//           label: Container(
//               padding: EdgeInsets.all(8.0),
//               alignment: Alignment.center,
//               child: Text('Wallet'))),
//     ];
//   }
//
//   @override
//   void initState() {
//     super.initState();
//     _columns = getColumns();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: Text('Syncfusion flutter datagrid'),
//         ),
//         body: FutureBuilder<Object>(
//             future: generateWalletList(),
//             builder: (context, data) {
//               return data.hasData
//                   ? SfDataGrid(
//                   source: walletDataSource,
//                   columnWidthMode: ColumnWidthMode.fill,
//                   columns: _columns)
//                   : Center(
//                   child: CircularProgressIndicator(
//                     strokeWidth: 2,
//                     value: 0.8,
//                   ));
//             }));
//
//
//       // FutureBuilder<Object>(
//       //       future: generateWalletList(),
//       //       builder: (context, data) {
//       //         return data.hasData
//       //             ? SfDataGrid(
//       //             source: walletDataSource,
//       //             columnWidthMode: ColumnWidthMode.fill,
//       //             columns: _columns)
//       //             : Center(
//       //             child: CircularProgressIndicator(
//       //               strokeWidth: 2,
//       //               value: 0.8,
//       //             ));
//       //       });
//   }
// }
//
// class WalletDataSource extends DataGridSource {
//
//   WalletDataSource(this.wallets) {
//     buildDataGridRow();
//   }
//
//   void buildDataGridRow() {
//     _walletDataGridRows = wallets
//         .map<DataGridRow>((e) => DataGridRow(cells: [
//       DataGridCell<int>(columnName: 'id', value: e.id),
//       DataGridCell<String>(columnName: 'name', value: e.name),
//       DataGridCell<int>(columnName: 'phone', value: e.phone),
//       DataGridCell<String>(columnName: 'email', value: e.email),
//       DataGridCell<int>(columnName: 'wallet', value: e.balance),
//     ]))
//         .toList();
//   }
//
//   List<Wallet> wallets = [];
//
//   List<DataGridRow> _walletDataGridRows = [];
//
//   @override
//   List<DataGridRow> get rows => _walletDataGridRows;
//
//   @override
//   DataGridRowAdapter buildRow(DataGridRow row) {
//     return DataGridRowAdapter(
//         cells: row.getCells().map<Widget>((e) {
//           return Container(
//             alignment: Alignment.center,
//             padding: EdgeInsets.all(8.0),
//             child: Text(e.value.toString()),
//           );
//         }).toList());
//   }
//
//   void updateDataGrid() {
//     notifyListeners();
//   }
// }
//
// class Wallet {
//   late int id;
//   late String name;
//   late int phone;
//   late String email;
//   late int balance;
//
//   Wallet({required this.id, required this.name, required this.phone, required this.email, required this.balance});
//
//   factory Wallet.fromJson(Map<String, dynamic> json) {
//     return Wallet(
//         id: int.parse(json['id']),
//         name: json['name'] as String,
//         phone: int.parse(json['phone']),
//         email: json['email'] as String,
//         balance: int.parse(json['balance']));
//   }
// }
//
