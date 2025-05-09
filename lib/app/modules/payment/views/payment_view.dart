import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/payment_controller.dart';

class PaymentView extends GetView<PaymentController> {
  PaymentView({super.key});

  final PaymentController _paymentController = Get.put(PaymentController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Get.back(),
          color: Colors.black, // Adjust color as needed
        ),
        title: const Text(''),
        // You might have a title here
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeaderImage(),
            const SizedBox(height: 20),
            _buildPaymentSummary(),
            const SizedBox(height: 20),
            Text(
              'Select your payment'
              // style: Get.textTheme.headline6!.copyWith(
              //   fontWeight: FontWeight.bold,
              )
            ,
            const SizedBox(height: 10),
            _buildPaymentMethod(
              isSelected:
                  _paymentController.selectedPayment.value ==
                  PaymentMethod.mastercard,
              onTap:
                  () => _paymentController.selectPayment(
                    PaymentMethod.mastercard,
                  ),
              logo: Image.asset('assets/image/logo.png', height: 30),
              // Replace with your asset
              title: 'Credit card',
              details: '5105 **** **** 0505',
            ),
            const SizedBox(height: 10),
            _buildPaymentMethod(
              isSelected:
                  _paymentController.selectedPayment.value ==
                  PaymentMethod.visa,
              onTap: () => _paymentController.selectPayment(PaymentMethod.visa),
              logo: Image.asset('assets/image/'
                  'logo.png', height: 30),
              // Replace with your asset
              title: 'Debit card',
              details: '3566 **** **** 0505',
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                OutlinedButton(
                  onPressed: () {
                    // Handle cancel order
                    print('Cancel Order');
                  },
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.redAccent,
                    side: const BorderSide(color: Colors.redAccent),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 30,
                      vertical: 12,
                    ),
                  ),
                  child: const Text('Cancel Order'),
                ),
                ElevatedButton(
                  onPressed: () {
                    if (_paymentController.selectedPayment.value != null) {
                      // Handle proceed order
                      print(
                        'Proceed Order with ${_paymentController.selectedPayment.value}',
                      );
                      // You would typically navigate to a confirmation screen or process the payment
                    } else {
                      Get.snackbar(
                        'Payment Method Required',
                        'Please select a payment method to proceed.',
                        snackPosition: SnackPosition.BOTTOM,
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.pink.shade400,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 30,
                      vertical: 12,
                    ),
                  ),
                  child: const Text('Proceed order'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeaderImage() {
    return Center(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.pink.shade100.withOpacity(
            0.8,
          ), // Approximate background color
        ),
        padding: const EdgeInsets.all(12.0),
        child: Image.asset(
          'assets/image/logo.png',
          // Replace with your actual logo asset path
          height: 80, // Adjust height as needed
        ),
      ),
    );
  }

  Widget _buildPaymentSummary() {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Payment summary',

          ),
          const SizedBox(height: 10),
          _buildSummaryItem('Price', '77,550'),
          _buildSummaryItem('Delivery fee', '9,000'),
          const Divider(color: Colors.grey),
          _buildSummaryItem(
            'Total Payment',
            '86,550',
            // style: Get.textTheme.subtitle1!.copyWith(
            //   fontWeight: FontWeight.bold,
            // ),
          ),
          const SizedBox(height: 8),
          InkWell(
            onTap: () {
              // Navigate to view details screen
              print('View Details tapped');
              Get.toNamed('/payment_details'); // Define this route
            },
            child: Row(
              children: [
                Text(
                  'View Details',
                  style: TextStyle(color: Colors.pink.shade400),
                ),
                const SizedBox(width: 8),
                Icon(Icons.arrow_forward_rounded, color: Colors.pink.shade400),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSummaryItem(String label, String value, {TextStyle? style}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Text(label, style: Get.textTheme.subtitle1),
          // Text(value, style: style ?? Get.textTheme.subtitle1),
        ],
      ),
    );
  }

  Widget _buildPaymentMethod({
    required bool isSelected,
    required VoidCallback onTap,
    required Widget logo,
    required String title,
    required String details,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(10),
      child: Container(
        padding: const EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: isSelected ? Colors.pink.shade400 : Colors.grey.shade300,
            width: isSelected ? 2 : 1,
          ),
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(8),
              ),
              child: logo,
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    // style: Get.textTheme.subtitle1!.copyWith(
                    //   fontWeight: FontWeight.bold,
                    // ),
                  ),
                  // Text(details, style: Get.textTheme.caption),
                ],
              ),
            ),
            Radio<PaymentMethod>(
              value:
                  title == 'Credit card'
                      ? PaymentMethod.mastercard
                      : PaymentMethod.visa,
              groupValue: _paymentController.selectedPayment.value,
              onChanged: (PaymentMethod? value) {
                if (value != null) {
                  _paymentController.selectPayment(value);
                }
              },
              activeColor: Colors.pink.shade400,
            ),
          ],
        ),
      ),
    );
  }
}
