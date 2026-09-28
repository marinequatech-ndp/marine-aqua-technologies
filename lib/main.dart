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
        scaffoldBackgroundColor: const Color(0xFFF4FBFE),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF08739B),
        ),
      ),
      home: const SplashScreen(),
    );
  }
}

/* ============================================================
   COLORS
============================================================ */

const Color marineBlue = Color(0xFF086C91);
const Color marineDarkBlue = Color(0xFF075678);
const Color marineLight = Color(0xFFEAF8FC);
const Color marineGreen = Color(0xFF20A65A);

/* ============================================================
   SPLASH SCREEN
============================================================ */

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
          builder: (_) => const LoginPage(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4FBFE),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/products/marine logo.png',
                width: 230,
                height: 150,
                fit: BoxFit.contain,
                errorBuilder: (_, __, ___) {
                  return const Icon(
                    Icons.water_drop,
                    size: 110,
                    color: marineBlue,
                  );
                },
              ),

              const SizedBox(height: 25),

              const Text(
                'MARINE AQUA',
                style: TextStyle(
                  fontSize: 42,
                  fontWeight: FontWeight.w800,
                  color: marineBlue,
                  letterSpacing: 1,
                ),
              ),

              const Text(
                'TECHNOLOGIES',
                style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.w800,
                  color: marineBlue,
                  letterSpacing: 1,
                ),
              ),

              const SizedBox(height: 18),

              const Text(
                'ఆక్వా సాగులో ప్రతి దశలో... మీకు తోడుగా',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w700,
                  color: marineBlue,
                ),
              ),

              const SizedBox(height: 8),

              const Text(
                'Smart Aquaculture. Better Results.',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),

              const SizedBox(height: 45),

              const SizedBox(
                width: 30,
                height: 30,
                child: CircularProgressIndicator(
                  strokeWidth: 3,
                  color: marineBlue,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/* ============================================================
   LOGIN PAGE
============================================================ */

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController phoneController = TextEditingController();

  @override
  void dispose() {
    phoneController.dispose();
    super.dispose();
  }

  void sendOtp() {
    final phone = phoneController.text.trim();

    if (phone.length != 10) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please enter a valid 10-digit mobile number'),
        ),
      );
      return;
    }

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => OtpPage(phoneNumber: phone),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4FBFE),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Column(
              children: [
                Expanded(
                  child: Center(
                    child: SingleChildScrollView(
                      physics: const NeverScrollableScrollPhysics(),
                      padding: const EdgeInsets.symmetric(horizontal: 28),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/products/marine logo.png',
                            width: 250,
                            height: 150,
                            fit: BoxFit.contain,
                            errorBuilder: (_, __, ___) {
                              return const Icon(
                                Icons.water_drop,
                                size: 100,
                                color: marineBlue,
                              );
                            },
                          ),

                          const SizedBox(height: 15),

                          const Text(
                            'MARINE AQUA',
                            style: TextStyle(
                              fontSize: 42,
                              fontWeight: FontWeight.w800,
                              color: marineBlue,
                            ),
                          ),

                          const Text(
                            'TECHNOLOGIES',
                            style: TextStyle(
                              fontSize: 38,
                              fontWeight: FontWeight.w800,
                              color: marineBlue,
                            ),
                          ),

                          const SizedBox(height: 15),

                          const Text(
                            'ఆక్వా సాగులో ప్రతి దశలో... మీకు తోడుగా',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w700,
                              color: marineBlue,
                            ),
                          ),

                          const SizedBox(height: 8),

                          const Text(
                            'Smart Aquaculture. Better Results.',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey,
                            ),
                          ),

                          const SizedBox(height: 35),

                          Container(
                            width: double.infinity,
                            padding: const EdgeInsets.fromLTRB(
                              28,
                              28,
                              28,
                              30,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(35),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.06),
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
                                    fontSize: 34,
                                    fontWeight: FontWeight.w800,
                                    color: marineBlue,
                                  ),
                                ),

                                const SizedBox(height: 8),

                                const Text(
                                  'Login with your mobile number',
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.grey,
                                  ),
                                ),

                                const SizedBox(height: 25),

                                Container(
                                  decoration: BoxDecoration(
                                    color: marineLight,
                                    borderRadius: BorderRadius.circular(18),
                                  ),
                                  child: TextField(
                                    controller: phoneController,
                                    keyboardType: TextInputType.phone,
                                    maxLength: 10,
                                    decoration: const InputDecoration(
                                      counterText: '',
                                      prefixIcon: Icon(
                                        Icons.phone_android,
                                        color: marineBlue,
                                      ),
                                      prefixText: '+91  ',
                                      prefixStyle: TextStyle(
                                        color: marineBlue,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                      ),
                                      hintText: 'Enter mobile number',
                                      border: InputBorder.none,
                                      contentPadding: EdgeInsets.symmetric(
                                        vertical: 18,
                                      ),
                                    ),
                                  ),
                                ),

                                const SizedBox(height: 22),

                                SizedBox(
                                  width: double.infinity,
                                  height: 55,
                                  child: ElevatedButton(
                                    onPressed: sendOtp,
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: marineBlue,
                                      foregroundColor: Colors.white,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(18),
                                      ),
                                    ),
                                    child: const Text(
                                      'SEND OTP',
                                      style: TextStyle(
                                        fontSize: 17,
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
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

/* ============================================================
   OTP PAGE
============================================================ */

class OtpPage extends StatefulWidget {
  final String phoneNumber;

  const OtpPage({
    super.key,
    required this.phoneNumber,
  });

  @override
  State<OtpPage> createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  final TextEditingController otpController = TextEditingController();

  void verifyOtp() {
    final otp = otpController.text.trim();

    // DEMO OTP
    if (otp == '123456') {
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
          content: Text('Invalid OTP. Demo OTP is 123456'),
        ),
      );
    }
  }

  @override
  void dispose() {
    otpController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4FBFE),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: marineBlue,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 28),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.verified_user_outlined,
                  size: 85,
                  color: marineBlue,
                ),

                const SizedBox(height: 25),

                const Text(
                  'Verify OTP',
                  style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.w800,
                    color: marineBlue,
                  ),
                ),

                const SizedBox(height: 10),

                Text(
                  'OTP sent to +91 ${widget.phoneNumber}',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                ),

                const SizedBox(height: 30),

                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: TextField(
                    controller: otpController,
                    keyboardType: TextInputType.number,
                    maxLength: 6,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 10,
                      color: marineBlue,
                    ),
                    decoration: const InputDecoration(
                      counterText: '',
                      hintText: '••••••',
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(
                        vertical: 18,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 25),

                SizedBox(
                  width: double.infinity,
                  height: 55,
                  child: ElevatedButton(
                    onPressed: verifyOtp,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: marineBlue,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18),
                      ),
                    ),
                    child: const Text(
                      'VERIFY & CONTINUE',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                const Text(
                  'Demo OTP: 123456',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
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

/* ============================================================
   MAIN NAVIGATION
============================================================ */

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
        height: 75,
        selectedIndex: selectedIndex,
        onDestinationSelected: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        indicatorColor: const Color(0xFFD4F2FC),
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

/* ============================================================
   HOME PAGE
============================================================ */

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4FBFE),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: _homeHeader(),
            ),

            SliverToBoxAdapter(
              child: _heroBanner(),
            ),

            SliverToBoxAdapter(
              child: _quickAccessTitle(),
            ),

            SliverToBoxAdapter(
              child: _quickAccessCards(),
            ),

            SliverToBoxAdapter(
              child: _waterParameters(),
            ),

            SliverToBoxAdapter(
              child: _productsTitle(),
            ),

            SliverToBoxAdapter(
              child: _featuredProducts(),
            ),

            const SliverToBoxAdapter(
              child: SizedBox(height: 30),
            ),
          ],
        ),
      ),
    );
  }

  Widget _homeHeader() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(22, 18, 22, 15),
      child: Row(
        children: [
          Image.asset(
            'assets/products/marine logo.png',
            width: 65,
            height: 65,
            fit: BoxFit.contain,
            errorBuilder: (_, __, ___) {
              return const Icon(
                Icons.water_drop,
                size: 55,
                color: marineBlue,
              );
            },
          ),

          const SizedBox(width: 12),

          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'MARINE AQUA',
                  style: TextStyle(
                    fontSize: 21,
                    fontWeight: FontWeight.w800,
                    color: marineBlue,
                  ),
                ),
                Text(
                  'TECHNOLOGIES',
                  style: TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.w800,
                    color: marineBlue,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  'ఆక్వా సాగులో ప్రతి దశలో... మీకు తోడుగా',
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w700,
                    color: marineBlue,
                  ),
                ),
              ],
            ),
          ),

          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.notifications_none,
              size: 30,
              color: marineBlue,
            ),
          ),
        ],
      ),
    );
  }

  Widget _heroBanner() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(28),
        child: SizedBox(
          height: 205,
          width: double.infinity,
          child: Image.asset(
            'assets/products/hero_shrimp.jpg',
            fit: BoxFit.cover,
            errorBuilder: (_, __, ___) {
              return Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color(0xFF075678),
                      Color(0xFF31A6D5),
                    ],
                  ),
                ),
                child: const Center(
                  child: Text(
                    'ఆరోగ్యకరమైన చెరువులు\nబలమైన రొయ్యలు\nఅధిక లాభాలు',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _quickAccessTitle() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 28, 24, 15),
      child: Row(
        children: [
          const Expanded(
            child: Text(
              'ఆక్వా సమాచారం',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w800,
                color: marineBlue,
              ),
            ),
          ),
          Icon(
            Icons.arrow_forward,
            color: marineBlue,
            size: 30,
          ),
        ],
      ),
    );
  }

  Widget _quickAccessCards() {
    return SizedBox(
      height: 175,
      child: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        scrollDirection: Axis.horizontal,
        children: [
          _quickCard(
            'assets/products/shrimp_guide.png',
            'రొయ్యల\nసాగు గైడ్',
          ),

          const SizedBox(width: 14),

          _quickCard(
            'assets/products/biomass_calculator.png',
            'బయోమాస్\nకాలిక్యులేటర్',
          ),

          const SizedBox(width: 14),

          _quickCard(
            'assets/products/shrimp_diseases.png',
            'రొయ్యల\nవ్యాధులు',
          ),
        ],
      ),
    );
  }

  Widget _quickCard(String image, String title) {
    return Container(
      width: 185,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(25),
        child: Image.asset(
          image,
          fit: BoxFit.cover,
          errorBuilder: (_, __, ___) {
            return Container(
              color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.image_not_supported_outlined,
                    size: 48,
                    color: Colors.grey,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    title,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: marineBlue,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _waterParameters() {
    return Container(
      margin: const EdgeInsets.fromLTRB(20, 28, 20, 10),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: const Color(0xFFE8F7FC),
        borderRadius: BorderRadius.circular(28),
        border: Border.all(
          color: const Color(0xFFB7E4F2),
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
                    fontSize: 22,
                    fontWeight: FontWeight.w800,
                    color: marineBlue,
                  ),
                ),
              ),
              Icon(
                Icons.edit_outlined,
                color: marineBlue,
              ),
            ],
          ),

          const SizedBox(height: 18),

          Row(
            children: [
              _parameter(
                Icons.science_outlined,
                'pH',
                '7.8',
                '6.5 - 8.5',
              ),
              _parameter(
                Icons.water,
                'Salinity',
                '18',
                'ppt',
              ),
              _parameter(
                Icons.air,
                'DO',
                '5.6',
                'mg/L',
              ),
              _parameter(
                Icons.science,
                'Alkalinity',
                '140',
                'ppm',
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _parameter(
    IconData icon,
    String name,
    String value,
    String unit,
  ) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 4),
        padding: const EdgeInsets.symmetric(
          vertical: 14,
          horizontal: 5,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          children: [
            Icon(
              icon,
              color: const Color(0xFF1796BC),
              size: 28,
            ),

            const SizedBox(height: 7),

            Text(
              name,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w700,
              ),
            ),

            const SizedBox(height: 5),

            Text(
              value,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w800,
                color: marineBlue,
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
          ],
        ),
      ),
    );
  }

  Widget _productsTitle() {
    return const Padding(
      padding: EdgeInsets.fromLTRB(24, 28, 24, 14),
      child: Text(
        'Featured Products',
        style: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.w800,
          color: marineBlue,
        ),
      ),
    );
  }

  Widget _featuredProducts() {
    return SizedBox(
      height: 185,
      child: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        scrollDirection: Axis.horizontal,
        children: const [
          ProductMiniCard(
            image: 'assets/products/marine 6g.png',
            name: 'Marine 6G',
          ),
          ProductMiniCard(
            image: 'assets/products/marine protab.png',
            name: 'Marine ProTab',
          ),
          ProductMiniCard(
            image: 'assets/products/marine volt-x.png',
            name: 'Marine Volt-X',
          ),
          ProductMiniCard(
            image: 'assets/products/oxytab plus.png',
            name: 'OXYTAB+',
          ),
        ],
      ),
    );
  }
}

