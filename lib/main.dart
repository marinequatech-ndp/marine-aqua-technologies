import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

void main() {
  runApp(const MarineAquaApp());
}

// ============================================================
// COLORS
// ============================================================

const Color marineBlue = Color(0xFF005B96);
const Color marineCyan = Color(0xFF18A9D1);
const Color darkText = Color(0xFF123B5D);
const Color backgroundColor = Color(0xFFF4FAFC);

// ============================================================
// APP
// ============================================================

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
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          foregroundColor: darkText,
          elevation: 0,
        ),
      ),
      home: const MainPage(),
    );
  }
}

// ============================================================
// PRODUCT MODEL
// ============================================================

class Product {
  final String name;
  final String image;
  final String category;
  final String shortDescription;
  final String composition;
  final String benefits;
  final String dosage;
  final String application;
  final String technology;

  const Product({
    required this.name,
    required this.image,
    required this.category,
    required this.shortDescription,
    required this.composition,
    required this.benefits,
    required this.dosage,
    required this.application,
    required this.technology,
  });
}

// ============================================================
// 16 PRODUCTS
// NOTE: Chlorides is intentionally ONE product/category.
// ============================================================

const List<Product> products = [
  Product(
    name: 'Marine 6G',
    image: 'assets/products/marine 6g.png',
    category: 'Liquid Minerals',
    shortDescription:
        'Liquid mineral support for shrimp mineral balance, moulting and shell formation.',
    composition: 'Liquid mineral blend.',
    benefits:
        'Supports mineral balance, moulting, shell formation and overall shrimp condition.',
    dosage: 'Use as recommended by your aqua consultant.',
    application:
        'Apply according to pond condition, salinity and mineral requirement.',
    technology: 'Liquid Mineral Support Technology',
  ),
  Product(
    name: 'Marine Volt-X',
    image: 'assets/products/marine volt-x.png',
    category: 'Growth & Feed Support',
    shortDescription:
        'Feed supplement designed to support growth, feed utilization and shrimp performance.',
    composition: 'Essential amino acids and beta-glucan immune-supporting components.',
    benefits:
        'Supports growth, feed utilization and shrimp immune support.',
    dosage: '5 ml per 1 kg feed daily.',
    application:
        'Mix the required quantity uniformly with feed before feeding.',
    technology: 'Growth & Feed Utilization Support',
  ),
  Product(
    name: 'Bio Sludge-X',
    image: 'assets/products/Bio sludge.png',
    category: 'Pond & Sludge Management',
    shortDescription:
        'Biological pond-support product for organic sludge breakdown and pond cleanliness.',
    composition: 'Nitrifying bacterial complex with enzyme activation support.',
    benefits:
        'Supports sludge degradation, organic-load management and reduction of harmful pond gases.',
    dosage: 'Use as recommended by your aqua consultant.',
    application:
        'Apply evenly across the pond, preferably according to sludge load and pond condition.',
    technology: 'Biological Sludge Degradation Technology',
  ),
  Product(
    name: 'Marine ProTab',
    image: 'assets/products/marine protab.png',
    category: 'Probiotic Tablets',
    shortDescription:
        'Probiotic tablet support for pond microbial balance and shrimp gut environment.',
    composition: 'Mannan oligosaccharides, beta glucans and probiotic-support components.',
    benefits:
        'Supports beneficial microbial balance, gut condition and pond stability.',
    dosage: '500 g per acre.',
    application:
        'Commonly used after Vibrio Shield, with a 24–48 hour interval as part of the recommended program.',
    technology: 'Probiotic Tablet Technology',
  ),
  Product(
    name: 'Marine Vibrio Shield',
    image: 'assets/products/Marine vibrio shield.png',
    category: 'Vibrio Management',
    shortDescription:
        'Pond-management product intended to support control of Vibrio-related pond challenges.',
    composition: 'Vibrio-management formulation.',
    benefits:
        'Supports Vibrio management and helps maintain a healthier pond microbial environment.',
    dosage: '1 L per acre.',
    application:
        'Dilute and distribute evenly throughout the pond according to the recommended application program.',
    technology: 'Vibrio Management Support',
  ),
  Product(
    name: 'Marine White Shield',
    image: 'assets/products/marine white shield.png',
    category: 'White Gut Support',
    shortDescription:
        'Pond-support solution for shrimp gut and feeding-related health management.',
    composition: 'Aquaculture gut-support formulation.',
    benefits:
        'Supports shrimp gut condition, feed response and overall digestive health.',
    dosage: 'Use as recommended by your aqua consultant.',
    application:
        'Use according to pond condition and the recommended culture-management program.',
    technology: 'Gut Health Support Technology',
  ),
  Product(
    name: 'OxyTab Plus',
    image: 'assets/products/oxytab plus.png',
    category: 'Oxygen Support',
    shortDescription:
        'Oxygen-support tablet for aquaculture ponds.',
    composition: 'Oxygen-releasing tablet formulation.',
    benefits:
        'Supports dissolved oxygen availability during oxygen-stress conditions.',
    dosage: 'Use according to pond oxygen condition and consultant recommendation.',
    application:
        'Distribute tablets evenly in the required pond area as directed.',
    technology: 'Controlled Oxygen Release',
  ),
  Product(
    name: 'Free Moult',
    image: 'assets/products/Free moult.png',
    category: 'Moulting Support',
    shortDescription:
        'Mineral and moulting-support product for healthy shrimp moulting.',
    composition: 'Moulting and mineral-support formulation.',
    benefits:
        'Supports smooth moulting, shell development and shrimp mineral requirements.',
    dosage: 'Use as recommended by your aqua consultant.',
    application:
        'Apply according to shrimp stage, pond mineral status and culture requirement.',
    technology: 'Moult & Shell Support',
  ),
  Product(
    name: 'Red Thunder',
    image: 'assets/products/Red thunder.png',
    category: 'Pond Management',
    shortDescription:
        'Aquaculture pond-support formulation for maintaining culture performance.',
    composition: 'Aquaculture pond-support formulation.',
    benefits:
        'Supports pond management and shrimp culture performance.',
    dosage: 'Use as recommended by your aqua consultant.',
    application:
        'Apply uniformly according to pond condition and culture program.',
    technology: 'Aquaculture Performance Support',
  ),
  Product(
    name: 'Zeoneem',
    image: 'assets/products/Zeoneem.png',
    category: 'Pond Management',
    shortDescription:
        'Pond-support product for routine aquaculture management.',
    composition: 'Aquaculture pond-management formulation.',
    benefits:
        'Supports pond condition and routine shrimp-culture management.',
    dosage: 'Use as recommended by your aqua consultant.',
    application:
        'Apply according to pond condition and recommended culture schedule.',
    technology: 'Pond Management Support',
  ),
  Product(
    name: 'Starmin',
    image: 'assets/products/Starmin.png',
    category: 'Mineral Support',
    shortDescription:
        'Mineral-support product for shrimp culture and pond mineral management.',
    composition: 'Aquaculture mineral-support formulation.',
    benefits:
        'Supports mineral availability, shrimp shell development and culture performance.',
    dosage: 'Use as recommended by your aqua consultant.',
    application:
        'Apply according to pond mineral requirement and culture stage.',
    technology: 'Mineral Balance Support',
  ),
  Product(
    name: 'Nutrimin',
    image: 'assets/products/nutrimin.png',
    category: 'Nutritional Support',
    shortDescription:
        'Nutritional support product for shrimp culture.',
    composition: 'Aquaculture nutritional-support formulation.',
    benefits:
        'Supports nutritional balance and overall shrimp culture performance.',
    dosage: 'Use as recommended by your aqua consultant.',
    application:
        'Use according to feed program, shrimp stage and culture requirement.',
    technology: 'Aquaculture Nutrition Support',
  ),
  Product(
    name: 'Bio Soil',
    image: 'assets/products/Bio soil.png',
    category: 'Pond Bottom Management',
    shortDescription:
        'Biological pond-bottom support product for soil and organic-load management.',
    composition: 'Biological soil-support formulation.',
    benefits:
        'Supports pond-bottom condition, organic-load management and healthier pond ecology.',
    dosage: 'Use as recommended by your aqua consultant.',
    application:
        'Apply uniformly over the pond according to bottom condition and pond-management plan.',
    technology: 'Biological Soil Management',
  ),
  Product(
    name: 'Chlorides',
    image: 'assets/products/chlorides.png',
    category: 'Mineral Support',
    shortDescription:
        'Combined chloride mineral range containing Marine Mag, Marine Potash Max and Marine Ca Max.',
    composition:
        'Marine Mag – Magnesium Chloride; Marine Potash Max – Potassium Chloride; Marine Ca Max – Calcium Chloride.',
    benefits:
        'Supports magnesium, potassium and calcium availability, mineral balance, shell strength and moulting support.',
    dosage: 'Use the required chloride product and quantity as recommended by your aqua consultant.',
    application:
        'Select the required mineral source based on pond mineral status and apply evenly as directed.',
    technology: 'Targeted Chloride Mineral Support',
  ),
  Product(
    name: 'Yucca Pro',
    image: 'assets/products/Yucca Pro.png',
    category: 'Pond Water Support',
    shortDescription:
        'Aquaculture pond-support product for routine water and culture management.',
    composition: 'Aquaculture water-management formulation.',
    benefits:
        'Supports pond water condition and overall shrimp culture management.',
    dosage: 'Use as recommended by your aqua consultant.',
    application:
        'Apply uniformly according to pond condition and the recommended program.',
    technology: 'Pond Water Support',
  ),
  Product(
    name: 'Hi-Soft',
    image: 'assets/products/Hi-Soft.png',
    category: 'Water & Culture Support',
    shortDescription:
        'Aquaculture-support product for pond and shrimp culture management.',
    composition: 'Aquaculture culture-support formulation.',
    benefits:
        'Supports pond management and shrimp culture performance.',
    dosage: 'Use as recommended by your aqua consultant.',
    application:
        'Apply according to pond condition and culture-management requirements.',
    technology: 'Aquaculture Culture Support',
  ),
];

