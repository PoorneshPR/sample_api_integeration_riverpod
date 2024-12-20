import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sample_riverpod/riverpod/passenger_list/passenger_list_provider.dart';
import 'package:sample_riverpod/riverpod/passenger_list/passenger_list_state.dart';

class PassengerListView extends StatelessWidget {
  PassengerListView({super.key});

  final passengerListProvider =
      NotifierProvider<PassengerListProvider, PassengerListState>(
          PassengerListProvider.new);

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.red,
      body: Column(
        children: [
          Expanded(child: Consumer(builder: (context, ref, child) {
            final value = ref.watch(
                passengerListProvider.select((value) => value.passengersList));
            return ListView.builder(
              itemCount: value?.length ?? 0,
              itemBuilder: (context, index) {
                final item = value?.elementAt(index);
                return Container(
                  padding: const EdgeInsets.all(10),
                  margin: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey.shade200),
                  child: Column(
                    children: [
                      Text("ID : ${item?.id ?? ""}"),
                      Text("airline : ${item?.airline ?? ""}"),
                    ],
                  ),
                );
              },
            );
          })),
          Consumer(builder: (context, ref, child) {
            final value = ref.read(passengerListProvider.notifier);
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
               ElevatedButton(
                    onPressed: () {
                      value.addToList();
                    },
                    child: const Text("Add+")),
                ElevatedButton(
                    onPressed: () {
                      value.removeFromList();
                    },
                    child: const Text("Remove-")),
              ],
            );
          })
        ],
      ),
    );
  }
}
