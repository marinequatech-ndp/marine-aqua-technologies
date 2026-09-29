
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
          seedColor: const Color(0xFF087C9D),
        ),
      ),
      home: const SplashScreen(),
    );
  }
}

// ============================================================
// COLORS
// ============================================================

const Color primaryBlue = Color(0xFF087C9D);
const Color darkBlue = Color(0xFF006B87);
const Color lightBlue = Color(0xFFE4F7FB);
const Color background = Color(0xFFF2FBFD);

// ============================================================
// ASSET HELPER
// ============================================================

Widget productImage(
  String path, {
  BoxFit fit = BoxFit.contain,
  double? width,
  double? height,
}) {
  return Image.asset(
    path,
    width: width,
    height: height,
    fit: fit,
    errorBuilder: (context, error, stackTrace) {
      return Container(
        width: width,
        height: height,
        alignment: Alignment.center,
        child: const Icon(
          Icons.image_not_supported_outlined,
          size: 55,
          color: primaryBlue,
        ),
      );
    },
  );
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
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 2), () {
      if (!mounted) return;

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => const LoginScreen(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              productImage(
                'assets/products/marine logo.png',
                width: 330,
                height: 230,
              ),

              const SizedBox(height: 20),

              const Text(
                'MARINE AQUA',
                style: TextStyle(
                  fontSize: 43,
                  fontWeight: FontWeight.w800,
                  color: primaryBlue,
                  letterSpacing: 1,
                ),
              ),

              const Text(
                'TECHNOLOGIES',
                style: TextStyle(
                  fontSize: 43,
                  fontWeight: FontWeight.w800,
                  color: primaryBlue,
                  letterSpacing: 1,
                ),
              ),

              const SizedBox(height: 20),

              const Text(
                'ఆక్వా సాగులో ప్రతి దశలో... మీకు తోడుగా',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.w700,
                  color: primaryBlue,
                ),
              ),

              const SizedBox(height: 10),

              const Text(
                'Smart Aquaculture. Better Results.',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.grey,
                ),
              ),

              const SizedBox(height: 80),

              const SizedBox(
                width: 28,
                height: 28,
                child: CircularProgressIndicator(
                  strokeWidth: 3,
                  color: primaryBlue,
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
// LOGIN SCREEN
// ============================================================

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController mobileController =
      TextEditingController();

  @override
  void dispose() {
    mobileController.dispose();
    super.dispose();
  }

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
        builder: (_) => OtpScreen(
          mobileNumber: mobileController.text.trim(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 28,
              vertical: 35,
            ),
            child: Column(
              children: [
                productImage(
                  'assets/products/marine logo.png',
                  width: 330,
                  height: 230,
                ),

                const SizedBox(height: 5),

                const Text(
                  'MARINE AQUA',
                  style: TextStyle(
                    fontSize: 42,
                    fontWeight: FontWeight.w800,
                    color: primaryBlue,
                  ),
                ),

                const Text(
                  'TECHNOLOGIES',
                  style: TextStyle(
                    fontSize: 42,
                    fontWeight: FontWeight.w800,
                    color: primaryBlue,
                  ),
                ),

                const SizedBox(height: 18),

                const Text(
                  'ఆక్వా సాగులో ప్రతి దశలో... మీకు తోడుగా',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: primaryBlue,
                  ),
                ),

                const SizedBox(height: 8),

                const Text(
                  'Smart Aquaculture. Better Results.',
                  style: TextStyle(
                    fontSize: 17,
                    color: Colors.grey,
                  ),
                ),

                const SizedBox(height: 55),

                Container(
                  padding: const EdgeInsets.fromLTRB(
                    28,
                    35,
                    28,
                    30,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(32),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.06),
                        blurRadius: 18,
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
                          fontSize: 37,
                          fontWeight: FontWeight.w800,
                          color: primaryBlue,
                        ),
                      ),

                      const SizedBox(height: 8),

                      const Text(
                        'Login with your mobile\nnumber',
                        style: TextStyle(
                          fontSize: 19,
                          color: Colors.grey,
                          height: 1.4,
                        ),
                      ),

                      const SizedBox(height: 30),

                      TextField(
                        controller: mobileController,
                        keyboardType: TextInputType.phone,
                        maxLength: 10,
                        decoration: InputDecoration(
                          counterText: '',
                          filled: true,
                          fillColor: lightBlue,
                          prefixIcon: const Icon(
                            Icons.phone_android,
                            color: primaryBlue,
                            size: 30,
                          ),
                          hintText: 'Enter mobile number',
                          hintStyle: const TextStyle(
                            fontSize: 18,
                            color: Colors.grey,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(22),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),

                      const SizedBox(height: 25),

                      SizedBox(
                        width: double.infinity,
                        height: 64,
                        child: ElevatedButton(
                          onPressed: sendOtp,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: primaryBlue,
                            foregroundColor: Colors.white,
                            elevation: 2,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          child: const Text(
                            'SEND OTP',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w800,
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
      ),
    );
  }
}

// ============================================================
// OTP SCREEN
// ============================================================

class OtpScreen extends StatefulWidget {
  final String mobileNumber;

  const OtpScreen({
    super.key,
    required this.mobileNumber,
  });

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final TextEditingController otpController =
      TextEditingController();

  void verifyOtp() {
    if (otpController.text.trim().length != 6) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please enter 6 digit OTP'),
        ),
      );
      return;
    }

    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (_) => const MainNavigation(),
      ),
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 28,
            vertical: 30,
          ),
          child: Column(
            children: [
              productImage(
                'assets/products/marine logo.png',
                width: 260,
                height: 190,
              ),

              const SizedBox(height: 20),

              const Text(
                'Verify OTP',
                style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.w800,
                  color: primaryBlue,
                ),
              ),

              const SizedBox(height: 10),

              Text(
                'OTP sent to +91 ${widget.mobileNumber}',
                style: const TextStyle(
                  fontSize: 17,
                  color: Colors.grey,
                ),
              ),

              const SizedBox(height: 45),

              TextField(
                controller: otpController,
                keyboardType: TextInputType.number,
                maxLength: 6,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 12,
                ),
                decoration: InputDecoration(
                  counterText: '',
                  filled: true,
                  fillColor: Colors.white,
                  hintText: '------',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),

              const SizedBox(height: 30),

              SizedBox(
                width: double.infinity,
                height: 62,
                child: ElevatedButton(
                  onPressed: verifyOtp,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryBlue,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: const Text(
                    'VERIFY OTP',
                    style: TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
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
        height: 82,
        backgroundColor: const Color(0xFFEFF2F7),
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

  final List<Map<String, String>> featuredProducts = const [
    {
      'name': 'Marine 6G',
      'image': 'assets/products/marine 6g.png',
    },
    {
      'name': 'Marine ProTab',
      'image': 'assets/products/marine protab.png',
    },
    {
      'name': 'OXYTAB+',
      'image': 'assets/products/oxytab plus.png',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CustomScrollView(
        slivers: [
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(20, 18, 20, 0),
            sliver: SliverToBoxAdapter(
              child: _header(),
            ),
          ),

          SliverPadding(
            padding: const EdgeInsets.fromLTRB(20, 22, 20, 0),
            sliver: SliverToBoxAdapter(
              child: _heroBanner(),
            ),
          ),

          SliverPadding(
            padding: const EdgeInsets.fromLTRB(20, 28, 20, 0),
            sliver: SliverToBoxAdapter(
              child: Row(
                children: [
                  const Expanded(
                    child: Text(
                      'ఆక్వా సమాచారం',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w800,
                        color: primaryBlue,
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.arrow_forward,
                      size: 38,
                      color: primaryBlue,
                    ),
                  ),
                ],
              ),
            ),
          ),

          SliverPadding(
            padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
            sliver: SliverToBoxAdapter(
              child: _infoCards(),
            ),
          ),

          SliverPadding(
            padding: const EdgeInsets.fromLTRB(20, 28, 20, 0),
            sliver: SliverToBoxAdapter(
              child: _waterParameters(),
            ),
          ),

          SliverPadding(
            padding: const EdgeInsets.fromLTRB(20, 28, 20, 12),
            sliver: SliverToBoxAdapter(
              child: const Text(
                'Featured Products',
                style: TextStyle(
                  fontSize: 31,
                  fontWeight: FontWeight.w800,
                  color: primaryBlue,
                ),
              ),
            ),
          ),

          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            sliver: SliverToBoxAdapter(
              child: SizedBox(
                height: 255,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: featuredProducts.length,
                  separatorBuilder: (_, __) =>
                      const SizedBox(width: 14),
                  itemBuilder: (context, index) {
                    final product = featuredProducts[index];

                    return _featuredCard(
                      product['name']!,
                      product['image']!,
                    );
                  },
                ),
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

  Widget _header() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: 75,
          height: 75,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(24),
          ),
          child: productImage(
            'assets/products/marine logo.png',
            width: 65,
            height: 65,
          ),
        ),

        const SizedBox(width: 14),

        const Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'MARINE AQUA',
                style: TextStyle(
                  fontSize: 27,
                  fontWeight: FontWeight.w800,
                  color: primaryBlue,
                ),
              ),
              Text(
                'TECHNOLOGIES',
                style: TextStyle(
                  fontSize: 27,
                  fontWeight: FontWeight.w800,
                  color: primaryBlue,
                ),
              ),
              SizedBox(height: 5),
              Text(
                'ఆక్వా సాగులో ప్రతి దశలో... మీకు తోడుగా',
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w700,
                  color: primaryBlue,
                ),
              ),
            ],
          ),
        ),

        const Icon(
          Icons.notifications_none,
          color: primaryBlue,
          size: 34,
        ),
      ],
    );
  }

  Widget _heroBanner() {
    return Container(
      height: 235,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(38),
        gradient: const LinearGradient(
          colors: [
            Color(0xFF0C86A5),
            Color(0xFF075E79),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      clipBehavior: Clip.antiAlias,
      child: Stack(
        children: [
          Positioned(
            right: -20,
            top: 25,
            child: Icon(
              Icons.water,
              size: 190,
              color: Colors.white.withOpacity(0.08),
            ),
          ),

          const Padding(
            padding: EdgeInsets.fromLTRB(30, 35, 25, 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'MARINE AQUA',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 34,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                Text(
                  'TECHNOLOGIES',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 34,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                SizedBox(height: 18),
                Text(
                  'Smart Aquaculture.',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                  ),
                ),
                Text(
                  'Better Results.',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _infoCards() {
    final cards = [
      {
        'title': 'రొయ్యల సాగు గైడ్',
        'image': 'assets/products/shrimp_guide.png',
      },
      {
        'title': 'బయోమాస్ కాలిక్యులేటర్',
        'image': 'assets/products/biomass_calculator.png',
      },
      {
        'title': 'రొయ్యల వ్యాధులు',
        'image': 'assets/products/shrimp_diseases.png',
      },
    ];

    return Row(
      children: cards.map((card) {
        return Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Container(
              height: 155,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(22),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.04),
                    blurRadius: 8,
                  ),
                ],
              ),
              clipBehavior: Clip.antiAlias,
              child: Column(
                children: [
                  Expanded(
                    child: productImage(
                      card['image']!,
                      fit: BoxFit.cover,
                      width: double.infinity,
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 5,
                      vertical: 8,
                    ),
                    color: const Color(0xFF657074),
                    child: Text(
                      card['title']!,
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }).toList(),
    );
  }

  Widget _waterParameters() {
    return Container(
      padding: const EdgeInsets.fromLTRB(
        20,
        22,
        20,
        22,
      ),
      decoration: BoxDecoration(
        color: lightBlue,
        borderRadius: BorderRadius.circular(32),
        border: Border.all(
          color: const Color(0xFF9ED9E8),
          width: 2,
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
                    fontSize: 27,
                    fontWeight: FontWeight.w800,
                    color: primaryBlue,
                  ),
                ),
              ),
              const Icon(
                Icons.edit,
                color: primaryBlue,
                size: 30,
              ),
            ],
          ),

          const SizedBox(height: 20),

          Row(
            children: [
              _parameter(
                icon: Icons.science_outlined,
                name: 'pH',
                value: '7.8',
                unit: '6.5 - 8.5',
              ),
              _parameter(
                icon: Icons.water,
                name: 'Salinity',
                value: '18',
                unit: 'ppt',
              ),
              _parameter(
                icon: Icons.air,
                name: 'DO',
                value: '5.6',
                unit: 'mg/L',
              ),
              _parameter(
                icon: Icons.science,
                name: 'Alkalinity',
                value: '140',
                unit: 'ppm',
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _parameter({
    required IconData icon,
    required String name,
    required String value,
    required String unit,
  }) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 4),
        height: 175,
        padding: const EdgeInsets.symmetric(
          horizontal: 5,
          vertical: 12,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: primaryBlue,
              size: 31,
            ),
            const SizedBox(height: 8),
            Text(
              name,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              value,
              style: const TextStyle(
                fontSize: 27,
                fontWeight: FontWeight.w800,
                color: primaryBlue,
              ),
            ),
            Text(
              unit,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 11,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _featuredCard(String name, String image) {
    return Container(
      width: 190,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(28),
      ),
      padding: const EdgeInsets.all(12),
      child: Column(
        children: [
          Expanded(
            child: productImage(
              image,
              fit: BoxFit.contain,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            name,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w800,
              color: primaryBlue,
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

  final List<Map<String, String>> products = const [
    {
      'name': 'Marine 6G',
      'image': 'assets/products/marine 6g.png',
    },
    {
      'name': 'Marine ProTab',
      'image': 'assets/products/marine protab.png',
    },
    {
      'name': 'OXYTAB+',
      'image': 'assets/products/oxytab plus.png',
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
      'name': 'Marine White Shield',
      'image': 'assets/products/marine white shield.png',
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
      'name': 'Nutrimin',
      'image': 'assets/products/nutrimin.png',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CustomScrollView(
        slivers: [
          const SliverPadding(
            padding: EdgeInsets.fromLTRB(22, 24, 22, 18),
            sliver: SliverToBoxAdapter(
              child: Text(
                'Our Products',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w800,
                  color: primaryBlue,
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

                  return _productCard(
                    product['name']!,
                    product['image']!,
                  );
                },
                childCount: products.length,
              ),
              gridDelegate:
                  const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 14,
                mainAxisSpacing: 14,
                childAspectRatio: 0.83,
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

  Widget _productCard(String name, String image) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(28),
      ),
      padding: const EdgeInsets.fromLTRB(
        10,
        12,
        10,
        12,
      ),
      child: Column(
        children: [
          Expanded(
            child: productImage(
              image,
              fit: BoxFit.contain,
            ),
          ),

          const SizedBox(height: 10),

          Text(
            name,
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w800,
              color: primaryBlue,
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
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(22),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Support',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.w800,
                color: primaryBlue,
              ),
            ),

            const SizedBox(height: 25),

            _supportCard(
              Icons.phone,
              'Call Support',
              'Talk to our technical team',
            ),

            const SizedBox(height: 15),

            _supportCard(
              Icons.chat,
              'WhatsApp Support',
              'Chat with Marine Aqua Technologies',
            ),

            const SizedBox(height: 15),

            _supportCard(
              Icons.location_on,
              'Technical Officer',
              'Connect with your local technical officer',
            ),
          ],
        ),
      ),
    );
  }

  Widget _supportCard(
    IconData icon,
    String title,
    String subtitle,
  ) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Row(
        children: [
          Container(
            width: 58,
            height: 58,
            decoration: BoxDecoration(
              color: lightBlue,
              borderRadius: BorderRadius.circular(18),
            ),
            child: Icon(
              icon,
              color: primaryBlue,
              size: 30,
            ),
          ),

          const SizedBox(width: 16),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.w800,
                    color: primaryBlue,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  subtitle,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),

          const Icon(
            Icons.arrow_forward_ios,
            size: 18,
            color: primaryBlue,
          ),
        ],
      ),
    );
  }
}
```
