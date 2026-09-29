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
        scaffoldBackgroundColor: const Color(0xFFF2FBFD),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF087A99),
        ),
      ),
      home: const LoginPage(),
    );
  }
}

// ============================================================
// COLORS
// ============================================================

const Color primary = Color(0xFF087A99);
const Color darkBlue = Color(0xFF075C78);
const Color lightBg = Color(0xFFF2FBFD);
const Color cardBg = Colors.white;

// ============================================================
// ASSET IMAGE
// ============================================================

class AssetImageSafe extends StatelessWidget {
  final String path;
  final BoxFit fit;
  final double? width;
  final double? height;

  const AssetImageSafe({
    super.key,
    required this.path,
    this.fit = BoxFit.contain,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      path,
      width: width,
      height: height,
      fit: fit,
      errorBuilder: (context, error, stackTrace) {
        return Container(
          width: width,
          height: height,
          color: Colors.white,
          alignment: Alignment.center,
          child: const Icon(
            Icons.image_not_supported_outlined,
            color: primary,
            size: 45,
          ),
        );
      },
    );
  }
}

// ============================================================
// LOGIN
// ============================================================

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController mobileController = TextEditingController();

  void sendOtp() {
    if (mobileController.text.trim().length != 10) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please enter a valid 10 digit mobile number'),
        ),
      );
      return;
    }

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => OtpPage(
          mobile: mobileController.text.trim(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightBg,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 55),

              const AssetImageSafe(
                path: 'assets/logo.png',
                width: 230,
                height: 150,
              ),

              const SizedBox(height: 10),

              const Text(
                'MARINE AQUA\nTECHNOLOGIES',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: primary,
                  fontSize: 38,
                  fontWeight: FontWeight.w800,
                  height: 1.4,
                ),
              ),

              const SizedBox(height: 14),

              const Text(
                'ఆక్వా సాగులో ప్రతి దశలో... మీకు తోడుగా',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: darkBlue,
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
              ),

              const SizedBox(height: 8),

              const Text(
                'Smart Aquaculture. Better Results.',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 16,
                ),
              ),

              const SizedBox(height: 50),

              Container(
                margin: const EdgeInsets.symmetric(horizontal: 28),
                padding: const EdgeInsets.fromLTRB(28, 35, 28, 35),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(32),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(.06),
                      blurRadius: 20,
                      offset: const Offset(0, 8),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Welcome Back',
                      style: TextStyle(
                        color: primary,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 8),

                    const Text(
                      'Login with your mobile number',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 17,
                      ),
                    ),

                    const SizedBox(height: 25),

                    TextField(
                      controller: mobileController,
                      keyboardType: TextInputType.phone,
                      maxLength: 10,
                      decoration: InputDecoration(
                        counterText: '',
                        filled: true,
                        fillColor: const Color(0xFFE9F8FB),
                        prefixIcon: const Icon(
                          Icons.phone_android,
                          color: primary,
                        ),
                        hintText: 'Enter mobile number',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(22),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),

                    SizedBox(
                      width: double.infinity,
                      height: 58,
                      child: ElevatedButton(
                        onPressed: sendOtp,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: primary,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        child: const Text(
                          'SEND OTP',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
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
    );
  }
}

// ============================================================
// OTP
// ============================================================

class OtpPage extends StatefulWidget {
  final String mobile;

  const OtpPage({
    super.key,
    required this.mobile,
  });

  @override
  State<OtpPage> createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  final TextEditingController otpController = TextEditingController();

  void verifyOtp() {
    // LOCAL OTP
    // Firebase లేదు.
    // Demo OTP = 123456

    if (otpController.text.trim() == '123456') {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (_) => const MainNavigation(),
        ),
        (route) => false,
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Wrong OTP. Use 123456'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightBg,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(28),
          child: Column(
            children: [
              const SizedBox(height: 70),

              const AssetImageSafe(
                path: 'assets/logo.png',
                width: 210,
                height: 130,
              ),

              const SizedBox(height: 35),

              const Text(
                'Verify OTP',
                style: TextStyle(
                  color: primary,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 10),

              Text(
                'OTP sent to +91 ${widget.mobile}',
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 16,
                ),
              ),

              const SizedBox(height: 30),

              TextField(
                controller: otpController,
                keyboardType: TextInputType.number,
                maxLength: 6,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 28,
                  letterSpacing: 8,
                  fontWeight: FontWeight.bold,
                ),
                decoration: InputDecoration(
                  counterText: '',
                  hintText: '000000',
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),

              const SizedBox(height: 25),

              SizedBox(
                width: double.infinity,
                height: 58,
                child: ElevatedButton(
                  onPressed: verifyOtp,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primary,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: const Text(
                    'VERIFY OTP',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              const Text(
                'Demo OTP: 123456',
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
            ],
          ),
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
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[selectedIndex],
      bottomNavigationBar: NavigationBar(
        selectedIndex: selectedIndex,
        onDestinationSelected: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        backgroundColor: const Color(0xFFF1F5F9),
        indicatorColor: const Color(0xFFC9F1FA),
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
// HEADER
// ============================================================

class AppHeader extends StatelessWidget {
  const AppHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 18, 20, 8),
      child: Row(
        children: [
          Container(
            width: 78,
            height: 78,
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: const AssetImageSafe(
              path: 'assets/logo.png',
            ),
          ),

          const SizedBox(width: 14),

          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'MARINE AQUA\nTECHNOLOGIES',
                  style: TextStyle(
                    color: primary,
                    fontSize: 25,
                    fontWeight: FontWeight.w800,
                    height: 1.35,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  'ఆక్వా సాగులో ప్రతి దశలో... మీకు తోడుగా',
                  style: TextStyle(
                    color: darkBlue,
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),

          const Icon(
            Icons.notifications_none,
            color: primary,
            size: 34,
          ),
        ],
      ),
    );
  }
}

// ============================================================
// HOME
// ============================================================

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CustomScrollView(
        slivers: [
          const SliverToBoxAdapter(
            child: AppHeader(),
          ),

          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 15, 20, 0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(32),
                child: SizedBox(
                  height: 230,
                  width: double.infinity,
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      const AssetImageSafe(
                        path: 'assets/hero_banner.png',
                        fit: BoxFit.cover,
                      ),

                      Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            colors: [
                              Colors.black.withOpacity(.55),
                              Colors.transparent,
                            ],
                          ),
                        ),
                      ),

                      const Positioned(
                        left: 28,
                        top: 40,
                        child: Text(
                          'MARINE AQUA\nTECHNOLOGIES',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            height: 1.4,
                          ),
                        ),
                      ),

                      const Positioned(
                        left: 28,
                        bottom: 45,
                        child: Text(
                          'Smart Aquaculture.\nBetter Results.',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                            height: 1.5,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),

          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(25, 25, 20, 15),
              child: Row(
                children: [
                  const Text(
                    'ఆక్వా సమాచారం',
                    style: TextStyle(
                      color: darkBlue,
                      fontSize: 29,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Spacer(),
                  Icon(
                    Icons.arrow_forward,
                    color: primary,
                    size: 38,
                  ),
                ],
              ),
            ),
          ),

          // ==================================================
          // THREE SHORTCUT CARDS
          // ==================================================

          SliverToBoxAdapter(
            child: SizedBox(
              height: 190,
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                scrollDirection: Axis.horizontal,
                children: const [
                  ShortcutCard(
                    image: 'assets/shortcut_card_1_royyala_sagu_guide.png',
                    title: 'రొయ్యల సాగు గైడ్',
                  ),
                  ShortcutCard(
                    image: 'assets/shortcut_card_2_biomass_calculator.png',
                    title: 'బయోమాస్ కాలిక్యులేటర్',
                  ),
                  ShortcutCard(
                    image: 'assets/shortcut_card_3_royyala_vyadhulu.png',
                    title: 'రొయ్యల వ్యాధులు',
                  ),
                ],
              ),
            ),
          ),

          SliverToBoxAdapter(
            child: WaterParameters(),
          ),

          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.fromLTRB(20, 25, 20, 15),
              child: Text(
                'Featured Products',
                style: TextStyle(
                  color: darkBlue,
                  fontSize: 29,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),

          SliverToBoxAdapter(
            child: SizedBox(
              height: 245,
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                scrollDirection: Axis.horizontal,
                children: const [
                  FeaturedProduct(
                    image: 'assets/marine 6g.png',
                    name: 'Marine 6G',
                  ),
                  FeaturedProduct(
                    image: 'assets/protab.png',
                    name: 'Marine ProTab',
                  ),
                  FeaturedProduct(
                    image: 'assets/oxytab.png',
                    name: 'OXYTAB+',
                  ),
                ],
              ),
            ),
          ),

          const SliverToBoxAdapter(
            child: SizedBox(height: 20),
          ),
        ],
      ),
    );
  }
}