// ============================================================
// MAIN PAGE
// ============================================================

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int selectedIndex = 0;

  final pages = const [
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

// ============================================================
// HOME
// ============================================================

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
    WidgetsBinding.instance.addPostFrameCallback((_) => welcomeVoice());
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
                    'assets/products/marine logo.png',
                    width: 72,
                    height: 72,
                    fit: BoxFit.contain,
                    errorBuilder: (_, __, ___) =>
                        const Icon(Icons.water, size: 60, color: marineBlue),
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
                HomeCard(
                  icon: Icons.lightbulb,
                  title: 'Tip Of The Day',
                  text:
                      'Maintain proper dissolved oxygen levels for better shrimp growth.',
                  color: const Color(0xFFDDF7EA),
                ),
                HomeCard(
                  icon: Icons.menu_book,
                  title: 'Shrimp Culture Guide',
                  text:
                      'Learn pond setup, management and shrimp-culture practices.',
                  color: const Color(0xFFDDEFFF),
                ),
                HomeCard(
                  icon: Icons.calculate,
                  title: 'Biomass Calculator',
                  text:
                      'Estimate shrimp biomass using sample count, average weight and pond area.',
                  color: const Color(0xFFDDF7EA),
                ),
                HomeCard(
                  icon: Icons.health_and_safety,
                  title: 'Shrimp Diseases',
                  text:
                      'Understand common shrimp-health and pond-management challenges.',
                  color: const Color(0xFFFFE1E1),
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
                (context, index) =>
                    ProductCard(product: products[index]),
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

          const SliverToBoxAdapter(child: SizedBox(height: 25)),
        ],
      ),
    );
  }
}

