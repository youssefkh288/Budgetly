import 'package:budgetly/core/color_manager.dart';
import 'package:budgetly/widgets/budget_box.dart';
import 'package:budgetly/widgets/custom_button.dart';
import 'package:budgetly/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController amountController = TextEditingController();
  TextEditingController titleController = TextEditingController();

  @override
  void dispose() {
    amountController.dispose();
    titleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Budgetly.',
          style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.exit_to_app,
              size: 28,
              color: ColorManager.blueColor,
            ),
          ),
          SizedBox(width: 4),
        ],
        elevation: 0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Divider(thickness: 3, endIndent: 100, indent: 100, height: 2),
              SizedBox(height: 20),
              BudgetBox(),
              SizedBox(height: 20),
              Text(
                'Remaining',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                ),
              ),
              Text(
                '2,400.00 EGP',
                style: TextStyle(
                  fontSize: 42,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
              SizedBox(height: 32),
              SizedBox(
                width: 350,
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                  elevation: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.add_circle,
                              color: ColorManager.blueColor,
                              size: 24,
                            ),
                            Text(
                              '  Quick Add',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 16),
                        CustomTextField(
                          controller: amountController,
                          hintText: '\$ 0.00',
                        ),
                        SizedBox(height: 6),
                        CustomTextField(
                          controller: titleController,
                          hintText: 'Note (e.g., Coffee)',
                        ),
                        SizedBox(height: 16),
                        CustomButton(text: 'Add Expense'),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
