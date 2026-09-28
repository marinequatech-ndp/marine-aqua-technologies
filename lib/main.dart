import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

void main() {
  runApp(const MarineAquaApp());
}

// ============================================================
// COLORS
// ============================================================

const Color marineBlue = Color(0xFF005B96);
const Color marineLightBlue = Color(0xFF087FC1);
const Color aquaBlue = Color(0xFF18A9D9);
const Color pageBg = Color(0xFFF4FAFD);
const Color darkText = Color(0xFF073B66);

// ============================================================
// APP
// ============================================================

class MarineAquaApp extends StatelessWidget {
  const MarineAquaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MARINE AQUA TECHNOLOGIES',
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: pageBg,
        colorScheme: ColorScheme.fromSeed(
          seedColor: marineBlue,
        ),
        fontFamily: 'Roboto',
      ),
      home: const SplashScreen(),
    );
  }
}

// ============================================================
// SPLASH SCREEN
// ============================================================

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final FlutterTts tts = FlutterTts();

  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(milliseconds: 700), () async {
      await speakWelcome();

      await Future.delayed(const Duration(milliseconds: 1800));

      if (!mounted) return;

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => const MainNavigation(),
        ),
      );
    });
  }

  Future<void> speakWelcome() async {
    try {
      await tts.setLanguage('en-IN');
      await tts.setSpeechRate(0.42);
      await tts.setPitch(1.0);

      await tts.speak(
        'Welcome to Marine Aqua Technologies. Smart Aquaculture. Better Results.',
      );
    } catch (_) {}
  }

  @override
  void dispose() {
    tts.stop();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 150,
              height: 150,
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: marineBlue.withOpacity(0.15),
                    blurRadius: 30,
                    spreadRadius: 5,
                  ),
                ],
              ),
              child: Image.asset(
                'lib/marine_logo.png',
                fit: BoxFit.contain,
              ),
            ),

            const SizedBox(height: 30),

            const Text(
              'MARINE AQUA',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w800,
                color: marineBlue,
                letterSpacing: 1,
              ),
            ),

            const Text(
              'TECHNOLOGIES',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w700,
                color: marineBlue,
                letterSpacing: 3,
              ),
            ),

            const SizedBox(height: 8),

            const Text(
              'Smart Aquaculture. Better Results.',
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey,
              ),
            ),

            const SizedBox(height: 45),

            const CircularProgressIndicator(
              color: marineBlue,
            ),
          ],
        ),
      ),
    );
  }
}

// ============================================================
// MAIN NAVIGATION
// ============================================================

class MainNavigation extends StatefulWidget {
  const MainNavigation({super.key});

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int selectedIndex = 0;

  final List<Widget> pages = const [
    HomePage(),
    ProductsPage(),
    SupportPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: selectedIndex,
        children: pages,
      ),