// ============================================================
// HOME CARD
// ============================================================

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

// ============================================================
// PRODUCTS PAGE
// ============================================================

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
                style: TextStyle(color: Colors.grey, fontSize: 15),
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            sliver: SliverGrid(
              delegate: SliverChildBuilderDelegate(
                (context, index) =>
                    ProductCard(product: products[index]),
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
          const SliverToBoxAdapter(child: SizedBox(height: 30)),
        ],
      ),
    );
  }
}

// ============================================================
// PRODUCT CARD
// ============================================================

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
                  errorBuilder: (_, __, ___) => const Icon(
                    Icons.image_not_supported,
                    size: 55,
                    color: Colors.grey,
                  ),
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

// ============================================================
// PRODUCT DETAIL
// ============================================================

class ProductDetailPage extends StatelessWidget {
  final Product product;

  const ProductDetailPage({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(product.name)),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 310,
              width: double.infinity,
              padding: const EdgeInsets.all(25),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(28),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 12,
                  ),
                ],
              ),
              child: Image.asset(
                product.image,
                fit: BoxFit.contain,
                errorBuilder: (_, __, ___) => const Icon(
                  Icons.image_not_supported,
                  size: 70,
                  color: Colors.grey,
                ),
              ),
            ),

            const SizedBox(height: 22),

            Text(
              product.name,
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: darkText,
              ),
            ),

            const SizedBox(height: 7),

            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 6,
              ),
              decoration: BoxDecoration(
                color: const Color(0xFFE5F5FA),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                product.category,
                style: const TextStyle(
                  color: marineBlue,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(height: 18),

            InfoBox(
              icon: Icons.description_outlined,
              title: 'Description',
              text: product.shortDescription,
            ),

            InfoBox(
              icon: Icons.science_outlined,
              title: 'Composition',
              text: product.composition,
            ),

            InfoBox(
              icon: Icons.check_circle_outline,
              title: 'Benefits',
              text: product.benefits,
            ),

            InfoBox(
              icon: Icons.medication_outlined,
              title: 'Dosage',
              text: product.dosage,
            ),

            InfoBox(
              icon: Icons.water_drop_outlined,
              title: 'Application',
              text: product.application,
            ),

            InfoBox(
              icon: Icons.memory_outlined,
              title: 'Technology',
              text: product.technology,
            ),

            const SizedBox(height: 20),

            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [marineBlue, marineCyan],
                ),
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Text(
                'For professional aquaculture use. '
                'Follow the recommended pond-management program.',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 13,
                  height: 1.4,
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
// INFO BOX
// ============================================================

class InfoBox extends StatelessWidget {
  final IconData icon;
  final String title;
  final String text;

  const InfoBox({
    super.key,
    required this.icon,
    required this.title,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 14),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, color: marineBlue),
              const SizedBox(width: 9),
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: marineBlue,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 9),
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

// ============================================================
// SUPPORT
// ============================================================

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

            SupportCard(
              icon: Icons.chat_bubble_outline,
              title: 'Ask Your Doubt',
              subtitle:
                  'Get help with aquaculture-related questions.',
              onTap: () => _showMessage(
                context,
                'Ask Your Doubt',
                'Please contact your Marine Aqua Technologies technical team.',
              ),
            ),

            SupportCard(
              icon: Icons.phone_outlined,
              title: 'Contact Support',
              subtitle:
                  'Connect with Marine Aqua Technologies support.',
              onTap: () => _showMessage(
                context,
                'Contact Support',
                'Marine Aqua Technologies support will assist you.',
              ),
            ),

            SupportCard(
              icon: Icons.menu_book_outlined,
              title: 'Aquaculture Guide',
              subtitle:
                  'Learn about shrimp culture and pond management.',
              onTap: () => _showMessage(
                context,
                'Aquaculture Guide',
                'Shrimp culture guidance will be added here.',
              ),
            ),
          ],
        ),
      ),
    );
  }

  static void _showMessage(
    BuildContext context,
    String title,
    String message,
  ) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text(title),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }
}