// ============================================================
// SHORTCUT CARD
// ============================================================

class ShortcutCard extends StatelessWidget {
  final String image;
  final String title;

  const ShortcutCard({
    super.key,
    required this.image,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 205,
      margin: const EdgeInsets.only(right: 14),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.05),
            blurRadius: 10,
          ),
        ],
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: [
          Expanded(
            child: AssetImageSafe(
              path: image,
              fit: BoxFit.cover,
              width: double.infinity,
            ),
          ),

          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(
              horizontal: 8,
              vertical: 10,
            ),
            color: primary,
            child: Text(
              title,
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
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
      margin: const EdgeInsets.fromLTRB(20, 25, 20, 0),
      padding: const EdgeInsets.fromLTRB(18, 22, 18, 20),
      decoration: BoxDecoration(
        color: const Color(0xFFE8F8FC),
        borderRadius: BorderRadius.circular(30),
        border: Border.all(
          color: const Color(0xFFB4E4EF),
          width: 2,
        ),
      ),
      child: Column(
        children: [
          Row(
            children: [
              const Text(
                'చెరువు నీటి పరిస్థితులు',
                style: TextStyle(
                  color: darkBlue,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Spacer(),
              const Icon(
                Icons.edit,
                color: primary,
              ),
            ],
          ),

          const SizedBox(height: 20),

          Row(
            children: const [
              ParameterCard(
                icon: Icons.science_outlined,
                title: 'pH',
                value: '7.8',
                unit: '6.5 - 8.5',
              ),
              ParameterCard(
                icon: Icons.waves,
                title: 'Salinity',
                value: '18',
                unit: 'ppt',
              ),
              ParameterCard(
                icon: Icons.air,
                title: 'DO',
                value: '5.6',
                unit: 'mg/L',
              ),
              ParameterCard(
                icon: Icons.science,
                title: 'Alkalinity',
                value: '140',
                unit: 'ppm',
              ),
            ],
          ),
        ],
      ),
    );
  }
}

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
    return Expanded(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 3),
        padding: const EdgeInsets.symmetric(
          vertical: 14,
          horizontal: 4,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(22),
        ),
        child: Column(
          children: [
            Icon(
              icon,
              color: primary,
              size: 27,
            ),
            const SizedBox(height: 8),
            Text(
              title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              value,
              style: const TextStyle(
                color: primary,
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              unit,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                color: Colors.grey,
                fontSize: 11,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ============================================================
// FEATURED PRODUCT
// ============================================================

class FeaturedProduct extends StatelessWidget {
  final String image;
  final String name;

  const FeaturedProduct({
    super.key,
    required this.image,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      margin: const EdgeInsets.only(right: 15),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(28),
      ),
      child: Column(
        children: [
          Expanded(
            child: AssetImageSafe(
              path: image,
              fit: BoxFit.contain,
              width: double.infinity,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            name,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              color: primary,
              fontSize: 17,
              fontWeight: FontWeight.bold,
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

class ProductsPage extends StatelessWidget {
  const ProductsPage({super.key});

  static const List<Map<String, String>> products = [
    {
      'name': 'Marine 6G',
      'image': 'assets/marine 6g.png',
    },
    {
      'name': 'Marine ProTab',
      'image': 'assets/protab.png',
    },
    {
      'name': 'OXYTAB+',
      'image': 'assets/oxytab.png',
    },
    {
      'name': 'Marine Vibrio Shield',
      'image': 'assets/vibrio shield.png',
    },
    {
      'name': 'Bio Sludge-X',
      'image': 'assets/bio sludge -x.png',
    },
    {
      'name': 'Free Moult',
      'image': 'assets/free moult.png',
    },
    {
      'name': 'White Shield',
      'image': 'assets/white shield.png',
    },
    {
      'name': 'Red Thunder',
      'image': 'assets/red thunder.png',
    },
    {
      'name': 'Starmin',
      'image': 'assets/starmin.png',
    },
    {
      'name': 'Marine Volt-X',
      'image': 'assets/volt-x.png',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CustomScrollView(
        slivers: [
          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.fromLTRB(25, 25, 20, 20),
              child: Text(
                'Our Products',
                style: TextStyle(
                  color: darkBlue,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),

          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            sliver: SliverGrid(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  final product = products[index];

                  return ProductCard(
                    name: product['name']!,
                    image: product['image']!,
                  );
                },
                childCount: products.length,
              ),
              gridDelegate:
                  const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 14,
                mainAxisSpacing: 14,
                childAspectRatio: .82,
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
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(26),
      ),
      child: Column(
        children: [
          Expanded(
            child: AssetImageSafe(
              path: image,
              fit: BoxFit.contain,
              width: double.infinity,
            ),
          ),

          const SizedBox(height: 10),

          Text(
            name,
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              color: primary,
              fontSize: 17,
              fontWeight: FontWeight.bold,
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
      child: Padding(
        padding: const EdgeInsets.all(22),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),

            const Text(
              'Support',
              style: TextStyle(
                color: darkBlue,
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 25),

            SupportCard(
              icon: Icons.phone,
              title: 'Call Support',
              subtitle: 'Talk to Marine Aqua Technologies',
              onTap: () {},
            ),

            SupportCard(
              icon: Icons.chat,
              title: 'WhatsApp Support',
              subtitle: 'Get aquaculture assistance',
              onTap: () {},
            ),

            SupportCard(
              icon: Icons.info_outline,
              title: 'About Marine Aqua Technologies',
              subtitle: 'Smart Aquaculture. Better Results.',
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}

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
    return Card(
      margin: const EdgeInsets.only(bottom: 15),
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(22),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.all(12),
        leading: CircleAvatar(
          radius: 27,
          backgroundColor: const Color(0xFFDDF5FA),
          child: Icon(
            icon,
            color: primary,
          ),
        ),
        title: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: darkBlue,
          ),
        ),
        subtitle: Text(subtitle),
        trailing: const Icon(
          Icons.arrow_forward_ios,
          size: 17,
          color: primary,
        ),
        onTap: onTap,
      ),
    );
  }
}
