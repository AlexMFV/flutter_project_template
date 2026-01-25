import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:talk2me/core/extensions/ref_message_ext.dart';
import 'package:talk2me/core/services/service_providers.dart';

class HomePage extends ConsumerWidget {
  const HomePage ({ super.key });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final vm = ref.read(homeVMProvider);
    ref.listenMessages(homeVMProvider, context);

    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Text("Error"),
            Row(
              children: [
                TextButton(
                  onPressed: () => vm.processError(),
                  child: Text("Error")
                ),
                                TextButton(
                  onPressed: () => vm.processSuccess(),
                  child: Text("Success")
                ),
                                TextButton(
                  onPressed: () => vm.processInfo(),
                  child: Text("Info")
                ),
                                TextButton(
                  onPressed: () => vm.processWarning(),
                  child: Text("Warning")
                ),
              ],
            )
          ],
        )
      ),
    );
  }
}