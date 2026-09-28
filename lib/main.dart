import 'package:flutter/material.dart';

void main() {
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
        fontFamily: 'Roboto',
        scaffoldBackgroundColor: const Color(0xFFF4FAFD),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF0876A8),
        ),
      ),
      home: const MainScreen(),
    );
  }
}

// ============================================================
// MAIN SCREEN
// ============================================================

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int selectedIndex = 0;

  final List<Widget> pages = const [
    HomePage(),
    ProductsPage(),
    SupportPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: pages[selectedIndex],
      ),

      bottomNavigationBar: NavigationBar(
        height: 76,
        selectedIndex: selectedIndex,
        backgroundColor: Colors.white,
        indicatorColor: const Color(0xFFD8F3FF),

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
            icon: Icon(Icons.headset_mic_outlined),
            selectedIcon: Icon(Icons.headset_mic),
            label: 'Support',
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
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),

      slivers: [

        // ====================================================
        // HEADER
        // ====================================================

        SliverToBoxAdapter(
          child: Container(
            color: Colors.white,
            padding: const EdgeInsets.fromLTRB(
              18,
              18,
              18,
              14,
            ),

            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [

                // LOGO
                Container(
                  width: 78,
                  height: 78,

                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(18),
                  ),

                  child: Image.asset(
                    'assets/logo.png',
                    fit: BoxFit.contain,

                    errorBuilder: (
                      context,
                      error,
                      stackTrace,
                    ) {
                      return const Icon(
                        Icons.water_drop,
                        size: 45,
                        color: Color(0xFF0876A8),
                      );
                    },
                  ),
                ),

                const SizedBox(width: 12),

                // COMPANY NAME
                Expanded(
                  child: Column(
                    crossAxisAlignment:
                        CrossAxisAlignment.start,

                    children: const [

                      Text(
                        'MARINE AQUA',
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w900,
                          color: Color(0xFF075985),
                          letterSpacing: 0.5,
                        ),
                      ),

                      Text(
                        'TECHNOLOGIES',
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w900,
                          color: Color(0xFF075985),
                          letterSpacing: 0.5,
                        ),
                      ),

                      SizedBox(height: 4),

                      Text(
                        'ఆక్వా సాగులో ప్రతి దశలో... మీకు తోడుగా',
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF075985),
                        ),
                      ),

                      SizedBox(height: 3),

                      Text(
                        'Smart Aquaculture. Better Results.',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),

                // NOTIFICATION
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.notifications_none_rounded,
                    size: 31,
                    color: Color(0xFF075985),
                  ),
                ),
              ],
            ),
          ),
        ),

        // ====================================================
        // HERO BANNER
        // ====================================================

        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(
              16,
              18,
              16,
              12,
            ),

            child: ClipRRect(
              borderRadius: BorderRadius.circular(26),

              child: Image.asset(
                'assets/hero_banner.png',

                width: double.infinity,
                height: 205,

                fit: BoxFit.cover,

                errorBuilder: (
                  context,
                  error,
                  stackTrace,
                ) {
                  return Container(
                    height: 205,
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [
                          Color(0xFF4B5054),
                          Color(0xFFE8ECEF),
                        ],
                      ),
                      borderRadius:
                          BorderRadius.circular(26),
                    ),

                    padding: const EdgeInsets.all(28),

                    child: const Column(
                      crossAxisAlignment:
                          CrossAxisAlignment.start,

                      mainAxisAlignment:
                          MainAxisAlignment.center,

                      children: [

                        Text(
                          'ఆరోగ్యకరమైన\nచెరువులు',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight:
                                FontWeight.w900,
                          ),
                        ),

                        SizedBox(height: 6),

                        Text(
                          'బలమైన రొయ్యలు',
                          style: TextStyle(
                            color: Colors.yellow,
                            fontSize: 28,
                            fontWeight:
                                FontWeight.w900,
                          ),
                        ),

                        SizedBox(height: 5),

                        Text(
                          'అధిక లాభాలు',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 28,
                            fontWeight:
                                FontWeight.w900,
                          ),
                        ),

                        SizedBox(height: 10),

                        Text(
                          'మెరుగైన ఫలితాల కోసం\nసంపూర్ణ ఆక్వాకల్చర్ సొల్యూషన్స్',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ),

        // ====================================================
        // 3 SHORTCUT CARDS TITLE
        // ====================================================

        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(
              18,
              8,
              18,
              10,
            ),

            child: Row(
              children: const [

                Text(
                  'ఆక్వా సమాచారం',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w900,
                    color: Color(0xFF075985),
                  ),
                ),

                Spacer(),

                Icon(
                  Icons.arrow_forward_rounded,
                  color: Color(0xFF0876A8),
                  size: 25,
                ),
              ],
            ),
          ),
        ),

        // ====================================================
        // 3 SHORTCUT CARDS
        // ====================================================

        SliverToBoxAdapter(
          child: SizedBox(
            height: 225,

            child: ListView(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),

              padding: const EdgeInsets.symmetric(
                horizontal: 16,
              ),

              children: [

                ShortcutCard(
                  image:
                      'assets/shortcut_card_1_royyala_sagu_guide.png',

                  onTap: () {
                    Navigator.push(
                      navigatorKey.currentContext!,
                      MaterialPageRoute(
                        builder: (_) =>
                            const GuidePage(),
                      ),
                    );
                  },
                ),

                ShortcutCard(
                  image:
                      'assets/shortcut_card_2_biomass_calculator.png',

                  onTap: () {
                    Navigator.push(
                      navigatorKey.currentContext!,
                      MaterialPageRoute(
                        builder: (_) =>
                            const BiomassCalculatorPage(),
                      ),
                    );
                  },
                ),

                ShortcutCard(
                  image:
                      'assets/shortcut_card_3_royyala_vyadhulu.png',

                  onTap: () {
                    Navigator.push(
                      navigatorKey.currentContext!,
                      MaterialPageRoute(
                        builder: (_) =>
                            const DiseasesPage(),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),

        // ====================================================
        // WATER PARAMETERS
        // ====================================================

        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(
              16,
              18,
              16,
              0,
            ),

            child: WaterParameters(),
          ),
        ),

        // ====================================================
        // FIND YOUR PROBLEMS
        // ====================================================

        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(
              16,
              20,
              16,
              0,
            ),

            child: FindProblems(),
          ),
        ),

        // ====================================================
        // SMALL SPACE AT BOTTOM
        // ====================================================

        const SliverToBoxAdapter(
          child: SizedBox(height: 25),
        ),
      ],
    );
  }
}

