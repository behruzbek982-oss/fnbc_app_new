import 'package:flutter/material.dart';

const Color kPurple = Color(0xFF5B2D82);
const Color kPurpleLight = Color(0xFFF3EFFA);
const Color kGold = Color(0xFFF2B705);
const Color kGreen = Color(0xFF2ECC71);
const Color kRed = Color(0xFFE74C3C);

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _balanceVisible = true;
  int _currentNavIndex = 0;

  void _doNothing() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            _buildTopBar(context),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 16),
                    _buildBalanceCard(),
                    const SizedBox(height: 20),
                    _buildSearchBar(),
                    const SizedBox(height: 24),
                    _buildSectionHeader('Quick Access'),
                    const SizedBox(height: 12),
                    _buildQuickAccessGrid(),
                    const SizedBox(height: 24),
                    _buildSectionHeader('Transactions'),
                    const SizedBox(height: 8),
                    _buildTransactionItem(
                      icon: Icons.call_received,
                      iconBg: kGreen.withValues(alpha: 0.15),
                      iconColor: kGreen,
                      title: 'Received from John',
                      subtitle: '3:00 PM',
                      amount: '+3,982.5',
                      amountColor: kGreen,
                    ),
                    _buildTransactionItem(
                      icon: Icons.call_made,
                      iconBg: kRed.withValues(alpha: 0.15),
                      iconColor: kRed,
                      title: 'Transfer to Devid',
                      subtitle: '1:15 PM',
                      amount: '-135.3',
                      amountColor: kRed,
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNav(),
    );
  }

  Widget _buildTopBar(BuildContext context) {
    return Container(
      color: kPurpleLight,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SideMenuScreen()),
              );
            },
            child: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Icon(Icons.menu, color: kPurple),
            ),
          ),
          const Text(
            'F N B C',
            style: TextStyle(
              color: kPurple,
              fontSize: 20,
              fontWeight: FontWeight.bold,
              letterSpacing: 2,
            ),
          ),
          InkWell(
            onTap: _doNothing,
            child: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Icon(Icons.notifications_none, color: kPurple),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBalanceCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: kPurple,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'BASIC CURRENT ACCOUNT',
            style: TextStyle(
              color: Colors.white70,
              fontSize: 12,
              letterSpacing: 1,
            ),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Text(
                _balanceVisible ? '₹ 8,92,135.66' : '₹ ••••••••',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(width: 10),
              InkWell(
                onTap: () {
                  setState(() {
                    _balanceVisible = !_balanceVisible;
                  });
                },
                child: Icon(
                  _balanceVisible
                      ? Icons.visibility_outlined
                      : Icons.visibility_off_outlined,
                  color: Colors.white70,
                  size: 20,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'JOHN SMITH',
                style: TextStyle(color: Colors.white70, fontSize: 12),
              ),
              Row(
                children: [
                  const Text(
                    '8327642732',
                    style: TextStyle(color: Colors.white70, fontSize: 12),
                  ),
                  const SizedBox(width: 6),
                  InkWell(
                    onTap: _doNothing,
                    child: const Icon(
                      Icons.copy,
                      color: Colors.white70,
                      size: 14,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSearchBar() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14),
      decoration: BoxDecoration(
        color: const Color(0xFFF5F5F7),
        borderRadius: BorderRadius.circular(12),
      ),
      child: const TextField(
        enabled: false,
        decoration: InputDecoration(
          icon: Icon(Icons.search, color: kPurple),
          hintText: 'Search here...',
          border: InputBorder.none,
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        InkWell(
          onTap: _doNothing,
          child: const Text(
            'View All',
            style: TextStyle(
              color: kPurple,
              fontSize: 13,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildQuickAccessGrid() {
    final items = [
      _QuickItem('Transfer', Icons.compare_arrows, kGold),
      _QuickItem('Airtime', Icons.phone_iphone, kGold),
      _QuickItem('Scan To Pay', Icons.qr_code_scanner, kGold),
      _QuickItem('Utilities', Icons.bolt, kGold),
      _QuickItem('Quick Loan', Icons.account_balance_wallet, kGold),
      _QuickItem('Statement', Icons.description_outlined, kGold),
      _QuickItem('Pay Bill', Icons.receipt_long, kGold),
      _QuickItem('Events', Icons.emoji_events_outlined, kGold),
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: items.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        mainAxisSpacing: 12,
        crossAxisSpacing: 8,
        childAspectRatio: 0.75,
      ),
      itemBuilder: (context, index) {
        final item = items[index];
        return InkWell(
          onTap: _doNothing,
          child: Column(
            children: [
              Container(
                width: 52,
                height: 52,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.grey.shade300),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(item.icon, color: item.color),
              ),
              const SizedBox(height: 6),
              Text(
                item.label,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 11),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildTransactionItem({
    required IconData icon,
    required Color iconBg,
    required Color iconColor,
    required String title,
    required String subtitle,
    required String amount,
    required Color amountColor,
  }) {
    return InkWell(
      onTap: _doNothing,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Row(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: iconBg,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(icon, color: iconColor, size: 20),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    subtitle,
                    style: TextStyle(color: Colors.grey.shade600, fontSize: 12),
                  ),
                ],
              ),
            ),
            Text(
              amount,
              style: TextStyle(color: amountColor, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomNav() {
    final items = [
      _NavItem('Home', Icons.home_outlined, Icons.home),
      _NavItem('Transactions', Icons.receipt_long_outlined, Icons.receipt_long),
      _NavItem('My Cards', Icons.credit_card_outlined, Icons.credit_card),
      _NavItem('Setting', Icons.settings_outlined, Icons.settings),
    ];

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 8,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(items.length, (index) {
          final selected = index == _currentNavIndex;
          final item = items[index];
          return InkWell(
            onTap: () {
              setState(() {
                _currentNavIndex = index;
              });
            },
            child: Column(
              children: [
                Icon(
                  selected ? item.activeIcon : item.icon,
                  color: selected ? kPurple : Colors.grey,
                  size: 22,
                ),
                const SizedBox(height: 4),
                Text(
                  item.label,
                  style: TextStyle(
                    color: selected ? kPurple : Colors.grey,
                    fontSize: 11,
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}

class _QuickItem {
  final String label;
  final IconData icon;
  final Color color;
  _QuickItem(this.label, this.icon, this.color);
}

class _NavItem {
  final String label;
  final IconData icon;
  final IconData activeIcon;
  _NavItem(this.label, this.icon, this.activeIcon);
}

class SideMenuScreen extends StatelessWidget {
  const SideMenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: const Center(child: Text('Страница напарника (боковое меню)')),
    );
  }
}
