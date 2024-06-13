import 'package:flutter/material.dart';

class SpendingTrackerScreen extends StatelessWidget {
  const SpendingTrackerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Informacion de balances'),
        centerTitle: true,
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Bienvenido,\nUsuario ARA!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Balance General',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                      const Text(
                        '\$100.30',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  const Icon(
                    Icons.add_box,
                    color: Colors.white,
                  )
                ],
              ),
            ),
            const SizedBox(height: 20),
            const TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                hintText: 'Search your spending',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView(
                children: [
                  SpendingCategoryCard(
                    color: Colors.orange,
                    icon: Icons.shopping_cart,
                    category: 'Despensa',
                    amount: '\$28.30',
                  ),
                  SpendingCategoryCard(
                    color: Colors.lightBlue,
                    icon: Icons.fastfood,
                    category: 'Carnes Frias',
                    amount: '\$28.30',
                  ),
                  SpendingCategoryCard(
                    color: Colors.pink,
                    icon: Icons.shopify,
                    category: 'Licores',
                    amount: '\$28.30',
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

class SpendingCategoryCard extends StatelessWidget {
  final Color color;
  final IconData icon;
  final String category;
  final String amount;

  const SpendingCategoryCard({
    required this.color,
    required this.icon,
    required this.category,
    required this.amount,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: color,
          child: Icon(icon, color: Colors.white),
        ),
        title: Text(category),
        trailing: Text(amount),
      ),
    );
  }
}
