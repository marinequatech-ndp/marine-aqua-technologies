import 'package:flutter/material.dart';

void main() {
  runApp(const LoginGate());
}

// ============================================================
// COLORS
// ============================================================

const Color marineBlue = Color(0xFF005B96);
const Color marineCyan = Color(0xFF18A9D1);
const Color darkText = Color(0xFF123B5D);
const Color backgroundColor = Color(0xFFF4FAFC);

// ============================================================
// LOGIN GATE
// ============================================================

class LoginGate extends StatefulWidget {
  const LoginGate({super.key});

  @override
  State<LoginGate> createState() => _LoginGateState();
}

class _LoginGateState extends State<LoginGate> {
  bool otpScreen = false;

  void openOtp() {
    setState(() {
      otpScreen = true;
    });
  }

  void backToLogin() {
    setState(() {
      otpScreen = false;
    });
  }

  void loginSuccess() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (_) => const MarineAquaApp(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (otpScreen) {
      return OtpPage(
        onVerified: loginSuccess,
        onBack: backToLogin,
      );
    }

    return LoginPage(
      onOtpSent: openOtp,
    );
  }
}

// ============================================================
// LOGIN PAGE
// ============================================================

class LoginPage extends StatefulWidget {
  final VoidCallback onOtpSent;

  const LoginPage({
    super.key,
    required this.onOtpSent,
  });

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController mobileController = TextEditingController();

  @override
  void dispose() {
    mobileController.dispose();
    super.dispose();
  }

