import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

void main() {
  runApp(const MarineAquaApp());
}

// =====================================================
// COLORS
// =====================================================

const Color marineBlue = Color(0xFF005B96);
const Color marineCyan = Color(0xFF18A9D1);
const Color darkText = Color(0xFF123B5D);
const Color backgroundColor = Color(0xFFF4FAFC);

// =====================================================
// APP
// =====================================================

class MarineAquaApp extends StatelessWidget {
  const MarineAquaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Marine Aqua Technologies',
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: backgroundColor,
        colorScheme: ColorScheme.fromSeed(seedColor: marineBlue),
      ),
      home: const MainPage(),
    );
  }
}

// =====================================================
// PRODUCT MODEL
// =====================================================

class Product {
  final String name;
  final String image;

  const Product({
    required this.name,
    required this.image,
  });
}

// =====================================================
// 16 PRODUCTS
// =====================================================

const List<Product> products = [
  Product(name: 'Marine 6G', image: 'assets/marine_6g.png'),
  Product(name: 'Marine Volt-X', image: 'assets/marine_volt_x.png'),
  Product(name: 'Bio Sludge', image: 'assets/bio_sludge.png'),
  Product(name: 'Marine ProTab', image: 'assets/marine_protab.png'),
  Product(
    name: 'Vibrio Shield & ProTab',
    image: 'assets/vibrio_shield_protab.png',
  ),
  Product(name: 'Marine White Gut', image: 'assets/marine_white_gut.png'),
  Product(name: 'OxyTab Plus', image: 'assets/oxytab_plus.png'),
  Product(name: 'Free Moult', image: 'assets/free_moult.png'),
  Product(name: 'Red Thunder', image: 'assets/red_thunder.png'),
  Product(name: 'Zeoneem', image: 'assets/zeoneem.png'),
  Product(name: 'Starmin', image: 'assets/starmin.png'),
  Product(name: 'Nutrimin', image: 'assets/nutrimin.png'),
  Product(name: 'Bio Soil', image: 'assets/bio_soil.png'),
  Product(name: 'Chlorides', image: 'assets/chlorides.png'),
  Product(name: 'Yucca Pro', image: 'assets/yucca_pro.png'),
  Product(name: 'Hi-Soft', image: 'assets/hi_soft.png'),
];

