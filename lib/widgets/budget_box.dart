import 'package:budgetly/core/color_manager.dart';
import 'package:flutter/material.dart';

class BudgetBox extends StatelessWidget {
  const BudgetBox({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 350,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        elevation: 2,
        clipBehavior: Clip.antiAlias,
        child: Column(
          children: [
            Container(
              height: 100,
              width: double.infinity,
              color: ColorManager.lighterBlue,
              child: Icon(
                Icons.account_balance_wallet_rounded,
                color: ColorManager.blueColor,
                size: 40,
              ),
            ),
            Container(
              color: Colors.white,
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: .spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: .start,
                    children: [
                      Text(
                        'Monthly Budget',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                          letterSpacing: 1.2,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        '4,000.00 EGP',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF1A1C1E),
                        ),
                      ),
                    ],
                  ),
                  TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                      backgroundColor: Color(0xFFE8F0FE),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: Text(
                      'Edit',
                      style: TextStyle(
                        color: ColorManager.blueColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