  void sendOtp() {
    final mobile = mobileController.text.trim();

    if (mobile.length != 10) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please enter a valid 10-digit mobile number'),
        ),
      );
      return;
    }

    widget.onOtpSent();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 28),
            child: Column(
              children: [
                const SizedBox(height: 35),

                // LOGO AREA
                Container(
                  width: 105,
                  height: 105,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(28),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.06),
                        blurRadius: 15,
                        offset: const Offset(0, 6),
                      ),
                    ],
                  ),
                  child: const Icon(
                    Icons.water_drop,
                    size: 65,
                    color: marineCyan,
                  ),
                ),

                const SizedBox(height: 22),

                const Text(
                  'MARINE',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w700,
                    color: marineCyan,
                    letterSpacing: 1,
                  ),
                ),

                const Text(
                  'AQUA TECHNOLOGIES',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: darkText,
                    letterSpacing: 1,
                  ),
                ),

                const SizedBox(height: 8),

                const Text(
                  'Smart Aquaculture. Better Results.',
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.grey,
                  ),
                ),

                const SizedBox(height: 55),

                // LOGIN CARD
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(25),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(25),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: 20,
                        offset: const Offset(0, 8),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Login',
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: darkText,
                        ),
                      ),

                      const SizedBox(height: 8),

                      const Text(
                        'Enter your mobile number to continue',
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.grey,
                        ),
                      ),

                      const SizedBox(height: 25),

                      TextField(
                        controller: mobileController,
                        keyboardType: TextInputType.phone,
                        maxLength: 10,
                        decoration: InputDecoration(
                          counterText: '',
                          prefixText: '+91  ',
                          prefixStyle: const TextStyle(
                            color: darkText,
                            fontWeight: FontWeight.w600,
                          ),
                          prefixIcon: const Icon(
                            Icons.phone_outlined,
                            color: marineBlue,
                          ),
                          hintText: 'Mobile Number',
                          filled: true,
                          fillColor: backgroundColor,
                          contentPadding: const EdgeInsets.symmetric(
                            vertical: 18,
                            horizontal: 15,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: BorderSide.none,
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
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                          ),
                          child: const Text(
                            'SEND OTP',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 0.5,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 30),

                const Text(
                  'By continuing, you agree to use Marine Aqua Technologies services.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                ),

                const SizedBox(height: 25),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// ============================================================
// OTP PAGE
// ============================================================

class OtpPage extends StatefulWidget {
  final VoidCallback onVerified;
  final VoidCallback onBack;

  const OtpPage({
    super.key,
    required this.onVerified,
    required this.onBack,
  });

  @override
  State<OtpPage> createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  final TextEditingController otpController = TextEditingController();

  @override
  void dispose() {
    otpController.dispose();
    super.dispose();
  }

  void verifyOtp() {
    final otp = otpController.text.trim();

    // TEST OTP
    if (otp == '123456') {
      widget.onVerified();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Invalid OTP. For testing use 123456'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 28),
            child: Column(
              children: [
                const SizedBox(height: 45),

                Container(
                  width: 105,
                  height: 105,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.06),
                        blurRadius: 18,
                        offset: const Offset(0, 7),
                      ),
                    ],
                  ),
                  child: const Icon(
                    Icons.verified_user_outlined,
                    size: 60,
                    color: marineBlue,
                  ),
                ),

                const SizedBox(height: 30),

                const Text(
                  'Verify OTP',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: darkText,
                  ),
                ),

                const SizedBox(height: 10),

                const Text(
                  'Enter the 6-digit OTP sent to your mobile number',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.grey,
                  ),
                ),

                const SizedBox(height: 35),

                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(25),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(25),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: 20,
                        offset: const Offset(0, 8),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      TextField(
                        controller: otpController,
                        keyboardType: TextInputType.number,
                        maxLength: 6,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 10,
                          color: darkText,
                        ),
                        decoration: InputDecoration(
                          counterText: '',
                          hintText: '------',
                          hintStyle: const TextStyle(
                            color: Colors.grey,
                            letterSpacing: 8,
                          ),
                          filled: true,
                          fillColor: backgroundColor,
                          contentPadding: const EdgeInsets.symmetric(
                            vertical: 18,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),

                      const SizedBox(height: 22),

                      SizedBox(
                        width: double.infinity,
                        height: 55,
                        child: ElevatedButton(
                          onPressed: verifyOtp,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: marineBlue,
                            foregroundColor: Colors.white,
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                          ),
                          child: const Text(
                            'VERIFY OTP',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 10),

                      TextButton(
                        onPressed: widget.onBack,
                        child: const Text(
                          'Change Mobile Number',
                          style: TextStyle(
                            color: marineBlue,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 25),

                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 18,
                    vertical: 12,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFFE5F5FB),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Text(
                    'Testing OTP: 123456',
                    style: TextStyle(
                      color: marineBlue,
                      fontWeight: FontWeight.w600,
                    ),
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
// MAIN APP
// ============================================================

class MarineAquaApp extends StatefulWidget {
  const MarineAquaApp({super.key});

  @override
  State<MarineAquaApp> createState() => _MarineAquaAppState();
}

class _MarineAquaAppState extends State<MarineAquaApp> {
  int selectedIndex = 0;

  final List<Widget> pages = const [
    HomePage(),
    ProductsPage(),
    SupportPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Marine Aqua Technologies',
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: backgroundColor,
        colorScheme: ColorScheme.fromSeed(
          seedColor: marineBlue,
        ),
      ),
      home: Scaffold(
        body: pages[selectedIndex],
        bottomNavigationBar: NavigationBar(
          selectedIndex: selectedIndex,
          backgroundColor: Colors.white,
          indicatorColor: const Color(0xFFD9F2FA),
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
      child: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(18, 10, 18, 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // HEADER
            Row(
              children: [
                Container(
                  width: 72,
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Icon(
                    Icons.water_drop,
                    size: 42,
                    color: marineCyan,
                  ),
                ),

                const SizedBox(width: 10),

                const Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'MARINE',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: marineCyan,
                        ),
                      ),
                      Text(
                        'TECHNOLOGIES',
                        style: TextStyle(
                          fontSize: 19,
                          fontWeight: FontWeight.bold,
                          color: darkText,
                        ),
                      ),
                      Text(
                        'Smart Aquaculture. Better Results.',
                        style: TextStyle(
                          fontSize: 10,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            const SizedBox(height: 25),

            // HERO
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(30),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [
                    Color(0xFF075B96),
                    Color(0xFF19A9D0),
                  ],
                ),
                borderRadius: BorderRadius.circular(32),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Healthy Ponds',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 31,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Stronger Shrimp',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 31,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Higher Profits',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 31,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 22),
                  Text(
                    'Complete Aquaculture Solutions\nfor a Better Tomorrow',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 17,
                      height: 1.4,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 28),

            const Text(
              'Aquaculture Solutions',
              style: TextStyle(
                fontSize: 27,
                fontWeight: FontWeight.bold,
                color: darkText,
              ),
            ),

            const SizedBox(height: 18),

            Row(
              children: [
                Expanded(
                  child: SolutionCard(
                    icon: Icons.lightbulb_outline,
                    title: 'Tip Of The Day',
                    description:
                        'Maintain proper dissolved oxygen levels for better pond conditions.',
                    color: const Color(0xFFDDF7EA),
                  ),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: SolutionCard(
                    icon: Icons.menu_book_outlined,
                    title: 'Shrimp Culture Guide',
                    description:
                        'Learn pond setup, management and culture practices.',
                    color: const Color(0xFFDDECFB),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 14),

            Row(
              children: [
                Expanded(
                  child: SolutionCard(
                    icon: Icons.calculate_outlined,
                    title: 'Biomass Calculator',
                    description:
                        'Calculate estimated shrimp biomass for pond management.',
                    color: const Color(0xFFDDF7EA),
                  ),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: SolutionCard(
                    icon: Icons.health_and_safety_outlined,
                    title: 'Shrimp Diseases',
                    description:
                        'Understand common shrimp health and disease concerns.',
                    color: const Color(0xFFFFDFDF),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// ============================================================
// SOLUTION CARD
// ============================================================

class SolutionCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;
  final Color color;

  const SolutionCard({
    super.key,
    required this.icon,
    required this.title,
    required this.description,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 235,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            icon,
            size: 42,
            color: marineBlue,
          ),
          const SizedBox(height: 16),
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: darkText,
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: Text(
              description,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.grey,
                height: 1.4,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ============================================================
// PRODUCT MODEL
// ============================================================

class Product {
  final String name;
  final String category;
  final String image;
  final String description;
  final String composition;
  final String benefits;
  final String dosage;
  final String application;

  const Product({
    required this.name,
    required this.category,
    required this.image,
    required this.description,
    required this.composition,
    required this.benefits,
    required this.dosage,
    required this.application,
  });
}

// ============================================================
// PRODUCTS
// ============================================================

const List<Product> products = [
  Product(
    name: 'Marine 6G',
    category: 'Liquid Minerals',
    image: 'assets/marine 6g.png',
    description:
        'Liquid mineral support for shrimp mineral balance, moulting and shell formation.',
    composition: 'Liquid mineral blend.',
    benefits:
        'Supports mineral balance, moulting, shell formation and overall shrimp condition.',
    dosage: 'Use as recommended by your aqua consultant.',
    application:
        'Apply according to pond condition, salinity and mineral requirement.',
  ),

  Product(
    name: 'Marine Volt-X',
    category: 'Growth Support',
    image: 'assets/volt-x.png',
    description:
        'Growth support product designed to support shrimp feed utilization and growth.',
    composition: 'Essential amino acids and beta glucan immune supporters.',
    benefits:
        'Supports feed utilization, growth and overall shrimp condition.',
    dosage: '5 ml per 1 kg feed.',
    application: 'Mix thoroughly with feed and provide as recommended.',
  ),

  Product(
    name: 'Bio Sludge-X',
    category: 'Pond Management',
    image: 'assets/bio sludge -x.png',
    description:
        'Nitrifying bacterial complex and enzyme activation support for pond management.',
    composition: 'Nitrifying bacterial complex and enzyme activation system.',
    benefits:
        'Supports organic waste management and beneficial microbial activity.',
    dosage: 'Use as recommended by your aqua consultant.',
    application: 'Apply according to pond condition and organic load.',
  ),

  Product(
    name: 'Marine ProTab',
    category: 'Probiotic Tablets',
    image: 'assets/protab.png',
    description:
        'Probiotic tablet support for pond microbial balance and shrimp gut condition.',
    composition: 'Mannan Oligosaccharides and Beta Glucans.',
    benefits:
        'Supports beneficial microbial balance and shrimp health.',
    dosage: '500 g per acre after recommended treatment interval.',
    application: 'Apply according to pond management program.',
  ),

  Product(
    name: 'Marine Vibrio Shield',
    category: 'Vibrio Control',
    image: 'assets/vibrio shield.png',
    description:
        'Pond management solution designed for Vibrio control support.',
    composition: 'Specialized pond management formulation.',
    benefits:
        'Supports pond microbial management and Vibrio control.',
    dosage: '1 L per acre.',
    application:
        'Apply uniformly across the pond according to the recommended program.',
  ),

  Product(
    name: 'Marine White Shield',
    category: 'Shrimp Health',
    image: 'assets/white shield.png',
    description:
        'Shrimp health support product for pond management.',
    composition: 'Specialized aquaculture formulation.',
    benefits:
        'Supports shrimp health and pond management practices.',
    dosage: 'Use as recommended by your aqua consultant.',
    application: 'Apply according to pond condition.',
  ),

  Product(
    name: 'OxyTab Plus',
    category: 'Oxygen Support',
    image: 'assets/oxytab.png',
    description:
        'Oxygen releasing tablet for aquaculture pond oxygen management.',
    composition: 'Sodium percarbonate based oxygen releasing formulation.',
    benefits:
        'Supports dissolved oxygen availability in pond water.',
    dosage: 'Use according to pond oxygen requirement.',
    application: 'Apply uniformly in the pond as recommended.',
  ),

  Product(
    name: 'Free Moult',
    category: 'Moulting Support',
    image: 'assets/free moult.png',
    description:
        'Advanced mineral support for better shrimp moulting.',
    composition: 'Aquaculture mineral and moulting support formulation.',
    benefits:
        'Supports healthy moulting and shell development.',
    dosage: 'Use as recommended by your aqua consultant.',
    application: 'Apply according to shrimp stage and pond condition.',
  ),

  Product(
    name: 'Red Thunder',
    category: 'Pond Support',
    image: 'assets/red thunder.png',
    description:
        'Aquaculture pond support formulation for shrimp culture management.',
    composition: 'Specialized aquaculture formulation.',
    benefits:
        'Supports pond management and shrimp culture performance.',
    dosage: 'Use as recommended by your aqua consultant.',
    application: 'Apply according to pond requirement.',
  ),

  Product(
    name: 'Zeoneem',
    category: 'Pond Management',
    image: 'assets/zeoneem.png',
    description:
        'Granular pond management product for aquaculture applications.',
    composition: 'Granular aquaculture pond management formulation.',
    benefits:
        'Supports pond bottom and overall pond management.',
    dosage: 'Use as recommended by your aqua consultant.',
    application: 'Broadcast uniformly across the pond.',
  ),

  Product(
    name: 'Starmin',
    category: 'Mineral Support',
    image: 'assets/starmin.png',
    description:
        'Mineral support product for shrimp culture.',
    composition: 'Aquaculture mineral blend.',
    benefits:
        'Supports mineral availability and shrimp growth conditions.',
    dosage: 'Use as recommended by your aqua consultant.',
    application: 'Apply according to pond mineral requirement.',
  ),

  Product(
    name: 'Nutrimin',
    category: 'Chelated Minerals',
    image: 'assets/nutrimin.png',
    description:
        'Chelated mineral support for shrimp pond management.',
    composition: 'Chelated mineral formulation.',
    benefits:
        'Supports mineral balance and shrimp physiological requirements.',
    dosage: 'Use as recommended by your aqua consultant.',
    application: 'Apply according to pond condition and requirement.',
  ),

  Product(
    name: 'Bio Soil',
    category: 'Soil Fertility',
    image: 'assets/bio soil.png',
    description:
        'Soil fertility enhancer for aquaculture pond bottom management.',
    composition: 'Soil management formulation.',
    benefits:
        'Supports pond soil condition and bottom management.',
    dosage: 'Use as recommended by your aqua consultant.',
    application: 'Apply uniformly according to soil condition.',
  ),

  Product(
    name: 'Chlorides',
    category: 'Mineral Support',
    image: 'assets/chlorides.png',
    description:
        'Chloride mineral support for aquaculture pond mineral management.',
    composition: 'Chloride mineral formulation.',
    benefits:
        'Supports chloride availability and mineral balance.',
    dosage: 'Use according to pond mineral requirement.',
    application: 'Apply based on water parameters and consultant recommendation.',
  ),

  Product(
    name: 'Yucca Pro',
    category: 'Toxin Binder',
    image: 'assets/yucca pro.png',
    description:
        'Toxin binder support product for aquaculture pond management.',
    composition: 'Yucca-based pond management formulation.',
    benefits:
        'Supports management of undesirable compounds in pond conditions.',
    dosage: 'Use as recommended by your aqua consultant.',
    application: 'Apply according to pond condition.',
  ),

  Product(
    name: 'Hi-Soft',
    category: 'Pond Support',
    image: 'assets/hi-soft.png',
    description:
        'Aquaculture pond support product for shrimp farming management.',
    composition: 'Aquaculture support formulation.',
    benefits:
        'Supports pond condition and shrimp culture management.',
    dosage: 'Use as recommended by your aqua consultant.',
    application: 'Apply according to pond requirement.',
  ),
];

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
          const SliverPadding(
            padding: EdgeInsets.fromLTRB(22, 25, 22, 5),
            sliver: SliverToBoxAdapter(
              child: Text(
                'Our Products',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: darkText,
                ),
              ),
            ),
          ),

          const SliverPadding(
            padding: EdgeInsets.fromLTRB(22, 0, 22, 20),
            sliver: SliverToBoxAdapter(
              child: Text(
                'Marine Aqua Technologies',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
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
                    product: product,
                  );
                },
                childCount: products.length,
              ),
              gridDelegate:
                  const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 14,
                mainAxisSpacing: 14,
                childAspectRatio: 0.70,
              ),
            ),
          ),

          const SliverPadding(
            padding: EdgeInsets.only(bottom: 25),
          ),
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
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(18),
                ),
                child: Image.asset(
                  product.image,
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) {
                    return const Icon(
                      Icons.inventory_2_outlined,
                      size: 70,
                      color: marineCyan,
                    );
                  },
                ),
              ),
            ),

            const SizedBox(height: 7),

            Text(
              product.name,
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
                color: darkText,
              ),
            ),

            const SizedBox(height: 8),

            SizedBox(
              width: double.infinity,
              height: 42,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => ProductDetailsPage(
                        product: product,
                      ),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFE4F6FB),
                  foregroundColor: marineBlue,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(22),
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
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: backgroundColor,
        elevation: 0,
        foregroundColor: darkText,
        title: Text(product.name),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(20, 10, 20, 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // PRODUCT IMAGE
            Container(
              width: double.infinity,
              height: 330,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Image.asset(
                product.image,
                fit: BoxFit.contain,
                errorBuilder: (context, error, stackTrace) {
                  return const Icon(
                    Icons.inventory_2_outlined,
                    size: 100,
                    color: marineCyan,
                  );
                },
              ),
            ),

            const SizedBox(height: 25),

            Text(
              product.name,
              style: const TextStyle(
                fontSize: 34,
                fontWeight: FontWeight.bold,
                color: darkText,
              ),
            ),

            const SizedBox(height: 8),

            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 18,
                vertical: 10,
              ),
              decoration: BoxDecoration(
                color: const Color(0xFFE1F5FB),
                borderRadius: BorderRadius.circular(30),
              ),
              child: Text(
                product.category,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: marineBlue,
                ),
              ),
            ),

            const SizedBox(height: 22),

            DetailCard(
              icon: Icons.description_outlined,
              title: 'Description',
              text: product.description,
            ),

            DetailCard(
              icon: Icons.science_outlined,
              title: 'Composition',
              text: product.composition,
            ),

            DetailCard(
              icon: Icons.check_circle_outline,
              title: 'Benefits',
              text: product.benefits,
            ),

            DetailCard(
              icon: Icons.medical_services_outlined,
              title: 'Dosage',
              text: product.dosage,
            ),

            DetailCard(
              icon: Icons.water_drop_outlined,
              title: 'Application',
              text: product.application,
            ),
          ],
        ),
      ),
    );
  }
}

// ============================================================
// DETAIL CARD
// ============================================================

class DetailCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String text;

  const DetailCard({
    super.key,
    required this.icon,
    required this.title,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                icon,
                size: 30,
                color: marineBlue,
              ),
              const SizedBox(width: 12),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: marineBlue,
                ),
              ),
            ],
          ),
          const SizedBox(height: 15),
          Text(
            text,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.grey,
              height: 1.5,
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
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(22),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),

            const Text(
              'Support',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: darkText,
              ),
            ),

            const SizedBox(height: 8),

            const Text(
              'Marine Aqua Technologies',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),

            const SizedBox(height: 30),

            SupportCard(
              icon: Icons.phone_outlined,
              title: 'Call Support',
              subtitle: 'Contact our support team',
            ),

            SupportCard(
              icon: Icons.chat_outlined,
              title: 'WhatsApp Support',
              subtitle: 'Chat with our support team',
            ),

            SupportCard(
              icon: Icons.email_outlined,
              title: 'Email Support',
              subtitle: 'Send us your query',
            ),

            SupportCard(
              icon: Icons.help_outline,
              title: 'Technical Assistance',
              subtitle: 'Get aquaculture technical guidance',
            ),
          ],
        ),
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

  const SupportCard({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
      ),
      child: Row(
        children: [
          Container(
            width: 55,
            height: 55,
            decoration: const BoxDecoration(
              color: Color(0xFFE2F5FB),
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.support_agent,
              color: marineBlue,
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
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: darkText,
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
            size: 17,
            color: Colors.grey,
          ),
        ],
      ),
    );
  }
}