      bottomNavigationBar: NavigationBar(
        selectedIndex: selectedIndex,
        backgroundColor: const Color(0xFFF1F8FA),
        indicatorColor: const Color(0xFFD4F0F7),

        onDestinationSelected: (index) {
          setState(() {
            selectedIndex = index;
          });
        },

        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.inventory_2_outlined),
            selectedIcon: Icon(Icons.inventory_2),
            label: 'Products',
          ),
          NavigationDestination(
            icon: Icon(Icons.support_agent_outlined),
            selectedIcon: Icon(Icons.support_agent),
            label: 'Support',
          ),
          NavigationDestination(
            icon: Icon(Icons.person_outline),
            selectedIcon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

// ============================================================
// HOME PAGE
// ============================================================

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CustomScrollView(
        slivers: [

          // HEADER
          SliverToBoxAdapter(
            child: Container(
              padding: const EdgeInsets.fromLTRB(22, 18, 22, 15),
              color: Colors.white,
              child: Row(
                children: [
                  Container(
                    width: 70,
                    height: 70,
                    padding: const EdgeInsets.all(5),
                    child: Image.asset(
                      'lib/marine_logo.png',
                    ),
                  ),

                  const SizedBox(width: 12),

                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'MARINE AQUA',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w900,
                            color: marineBlue,
                          ),
                        ),
                        Text(
                          'TECHNOLOGIES',
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w800,
                            letterSpacing: 2,
                            color: marineBlue,
                          ),
                        ),
                        SizedBox(height: 3),
                        Text(
                          'Smart Aquaculture. Better Results.',
                          style: TextStyle(
                            fontSize: 11,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),

                  IconButton(
                    icon: const Icon(
                      Icons.notifications_none,
                      color: marineBlue,
                      size: 30,
                    ),
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('No new notifications'),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),

          // HERO
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(22, 15, 22, 5),
              child: Container(
                height: 235,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(28),
                  gradient: const LinearGradient(
                    colors: [
                      Color(0xFF034E8C),
                      Color(0xFF078ED1),
                      Color(0xFF21B3C8),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: Stack(
                  children: [

                    Positioned(
                      right: 20,
                      top: 45,
                      child: Icon(
                        Icons.water,
                        size: 110,
                        color: Colors.white.withOpacity(0.12),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.all(28),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Healthy Ponds',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.w800,
                            ),
                          ),

                          const Text(
                            'Stronger Shrimp',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.w800,
                            ),
                          ),

                          const Text(
                            'Higher Profits',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.w800,
                            ),
                          ),

                          const SizedBox(height: 12),

                          const Text(
                            'Complete Aquaculture Solutions\nfor a Better Tomorrow',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              height: 1.4,
                            ),
                          ),

                          const SizedBox(height: 14),

                          ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => const ProductsPage(),
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              foregroundColor: marineBlue,
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                            child: const Text(
                              'Explore Products →',
                              style: TextStyle(
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // SPACING
          const SliverToBoxAdapter(
            child: SizedBox(height: 18),
          ),

          // FOUR MAIN CARDS
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 22),
            sliver: SliverGrid(
              delegate: SliverChildListDelegate(
                [

                  HomeFeatureCard(
                    icon: Icons.lightbulb,
                    iconColor: Colors.orange,
                    title: 'Tip Of The Day',
                    description:
                        'Maintain proper dissolved oxygen levels for better growth.',
                    buttonText: 'Learn More',
                    background: const Color(0xFFDDF6E9),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const TipPage(),
                        ),
                      );
                    },
                  ),

                  HomeFeatureCard(
                    icon: Icons.menu_book,
                    iconColor: Colors.blue,
                    title: 'Shrimp Culture Guide',
                    description:
                        'Learn setup, management & best practices.',
                    buttonText: 'Explore Guide',
                    background: const Color(0xFFDCEFFF),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const GuidePage(),
                        ),
                      );
                    },
                  ),

                  HomeFeatureCard(
                    icon: Icons.calculate,
                    iconColor: Colors.teal,
                    title: 'Biomass Calculator',
                    description:
                        'Get estimated biomass in 3 easy steps.',
                    buttonText: 'Calculate Now',
                    background: const Color(0xFFDDF6E9),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const BiomassCalculatorPage(),
                        ),
                      );
                    },
                  ),

                  HomeFeatureCard(
                    icon: Icons.health_and_safety,
                    iconColor: Colors.redAccent,
                    title: 'Shrimp Diseases',
                    description:
                        'Identify, prevent & manage common diseases.',
                    buttonText: 'View Details',
                    background: const Color(0xFFFFE0E0),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const DiseasesPage(),
                        ),
                      );
                    },
                  ),
                ],
              ),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                childAspectRatio: 0.85,
              ),
            ),
          ),

          // AI VOICE ASSISTANT
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(22, 20, 22, 20),
              child: InkWell(
                borderRadius: BorderRadius.circular(25),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const VoiceAssistantPage(),
                    ),
                  );
                },
                child: Container(
                  padding: const EdgeInsets.all(22),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [
                        Color(0xFF064B7B),
                        Color(0xFF078FD1),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 62,
                        height: 62,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.18),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.mic,
                          color: Colors.white,
                          size: 32,
                        ),
                      ),

                      const SizedBox(width: 15),

                      const Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Ask Marine AI',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 21,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(
                              'Ask your aquaculture doubts using your voice.',
                              style: TextStyle(
                                color: Colors.white70,
                                fontSize: 13,
                              ),
                            ),
                          ],
                        ),
                      ),

                      const Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.white,
                        size: 18,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ============================================================