// =====================================================
// MAIN PAGE
// =====================================================

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
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
      body: pages[selectedIndex],
      bottomNavigationBar: NavigationBar(
        selectedIndex: selectedIndex,
        backgroundColor: Colors.white,
        indicatorColor: const Color(0xFFD8F1F8),
        onDestinationSelected: (index) {
          setState(() => selectedIndex = index);
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

// =====================================================
// HOME PAGE
// =====================================================

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final FlutterTts tts = FlutterTts();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      welcomeVoice();
    });
  }

  Future<void> welcomeVoice() async {
    try {
      await tts.setLanguage('te-IN');
      await tts.setSpeechRate(0.45);
      await tts.setVolume(1.0);
      await tts.setPitch(1.0);
      await tts.speak(
        'మెరైన్ ఆక్వా టెక్నాలజీస్ కి స్వాగతం. '
        'స్మార్ట్ ఆక్వాకల్చర్. బెటర్ రిజల్ట్స్.',
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
    return SafeArea(
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Container(
              color: Colors.white,
              padding: const EdgeInsets.all(18),
              child: Row(
                children: [
                  Image.asset(
                    'assets/marine_logo.png',
                    width: 78,
                    height: 78,
                    fit: BoxFit.contain,
                    errorBuilder: (_, __, ___) =>
                        const Icon(Icons.water_drop, size: 60, color: marineBlue),
                  ),
                  const SizedBox(width: 12),
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'MARINE AQUA',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: marineBlue,
                          ),
                        ),
                        Text(
                          'TECHNOLOGIES',
                          style: TextStyle(
                            fontSize: 18,
                            letterSpacing: 2,
                            fontWeight: FontWeight.bold,
                            color: darkText,
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
                    onPressed: () {},
                    icon: const Icon(
                      Icons.notifications_none,
                      color: marineBlue,
                      size: 30,
                    ),
                  ),
                ],
              ),
            ),
          ),

          SliverToBoxAdapter(
            child: Container(
              margin: const EdgeInsets.all(18),
              padding: const EdgeInsets.all(25),
              height: 235,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(28),
                gradient: const LinearGradient(
                  colors: [
                    Color(0xFF064B83),
                    Color(0xFF078CD0),
                    Color(0xFF20B5C8),
                  ],
                ),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Healthy Ponds',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Stronger Shrimp',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Higher Profits',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Complete Aquaculture Solutions\nfor a Better Tomorrow',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
            ),
          ),

          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.fromLTRB(20, 5, 20, 12),
              child: Text(
                'Aquaculture Solutions',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: darkText,
                ),
              ),
            ),
          ),

          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            sliver: SliverGrid(
              delegate: SliverChildListDelegate([
                const HomeCard(
                  icon: Icons.lightbulb,
                  title: 'Tip Of The Day',
                  text:
                      'Maintain proper dissolved oxygen levels for better growth.',
                  color: Color(0xFFDDF7EA),
                ),
                const HomeCard(
                  icon: Icons.menu_book,
                  title: 'Shrimp Culture Guide',
                  text:
                      'Learn setup, management & best practices.',
                  color: Color(0xFFDDEFFF),
                ),
                const HomeCard(
                  icon: Icons.calculate,
                  title: 'Biomass Calculator',
                  text:
                      'Get estimated biomass in 3 easy steps.',
                  color: Color(0xFFDDF7EA),
                ),
                const HomeCard(
                  icon: Icons.health_and_safety,
                  title: 'Shrimp Diseases',
                  text:
                      'Identify and understand common diseases.',
                  color: Color(0xFFFFE1E1),
                ),
              ]),
              gridDelegate:
                  const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 0.95,
              ),
            ),
          ),

          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.fromLTRB(20, 25, 20, 12),
              child: Text(
                'Our Products',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: darkText,
                ),
              ),
            ),
          ),

          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            sliver: SliverGrid(
              delegate: SliverChildBuilderDelegate(
                (context, index) => ProductCard(product: products[index]),
                childCount: 4,
              ),
              gridDelegate:
                  const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 0.78,
              ),
            ),
          ),

          const SliverToBoxAdapter(
            child: SizedBox(height: 25),
          ),
        ],
      ),
    );
  }
}

// =====================================================
// HOME CARD
// =====================================================

class HomeCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String text;
  final Color color;

  const HomeCard({
    super.key,
    required this.icon,
    required this.title,
    required this.text,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(17),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(23),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 2),
          Icon(icon, size: 35, color: marineBlue),
          const SizedBox(height: 10),
          Text(
            title,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.bold,
              color: darkText,
            ),
          ),
          const SizedBox(height: 7),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                fontSize: 13,
                color: Colors.black54,
                height: 1.35,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// =====================================================
// PRODUCTS PAGE
// =====================================================

class ProductsPage extends StatelessWidget {
  const ProductsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CustomScrollView(
        slivers: [
          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.fromLTRB(20, 22, 20, 5),
              child: Text(
                'Our Products',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: darkText,
                ),
              ),
            ),
          ),
          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.fromLTRB(20, 0, 20, 18),
              child: Text(
                'Marine Aqua Technologies',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 15,
                ),
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            sliver: SliverGrid(
              delegate: SliverChildBuilderDelegate(
                (context, index) => ProductCard(product: products[index]),
                childCount: products.length,
              ),
              gridDelegate:
                  const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 14,
                childAspectRatio: 0.75,
              ),
            ),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(height: 30),
          ),
        ],
      ),
    );
  }
}

// =====================================================
// PRODUCT CARD
// =====================================================