// ============================================================
// SHORTCUT CARD
// ============================================================

class ShortcutCard extends StatelessWidget {
  final String image;
  final VoidCallback onTap;

  const ShortcutCard({
    super.key,
    required this.image,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,

      child: Container(
        width: 190,
        margin: const EdgeInsets.only(right: 14),

        decoration: BoxDecoration(
          color: Colors.white,

          borderRadius:
              BorderRadius.circular(23),

          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.08),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),

        child: ClipRRect(
          borderRadius:
              BorderRadius.circular(23),

          child: Image.asset(
            image,

            width: double.infinity,
            height: double.infinity,

            fit: BoxFit.cover,

            errorBuilder: (
              context,
              error,
              stackTrace,
            ) {
              return const Center(
                child: Icon(
                  Icons.image_not_supported_outlined,
                  size: 45,
                  color: Colors.grey,
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

// ============================================================
// WATER PARAMETERS
// ============================================================

class WaterParameters extends StatelessWidget {
  const WaterParameters({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),

      decoration: BoxDecoration(
        color: const Color(0xFFE9F8FF),

        borderRadius:
            BorderRadius.circular(26),

        border: Border.all(
          color: const Color(0xFFB5E5F5),
          width: 1.5,
        ),
      ),

      child: Column(
        children: [

          Row(
            children: [

              const Expanded(
                child: Text(
                  'చెరువు నీటి పరిస్థితులు',
                  style: TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.w900,
                    color: Color(0xFF075985),
                  ),
                ),
              ),

              Icon(
                Icons.edit_outlined,
                color: Color(0xFF0876A8),
                size: 27,
              ),
            ],
          ),

          const SizedBox(height: 15),

          Row(
            children: const [

              Expanded(
                child: ParameterCard(
                  icon: Icons.science_outlined,
                  title: 'pH',
                  value: '7.8',
                  unit: '(6.5 - 8.5)',
                ),
              ),

              SizedBox(width: 8),

              Expanded(
                child: ParameterCard(
                  icon: Icons.waves,
                  title: 'Salinity',
                  value: '18',
                  unit: 'ppt',
                ),
              ),

              SizedBox(width: 8),

              Expanded(
                child: ParameterCard(
                  icon: Icons.air,
                  title: 'DO',
                  value: '5.6',
                  unit: 'mg/L',
                ),
              ),

              SizedBox(width: 8),

              Expanded(
                child: ParameterCard(
                  icon: Icons.science,
                  title: 'Alkalinity',
                  value: '140',
                  unit: 'ppm',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// ============================================================
// PARAMETER CARD
// ============================================================

class ParameterCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;
  final String unit;

  const ParameterCard({
    super.key,
    required this.icon,
    required this.title,
    required this.value,
    required this.unit,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,

      padding: const EdgeInsets.symmetric(
        horizontal: 6,
        vertical: 10,
      ),

      decoration: BoxDecoration(
        color: Colors.white,

        borderRadius:
            BorderRadius.circular(20),
      ),

      child: Column(
        mainAxisAlignment:
            MainAxisAlignment.center,

        children: [

          Icon(
            icon,
            size: 28,
            color: const Color(0xFF1598C8),
          ),

          const SizedBox(height: 5),

          Text(
            title,
            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w700,
              color: Color(0xFF164E63),
            ),
          ),

          const SizedBox(height: 4),

          Text(
            value,
            style: const TextStyle(
              fontSize: 23,
              fontWeight: FontWeight.w900,
              color: Color(0xFF075985),
            ),
          ),

          Text(
            unit,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 10,
              color: Colors.grey,
            ),
          ),

          const SizedBox(height: 5),

          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 9,
              vertical: 4,
            ),

            decoration: BoxDecoration(
              color: const Color(0xFFCFF6DD),
              borderRadius:
                  BorderRadius.circular(20),
            ),

            child: const Text(
              'సరైనది',
              style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.bold,
                color: Color(0xFF17834B),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ============================================================
// FIND YOUR PROBLEMS
// ============================================================

class FindProblems extends StatelessWidget {
  const FindProblems({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),

      decoration: BoxDecoration(
        color: const Color(0xFFE9F8FF),

        borderRadius:
            BorderRadius.circular(28),

        border: Border.all(
          color: const Color(0xFFB5E5F5),
          width: 1.5,
        ),
      ),

      child: Column(
        children: [

          Row(
            children: [

              const Expanded(
                child: Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.start,

                  children: [

                    Text(
                      'Find Your Problems',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight:
                            FontWeight.w900,
                        color:
                            Color(0xFF075985),
                      ),
                    ),

                    SizedBox(height: 4),

                    Text(
                      'మీ చెరువులో ఉన్న సమస్యను ఎంచుకోండి',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),

              Container(
                width: 55,
                height: 55,

                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      BorderRadius.circular(18),
                ),

                child: const Icon(
                  Icons.manage_search_rounded,
                  color: Color(0xFF0876A8),
                  size: 30,
                ),
              ),
            ],
          ),

          const SizedBox(height: 18),

          Row(
            children: [

              Expanded(
                child: ProblemCard(
                  icon: Icons.bug_report_outlined,
                  title: 'Vibrio',
                  subtitle: 'Vibrio problem',
                ),
              ),

              const SizedBox(width: 12),

              Expanded(
                child: ProblemCard(
                  icon: Icons.health_and_safety_outlined,
                  title: 'White Gut',
                  subtitle: 'Gut health problem',
                ),
              ),
            ],
          ),

          const SizedBox(height: 12),

          Row(
            children: [

              Expanded(
                child: ProblemCard(
                  icon: Icons.trending_down,
                  title: 'Slow Growth',
                  subtitle: 'Growth problem',
                ),
              ),

              const SizedBox(width: 12),

              Expanded(
                child: ProblemCard(
                  icon: Icons.water_drop_outlined,
                  title: 'Low DO',
                  subtitle: 'Oxygen problem',
                ),
              ),
            ],
          ),

          const SizedBox(height: 12),

          Row(
            children: [

              Expanded(
                child: ProblemCard(
                  icon: Icons.shield_outlined,
                  title: 'Soft Shell',
                  subtitle: 'Shell problem',
                ),
              ),

              const SizedBox(width: 12),

              Expanded(
                child: ProblemCard(
                  icon: Icons.science_outlined,
                  title: 'Water Quality',
                  subtitle: 'Water problem',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// ============================================================
// PROBLEM CARD
// ============================================================

class ProblemCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;

  const ProblemCard({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 145,

      padding: const EdgeInsets.all(12),

      decoration: BoxDecoration(
        color: Colors.white,

        borderRadius:
            BorderRadius.circular(22),
      ),

      child: Column(
        mainAxisAlignment:
            MainAxisAlignment.center,

        children: [

          Icon(
            icon,
            size: 35,
            color: const Color(0xFF0876A8),
          ),

          const SizedBox(height: 8),

          Text(
            title,
            textAlign: TextAlign.center,

            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w800,
              color: Color(0xFF075985),
            ),
          ),

          const SizedBox(height: 3),

          Text(
            subtitle,
            textAlign: TextAlign.center,

            style: const TextStyle(
              fontSize: 12,
              color: Colors.grey,
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
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),

      slivers: [

        SliverAppBar(
          pinned: true,
          backgroundColor: Colors.white,

          title: const Text(
            'Our Products',
            style: TextStyle(
              fontWeight: FontWeight.w900,
              color: Color(0xFF075985),
            ),
          ),
        ),

        SliverPadding(
          padding: const EdgeInsets.all(16),

          sliver: SliverGrid(
            delegate: SliverChildListDelegate(
              [

                ProductCard(
                  name: 'Marine 6G',
                  image: 'assets/marine 6g.png',
                ),

                ProductCard(
                  name: 'Marine ProTab',
                  image: 'assets/protab.png',
                ),

                ProductCard(
                  name: 'Marine Vibrio Shield',
                  image: 'assets/vibrio shield.png',
                ),

                ProductCard(
                  name: 'Marine Volt-X',
                  image: 'assets/volt-x.png',
                ),

                ProductCard(
                  name: 'Bio Sludge-X',
                  image: 'assets/bio sludge -x.png',
                ),

                ProductCard(
                  name: 'OXYTAB+',
                  image: 'assets/oxytab.png',
                ),

                ProductCard(
                  name: 'White Gut Xpert',
                  image: 'assets/white shield.png',
                ),

                ProductCard(
                  name: 'Marine Free Moult',
                  image: 'assets/free moult.png',
                ),
              ],
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
      ],
    );
  }
}

// ============================================================
// PRODUCT CARD
// ============================================================

class ProductCard extends StatelessWidget {
  final String name;
  final String image;

  const ProductCard({
    super.key,
    required this.name,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),

      decoration: BoxDecoration(
        color: Colors.white,

        borderRadius:
            BorderRadius.circular(22),

        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),

      child: Column(
        children: [

          Expanded(
            child: Image.asset(
              image,
              fit: BoxFit.contain,

              errorBuilder: (
                context,
                error,
                stackTrace,
              ) {
                return const Icon(
                  Icons.inventory_2_outlined,
                  size: 65,
                  color: Color(0xFF0876A8),
                );
              },
            ),
          ),

          const SizedBox(height: 8),

          Text(
            name,
            textAlign: TextAlign.center,

            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w800,
              color: Color(0xFF075985),
            ),
          ),

          const SizedBox(height: 8),

          Container(
            width: double.infinity,
            padding:
                const EdgeInsets.symmetric(
              vertical: 8,
            ),

            decoration: BoxDecoration(
              color: const Color(0xFFDDF5FF),
              borderRadius:
                  BorderRadius.circular(15),
            ),

            child: const Text(
              'View Details',
              textAlign: TextAlign.center,

              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.bold,
                color: Color(0xFF075985),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ============================================================
// SUPPORT PAGE
// ============================================================

class SupportPage extends StatelessWidget {
  const SupportPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [

        SliverAppBar(
          pinned: true,
          backgroundColor: Colors.white,

          title: const Text(
            'Support',
            style: TextStyle(
              fontWeight: FontWeight.w900,
              color: Color(0xFF075985),
            ),
          ),
        ),

        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.all(20),

            child: Column(
              children: [

                Container(
                  width: 100,
                  height: 100,

                  decoration: BoxDecoration(
                    color: const Color(0xFFE1F6FF),
                    borderRadius:
                        BorderRadius.circular(30),
                  ),

                  child: const Icon(
                    Icons.headset_mic,
                    size: 55,
                    color: Color(0xFF0876A8),
                  ),
                ),

                const SizedBox(height: 20),

                const Text(
                  'Marine Aqua Support',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w900,
                    color: Color(0xFF075985),
                  ),
                ),

                const SizedBox(height: 8),

                const Text(
                  'మీ చెరువు సమస్యలకు మా టెక్నికల్ టీమ్ సహాయం అందిస్తుంది.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.grey,
                  ),
                ),

                const SizedBox(height: 30),

                SupportOption(
                  icon: Icons.phone,
                  title: 'Call Support',
                  subtitle:
                      'మా టెక్నికల్ టీమ్‌ను సంప్రదించండి',
                  onTap: () {},
                ),

                const SizedBox(height: 12),

                SupportOption(
                  icon: Icons.chat,
                  title: 'WhatsApp Support',
                  subtitle:
                      'మీ సమస్యను మెసేజ్ చేయండి',
                  onTap: () {},
                ),

                const SizedBox(height: 12),

                SupportOption(
                  icon: Icons.location_on,
                  title: 'Field Support',
                  subtitle:
                      'Pond visit కోసం సంప్రదించండి',
                  onTap: () {},
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

// ============================================================
// SUPPORT OPTION
// ============================================================

class SupportOption extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  const SupportOption({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,

      child: Container(
        padding: const EdgeInsets.all(18),

        decoration: BoxDecoration(
          color: Colors.white,

          borderRadius:
              BorderRadius.circular(22),

          boxShadow: [
            BoxShadow(
              color:
                  Colors.black.withOpacity(0.05),
              blurRadius: 8,
            ),
          ],
        ),

        child: Row(
          children: [

            Container(
              width: 52,
              height: 52,

              decoration: BoxDecoration(
                color: const Color(0xFFE2F6FF),
                borderRadius:
                    BorderRadius.circular(16),
              ),

              child: Icon(
                icon,
                color: const Color(0xFF0876A8),
                size: 28,
              ),
            ),

            const SizedBox(width: 15),

            Expanded(
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start,

                children: [

                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 17,
                      fontWeight:
                          FontWeight.w800,
                      color: Color(0xFF075985),
                    ),
                  ),

                  const SizedBox(height: 3),

                  Text(
                    subtitle,
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),

            const Icon(
              Icons.arrow_forward_ios,
              size: 17,
              color: Color(0xFF0876A8),
            ),
          ],
        ),
      ),
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
    return const SimpleInfoPage(
      title: 'రొయ్యల సాగు గైడ్',
      icon: Icons.menu_book_rounded,
      description:
          'రొయ్యల సాగుకు సంబంధించిన ముఖ్యమైన సమాచారం, నిర్వహణ మరియు ప్రాథమిక సూచనలు ఇక్కడ అందుబాటులో ఉంటాయి.',
    );
  }
}

// ============================================================
// DISEASE PAGE
// ============================================================

class DiseasesPage extends StatelessWidget {
  const DiseasesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const SimpleInfoPage(
      title: 'రొయ్యల వ్యాధులు',
      icon: Icons.health_and_safety_outlined,
      description:
          'రొయ్యలలో కనిపించే సాధారణ సమస్యలు మరియు వాటి నిర్వహణకు సంబంధించిన సమాచారం.',
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

  double biomass = 0;

  void calculateBiomass() {
    final count =
        double.tryParse(countController.text) ?? 0;

    final weight =
        double.tryParse(weightController.text) ?? 0;

    setState(() {
      biomass = (count * weight) / 1000;
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
        title: const Text(
          'బయోమాస్ కాలిక్యులేటర్',
          style: TextStyle(
            fontWeight: FontWeight.w800,
          ),
        ),

        backgroundColor: Colors.white,
        foregroundColor:
            const Color(0xFF075985),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),

        child: Column(
          children: [

            const Icon(
              Icons.calculate_rounded,
              size: 75,
              color: Color(0xFF0876A8),
            ),

            const SizedBox(height: 15),

            const Text(
              'Biomass Calculator',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w900,
                color: Color(0xFF075985),
              ),
            ),

            const SizedBox(height: 25),

            TextField(
              controller: countController,

              keyboardType:
                  TextInputType.number,

              decoration:
                  InputDecoration(
                labelText:
                    'Shrimp Count',
                border:
                    OutlineInputBorder(
                  borderRadius:
                      BorderRadius.circular(16),
                ),
              ),
            ),

            const SizedBox(height: 15),

            TextField(
              controller: weightController,

              keyboardType:
                  TextInputType.number,

              decoration:
                  InputDecoration(
                labelText:
                    'Average Weight (grams)',
                border:
                    OutlineInputBorder(
                  borderRadius:
                      BorderRadius.circular(16),
                ),
              ),
            ),

            const SizedBox(height: 20),

            SizedBox(
              width: double.infinity,

              child: ElevatedButton(
                onPressed:
                    calculateBiomass,

                style:
                    ElevatedButton.styleFrom(
                  backgroundColor:
                      const Color(0xFF0876A8),

                  foregroundColor:
                      Colors.white,

                  padding:
                      const EdgeInsets.symmetric(
                    vertical: 15,
                  ),

                  shape:
                      RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(16),
                  ),
                ),

                child: const Text(
                  'Calculate Biomass',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight:
                        FontWeight.bold,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 30),

            if (biomass > 0)
              Container(
                width: double.infinity,

                padding:
                    const EdgeInsets.all(25),

                decoration: BoxDecoration(
                  color:
                      const Color(0xFFE3F8FF),

                  borderRadius:
                      BorderRadius.circular(22),
                ),

                child: Column(
                  children: [

                    const Text(
                      'Estimated Biomass',
                      style: TextStyle(
                        fontSize: 17,
                        color: Colors.grey,
                      ),
                    ),

                    const SizedBox(height: 8),

                    Text(
                      '${biomass.toStringAsFixed(2)} kg',
                      style: const TextStyle(
                        fontSize: 34,
                        fontWeight:
                            FontWeight.w900,
                        color:
                            Color(0xFF075985),
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
// SIMPLE INFO PAGE
// ============================================================

class SimpleInfoPage extends StatelessWidget {
  final String title;
  final IconData icon;
  final String description;

  const SimpleInfoPage({
    super.key,
    required this.title,
    required this.icon,
    required this.description,
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

        foregroundColor:
            const Color(0xFF075985),
      ),

      body: Padding(
        padding: const EdgeInsets.all(22),

        child: Column(
          children: [

            const SizedBox(height: 30),

            Icon(
              icon,
              size: 85,
              color: const Color(0xFF0876A8),
            ),

            const SizedBox(height: 25),

            Text(
              title,
              textAlign: TextAlign.center,

              style: const TextStyle(
                fontSize: 27,
                fontWeight: FontWeight.w900,
                color: Color(0xFF075985),
              ),
            ),

            const SizedBox(height: 15),

            Text(
              description,
              textAlign: TextAlign.center,

              style: const TextStyle(
                fontSize: 16,
                height: 1.5,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ============================================================
// NAVIGATION KEY
// ============================================================

final GlobalKey<NavigatorState> navigatorKey =
    GlobalKey<NavigatorState>();