// FEATURE CARD
// ============================================================

class HomeFeatureCard extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String title;
  final String description;
  final String buttonText;
  final Color background;
  final VoidCallback onTap;

  const HomeFeatureCard({
    super.key,
    required this.icon,
    required this.iconColor,
    required this.title,
    required this.description,
    required this.buttonText,
    required this.background,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Icon(
            icon,
            color: iconColor,
            size: 36,
          ),

          const SizedBox(height: 13),

          Text(
            title,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              color: darkText,
              fontSize: 19,
              fontWeight: FontWeight.w800,
            ),
          ),

          const SizedBox(height: 7),

          Expanded(
            child: Text(
              description,
              style: const TextStyle(
                color: Color(0xFF526879),
                fontSize: 13,
                height: 1.35,
              ),
            ),
          ),

          const SizedBox(height: 10),

          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: onTap,
              style: ElevatedButton.styleFrom(
                backgroundColor: iconColor,
                foregroundColor: Colors.white,
                elevation: 0,
                padding: const EdgeInsets.symmetric(vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
              ),
              child: Text(
                buttonText,
                style: const TextStyle(
                  fontWeight: FontWeight.w800,
                  fontSize: 12,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ============================================================
// PRODUCTS
// ============================================================

class Product {
  final String name;
  final String image;
  final String description;
  final String dosage;

  const Product({
    required this.name,
    required this.image,
    required this.description,
    required this.dosage,
  });
}

const List<Product> products = [
  Product(
    name: 'Marine 6G',
    image: 'lib/marine 6g.png',
    description:
        'Liquid minerals designed to support mineral balance, moulting and shell formation.',
    dosage: 'Use according to pond mineral requirement.',
  ),
  Product(
    name: 'Bio Sludge-X',
    image: 'lib/bio sludge -x.png',
    description:
        'Nitrifying bacterial complex and enzyme activation system for pond management.',
    dosage: 'Use according to pond condition.',
  ),
  Product(
    name: 'Free Moult',
    image: 'lib/free moult.png',
    description:
        'Supports healthy moulting and mineral management in shrimp culture.',
    dosage: 'Follow product label recommendation.',
  ),
  Product(
    name: 'OXYTAB+',
    image: 'lib/oxytab.png',
    description:
        'Oxygen releasing tablets for supporting dissolved oxygen management.',
    dosage: 'Use according to pond oxygen requirement.',
  ),
  Product(
    name: 'Marine ProTab',
    image: 'lib/protab.png',
    description:
        'Probiotic tablet containing beneficial components for pond management.',
    dosage: '500 g per acre after Vibrio management as recommended.',
  ),
  Product(
    name: 'Vibrio Shield',
    image: 'lib/vibrio shield.png',
    description:
        'Pond management solution designed for Vibrio control support.',
    dosage: '1 L per acre.',
  ),
  Product(
    name: 'Marine Volt-X',
    image: 'lib/volt-x.png',
    description:
        'Growth support formula with essential amino acids and immune support components.',
    dosage: '5 ml per 1 kg feed.',
  ),
  Product(
    name: 'Starmin',
    image: 'lib/starmin.png',
    description:
        'Mineral support product for aquaculture pond management.',
    dosage: 'Follow product label recommendation.',
  ),
];

class ProductsPage extends StatelessWidget {
  const ProductsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Our Products',
          style: TextStyle(fontWeight: FontWeight.w800),
        ),
        backgroundColor: Colors.white,
        foregroundColor: marineBlue,
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(18),
        itemCount: products.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 14,
          mainAxisSpacing: 14,
          childAspectRatio: 0.72,
        ),
        itemBuilder: (context, index) {
          final product = products[index];

          return InkWell(
            borderRadius: BorderRadius.circular(20),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => ProductDetailsPage(
                    product: product,
                  ),
                ),
              );
            },
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.06),
                    blurRadius: 12,
                  ),
                ],
              ),
              child: Column(
                children: [
                  Expanded(
                    child: Image.asset(
                      product.image,
                      fit: BoxFit.contain,
                    ),
                  ),

                  const SizedBox(height: 8),

                  Text(
                    product.name,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: marineBlue,
                      fontWeight: FontWeight.w800,
                      fontSize: 16,
                    ),
                  ),

                  const SizedBox(height: 5),

                  const Text(
                    'View Details →',
                    style: TextStyle(
                      color: aquaBlue,
                      fontWeight: FontWeight.w700,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

// ============================================================
// PRODUCT DETAILS
// ============================================================

class ProductDetailsPage extends StatelessWidget {
  final Product product;

  const ProductDetailsPage({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product.name),
        backgroundColor: Colors.white,
        foregroundColor: marineBlue,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(22),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Container(
              width: double.infinity,
              height: 280,
              padding: const EdgeInsets.all(25),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25),
              ),
              child: Image.asset(
                product.image,
                fit: BoxFit.contain,
              ),
            ),

            const SizedBox(height: 25),

            Text(
              product.name,
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w900,
                color: marineBlue,
              ),
            ),

            const SizedBox(height: 20),

            const Text(
              'Benefits',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w800,
                color: darkText,
              ),
            ),

            const SizedBox(height: 8),

            Text(
              product.description,
              style: const TextStyle(
                fontSize: 16,
                height: 1.5,
                color: Colors.black87,
              ),
            ),

            const SizedBox(height: 25),

            Container(
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: const Color(0xFFE5F6FC),
                borderRadius: BorderRadius.circular(18),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(
                    Icons.science,
                    color: marineBlue,
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Dosage',
                          style: TextStyle(
                            fontWeight: FontWeight.w800,
                            fontSize: 17,
                            color: marineBlue,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          product.dosage,
                          style: const TextStyle(
                            fontSize: 15,
                          ),
                        ),
                      ],
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

// ============================================================
// TIP PAGE
// ============================================================

class TipPage extends StatelessWidget {
  const TipPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const InfoPage(
      title: 'Tip Of The Day',
      icon: Icons.lightbulb,
      content: '''
Maintain proper dissolved oxygen levels for better shrimp growth.

Regularly monitor:

• Dissolved Oxygen
• pH
• Temperature
• Salinity
• Alkalinity
• Ammonia

Good pond water management helps maintain a stable culture environment.
''',
    );
  }
}

// ============================================================
// GUIDE PAGE
// ============================================================

class GuidePage extends StatelessWidget {
  const GuidePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const InfoPage(
      title: 'Shrimp Culture Guide',
      icon: Icons.menu_book,
      content: '''
Shrimp Culture Basic Guide

1. Pond Preparation
Prepare the pond properly before stocking.

2. Water Quality
Monitor pH, alkalinity, salinity, temperature and dissolved oxygen.

3. Seed Stocking
Use healthy and good-quality shrimp seed.

4. Feeding
Feed according to shrimp biomass, appetite and pond condition.

5. Pond Monitoring
Regularly observe water colour, bottom condition and shrimp behaviour.

6. Health Management
Monitor shrimp for abnormal swimming, poor feeding, gut issues and moulting problems.

7. Record Keeping
Maintain regular records of feed, water parameters and pond observations.
''',
    );
  }
}

