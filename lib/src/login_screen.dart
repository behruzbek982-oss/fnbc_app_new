import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Родной фон Scaffold делаем фиолетовым для плавной стыковки с шапкой
      backgroundColor: const Color(0xFF5C2684), 
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            // 1. Верхняя фиолетовая шапка
            SliverToBoxAdapter(
              child: Container(
                width: double.infinity,
                color: const Color(0xFF5C2684),
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Icon(Icons.arrow_back, color: Colors.white),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Bank at your finger tips',
                            style: TextStyle(color: Colors.white70, fontSize: 16),
                          ),
                          Image.asset(
                            'assets/images/2.png',
                            height: 70,
                            width: 50,
                            errorBuilder: (context, error, stackTrace) =>
                                const Icon(Icons.image, color: Colors.white, size: 50),
                          ),
                        ],
                      ),
                      const Text(
                        'Login Method',
                        style: TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            // 2. Белый контейнер, который ВСЕГДА заполняет всё оставшееся пространство до самого низа
            SliverFillRemaining(
              hasScrollBody: false, // Позволяет контенту внутри скроллиться, если он не влезает
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white, // Белый цвет полностью закроет низ
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 30.0),
                  child: Column(
                    children: [
                      // Вкладки
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          const Text(
                            'Quick Access MPIN',
                            style: TextStyle(
                              color: Color(0xFF5C2684),
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            'Customer ID',
                            style: TextStyle(
                              color: Colors.grey.shade600,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 40),

                      // Ячейки пин-кода
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          4,
                          (index) => Container(
                            width: 56,
                            height: 60,
                            margin: const EdgeInsets.symmetric(horizontal: 8),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                color: Colors.grey.shade300,
                                width: 1.5,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),

                      // Кнопка Forgot MPIN?
                      TextButton(
                        onPressed: () {},
                        child: const Text(
                          'Forgot MPIN?',
                          style: TextStyle(color: Color(0xFF5C2684), fontWeight: FontWeight.bold),
                        ),
                      ),
                      const SizedBox(height: 10),

                      // Фиолетовая кнопка Login
                      SizedBox(
                        width: double.infinity,
                        height: 55,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF5C2684),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                          ),
                          child: const Text('Login', style: TextStyle(color: Colors.white, fontSize: 16)),
                        ),
                      ),
                      const SizedBox(height: 20),

                      // Кнопка Login with Face ID (с серой рамкой)
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12.0),
                          border: Border.all(color: Colors.grey.shade300, width: 1.0),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(Icons.face, color: Color(0xFF5C2684)), // Временная иконка
                            const SizedBox(width: 12),
                            const Text(
                              'Login with Face ID',
                              style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 30),

                      // Ссылка Create an account?
                      TextButton(
                        onPressed: () {},
                        child: const Text(
                          'Create an account?',
                          style: TextStyle(color: Color(0xFF5C2684), fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