/* ============================================================
   PRODUCT MINI CARD
============================================================ */

class ProductMiniCard extends StatelessWidget {
  final String image;
  final String name;

  const ProductMiniCard({
    super.key,
    required this.image,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 145,
      margin: const EdgeInsets.only(right: 14),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
          ),
        ],
      ),
      child: Column(
        children: [
          Expanded(
            child: Image.asset(
              image,
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
          const SizedBox(height: 8),
          Text(
            name,
            textAlign: TextAlign.center,
            maxLines: 2,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: marineBlue,
              fontSize: 13,
            ),
          ),
        ],
      ),
    );
  }
}

/* ============================================================
   PRODUCTS PAGE
============================================================ */

class ProductsPage extends StatelessWidget {
  const ProductsPage({super.key});

  static const List<Map<String, String>> products = [
    {
      'name': 'Bio Sludge',
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
      'name': 'Marine Vibrio Shield',
      'image': 'assets/products/Marine vibrio shield.png',
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
      'name': 'Marine 6G',
      'image': 'assets/products/marine 6g.png',
    },
    {
      'name': 'Marine ProTab',
      'image': 'assets/products/marine protab.png',
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
      'name': 'Nutrimin',
      'image': 'assets/products/nutrimin.png',
    },
    {
      'name': 'OXYTAB+',
      'image': 'assets/products/oxytab plus.png',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4FBFE),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF4FBFE),
        elevation: 0,
        title: const Text(
          'Marine Products',
          style: TextStyle(
            color: marineBlue,
            fontWeight: FontWeight.w800,
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
          childAspectRatio: 0.78,
        ),
        itemBuilder: (context, index) {
          final product = products[index];

          return Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(24),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.04),
                  blurRadius: 10,
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
                        Icons.image_not_supported_outlined,
                        size: 55,
                        color: Colors.grey,
                      );
                    },
                  ),
                ),

                const SizedBox(height: 10),

                Text(
                  product['name']!,
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w800,
                    color: marineBlue,
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

/* ============================================================
   SUPPORT PAGE
============================================================ */

class SupportPage extends StatelessWidget {
  const SupportPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4FBFE),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF4FBFE),
        elevation: 0,
        title: const Text(
          'Support',
          style: TextStyle(
            color: marineBlue,
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(22),
        children: [
          Container(
            padding: const EdgeInsets.all(25),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(28),
            ),
            child: Column(
              children: [
                const Icon(
                  Icons.support_agent,
                  size: 75,
                  color: marineBlue,
                ),

                const SizedBox(height: 15),

                const Text(
                  'Marine Aqua Technologies',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.w800,
                    color: marineBlue,
                  ),
                ),

                const SizedBox(height: 10),

                const Text(
                  'ఆక్వా సాగులో ప్రతి దశలో... మీకు తోడుగా',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15,
                    color: marineBlue,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 20),

          _supportTile(
            Icons.phone,
            'Call Support',
            'Talk to our technical team',
          ),

          _supportTile(
            Icons.chat,
            'WhatsApp Support',
            'Chat with our support team',
          ),

          _supportTile(
            Icons.location_on,
            'Technical Team',
            'Connect with your local officer',
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
      margin: const EdgeInsets.only(bottom: 14),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(13),
            decoration: BoxDecoration(
              color: marineLight,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Icon(
              icon,
              color: marineBlue,
              size: 28,
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
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: marineBlue,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: const TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),

          const Icon(
            Icons.arrow_forward_ios,
            size: 17,
            color: marineBlue,
          ),
        ],
      ),
    );
  }
}
