import 'package:budgetly/core/color_manager.dart';
import 'package:budgetly/models/expenses.dart';
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
  final TextEditingController amountController = TextEditingController();
  final TextEditingController titleController = TextEditingController();

  final List<Map<String, dynamic>> categories = [
    {'name': 'Food', 'icon': Icons.restaurant, 'color': Colors.orange},
    {'name': 'Transport', 'icon': Icons.directions_bus, 'color': Colors.blue},
    {'name': 'Shopping', 'icon': Icons.shopping_bag, 'color': Colors.purple},
    {
      'name': 'Health',
      'icon': Icons.medical_services,
      'color': Colors.redAccent,
    },
    {
      'name': 'Other',
      'icon': Icons.miscellaneous_services,
      'color': Colors.blueGrey,
    },
  ];

  int selectedCategoryIndex = 4;

  List<Expenses> expenses = [
    Expenses(
      amount: 30,
      title: 'Lunch',
      date: DateTime.now(),
      icon: Icons.restaurant,
      color: Colors.orange,
    ),
  ];
  @override
  void dispose() {
    amountController.dispose();
    titleController.dispose();
    super.dispose();
  }

  void _showCategoryPicker(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
      ),
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setSheetState) {
            return Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    "Select Category",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 20),
                  ...categories.asMap().entries.map((entry) {
                    int idx = entry.key;
                    var cat = entry.value;
                    return ListTile(
                      leading: CircleAvatar(
                        backgroundColor: cat['color'].withOpacity(0.2),
                        child: Icon(cat['icon'], color: cat['color']),
                      ),
                      title: Text(cat['name']),
                      trailing: selectedCategoryIndex == idx
                          ? Icon(Icons.check_circle, color: cat['color'])
                          : null,
                      onTap: () {
                        setState(() => selectedCategoryIndex = idx);
                        Navigator.pop(context);
                      },
                    );
                  }),
                  const SizedBox(height: 20),
                ],
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
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
          const SizedBox(width: 4),
        ],
        elevation: 0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Divider(
                thickness: 3,
                endIndent: 100,
                indent: 100,
                height: 2,
              ),
              const SizedBox(height: 20),
              const BudgetBox(),
              const SizedBox(height: 20),
              const Text(
                'Remaining',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                ),
              ),
              const Text(
                '2,400.00 EGP',
                style: TextStyle(
                  fontSize: 42,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
              const SizedBox(height: 32),
              // Quick Add
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
                        const SizedBox(height: 16),
                        CustomTextField(
                          controller: amountController,
                          hintText: '\$ 0.00',
                        ),
                        const SizedBox(height: 6),
                        CustomTextField(
                          controller: titleController,
                          hintText: 'Note (e.g., Coffee)',
                        ),
                        const SizedBox(height: 20),
                        InkWell(
                          onTap: () => _showCategoryPicker(context),
                          child: Row(
                            children: [
                              Icon(
                                categories[selectedCategoryIndex]['icon'],
                                color:
                                    categories[selectedCategoryIndex]['color'],
                                size: 26,
                              ),
                              Text(
                                '   ${categories[selectedCategoryIndex]['name']}',
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const Spacer(),
                              const Icon(
                                Icons.arrow_drop_down,
                                color: Colors.black,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 20),

                        CustomButton(
                          text: 'Add Expense',
                          onPressed: () {
                            if (amountController.text.isNotEmpty &&
                                titleController.text.isNotEmpty) {
                              setState(() {
                                expenses.insert(
                                  0,
                                  Expenses(
                                    amount: double.parse(amountController.text),
                                    title: titleController.text,
                                    date: DateTime.now(),
                                    icon:
                                        categories[selectedCategoryIndex]['icon'],
                                    color:
                                        categories[selectedCategoryIndex]['color'],
                                  ),
                                );
                                amountController.clear();
                                titleController.clear();
                                FocusScope.of(context).unfocus();
                              });
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Recent Expenses',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        'See All',
                        style: TextStyle(
                          color: ColorManager.blueColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 12),

              expenses.isEmpty
                  ? const Padding(
                      padding: EdgeInsets.all(40),
                      child: Text(
                        "No expenses yet!",
                        style: TextStyle(color: Colors.grey),
                      ),
                    )
                  : ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: expenses.length,
                      itemBuilder: (context, index) {
                        final item = expenses[index];
                        return ListTile(
                          leading: CircleAvatar(
                            backgroundColor: item.color.withValues(alpha: 0.15),
                            child: Icon(item.icon, color: item.color, size: 26),
                          ),
                          title: Text(
                            item.title,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          subtitle: Text("${item.date.day}/${item.date.month}"),
                          trailing: Text(
                            "-${item.amount} EGP",
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.red,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        );
                      },
                    ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
