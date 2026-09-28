import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MarineAquaApp());
}

class MarineAquaApp extends StatelessWidget {
  const MarineAquaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Marine Aqua Technologies',
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: 'Arial',
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF075985),
        ),
      ),
      home: const SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 2), () {
      if (!mounted) return;

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => const HomeScreen(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/products/marine logo.png',
                width: 230,
                height: 230,
                fit: BoxFit.contain,
              ),

              const SizedBox(height: 35),

              const Text(
                'ఆక్వా సాగులో ప్రతి దశలో... మీకు తోడుగా',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF064E7A),
                ),
              ),

              const SizedBox(height: 20),

              const Text(
                'Marine Aqua Technologies',
                style: TextStyle(
                  fontSize: 22,
                  color: Color(0xFF075985),
                ),
              ),

              const SizedBox(height: 45),

              const CircularProgressIndicator(
                strokeWidth: 4,
                color: Color(0xFF129BCB),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4FAFD),

      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'MARINE AQUA\nTECHNOLOGIES',
          style: TextStyle(
            color: Color(0xFF064E7A),
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.notifications_none,
              color: Color(0xFF064E7A),
            ),
            onPressed: () {},
          ),
        ],
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // HERO SECTION
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(28),
                gradient: const LinearGradient(
                  colors: [
                    Color(0xFF075985),
                    Color(0xFF129BCB),
                  ],
                ),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'ఆరోగ్యకరమైన చెరువులు',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  SizedBox(height: 5),

                  Text(
                    'బలమైన రొయ్యలు',
                    style: TextStyle(
                      color: Color(0xFFFFD600),
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  SizedBox(height: 5),

                  Text(
                    'అధిక లాభాలు',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  SizedBox(height: 18),

                  Text(
                    'మెరుగైన ఫలితాల కోసం\nసంపూర్ణ ఆక్వాకల్చర్ సొల్యూషన్స్',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                    ),
                  ),

                  SizedBox(height: 20),

                  Text(
                    'ప్రొడక్ట్స్ చూడండి  →',
                    style: TextStyle(
                      color: Color(0xFF064E7A),
                      backgroundColor: Colors.white,
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // THREE CARDS
            Row(
              children: [
                Expanded(
                  child: _HomeCard(
                    icon: Icons.menu_book,
                    title: 'రొయ్యల\nసాగు గైడ్',
                    color: Color(0xFFE1F3FF),
                  ),
                ),

                const SizedBox(width: 10),

                Expanded(
                  child: _HomeCard(
                    icon: Icons.calculate,
                    title: 'బయోమాస్\nకాలిక్యులేటర్',
                    color: Color(0xFFE2F8EA),
                  ),
                ),

                const SizedBox(width: 10),

                Expanded(
                  child: _HomeCard(
                    icon: Icons.health_and_safety,
                    title: 'రొయ్యల\nవ్యాధులు',
                    color: Color(0xFFFFE5E5),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 25),

            // PRODUCTS
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'మా ప్రొడక్ట్స్',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF064E7A),
                  ),
                ),

                TextButton(
                  onPressed: () {},
                  child: const Text('అన్నీ చూడండి →'),
                ),
              ],
            ),

            const SizedBox(height: 10),

            SizedBox(
              height: 190,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: const [
                  ProductCard(
                    image: 'assets/products/marine 6g.png',
                    name: 'Marine 6G',
                  ),
                  ProductCard(
                    image: 'assets/products/marine protab.png',
                    name: 'Marine ProTab',
                  ),
                  ProductCard(
                    image: 'assets/products/marine vibrio shield.png',
                    name: 'Marine Vibrio Shield',
                  ),
                  ProductCard(
                    image: 'assets/products/marine volt-x.png',
                    name: 'Marine Volt-X',
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // SUPPORT
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(22),
                gradient: const LinearGradient(
                  colors: [
                    Color(0xFFDFF4FF),
                    Color(0xFFEAF9FF),
                  ],
                ),
              ),
              child: Row(
                children: [
                  const Icon(
                    Icons.headset_mic,
                    size: 45,
                    color: Color(0xFF075985),
                  ),

                  const SizedBox(width: 15),

                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'టెక్నికల్ సపోర్ట్',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF064E7A),
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          'మా నిపుణుల బృందంతో సంప్రదించండి',
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),

                  ElevatedButton(
                    onPressed: () {},
                    child: const Text('సంప్రదించండి'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),

      // PROFILE REMOVE CHESAM
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: const Color(0xFF075985),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.inventory_2_outlined),
            label: 'Products',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.headset_mic_outlined),
            label: 'Support',
          ),
        ],
      ),
    );
  }
}

class _HomeCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final Color color;

  const _HomeCard({
    required this.icon,
    required this.title,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 145,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 40,
            color: const Color(0xFF087DB5),
          ),

          const SizedBox(height: 10),

          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15,
              color: Color(0xFF064E7A),
            ),
          ),
        ],
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final String image;
  final String name;

  const ProductCard({
    super.key,
    required this.image,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 155,
      margin: const EdgeInsets.only(right: 12),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: const Color(0xFFE0EEF5),
        ),
      ),
      child: Column(
        children: [
          Expanded(
            child: Image.asset(
              image,
              fit: BoxFit.contain,
              errorBuilder: (context, error, stackTrace) {
                return const Icon(
                  Icons.inventory_2,
                  size: 70,
                  color: Color(0xFF075985),
                );
              },
            ),
          ),

          Text(
            name,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Color(0xFF064E7A),
            ),
          ),
        ],
      ),
    );
  }
}