// ============================================================
// DISEASES PAGE
// ============================================================

class DiseasesPage extends StatelessWidget {
  const DiseasesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final diseases = [
      {
        'name': 'White Gut',
        'icon': Icons.warning_amber_rounded,
        'text':
            'Observe gut appearance, feeding behaviour and pond conditions. Maintain good water and bottom management.'
      },
      {
        'name': 'Vibrio Related Problems',
        'icon': Icons.bug_report,
        'text':
            'Maintain pond hygiene, organic load management and stable water parameters.'
      },
      {
        'name': 'Moulting Stress',
        'icon': Icons.change_circle,
        'text':
            'Monitor mineral balance, alkalinity and water quality during moulting periods.'
      },
      {
        'name': 'Poor Growth',
        'icon': Icons.trending_down,
        'text':
            'Check feeding, water quality, biomass, health status and overall pond management.'
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Shrimp Diseases',
          style: TextStyle(fontWeight: FontWeight.w800),
        ),
        backgroundColor: Colors.white,
        foregroundColor: marineBlue,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(18),
        itemCount: diseases.length,
        itemBuilder: (context, index) {
          final disease = diseases[index];

          return Container(
            margin: const EdgeInsets.only(bottom: 15),
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  disease['icon'] as IconData,
                  color: Colors.redAccent,
                  size: 35,
                ),
                const SizedBox(width: 15),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        disease['name'] as String,
                        style: const TextStyle(
                          fontSize: 19,
                          fontWeight: FontWeight.w800,
                          color: darkText,
                        ),
                      ),
                      const SizedBox(height: 7),
                      Text(
                        disease['text'] as String,
                        style: const TextStyle(
                          fontSize: 14,
                          height: 1.45,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

// ============================================================
// BIOMASS CALCULATOR
// ============================================================

class BiomassCalculatorPage extends StatefulWidget {
  const BiomassCalculatorPage({super.key});

  @override
  State<BiomassCalculatorPage> createState() =>
      _BiomassCalculatorPageState();
}

class _BiomassCalculatorPageState
    extends State<BiomassCalculatorPage> {

  final TextEditingController countController =
      TextEditingController();

  final TextEditingController weightController =
      TextEditingController();

  double? result;

  void calculate() {
    final count = double.tryParse(countController.text);
    final weight = double.tryParse(weightController.text);

    if (count == null || weight == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Please enter shrimp count and average body weight.',
          ),
        ),
      );
      return;
    }

    setState(() {
      result = (count * weight) / 1000;
    });
  }

  @override
  void dispose() {
    countController.dispose();
    weightController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Biomass Calculator'),
        backgroundColor: Colors.white,
        foregroundColor: marineBlue,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(22),
        child: Column(
          children: [

            const Icon(
              Icons.calculate,
              size: 75,
              color: Colors.teal,
            ),

            const SizedBox(height: 20),

            const Text(
              'Estimate Shrimp Biomass',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w800,
                color: marineBlue,
              ),
            ),

            const SizedBox(height: 30),

            TextField(
              controller: countController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Number of Shrimp',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.numbers),
              ),
            ),

            const SizedBox(height: 18),

            TextField(
              controller: weightController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Average Weight (grams)',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.scale),
              ),
            ),

            const SizedBox(height: 25),

            SizedBox(
              width: double.infinity,
              height: 52,
              child: ElevatedButton(
                onPressed: calculate,
                child: const Text(
                  'CALCULATE BIOMASS',
                  style: TextStyle(
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
            ),

            if (result != null) ...[
              const SizedBox(height: 30),

              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(25),
                decoration: BoxDecoration(
                  color: const Color(0xFFDDF6E9),
                  borderRadius: BorderRadius.circular(22),
                ),
                child: Column(
                  children: [
                    const Text(
                      'Estimated Biomass',
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w700,
                      ),
                    ),

                    const SizedBox(height: 10),

                    Text(
                      '${result!.toStringAsFixed(2)} kg',
                      style: const TextStyle(
                        fontSize: 34,
                        fontWeight: FontWeight.w900,
                        color: Colors.teal,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

// ============================================================
// VOICE ASSISTANT
// ============================================================

class VoiceAssistantPage extends StatefulWidget {
  const VoiceAssistantPage({super.key});

  @override
  State<VoiceAssistantPage> createState() =>
      _VoiceAssistantPageState();
}

class _VoiceAssistantPageState
    extends State<VoiceAssistantPage> {

  final stt.SpeechToText speech = stt.SpeechToText();
  final FlutterTts tts = FlutterTts();

  bool listening = false;

  String question = '';
  String answer =
      'Namaskaram! Mee aquaculture doubt ni voice lo adagandi.';

  @override
  void initState() {
    super.initState();

    tts.setLanguage('en-IN');
    tts.setSpeechRate(0.43);
  }

  Future<void> startListening() async {
    final available = await speech.initialize();

    if (!available) {
      setState(() {
        answer =
            'Voice recognition is not available on this device.';
      });
      return;
    }

    setState(() {
      listening = true;
    });

    await speech.listen(
      onResult: (result) {
        setState(() {
          question = result.recognizedWords;
        });

        if (result.finalResult) {
          processQuestion(result.recognizedWords);
        }
      },
    );
  }

  Future<void> stopListening() async {
    await speech.stop();

    setState(() {
      listening = false;
    });
  }

  Future<void> processQuestion(String q) async {
    final text = q.toLowerCase();

    String response;

    if (text.contains('oxygen') ||
        text.contains('do') ||
        text.contains('dissolved oxygen')) {
      response =
          'Pond lo dissolved oxygen ni regular ga monitor cheyyali. Shrimp feeding, weather, stocking density and pond condition batti oxygen requirement marutundi.';
    } else if (text.contains('ph')) {
      response =
          'Pond pH stable ga maintain cheyyadam important. Sudden pH changes shrimp stress ki reason avvachu.';
    } else if (text.contains('vibrio')) {
      response =
          'Vibrio management kosam pond hygiene, organic load control, stable water parameters mariyu proper pond management important.';
    } else if (text.contains('growth') ||
        text.contains('weight')) {
      response =
          'Shrimp growth kosam quality feed, proper feeding management, water quality, mineral balance and good pond conditions important.';
    } else if (text.contains('moult') ||
        text.contains('moulting')) {
      response =
          'Moulting time lo mineral balance, alkalinity and water quality ni carefully monitor cheyyali.';
    } else if (text.contains('ammonia')) {
      response =
          'Ammonia increase ayithe feeding, organic load, pH and pond bottom condition ni check cheyyali.';
    } else if (text.contains('salinity')) {
      response =
          'Salinity ni sudden ga change cheyyakunda stable ga maintain cheyyadam shrimp culture lo important.';
    } else if (text.contains('hello') ||
        text.contains('hi')) {
      response =
          'Namaskaram! Marine Aqua Technologies ki swagatham. Mee pond doubt adagandi.';
    } else {
      response =
          'Mee question ni ardham chesukunnanu. Detailed AI answer kosam future version lo advanced AI service ni connect cheyyachu. Present ga oxygen, pH, Vibrio, growth, moulting, ammonia and salinity related questions ki answer chepthanu.';
    }

    setState(() {
      answer = response;
      listening = false;
    });

    await tts.speak(response);
  }

  @override
  void dispose() {
    speech.stop();
    tts.stop();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Marine AI Assistant',
          style: TextStyle(
            fontWeight: FontWeight.w800,
          ),
        ),
        backgroundColor: Colors.white,
        foregroundColor: marineBlue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(22),
        child: Column(
          children: [

            const SizedBox(height: 25),

            Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: const LinearGradient(
                  colors: [
                    marineBlue,
                    aquaBlue,
                  ],
                ),
                boxShadow: [
                  BoxShadow(
                    color: aquaBlue.withOpacity(0.25),
                    blurRadius: 25,
                    spreadRadius: 5,
                  ),
                ],
              ),
              child: Icon(
                listening ? Icons.mic : Icons.mic_none,
                color: Colors.white,
                size: 55,
              ),
            ),

            const SizedBox(height: 25),

            const Text(
              'Ask Your Pond Doubt',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.w900,
                color: marineBlue,
              ),
            ),

            const SizedBox(height: 8),

            const Text(
              'Tap the microphone and speak.',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.grey,
                fontSize: 15,
              ),
            ),

            const SizedBox(height: 25),

            if (question.isNotEmpty)
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(18),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(18),
                ),
                child: Text(
                  'You: $question',
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),

            const SizedBox(height: 15),

            Expanded(
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: const Color(0xFFE4F6FC),
                  borderRadius: BorderRadius.circular(22),
                ),
                child: SingleChildScrollView(
                  child: Text(
                    answer,
                    style: const TextStyle(
                      fontSize: 16,
                      height: 1.55,
                      color: darkText,
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),

            SizedBox(
              width: double.infinity,
              height: 58,
              child: ElevatedButton.icon(
                onPressed:
                    listening ? stopListening : startListening,
                icon: Icon(
                  listening ? Icons.stop : Icons.mic,
                ),
                label: Text(
                  listening
                      ? 'STOP LISTENING'
                      : 'ASK BY VOICE',
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      listening ? Colors.red : marineBlue,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18),
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

// ============================================================
// SUPPORT
// ============================================================

class SupportPage extends StatelessWidget {
  const SupportPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Support',
          style: TextStyle(fontWeight: FontWeight.w800),
        ),
        backgroundColor: Colors.white,
        foregroundColor: marineBlue,
      ),
      body: ListView(
        padding: const EdgeInsets.all(22),
        children: [

          const Icon(
            Icons.support_agent,
            size: 80,
            color: marineBlue,
          ),

          const SizedBox(height: 15),

          const Text(
            'Marine Aqua Technologies Support',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w900,
              color: marineBlue,
            ),
          ),

          const SizedBox(height: 30),

          SupportTile(
            icon: Icons.phone,
            title: 'Customer Support',
            subtitle: 'Contact our support team',
            onTap: () {},
          ),

          SupportTile(
            icon: Icons.location_on,
            title: 'Technical Support',
            subtitle: 'Get aquaculture guidance',
            onTap: () {},
          ),

          SupportTile(
            icon: Icons.chat,
            title: 'Ask Marine AI',
            subtitle: 'Ask your pond doubts by voice',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const VoiceAssistantPage(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class SupportTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  const SupportTile({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 15),
      elevation: 0,
      child: ListTile(
        onTap: onTap,
        contentPadding: const EdgeInsets.all(15),
        leading: CircleAvatar(
          backgroundColor: const Color(0xFFE0F2F8),
          child: Icon(
            icon,
            color: marineBlue,
          ),
        ),
        title: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.w800,
          ),
        ),
        subtitle: Text(subtitle),
        trailing: const Icon(
          Icons.arrow_forward_ios,
          size: 16,
        ),
      ),
    );
  }
}

// ============================================================
// PROFILE
// ============================================================

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Profile',
          style: TextStyle(fontWeight: FontWeight.w800),
        ),
        backgroundColor: Colors.white,
        foregroundColor: marineBlue,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(22),
        child: Column(
          children: [

            const SizedBox(height: 20),

            Container(
              width: 110,
              height: 110,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: marineBlue.withOpacity(0.12),
                    blurRadius: 20,
                  ),
                ],
              ),
              child: Image.asset(
                'lib/marine_logo.png',
              ),
            ),

            const SizedBox(height: 20),

            const Text(
              'MARINE AQUA TECHNOLOGIES',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 21,
                fontWeight: FontWeight.w900,
                color: marineBlue,
              ),
            ),

            const SizedBox(height: 8),

            const Text(
              'Smart Aquaculture. Better Results.',
              style: TextStyle(
                color: Colors.grey,
              ),
            ),

            const SizedBox(height: 35),

            ProfileTile(
              icon: Icons.business,
              title: 'Company',
              value: 'Marine Aqua Technologies',
            ),

            ProfileTile(
              icon: Icons.water,
              title: 'Industry',
              value: 'Aquaculture',
            ),

            ProfileTile(
              icon: Icons.info_outline,
              title: 'App Version',
              value: '1.0.0',
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;

  const ProfileTile({
    super.key,
    required this.icon,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Row(
        children: [
          Icon(
            icon,
            color: marineBlue,
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 12,
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  value,
                  style: const TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 15,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ============================================================
// COMMON INFO PAGE
// ============================================================

class InfoPage extends StatelessWidget {
  final String title;
  final IconData icon;
  final String content;

  const InfoPage({
    super.key,
    required this.title,
    required this.icon,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.w800,
          ),
        ),
        backgroundColor: Colors.white,
        foregroundColor: marineBlue,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(22),
        child: Column(
          children: [

            Icon(
              icon,
              size: 75,
              color: marineBlue,
            ),

            const SizedBox(height: 20),

            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(22),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(22),
              ),
              child: Text(
                content,
                style: const TextStyle(
                  fontSize: 16,
                  height: 1.6,
                  color: darkText,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
