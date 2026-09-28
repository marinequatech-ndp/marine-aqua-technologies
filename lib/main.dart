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
        fontFamily: 'Arial',
        scaffoldBackgroundColor: const Color(0xFFF4FAFD),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF00639B),
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
        child: pages[selectedIndex],
      ),

      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(28),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 15,
              offset: Offset(0, -3),
            ),
          ],
        ),
        child: NavigationBar(
          backgroundColor: Colors.white,
          elevation: 0,
          selectedIndex: selectedIndex,
          onDestinationSelected: (index) {
            setState(() {
              selectedIndex = index;
            });
          },
          indicatorColor: const Color(0xFFD9F1FC),
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
          ],
        ),
      ),
    );
  }
}

// ============================================================
// HOME PAGE
// ============================================================

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static const Color darkBlue = Color(0xFF064579);
  static const Color marineBlue = Color(0xFF00689E);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          // --------------------------------------------------
          // HEADER
          // --------------------------------------------------

          Container(
            margin: const EdgeInsets.fromLTRB(12, 8, 12, 8),
            padding: const EdgeInsets.symmetric(
              horizontal: 18,
              vertical: 12,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 12,
                  offset: Offset(0, 4),
                ),
              ],
            ),
            child: Row(
              children: [

                // LOGO
                Container(
                  width: 78,
                  height: 78,
                  padding: const EdgeInsets.all(4),
                  child: Image.asset(
                    'assets/products/marine logo.png',
                    fit: BoxFit.contain,
                    errorBuilder: (_, __, ___) {
                      return const Icon(
                        Icons.water_drop,
                        size: 50,
                        color: Color(0xFF00A4C7),
                      );
                    },
                  ),
                ),

                const SizedBox(width: 12),

                // BRAND
                const Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'MARINE AQUA',
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w900,
                          color: darkBlue,
                          letterSpacing: 0.5,
                        ),
                      ),
                      Text(
                        'TECHNOLOGIES',
                        style: TextStyle(
                          fontSize: 23,
                          fontWeight: FontWeight.w900,
                          color: darkBlue,
                          letterSpacing: 1.5,
                        ),
                      ),

                      SizedBox(height: 3),

                      Text(
                        'ఆక్వా సాగులో ప్రతి దశలో... మీకు తోడుగా',
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w700,
                          color: darkBlue,
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
                Stack(
                  children: [
                    IconButton(
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(
                              'No new notifications',
                            ),
                          ),
                        );
                      },
                      icon: const Icon(
                        Icons.notifications_none_rounded,
                        size: 34,
                        color: darkBlue,
                      ),
                    ),

                    Positioned(
                      right: 7,
                      top: 7,
                      child: Container(
                        width: 11,
                        height: 11,
                        decoration: BoxDecoration(
                          color: Colors.red,
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.white,
                            width: 2,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // --------------------------------------------------
          // HERO BANNER
          // --------------------------------------------------

          Container(
            height: 285,
            margin: const EdgeInsets.symmetric(
              horizontal: 24,
              vertical: 8,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(28),
              gradient: const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color(0xFF0B74B5),
                  Color(0xFF0B9BC2),
                  Color(0xFF1AB2C2),
                ],
              ),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 10,
                  offset: Offset(0, 5),
                ),
              ],
            ),
            child: Stack(
              children: [

                // WATER DECORATION
                Positioned(
                  right: -20,
                  bottom: -10,
                  child: Icon(
                    Icons.water,
                    size: 180,
                    color: Colors.white.withOpacity(0.08),
                  ),
                ),

                // FISH DECORATION
                Positioned(
                  right: 20,
                  top: 30,
                  child: Icon(
                    Icons.set_meal,
                    size: 105,
                    color: Colors.white.withOpacity(0.20),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.fromLTRB(
                    26,
                    28,
                    20,
                    20,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      const Text(
                        'ఆరోగ్యకరమైన చెరువులు',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 28,
                          fontWeight: FontWeight.w900,
                        ),
                      ),

                      const Text(
                        'బలమైన రొయ్యలు',
                        style: TextStyle(
                          color: Color(0xFFFFE000),
                          fontSize: 30,
                          fontWeight: FontWeight.w900,
                        ),
                      ),

                      const Text(
                        'అధిక లాభాలు',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 28,
                          fontWeight: FontWeight.w900,
                        ),
                      ),

                      const SizedBox(height: 12),

                      const Text(
                        'మెరుగైన రేవడి కోసం\nసంపూర్ణ ఆక్వాకల్చర్ సొల్యూషన్స్',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                          height: 1.35,
                        ),
                      ),

                      const Spacer(),

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
                          foregroundColor: darkBlue,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 22,
                            vertical: 12,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        child: const Text(
                          'ప్రొడక్ట్స్ చూడండి  →',
                          style: TextStyle(
                            fontSize: 16,
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

          // --------------------------------------------------
          // FEATURE CARDS
          // --------------------------------------------------

          Padding(
            padding: const EdgeInsets.fromLTRB(
              24,
              12,
              24,
              5,
            ),
            child: Row(
              children: [

                Expanded(
                  child: FeatureCard(
                    icon: Icons.menu_book_rounded,
                    title: 'రొయ్యల\nసాగు గైడ్',
                    description:
                        'పూర్తి సాగు విధానం,\nమెరుగైన ఫలితాల కోసం',
                    color: const Color(0xFFE1F3FF),
                    iconColor: Colors.blue,
                    onTap: () {},
                  ),
                ),

                const SizedBox(width: 12),

                Expanded(
                  child: FeatureCard(
                    icon: Icons.calculate_rounded,
                    title: 'బయోమాస్\nకాలిక్యులేటర్',
                    description:
                        '3 స్టెప్‌లలో మీ చెరువు\nబయోమాస్ అంచనా',
                    color: const Color(0xFFE1F8EA),
                    iconColor: Colors.green,
                    onTap: () {},
                  ),
                ),

                const SizedBox(width: 12),

                Expanded(
                  child: FeatureCard(
                    icon: Icons.health_and_safety_rounded,
                    title: 'రొయ్యల\nవ్యాధులు',
                    description:
                        'సాధారణ వ్యాధులు,\nలక్షణాలు & నివారణ',
                    color: const Color(0xFFFFE7E7),
                    iconColor: Colors.red,
                    onTap: () {},
                  ),
                ),
              ],
            ),
          ),

          // --------------------------------------------------
          // PRODUCTS
          // --------------------------------------------------

          Container(
            margin: const EdgeInsets.fromLTRB(
              24,
              15,
              24,
              10,
            ),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(25),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 10,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Row(
                  mainAxisAlignment:
                      MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'మా ప్రొడక్ట్స్',
                      style: TextStyle(
                        color: darkBlue,
                        fontSize: 26,
                        fontWeight: FontWeight.w900,
                      ),
                    ),

                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        'అన్ని చూడండి  →',
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 5),

                SizedBox(
                  height: 190,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: const [

                      ProductMiniCard(
                        name: 'Marine 6G',
                        image:
                            'assets/products/marine 6g.png',
                      ),

                      ProductMiniCard(
                        name: 'Marine ProTab',
                        image:
                            'assets/products/marine protab.png',
                      ),

                      ProductMiniCard(
                        name: 'Marine Vibrio Shield',
                        image:
                            'assets/products/Marine vibrio shield.png',
                      ),

                      ProductMiniCard(
                        name: 'Marine Volt-X',
                        image:
                            'assets/products/marine volt-x.png',
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // --------------------------------------------------
          // WATER QUALITY
          // --------------------------------------------------

          Container(
            margin: const EdgeInsets.fromLTRB(
              24,
              10,
              24,
              10,
            ),
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              color: const Color(0xFFEAF7FF),
              borderRadius: BorderRadius.circular(25),
              border: Border.all(
                color: const Color(0xFFD2ECFA),
              ),
            ),
            child: Column(
              children: [

                Row(
                  children: [
                    const Icon(
                      Icons.water_drop_rounded,
                      color: Colors.blue,
                      size: 38,
                    ),

                    const SizedBox(width: 10),

                    const Expanded(
                      child: Text(
                        'నీటి పరామితులు',
                        style: TextStyle(
                          color: darkBlue,
                          fontSize: 23,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),

                    Text(
                      'చివరి అప్‌డేట్: 28 Sep 2025',
                      style: TextStyle(
                        color: Colors.grey.shade600,
                        fontSize: 11,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 15),

                Row(
                  children: const [

                    Expanded(
                      child: WaterCard(
                        title: 'pH',
                        value: '7.8',
                        icon: Icons.waves,
                      ),
                    ),

                    SizedBox(width: 8),

                    Expanded(
                      child: WaterCard(
                        title: 'సాలినిటీ (ppt)',
                        value: '18',
                        icon: Icons.water_drop,
                      ),
                    ),

                    SizedBox(width: 8),

                    Expanded(
                      child: WaterCard(
                        title: 'DO (mg/L)',
                        value: '5.6',
                        icon: Icons.air,
                      ),
                    ),

                    SizedBox(width: 8),

                    Expanded(
                      child: WaterCard(
                        title: 'ఆల్కలినిటీ',
                        value: '140',
                        icon: Icons.science,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // --------------------------------------------------
          // TECHNICAL SUPPORT
          // --------------------------------------------------

          Container(
            margin: const EdgeInsets.fromLTRB(
              24,
              8,
              24,
              20,
            ),
            height: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              gradient: const LinearGradient(
                colors: [
                  Color(0xFFE6F7FF),
                  Color(0xFFBCE8FA),
                ],
              ),
            ),
            child: Row(
              children: [

                const Padding(
                  padding: EdgeInsets.only(left: 22),
                  child: Icon(
                    Icons.headset_mic_rounded,
                    size: 55,
                    color: darkBlue,
                  ),
                ),

                const SizedBox(width: 14),

                const Expanded(
                  child: Column(
                    mainAxisAlignment:
                        MainAxisAlignment.center,
                    crossAxisAlignment:
                        CrossAxisAlignment.start,
                    children: [
                      Text(
                        'టెక్నికల్ సపోర్ట్',
                        style: TextStyle(
                          color: darkBlue,
                          fontSize: 21,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      Text(
                        'మా నిపుణుల బృందంతో సంప్రదించండి',
                        style: TextStyle(
                          color: Colors.black54,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),

                Padding(
                  padding:
                      const EdgeInsets.only(right: 12),
                  child: ElevatedButton.icon(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.phone,
                      size: 18,
                    ),
                    label: const Text(
                      'సంప్రదించండి',
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          const Color(0xFF078BD1),
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(30),
                      ),
                    ),
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
// FEATURE CARD
// ============================================================

class FeatureCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;
  final Color color;
  final Color iconColor;
  final VoidCallback onTap;

  const FeatureCard({
    super.key,
    required this.icon,
    required this.title,
    required this.description,
    required this.color,
    required this.iconColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 190,
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(23),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Icon(
              icon,
              size: 48,
              color: iconColor,
            ),

            const SizedBox(height: 8),

            Text(
              title,
              style: TextStyle(
                color: iconColor,
                fontSize: 16,
                fontWeight: FontWeight.w900,
              ),
            ),

            const SizedBox(height: 5),

            Expanded(
              child: Text(
                description,
                style: const TextStyle(
                  color: Colors.black54,
                  fontSize: 11,
                  height: 1.3,
                ),
              ),
            ),

            Align(
              alignment: Alignment.bottomRight,
              child: Container(
                width: 35,
                height: 35,
                decoration: BoxDecoration(
                  color: iconColor,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.arrow_forward,
                  color: Colors.white,
                  size: 20,
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
// PRODUCT MINI CARD
// ============================================================

class ProductMiniCard extends StatelessWidget {
  final String name;
  final String image;

  const ProductMiniCard({
    super.key,
    required this.name,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 145,
      margin: const EdgeInsets.only(right: 12),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: const Color(0xFFE2EDF3),
        ),
      ),
      child: Column(
        children: [

          Expanded(
            child: Image.asset(
              image,
              fit: BoxFit.contain,
              errorBuilder: (_, __, ___) {
                return const Icon(
                  Icons.inventory_2,
                  size: 65,
                  color: Color(0xFF09679D),
                );
              },
            ),
          ),

          const SizedBox(height: 5),

          Text(
            name,
            maxLines: 2,
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              color: Color(0xFF064579),
              fontSize: 14,
              fontWeight: FontWeight.w800,
            ),
          ),
        ],
      ),
    );
  }
}

// ============================================================
// WATER CARD
// ============================================================

class WaterCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;

  const WaterCard({
    super.key,
    required this.title,
    required this.value,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(17),
      ),
      child: Column(
        crossAxisAlignment:
            CrossAxisAlignment.start,
        children: [

          Text(
            title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              color: Colors.black54,
              fontSize: 10,
            ),
          ),

          const SizedBox(height: 5),

          Row(
            children: [
              Expanded(
                child: Text(
                  value,
                  style: const TextStyle(
                    color: Color(0xFF063F70),
                    fontSize: 22,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),

              Icon(
                icon,
                color: Colors.blue,
                size: 25,
              ),
            ],
          ),

          const Spacer(),

          Container(
            width: 8,
            height: 8,
            decoration: const BoxDecoration(
              color: Colors.green,
              shape: BoxShape.circle,
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

  static const List<Map<String, String>> products = [
    {
      'name': 'Marine 6G',
      'image': 'assets/products/marine 6g.png',
    },
    {
      'name': 'Marine ProTab',
      'image': 'assets/products/marine protab.png',
    },
    {
      'name': 'Marine Vibrio Shield',
      'image': 'assets/products/Marine vibrio shield.png',
    },
    {
      'name': 'Marine Volt-X',
      'image': 'assets/products/marine volt-x.png',
    },
    {
      'name': 'Bio Sludge-X',
      'image': 'assets/products/Bio sludge.png',
    },
    {
      'name': 'Bio Soil',
      'image': 'assets/products/Bio soil.png',
    },
    {
      'name': 'Free Moult',
      'image': 'assets/products/Free moult.png',
    },
    {
      'name': 'Hi-Soft',
      'image': 'assets/products/Hi-Soft.png',
    },
    {
      'name': 'Red Thunder',
      'image': 'assets/products/Red thunder.png',
    },
    {
      'name': 'Starmin',
      'image': 'assets/products/Starmin.png',
    },
    {
      'name': 'Yucca Pro',
      'image': 'assets/products/Yucca Pro.png',
    },
    {
      'name': 'Zeoneem',
      'image': 'assets/products/Zeoneem.png',
    },
    {
      'name': 'Chlorides',
      'image': 'assets/products/chlorides.png',
    },
    {
      'name': 'Marine White Shield',
      'image': 'assets/products/marine white shield.png',
    },
    {
      'name': 'Nutrimin',
      'image': 'assets/products/nutrimin.png',
    },
    {
      'name': 'OxyTab Plus',
      'image': 'assets/products/oxytab plus.png',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4FAFD),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'Our Products',
          style: TextStyle(
            color: Color(0xFF064579),
            fontSize: 28,
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(18),
        itemCount: products.length,
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 14,
          mainAxisSpacing: 14,
          childAspectRatio: 0.76,
        ),
        itemBuilder: (context, index) {
          final product = products[index];

          return Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(22),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 8,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: Column(
              children: [

                Expanded(
                  child: Image.asset(
                    product['image']!,
                    fit: BoxFit.contain,
                    errorBuilder: (_, __, ___) {
                      return const Icon(
                        Icons.inventory_2,
                        size: 80,
                        color: Color(0xFF09679D),
                      );
                    },
                  ),
                ),

                const SizedBox(height: 8),

                Text(
                  product['name']!,
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  style: const TextStyle(
                    color: Color(0xFF064579),
                    fontSize: 17,
                    fontWeight: FontWeight.w900,
                  ),
                ),

                const SizedBox(height: 10),

                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          const Color(0xFFD9F3FC),
                      foregroundColor:
                          const Color(0xFF064579),
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(25),
                      ),
                    ),
                    child: const Text(
                      'View Details',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
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
// SUPPORT PAGE
// ============================================================

class SupportPage extends StatelessWidget {
  const SupportPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(22),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          const SizedBox(height: 20),

          const Text(
            'Technical Support',
            style: TextStyle(
              color: Color(0xFF064579),
              fontSize: 32,
              fontWeight: FontWeight.w900,
            ),
          ),

          const SizedBox(height: 8),

          const Text(
            'ఆక్వా సాగులో మీకు అవసరమైన సాంకేతిక సహాయం కోసం మా బృందాన్ని సంప్రదించండి.',
            style: TextStyle(
              color: Colors.black54,
              fontSize: 16,
              height: 1.5,
            ),
          ),

          const SizedBox(height: 30),

          SupportCard(
            icon: Icons.phone,
            title: 'Call Support',
            subtitle: 'మా టెక్నికల్ టీమ్‌తో మాట్లాడండి',
            onTap: () {},
          ),

          SupportCard(
            icon: Icons.chat,
            title: 'WhatsApp Support',
            subtitle: 'WhatsApp ద్వారా సంప్రదించండి',
            onTap: () {},
          ),

          SupportCard(
            icon: Icons.location_on,
            title: 'Technical Visit',
            subtitle: 'Pond technical assistance కోసం',
            onTap: () {},
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
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      child: ListTile(
        onTap: onTap,
        contentPadding: const EdgeInsets.all(14),
        tileColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        leading: Container(
          width: 55,
          height: 55,
          decoration: const BoxDecoration(
            color: Color(0xFFDDF3FC),
            shape: BoxShape.circle,
          ),
          child: const Icon(
            Icons.support_agent,
            color: Color(0xFF00689E),
          ),
        ),
        title: Text(
          title,
          style: const TextStyle(
            color: Color(0xFF064579),
            fontSize: 18,
            fontWeight: FontWeight.w800,
          ),
        ),
        subtitle: Text(
          subtitle,
          style: const TextStyle(
            color: Colors.black54,
          ),
        ),
        trailing: const Icon(
          Icons.arrow_forward_ios,
          color: Color(0xFF00689E),
        ),
      ),
    );
  }
}
