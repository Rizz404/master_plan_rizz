import 'package:flutter/material.dart';
import 'package:master_plan/data/model/plan.dart';
import 'package:master_plan/presentation/provider/plan_provider.dart';
import 'package:master_plan/presentation/screens/plan_creator_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return PlanProvider(
      notifier: ValueNotifier<List<Plan>>(const []),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'State management app',
        theme: ThemeData(primarySwatch: Colors.blue),
        home: const PlanCreatorScreen(),
      ),
    );
  }
}