class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(22),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => ProductDetailPage(product: product),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(22),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.06),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Image.asset(
                  product.image,
                  fit: BoxFit.contain,
                  errorBuilder: (_, __, ___) {
                    return const Icon(
                      Icons.image_not_supported,
                      size: 55,
                      color: Colors.grey,
                    );
                  },
                ),
              ),
            ),
            Text(
              product.name,
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: darkText,
              ),
            ),
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 14,
                vertical: 7,
              ),
              decoration: BoxDecoration(
                color: const Color(0xFFE5F5FA),
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Text(
                'View Details',
                style: TextStyle(
                  color: marineBlue,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// =====================================================
// PRODUCT DETAIL
// =====================================================

class ProductDetailPage extends StatelessWidget {
  final Product product;

  const ProductDetailPage({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    final bool isChlorides = product.name == 'Chlorides';

    return Scaffold(
      appBar: AppBar(
        title: Text(isChlorides ? 'Chlorides' : product.name),
        backgroundColor: Colors.white,
        foregroundColor: darkText,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 300,
              width: double.infinity,
              padding: const EdgeInsets.all(25),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(28),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 12,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: Image.asset(
                product.image,
                fit: BoxFit.contain,
                errorBuilder: (_, __, ___) {
                  return const Icon(
                    Icons.image_not_supported,
                    size: 60,
                    color: Colors.grey,
                  );
                },
              ),
            ),

            const SizedBox(height: 25),

            Text(
              isChlorides ? 'Chlorides' : product.name,
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: darkText,
              ),
            ),

            if (isChlorides) ...[
              const SizedBox(height: 8),
              const Text(
                'Essential Mineral Chlorides for Aquaculture',
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.grey,
                ),
              ),
            ],

            const SizedBox(height: 20),

            if (isChlorides) ...[
              const ChlorideProductBox(
                productName: 'Marine MAG',
                subtitle: 'Magnesium Mineral',
                composition: 'Magnesium Sulfate (MgSO₄)',
                benefits:
                    '• Improves water quality\n'
                    '• Enhances shrimp growth\n'
                    '• Supports molting\n'
                    '• Maintains mineral balance',
                dosage: 'As recommended by aqua consultant.',
              ),

              const SizedBox(height: 15),

              const ChlorideProductBox(
                productName: 'Marine POTASH MAX',
                subtitle: 'Potassium Mineral',
                composition: 'Potassium Chloride (KCl)',
                benefits:
                    '• Maintains water stability\n'
                    '• Supports osmoregulation\n'
                    '• Enhances shrimp growth\n'
                    '• Improves survival rate\n'
                    '• Balances mineral levels',
                dosage: 'As recommended by aqua consultant.',
              ),

              const SizedBox(height: 15),

              const ChlorideProductBox(
                productName: 'Marine CA MAX',
                subtitle: 'Calcium Mineral',
                composition: 'Calcium Chloride (CaCl₂)',
                benefits:
                    '• Improves shell hardness\n'
                    '• Enhances molting\n'
                    '• Supports muscle development\n'
                    '• Maintains pond water minerals\n'
                    '• Boosts shrimp survival',
                dosage: 'As recommended by aqua consultant.',
              ),

              const SizedBox(height: 15),

              const InfoBox(
                title: 'Storage & Handling',
                text:
                    'Keep in a cool, dry place.\n'
                    'Keep container tightly closed.\n'
                    'Protect from moisture.\n'
                    'Keep out of reach of children.\n'
                    'For aqua use only.',
              ),
            ] else ...[
              const InfoBox(
                title: 'Product Information',
                text: 'Product information will be displayed here.',
              ),
              const SizedBox(height: 15),
              const InfoBox(
                title: 'Benefits',
                text:
                    'Product benefits and technical information will be displayed here.',
              ),
              const SizedBox(height: 15),
              const InfoBox(
                title: 'Application',
                text:
                    'Application and dosage information will be displayed here.',
              ),
            ],

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}

// =====================================================
// CHLORIDE PRODUCT BOX
// =====================================================

class ChlorideProductBox extends StatelessWidget {
  final String productName;
  final String subtitle;
  final String composition;
  final String benefits;
  final String dosage;

  const ChlorideProductBox({
    super.key,
    required this.productName,
    required this.subtitle,
    required this.composition,
    required this.benefits,
    required this.dosage,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
        border: Border.all(
          color: const Color(0xFFD9EEF5),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            productName,
            style: const TextStyle(
              fontSize: 21,
              fontWeight: FontWeight.bold,
              color: marineBlue,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            subtitle,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Colors.black54,
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            'Composition',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: darkText,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            composition,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 15),
          const Text(
            'Benefits',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: darkText,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            benefits,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.black87,
              height: 1.5,
            ),
          ),
          const SizedBox(height: 15),
          const Text(
            'Dosage',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: darkText,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            dosage,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.black87,
              height: 1.4,
            ),
          ),
        ],
      ),
    );
  }
}

// =====================================================
// INFO BOX
// =====================================================

class InfoBox extends StatelessWidget {
  final String title;
  final String text;

  const InfoBox({
    super.key,
    required this.title,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: marineBlue,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            text,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.black54,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}

// =====================================================
// SUPPORT
// =====================================================

class SupportPage extends StatelessWidget {
  const SupportPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Support',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: darkText,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'We are here to help you with your aquaculture questions.',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 15,
              ),
            ),
            const SizedBox(height: 25),
            const SupportCard(
              icon: Icons.chat_bubble_outline,
              title: 'Ask Your Doubt',
              subtitle:
                  'Get help with aquaculture-related questions.',
            ),
            const SupportCard(
              icon: Icons.phone_outlined,
              title: 'Contact Support',
              subtitle:
                  'Connect with Marine Aqua Technologies support.',
            ),
            const SupportCard(
              icon: Icons.menu_book_outlined,
              title: 'Aquaculture Guide',
              subtitle:
                  'Learn about shrimp culture and pond management.',
            ),
          ],
        ),
      ),
    );
  }
}