// ============================================================
// PROFILE PAGE
// ============================================================

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(22),
        child: Column(
          children: [
            const SizedBox(height: 35),

            Container(
              width: 100,
              height: 100,
              decoration: const BoxDecoration(
                color: Color(0xFFE0F4FA),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.person_outline,
                size: 55,
                color: marineBlue,
              ),
            ),

            const SizedBox(height: 20),

            const Text(
              'Profile',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: darkText,
              ),
            ),

            const SizedBox(height: 8),

            const Text(
              'Marine Aqua Technologies',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),

            const SizedBox(height: 35),

            ProfileOption(
              icon: Icons.settings_outlined,
              title: 'Settings',
            ),

            ProfileOption(
              icon: Icons.language_outlined,
              title: 'Language',
            ),

            ProfileOption(
              icon: Icons.info_outline,
              title: 'About',
            ),

            ProfileOption(
              icon: Icons.privacy_tip_outlined,
              title: 'Privacy Policy',
            ),

            ProfileOption(
              icon: Icons.logout,
              title: 'Logout',
            ),
          ],
        ),
      ),
    );
  }
}

// ============================================================
// PROFILE OPTION
// ============================================================

class ProfileOption extends StatelessWidget {
  final IconData icon;
  final String title;

  const ProfileOption({
    super.key,
    required this.icon,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 17,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Row(
        children: [
          Icon(
            icon,
            color: marineBlue,
            size: 25,
          ),

          const SizedBox(width: 16),

          Expanded(
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: darkText,
              ),
            ),
          ),

          const Icon(
            Icons.arrow_forward_ios,
            size: 16,
            color: Colors.grey,
          ),
        ],
      ),
    );
  }
}