// ============================================================
// SUPPORT CARD
// ============================================================

class SupportCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  const SupportCard({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(20),
      onTap: onTap,
      child: Container(
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
                    style: const TextStyle(color: Colors.black54),
                  ),
                ],
              ),
            ),
            const Icon(
              Icons.chevron_right,
              color: Colors.grey,
            ),
          ],
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
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const SizedBox(height: 25),
            Image.asset(
              'assets/products/marine logo.png',
              width: 120,
              height: 120,
              fit: BoxFit.contain,
              errorBuilder: (_, __, ___) =>
                  const Icon(Icons.water, size: 100, color: marineBlue),
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

            ProfileTile(
              icon: Icons.business_outlined,
              title: 'About Marine Aqua Technologies',
              onTap: () => _showAbout(context),
            ),
            ProfileTile(
              icon: Icons.language,
              title: 'Language',
              onTap: () => _showLanguage(context),
            ),
            ProfileTile(
              icon: Icons.info_outline,
              title: 'App Information',
              onTap: () => _showAppInfo(context),
            ),
          ],
        ),
      ),
    );
  }

  static void _showAbout(BuildContext context) {
    _dialog(
      context,
      'About Marine Aqua Technologies',
      'Marine Aqua Technologies provides aquaculture-focused products and solutions for shrimp pond management, water quality, minerals, nutrition and culture support.',
    );
  }

  static void _showLanguage(BuildContext context) {
    _dialog(
      context,
      'Language',
      'English and Telugu language support can be connected here.',
    );
  }

  static void _showAppInfo(BuildContext context) {
    _dialog(
      context,
      'App Information',
      'Marine Aqua Technologies\\nSmart Aquaculture. Better Results.\\nVersion 1.0.0',
    );
  }

  static void _dialog(
    BuildContext context,
    String title,
    String message,
  ) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text(title),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }
}

// ============================================================
// PROFILE TILE
// ============================================================

class ProfileTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  const ProfileTile({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
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
        onTap: onTap,
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