// =====================================================
// SUPPORT CARD
// =====================================================

class SupportCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;

  const SupportCard({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: const Color(0xFFE3F4FA),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Icon(
              icon,
              color: marineBlue,
              size: 30,
            ),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: darkText,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  subtitle,
                  style: const TextStyle(
                    color: Colors.black54,
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

// =====================================================
// PROFILE
// =====================================================

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const SizedBox(height: 25),
            Image.asset(
              'assets/marine_logo.png',
              width: 120,
              height: 120,
              fit: BoxFit.contain,
              errorBuilder: (_, __, ___) =>
                  const Icon(Icons.water_drop, size: 90, color: marineBlue),
            ),
            const SizedBox(height: 18),
            const Text(
              'MARINE AQUA TECHNOLOGIES',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: darkText,
              ),
            ),
            const SizedBox(height: 5),
            const Text(
              'Smart Aquaculture. Better Results.',
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 30),
            const ProfileTile(
              icon: Icons.business_outlined,
              title: 'About Marine Aqua Technologies',
            ),
            const ProfileTile(
              icon: Icons.language,
              title: 'Language',
            ),
            const ProfileTile(
              icon: Icons.info_outline,
              title: 'App Information',
            ),
          ],
        ),
      ),
    );
  }
}

// =====================================================
// PROFILE TILE
// =====================================================

class ProfileTile extends StatelessWidget {
  final IconData icon;
  final String title;

  const ProfileTile({
    super.key,
    required this.icon,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
      ),
      child: ListTile(
        leading: Icon(icon, color: marineBlue),
        title: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: darkText,
          ),
        ),
        trailing: const Icon(
          Icons.chevron_right,
          color: Colors.grey,
        ),
      ),
    );
  }
}
