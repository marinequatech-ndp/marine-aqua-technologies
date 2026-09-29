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
        scaffoldBackgroundColor: const Color(0xFFF3FBFD),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF087FA3),
        ),
      ),
      home: const MainNavigation(),
    );
  }
}

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
    PondsPage(),
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
        height: 78,
        backgroundColor: Colors.white,
        indicatorColor: const Color(0xFFD5F4FC),
        selectedIndex: selectedIndex,
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
            icon: Icon(Icons.water_outlined),
            selectedIcon: Icon(Icons.water),
            label: 'My Ponds',
          ),
          NavigationDestination(
            icon: Icon(Icons.headset_mic_outlined),
            selectedIcon: Icon(Icons.headset_mic),
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

/* =========================================================
   COMMON COLORS
========================================================= */

const Color marineBlue = Color(0xFF087FA3);
const Color darkBlue = Color(0xFF073D78);
const Color lightBlue = Color(0xFFE7F7FB);
const Color pageBackground = Color(0xFFF3FBFD);

/* =========================================================
   HOME PAGE
========================================================= */

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(18, 12, 18, 0),
              child: _buildHeader(),
            ),
          ),

          const SliverToBoxAdapter(
            child: SizedBox(height: 12),
          ),

          SliverToBoxAdapter(
            child: _buildHeroBanner(context),
          ),

          const SliverToBoxAdapter(
            child: SizedBox(height: 16),
          ),

          SliverToBoxAdapter(
            child: _buildQuickFeatures(context),
          ),

          const SliverToBoxAdapter(
            child: SizedBox(height: 16),
          ),

          SliverToBoxAdapter(
            child: _buildDealerCard(context),
          ),

          const SliverToBoxAdapter(
            child: SizedBox(height: 18),
          ),

          SliverToBoxAdapter(
            child: _buildProductSection(context),
          ),

          const SliverToBoxAdapter(
            child: SizedBox(height: 18),
          ),

          SliverToBoxAdapter(
            child: _buildSuccessStories(),
          ),

          const SliverToBoxAdapter(
            child: SizedBox(height: 18),
          ),

          SliverToBoxAdapter(
            child: _buildWaterTools(),
          ),

          const SliverToBoxAdapter(
            child: SizedBox(height: 18),
          ),

          SliverToBoxAdapter(
            child: _buildGrowthGuide(),
          ),

          const SliverToBoxAdapter(
            child: SizedBox(height: 24),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      children: [
        Expanded(
          child: Row(
            children: [
              Container(
                width: 54,
                height: 54,
                padding: const EdgeInsets.all(7),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Image.asset(
                  'assets/products/marine logo.png',
                  fit: BoxFit.contain,
                  errorBuilder: (_, __, ___) {
                    return const Icon(
                      Icons.water_drop,
                      color: marineBlue,
                      size: 34,
                    );
                  },
                ),
              ),
              const SizedBox(width: 10),
              const Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'MARINE AQUA',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w800,
                        color: marineBlue,
                        letterSpacing: .2,
                      ),
                    ),
                    Text(
                      'TECHNOLOGIES',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w800,
                        color: marineBlue,
                        letterSpacing: .2,
                      ),
                    ),
                    SizedBox(height: 3),
                    Text(
                      'ఆక్వా సాగులో ప్రతి దశలో... మీకు తోడుగా',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w700,
                        color: marineBlue,
                      ),
                    ),
                  ],
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
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.translate,
            color: marineBlue,
            size: 27,
          ),
        ),
        Container(
          width: 42,
          height: 42,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Color(0xFFDDF3F8),
          ),
          child: const Icon(
            Icons.person,
            color: marineBlue,
          ),
        ),
      ],
    );
  }

  Widget _buildHeroBanner(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 18),
      height: 190,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        image: const DecorationImage(
          image: AssetImage('assets/products/hero_shrimp.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [
              darkBlue.withOpacity(.95),
              darkBlue.withOpacity(.45),
              Colors.transparent,
            ],
          ),
        ),
        padding: const EdgeInsets.fromLTRB(22, 22, 18, 18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Healthy Ponds\nStronger Shrimp\nHigher Profits',
              style: TextStyle(
                color: Colors.white,
                fontSize: 22,
                height: 1.05,
                fontWeight: FontWeight.w800,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Complete Aquaculture Solutions\nfor a Better Tomorrow',
              style: TextStyle(
                color: Colors.white,
                fontSize: 11.5,
                height: 1.25,
              ),
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: darkBlue,
                elevation: 0,
                padding: const EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 9,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Explore Products',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 12,
                    ),
                  ),
                  SizedBox(width: 6),
                  Icon(Icons.arrow_forward, size: 16),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildQuickFeatures(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: _featureCard(
                  title: 'Tip Of The Day',
                  subtitle: 'Maintain proper dissolved oxygen levels for better growth.',
                  icon: Icons.lightbulb_outline,
                  iconColor: Colors.orange,
                  background: const Color(0xFFDDF7E9),
                  onTap: () {},
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: _featureCard(
                  title: 'Shrimp Culture Guide',
                  subtitle: 'Learn setup, management & best practices.',
                  icon: Icons.menu_book,
                  iconColor: Colors.blue,
                  background: const Color(0xFFDFF2FF),
                  onTap: () {},
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                child: _featureCard(
                  title: 'Biomass Calculator',
                  subtitle: 'Get estimated biomass in 3 easy steps.',
                  icon: Icons.calculate_outlined,
                  iconColor: Colors.green,
                  background: const Color(0xFFDDF7E9),
                  onTap: () {},
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: _featureCard(
                  title: 'Shrimp Diseases',
                  subtitle: 'Identify, prevent & manage common diseases.',
                  icon: Icons.health_and_safety_outlined,
                  iconColor: Colors.red,
                  background: const Color(0xFFFFE5E5),
                  onTap: () {},
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _featureCard({
    required String title,
    required String subtitle,
    required IconData icon,
    required Color iconColor,
    required Color background,
    required VoidCallback onTap,
  }) {
    return InkWell(
      borderRadius: BorderRadius.circular(14),
      onTap: onTap,
      child: Container(
        height: 128,
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: background,
          borderRadius: BorderRadius.circular(14),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              icon,
              size: 29,
              color: iconColor,
            ),
            const SizedBox(height: 5),
            Text(
              title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                color: darkBlue,
                fontWeight: FontWeight.w800,
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 3),
            Expanded(
              child: Text(
                subtitle,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  color: Color(0xFF35536B),
                  fontSize: 10.5,
                  height: 1.2,
                ),
              ),
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Icon(
                  Icons.arrow_forward,
                  size: 17,
                  color: darkBlue,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDealerCard(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 18),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: const Color(0xFFE4F5FF),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: const Color(0xFFC8E9F4),
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 72,
            height: 72,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(14),
            ),
            child: const Icon(
              Icons.location_on,
              color: Colors.red,
              size: 48,
            ),
          ),
          const SizedBox(width: 12),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Dealers Location',
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w800,
                    color: darkBlue,
                  ),
                ),
                SizedBox(height: 3),
                Text(
                  'Find our nearest dealers\nacross India',
                  style: TextStyle(
                    fontSize: 11,
                    color: Color(0xFF315B78),
                    height: 1.2,
                  ),
                ),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF1489E6),
              foregroundColor: Colors.white,
              elevation: 0,
              padding: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 9,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: const Text(
              'Find Nearby →',
              style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProductSection(BuildContext context) {
    final products = [
      {
        'name': 'MARINE-6G',
        'image': 'assets/products/marine 6g.png',
      },
      {
        'name': 'VIBRIO SHIELD',
        'image': 'assets/products/Marine vibrio shield.png',
      },
      {
        'name': 'MARINE PROTAB',
        'image': 'assets/products/marine protab.png',
      },
      {
        'name': 'OXYTAB+',
        'image': 'assets/products/oxytab plus.png',
      },
      {
        'name': 'MARINE VOLT-X',
        'image': 'assets/products/marine volt-x.png',
      },
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: Column(
        children: [
          Row(
            children: [
              const Icon(
                Icons.inventory_2,
                color: Color(0xFF168BE6),
                size: 25,
              ),
              const SizedBox(width: 7),
              const Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Our Aquaculture Solutions',
                      style: TextStyle(
                        color: darkBlue,
                        fontSize: 16,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    Text(
                      'Trusted Products for Healthy Shrimp & Better Yields',
                      style: TextStyle(
                        color: Color(0xFF52708A),
                        fontSize: 9.5,
                      ),
                    ),
                  ],
                ),
              ),
              TextButton(
                onPressed: () {},
                child: const Text(
                  'View All →',
                  style: TextStyle(
                    color: Color(0xFF168BE6),
                    fontWeight: FontWeight.w700,
                    fontSize: 11,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 9),
          SizedBox(
            height: 150,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: products.length,
              separatorBuilder: (_, __) => const SizedBox(width: 9),
              itemBuilder: (context, index) {
                return _productMiniCard(
                  products[index]['name']!,
                  products[index]['image']!,
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _productMiniCard(String name, String image) {
    return Container(
      width: 126,
      padding: const EdgeInsets.all(7),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: const Color(0xFFE2EEF2),
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
                  Icons.inventory_2_outlined,
                  color: marineBlue,
                  size: 45,
                );
              },
            ),
          ),
          const SizedBox(height: 4),
          Text(
            name,
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              color: darkBlue,
              fontSize: 10,
              fontWeight: FontWeight.w800,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSuccessStories() {
    final stories = [
      {
        'title': '40% Faster Growth',
        'place': 'West Godavari, AP',
        'image': 'assets/products/hero_shrimp.jpg',
      },
      {
        'title': 'Better Survival Rate',
        'place': 'Krishna, AP',
        'image': 'assets/products/shrimp_guide.png',
      },
      {
        'title': 'Healthy & Active Shrimp',
        'place': 'Kakinada, AP',
        'image': 'assets/products/shrimp_diseases.png',
      },
      {
        'title': 'Higher Yields',
        'place': 'Eluru, AP',
        'image': 'assets/products/hero_shrimp.jpg',
      },
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: Column(
        children: [
          Row(
            children: [
              const Icon(
                Icons.emoji_events,
                color: Colors.amber,
                size: 26,
              ),
              const SizedBox(width: 7),
              const Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Success Stories',
                      style: TextStyle(
                        color: darkBlue,
                        fontSize: 16,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    Text(
                      'Real farmers. Real results.',
                      style: TextStyle(
                        color: Color(0xFF52708A),
                        fontSize: 10,
                      ),
                    ),
                  ],
                ),
              ),
              const Text(
                'View All →',
                style: TextStyle(
                  color: Color(0xFF168BE6),
                  fontSize: 11,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
          const SizedBox(height: 9),
          SizedBox(
            height: 112,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: stories.length,
              separatorBuilder: (_, __) => const SizedBox(width: 9),
              itemBuilder: (_, index) {
                return Container(
                  width: 175,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(11),
                    image: DecorationImage(
                      image: AssetImage(stories[index]['image']!),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(11),
                      gradient: const LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.transparent,
                          Color(0xDD001B3A),
                        ],
                      ),
                    ),
                    padding: const EdgeInsets.all(9),
                    alignment: Alignment.bottomLeft,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Icon(
                          Icons.play_circle_outline,
                          color: Colors.white,
                          size: 25,
                        ),
                        const SizedBox(height: 2),
                        Text(
                          stories[index]['title']!,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        Text(
                          stories[index]['place']!,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 8.5,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildWaterTools() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 18),
      padding: const EdgeInsets.all(13),
      decoration: BoxDecoration(
        color: const Color(0xFFDDF8E9),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            children: [
              Icon(
                Icons.science,
                color: Color(0xFF159A78),
                size: 24,
              ),
              SizedBox(width: 7),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Water Quality Tools',
                    style: TextStyle(
                      color: darkBlue,
                      fontSize: 16,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  Text(
                    'Calculate, monitor and maintain ideal water parameters',
                    style: TextStyle(
                      color: Color(0xFF52708A),
                      fontSize: 9.5,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              _toolBox(Icons.water_drop, 'pH', 'Calculator'),
              _toolBox(Icons.thermostat, 'Temperature', 'Guide'),
              _toolBox(Icons.science, 'Salinity', 'Calculator'),
              _toolBox(Icons.bubble_chart, 'DO', 'Calculator'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _toolBox(IconData icon, String title, String sub) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.only(right: 5),
        padding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 4,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            Icon(
              icon,
              color: const Color(0xFF168BE6),
              size: 24,
            ),
            const SizedBox(height: 3),
            Text(
              title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                color: darkBlue,
                fontSize: 9,
                fontWeight: FontWeight.w800,
              ),
            ),
            Text(
              sub,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                color: Color(0xFF168BE6),
                fontSize: 8,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGrowthGuide() {
    final guides = [
      ['PL Selection', 'Choose healthy PL'],
      ['Pond Preparation', 'Get your pond ready'],
      ['Feeding Guide', 'Right feed, faster growth'],
      ['Moulting Care', 'Stronger shell, better growth'],
    ];

    final images = [
      'assets/products/shrimp_guide.png',
      'assets/products/hero_shrimp.jpg',
      'assets/products/shrimp_guide.png',
      'assets/products/hero_shrimp.jpg',
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: Column(
        children: [
          Row(
            children: [
              const Icon(
                Icons.menu_book,
                color: Color(0xFF168BE6),
                size: 26,
              ),
              const SizedBox(width: 7),
              const Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Shrimp Growth Guide',
                      style: TextStyle(
                        color: darkBlue,
                        fontSize: 16,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    Text(
                      'Step-by-step guidance from stocking to harvest',
                      style: TextStyle(
                        color: Color(0xFF52708A),
                        fontSize: 9.5,
                      ),
                    ),
                  ],
                ),
              ),
              const Text(
                'View All →',
                style: TextStyle(
                  color: Color(0xFF168BE6),
                  fontSize: 11,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
          const SizedBox(height: 9),
          SizedBox(
            height: 135,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: guides.length,
              separatorBuilder: (_, __) => const SizedBox(width: 8),
              itemBuilder: (_, index) {
                return SizedBox(
                  width: 155,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          images[index],
                          height: 82,
                          width: 155,
                          fit: BoxFit.cover,
                          errorBuilder: (_, __, ___) {
                            return Container(
                              height: 82,
                              color: lightBlue,
                              child: const Icon(
                                Icons.image_not_supported,
                                color: marineBlue,
                              ),
                            );
                          },
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        guides[index][0],
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          color: darkBlue,
                          fontSize: 10,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      Text(
                        guides[index][1],
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          color: Color(0xFF52708A),
                          fontSize: 8.5,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

/* =========================================================
   PRODUCTS PAGE
========================================================= */

class ProductsPage extends StatelessWidget {
  const ProductsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final products = [
      ['Marine 6G', 'assets/products/marine 6g.png'],
      ['Marine ProTab', 'assets/products/marine protab.png'],
      ['OXYTAB+', 'assets/products/oxytab plus.png'],
      ['Marine Vibrio Shield', 'assets/products/Marine vibrio shield.png'],
      ['Marine Volt-X', 'assets/products/marine volt-x.png'],
      ['Bio Sludge-X', 'assets/products/Bio sludge.png'],
      ['Bio Soil', 'assets/products/Bio soil.png'],
      ['Free Moult', 'assets/products/Free moult.png'],
      ['Hi-Soft', 'assets/products/Hi-Soft.png'],
      ['Red Thunder', 'assets/products/Red thunder.png'],
      ['Starmin', 'assets/products/Starmin.png'],
      ['Yucca Pro', 'assets/products/Yucca Pro.png'],
      ['Zeoneem', 'assets/products/Zeoneem.png'],
      ['Nutrimin', 'assets/products/nutrimin.png'],
      ['Marine White Shield', 'assets/products/marine white shield.png'],
    ];

    return SafeArea(
      child: CustomScrollView(
        slivers: [
          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.fromLTRB(20, 18, 20, 12),
              child: Text(
                'Our Products',
                style: TextStyle(
                  color: darkBlue,
                  fontSize: 27,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 20),
            sliver: SliverGrid(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return _productCard(
                    products[index][0],
                    products[index][1],
                  );
                },
                childCount: products.length,
              ),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: .82,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _productCard(String name, String image) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      padding: const EdgeInsets.all(12),
      child: Column(
        children: [
          Expanded(
            child: Image.asset(
              image,
              fit: BoxFit.contain,
              errorBuilder: (_, __, ___) {
                return const Center(
                  child: Icon(
                    Icons.image_not_supported_outlined,
                    color: marineBlue,
                    size: 48,
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 7),
          Text(
            name,
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              color: marineBlue,
              fontSize: 14,
              fontWeight: FontWeight.w800,
            ),
          ),
        ],
      ),
    );
  }
}

/* =========================================================
   MY PONDS
========================================================= */

class PondsPage extends StatelessWidget {
  const PondsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const Text(
            'My Ponds',
            style: TextStyle(
              color: darkBlue,
              fontSize: 28,
              fontWeight: FontWeight.w800,
            ),
          ),
          const SizedBox(height: 20),
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Column(
              children: [
                Icon(
                  Icons.water,
                  color: marineBlue,
                  size: 55,
                ),
                SizedBox(height: 10),
                Text(
                  'No pond added yet',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: darkBlue,
                  ),
                ),
                SizedBox(height: 6),
                Text(
                  'Add your pond to monitor water quality and shrimp growth.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          FilledButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.add),
            label: const Text('Add Pond'),
          ),
        ],
      ),
    );
  }
}

/* =========================================================
   SUPPORT
========================================================= */

class SupportPage extends StatelessWidget {
  const SupportPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const Text(
            'Support',
            style: TextStyle(
              color: darkBlue,
              fontSize: 28,
              fontWeight: FontWeight.w800,
            ),
          ),
          const SizedBox(height: 20),
          _supportTile(
            Icons.phone,
            'Call Technical Support',
            'Talk to our aquaculture technical team',
          ),
          _supportTile(
            Icons.chat,
            'WhatsApp Support',
            'Chat with Marine Aqua Technologies',
          ),
          _supportTile(
            Icons.location_on,
            'Dealer Support',
            'Find your nearest dealer',
          ),
        ],
      ),
    );
  }

  Widget _supportTile(
    IconData icon,
    String title,
    String subtitle,
  ) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 25,
            backgroundColor: lightBlue,
            child: Icon(
              icon,
              color: marineBlue,
            ),
          ),
          const SizedBox(width: 13),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: darkBlue,
                    fontSize: 15,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  subtitle,
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 11,
                  ),
                ),
              ],
            ),
          ),
          const Icon(
            Icons.arrow_forward_ios,
            size: 16,
            color: marineBlue,
          ),
        ],
      ),
    );
  }
}

/* =========================================================
   PROFILE
========================================================= */

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const Text(
            'Profile',
            style: TextStyle(
              color: darkBlue,
              fontSize: 28,
              fontWeight: FontWeight.w800,
            ),
          ),
          const SizedBox(height: 20),
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Column(
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundColor: lightBlue,
                  child: Icon(
                    Icons.person,
                    size: 45,
                    color: marineBlue,
                  ),
                ),
                SizedBox(height: 12),
                Text(
                  'Welcome',
                  style: TextStyle(
                    color: darkBlue,
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  'Marine Aqua Technologies',
                  style: TextStyle(
                    color: Colors.grey,
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
