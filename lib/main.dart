import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
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
          seedColor: const Color(0xFF087EA4),
        ),
      ),
      home: const SplashScreen(),
    );
  }
}

/* ============================================================
   COLORS
============================================================ */

const Color marineBlue = Color(0xFF087EA4);
const Color darkBlue = Color(0xFF064E78);
const Color lightBackground = Color(0xFFF2FBFD);
const Color cardBlue = Color(0xFFE1F5FA);

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
          builder: (_) => const LoginScreen(),
        ),
      );
    });
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
              width: 125,
              height: 125,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                    color: marineBlue.withOpacity(.15),
                    blurRadius: 25,
                    spreadRadius: 3,
                  ),
                ],
              ),
              child: Image.asset(
                'assets/products/marine logo.png',
                fit: BoxFit.contain,
                errorBuilder: (_, __, ___) {
                  return const Icon(
                    Icons.water_drop,
                    size: 70,
                    color: marineBlue,
                  );
                },
              ),
            ),

            const SizedBox(height: 25),

            const Text(
              'MARINE AQUA',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w800,
                color: marineBlue,
              ),
            ),

            const Text(
              'TECHNOLOGIES',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w800,
                color: marineBlue,
              ),
            ),

            const SizedBox(height: 10),

            const Text(
              'Smart Aquaculture. Better Results.',
              style: TextStyle(
                fontSize: 15,
                color: Colors.black54,
              ),
            ),

            const SizedBox(height: 35),

            const CircularProgressIndicator(
              color: marineBlue,
            ),
          ],
        ),
      ),
    );
  }
}

/* ============================================================
   LOGIN SCREEN
============================================================ */

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController mobileController = TextEditingController();

  bool otpSent = false;

  void sendOtp() {
    if (mobileController.text.length != 10) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Enter a valid 10-digit mobile number'),
        ),
      );
      return;
    }

    setState(() {
      otpSent = true;
    });

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => OtpScreen(
          mobileNumber: mobileController.text,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightBackground,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            children: [
              const Spacer(),

              Container(
                width: 105,
                height: 105,
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(28),
                  boxShadow: [
                    BoxShadow(
                      color: marineBlue.withOpacity(.12),
                      blurRadius: 20,
                    ),
                  ],
                ),
                child: Image.asset(
                  'assets/products/marine logo.png',
                  fit: BoxFit.contain,
                  errorBuilder: (_, __, ___) {
                    return const Icon(
                      Icons.water_drop,
                      color: marineBlue,
                      size: 60,
                    );
                  },
                ),
              ),

              const SizedBox(height: 25),

              const Text(
                'MARINE AQUA',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: marineBlue,
                ),
              ),

              const Text(
                'TECHNOLOGIES',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: marineBlue,
                ),
              ),

              const SizedBox(height: 10),

              const Text(
                'Smart Aquaculture. Better Results.',
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.black54,
                ),
              ),

              const SizedBox(height: 45),

              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Login with Mobile',
                  style: TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.bold,
                    color: darkBlue,
                  ),
                ),
              ),

              const SizedBox(height: 10),

              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Enter your mobile number to continue',
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 14,
                  ),
                ),
              ),

              const SizedBox(height: 22),

              TextField(
                controller: mobileController,
                keyboardType: TextInputType.phone,
                maxLength: 10,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                ],
                decoration: InputDecoration(
                  counterText: '',
                  prefixText: '+91  ',
                  prefixStyle: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                  hintText: 'Mobile Number',
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide.none,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: const BorderSide(
                      color: marineBlue,
                      width: 2,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                  onPressed: sendOtp,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: marineBlue,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  child: const Text(
                    'GET OTP',
                    style: TextStyle(
                      fontSize: 17,
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
                  fontSize: 13,
                ),
              ),

              const Spacer(),

              const Text(
                '© Marine Aqua Technologies',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 12,
                ),
              ),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}

/* ============================================================
   OTP SCREEN
============================================================ */

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
  final TextEditingController otpController = TextEditingController();

  void verifyOtp() {
    if (otpController.text == '123456') {
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
      backgroundColor: lightBackground,
      appBar: AppBar(
        backgroundColor: lightBackground,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            children: [
              const SizedBox(height: 40),

              const Icon(
                Icons.verified_user_outlined,
                size: 80,
                color: marineBlue,
              ),

              const SizedBox(height: 25),

              const Text(
                'Verify OTP',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: darkBlue,
                ),
              ),

              const SizedBox(height: 10),

              Text(
                'OTP sent to +91 ${widget.mobileNumber}',
                style: const TextStyle(
                  color: Colors.black54,
                  fontSize: 14,
                ),
              ),

              const SizedBox(height: 35),

              TextField(
                controller: otpController,
                keyboardType: TextInputType.number,
                maxLength: 6,
                textAlign: TextAlign.center,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                ],
                style: const TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 8,
                ),
                decoration: InputDecoration(
                  counterText: '',
                  hintText: '••••••',
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide.none,
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
                      borderRadius: BorderRadius.circular(16),
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
                'For testing use OTP: 123456',
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

/* ============================================================
   MAIN NAVIGATION
============================================================ */

class MainNavigation extends StatefulWidget {
  const MainNavigation({super.key});

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int currentIndex = 0;

  final List<Widget> pages = const [
    HomeScreen(),
    ProductsScreen(),
    MyPondsScreen(),
    SupportScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: currentIndex,
        children: pages,
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: currentIndex,
        backgroundColor: Colors.white,
        indicatorColor: const Color(0xFFD7F4FA),
        onDestinationSelected: (index) {
          setState(() {
            currentIndex = index;
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
            icon: Icon(Icons.waves_outlined),
            selectedIcon: Icon(Icons.waves),
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

/* ============================================================
   HOME
============================================================ */

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(18, 15, 18, 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            /* HEADER */

            Row(
              children: [
                Container(
                  width: 58,
                  height: 58,
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
                      );
                    },
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
                          fontSize: 21,
                          fontWeight: FontWeight.bold,
                          color: marineBlue,
                        ),
                      ),
                      Text(
                        'TECHNOLOGIES',
                        style: TextStyle(
                          fontSize: 21,
                          fontWeight: FontWeight.bold,
                          color: marineBlue,
                        ),
                      ),
                      Text(
                        'Smart Aquaculture. Better Results.',
                        style: TextStyle(
                          fontSize: 10,
                          color: darkBlue,
                        ),
                      ),
                    ],
                  ),
                ),

                const Icon(
                  Icons.notifications_none,
                  size: 30,
                  color: marineBlue,
                ),

                const SizedBox(width: 8),

                const CircleAvatar(
                  radius: 22,
                  backgroundColor: Color(0xFFDDF3F8),
                  child: Icon(
                    Icons.person,
                    color: marineBlue,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),

            /* HERO */

            Container(
              height: 190,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                image: const DecorationImage(
                  image: AssetImage(
                    'assets/products/hero_shrimp.jpg',
                  ),
                  fit: BoxFit.cover,
                ),
              ),
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [
                      Colors.black.withOpacity(.70),
                      Colors.transparent,
                    ],
                  ),
                ),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Healthy Ponds\nStronger Shrimp\nHigher Profits',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        height: 1.05,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    SizedBox(height: 10),

                    Text(
                      'Complete Aquaculture Solutions\nfor a Better Tomorrow',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 13,
                      ),
                    ),

                    Spacer(),

                    DecoratedBox(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 10,
                        ),
                        child: Text(
                          'Explore Products  →',
                          style: TextStyle(
                            color: darkBlue,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 18),

            /* QUICK CARDS */

            Row(
              children: [
                Expanded(
                  child: QuickCard(
                    image: 'assets/products/card1.png',
                    title: 'రొయ్యల సాగు గైడ్',
                    text: 'రొయ్యల సాగులో ముఖ్యమైన సూచనలు తెలుసుకోండి.',
                  ),
                ),

                const SizedBox(width: 12),

                Expanded(
                  child: QuickCard(
                    image: 'assets/products/card2.png',
                    title: 'బయోమాస్ కాలిక్యులేటర్',
                    text: 'మీ చెరువులో అంచనా బయోమాస్‌ను సులభంగా తెలుసుకోండి.',
                  ),
                ),
              ],
            ),

            const SizedBox(height: 12),

            Row(
              children: [
                Expanded(
                  child: QuickCard(
                    image: 'assets/products/card3.png',
                    title: 'రొయ్యల వ్యాధులు',
                    text: 'సాధారణ రొయ్యల వ్యాధులను గుర్తించి నివారించండి.',
                  ),
                ),

                const SizedBox(width: 12),

                Expanded(
                  child: QuickCard(
                    image: 'assets/products/card4.png',
                    title: 'టిప్ ఆఫ్ ది డే',
                    text: 'ప్రతి రోజు ఆక్వా సాగుకు ఉపయోగపడే ముఖ్యమైన టిప్స్.',
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),

            /* DEALER */

            Container(
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: const Color(0xFFE3F5FC),
                borderRadius: BorderRadius.circular(22),
                border: Border.all(
                  color: const Color(0xFFB9E1ED),
                ),
              ),
              child: Row(
                children: [
                  Container(
                    width: 65,
                    height: 65,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: const Icon(
                      Icons.location_on,
                      color: Colors.red,
                      size: 38,
                    ),
                  ),

                  const SizedBox(width: 15),

                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Dealers Location',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: darkBlue,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          'Find our nearest dealers across India',
                          style: TextStyle(
                            color: Colors.black54,
                          ),
                        ),
                      ],
                    ),
                  ),

                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF168CE2),
                      foregroundColor: Colors.white,
                    ),
                    child: const Text('Find Nearby'),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 25),

            SectionTitle(
              title: 'Our Aquaculture Solutions',
              subtitle: 'Trusted Products for Healthy Shrimp & Better Yields',
              onTap: () {},
            ),

            const SizedBox(height: 12),

            SizedBox(
              height: 190,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: products.length,
                separatorBuilder: (_, __) => const SizedBox(width: 12),
                itemBuilder: (context, index) {
                  final product = products[index];

                  return ProductMiniCard(
                    product: product,
                  );
                },
              ),
            ),

            const SizedBox(height: 25),

            SectionTitle(
              title: 'Success Stories',
              subtitle: 'Real farmers. Real results.',
              onTap: () {},
            ),

            const SizedBox(height: 12),

            Row(
              children: [
                Expanded(
                  child: StoryCard(
                    image: 'assets/products/hero_shrimp.jpg',
                    title: '40% Faster Growth',
                    location: 'West Godavari, AP',
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: StoryCard(
                    image: 'assets/products/shrimp_guide.png',
                    title: 'Better Survival Rate',
                    location: 'Krishna, AP',
                  ),
                ),
              ],
            ),

            const SizedBox(height: 25),

            /* WATER QUALITY */

            Container(
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: const Color(0xFFDDF8E8),
                borderRadius: BorderRadius.circular(24),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    '🧪  Water Quality Tools',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: darkBlue,
                    ),
                  ),

                  const SizedBox(height: 5),

                  const Text(
                    'Calculate, monitor and maintain ideal water parameters',
                    style: TextStyle(
                      color: Colors.black54,
                    ),
                  ),

                  const SizedBox(height: 15),

                  Row(
                    children: const [
                      WaterTool(
                        icon: Icons.water_drop,
                        title: 'pH',
                        subtitle: 'Calculator',
                      ),
                      WaterTool(
                        icon: Icons.thermostat,
                        title: 'Temperature',
                        subtitle: 'Guide',
                      ),
                      WaterTool(
                        icon: Icons.science,
                        title: 'Salinity',
                        subtitle: 'Calculator',
                      ),
                      WaterTool(
                        icon: Icons.bubble_chart,
                        title: 'DO',
                        subtitle: 'Calculator',
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 25),

            SectionTitle(
              title: 'Shrimp Growth Guide',
              subtitle: 'Step-by-step guidance from stocking to harvest',
              onTap: () {},
            ),

            const SizedBox(height: 12),

            Row(
              children: [
                Expanded(
                  child: GuideCard(
                    image: 'assets/products/shrimp_guide.png',
                    title: 'PL Selection',
                    subtitle: 'Choose healthy PL',
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: GuideCard(
                    image: 'assets/products/hero_shrimp.jpg',
                    title: 'Pond Preparation',
                    subtitle: 'Get your pond ready',
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

/* ============================================================
   PRODUCT MODEL
============================================================ */

class Product {
  final String name;
  final String image;

  const Product({
    required this.name,
    required this.image,
  });
}

const List<Product> products = [
  Product(
    name: 'Marine 6G',
    image: 'assets/products/marine 6g.png',
  ),
  Product(
    name: 'Marine ProTab',
    image: 'assets/products/marine protab.png',
  ),
  Product(
    name: 'OXYTAB+',
    image: 'assets/products/oxytab plus.png',
  ),
  Product(
    name: 'Marine Vibrio Shield',
    image: 'assets/products/Marine vibrio shield.png',
  ),
  Product(
    name: 'Marine Volt-X',
    image: 'assets/products/marine volt-x.png',
  ),
  Product(
    name: 'Bio Sludge-X',
    image: 'assets/products/Bio sludge.png',
  ),
  Product(
    name: 'Bio Soil',
    image: 'assets/products/Bio soil.png',
  ),
  Product(
    name: 'Free Moult',
    image: 'assets/products/Free moult.png',
  ),
  Product(
    name: 'Hi-Soft',
    image: 'assets/products/Hi-Soft.png',
  ),
  Product(
    name: 'Red Thunder',
    image: 'assets/products/Red thunder.png',
  ),
  Product(
    name: 'Starmin',
    image: 'assets/products/Starmin.png',
  ),
  Product(
    name: 'Yucca Pro',
    image: 'assets/products/Yucca Pro.png',
  ),
  Product(
    name: 'Zeoneem',
    image: 'assets/products/Zeoneem.png',
  ),
  Product(
    name: 'Nutrimin',
    image: 'assets/products/nutrimin.png',
  ),
  Product(
    name: 'Marine White Shield',
    image: 'assets/products/marine white shield.png',
  ),
];

/* ============================================================
   PRODUCTS SCREEN
============================================================ */

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CustomScrollView(
        slivers: [
          const SliverAppBar(
            automaticallyImplyLeading: false,
            backgroundColor: lightBackground,
            floating: true,
            title: Text(
              'Our Products',
              style: TextStyle(
                color: darkBlue,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          SliverPadding(
            padding: const EdgeInsets.all(18),
            sliver: SliverGrid(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return ProductCard(
                    product: products[index],
                  );
                },
                childCount: products.length,
              ),
              gridDelegate:
                  const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 14,
                mainAxisSpacing: 14,
                childAspectRatio: .76,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/* ============================================================
   PRODUCT CARD
============================================================ */

class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => ProductDetailsScreen(
              product: product,
            ),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(25),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(.05),
              blurRadius: 10,
            ),
          ],
        ),
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Image.asset(
                  product.image,
                  fit: BoxFit.contain,
                  errorBuilder: (_, __, ___) {
                    return const Icon(
                      Icons.image_not_supported_outlined,
                      size: 60,
                      color: marineBlue,
                    );
                  },
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.fromLTRB(8, 0, 8, 18),
              child: Text(
                product.name,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  color: marineBlue,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/* ============================================================
   PRODUCT DETAILS
============================================================ */

class ProductDetailsScreen extends StatelessWidget {
  final Product product;

  const ProductDetailsScreen({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightBackground,
      appBar: AppBar(
        title: Text(product.name),
        backgroundColor: lightBackground,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Container(
              height: 330,
              width: double.infinity,
              padding: const EdgeInsets.all(30),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25),
              ),
              child: Image.asset(
                product.image,
                fit: BoxFit.contain,
                errorBuilder: (_, __, ___) {
                  return const Icon(
                    Icons.image_not_supported,
                    size: 80,
                    color: marineBlue,
                  );
                },
              ),
            ),

            const SizedBox(height: 25),

            Text(
              product.name,
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: darkBlue,
              ),
            ),

            const SizedBox(height: 25),

            InfoBox(
              title: 'Benefits',
              text:
                  'Aquaculture support solution designed for better pond management, shrimp health and farm performance.',
            ),

            const SizedBox(height: 15),

            InfoBox(
              title: 'Composition',
              text:
                  'Product composition and technical information can be displayed here.',
            ),

            const SizedBox(height: 15),

            InfoBox(
              title: 'Dosage',
              text:
                  'Refer to the product label and technical recommendation for the appropriate dosage.',
            ),
          ],
        ),
      ),
    );
  }
}

/* ============================================================
   MY PONDS
============================================================ */

class MyPondsScreen extends StatelessWidget {
  const MyPondsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'My Ponds',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: darkBlue,
              ),
            ),

            const SizedBox(height: 20),

            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(25),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25),
              ),
              child: const Column(
                children: [
                  Icon(
                    Icons.water,
                    size: 65,
                    color: marineBlue,
                  ),

                  SizedBox(height: 15),

                  Text(
                    'No pond added yet',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: darkBlue,
                    ),
                  ),

                  SizedBox(height: 8),

                  Text(
                    'Add your pond details to monitor your aquaculture activities.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black54,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            SizedBox(
              width: double.infinity,
              height: 52,
              child: ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.add),
                label: const Text('ADD POND'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: marineBlue,
                  foregroundColor: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/* ============================================================
   SUPPORT
============================================================ */

class SupportScreen extends StatelessWidget {
  const SupportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Support',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: darkBlue,
              ),
            ),

            const SizedBox(height: 25),

            SupportCard(
              icon: Icons.phone,
              title: 'Call Support',
              subtitle: 'Talk to our technical team',
              onTap: () {},
            ),

            const SizedBox(height: 15),

            SupportCard(
              icon: Icons.chat,
              title: 'WhatsApp Support',
              subtitle: 'Get technical assistance',
              onTap: () {},
            ),

            const SizedBox(height: 15),

            SupportCard(
              icon: Icons.email,
              title: 'Email Support',
              subtitle: 'Send us your query',
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}

/* ============================================================
   PROFILE
============================================================ */

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const CircleAvatar(
              radius: 48,
              backgroundColor: Color(0xFFDDF3F8),
              child: Icon(
                Icons.person,
                size: 55,
                color: marineBlue,
              ),
            ),

            const SizedBox(height: 15),

            const Text(
              'Marine Aqua User',
              style: TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.bold,
                color: darkBlue,
              ),
            ),

            const SizedBox(height: 5),

            const Text(
              'Aquaculture Farmer',
              style: TextStyle(
                color: Colors.black54,
              ),
            ),

            const SizedBox(height: 30),

            ProfileItem(
              icon: Icons.person_outline,
              title: 'Personal Information',
              onTap: () {},
            ),

            ProfileItem(
              icon: Icons.language,
              title: 'Language',
              onTap: () {},
            ),

            ProfileItem(
              icon: Icons.notifications_none,
              title: 'Notifications',
              onTap: () {},
            ),

            ProfileItem(
              icon: Icons.info_outline,
              title: 'About Marine Aqua Technologies',
              onTap: () {},
            ),

            const Spacer(),

            SizedBox(
              width: double.infinity,
              child: OutlinedButton.icon(
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const LoginScreen(),
                    ),
                    (route) => false,
                  );
                },
                icon: const Icon(Icons.logout),
                label: const Text('Logout'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/* ============================================================
   WIDGETS
============================================================ */

class QuickCard extends StatelessWidget {
  final String image;
  final String title;
  final String text;

  const QuickCard({
    super.key,
    required this.image,
    required this.title,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 175,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.07),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 6,
            child: SizedBox(
              width: double.infinity,
              child: Image.asset(
                image,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    color: const Color(0xFFE8F6FA),
                    child: const Center(
                      child: Icon(
                        Icons.image_not_supported_outlined,
                        color: marineBlue,
                        size: 32,
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(12, 8, 12, 7),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: darkBlue,
                    ),
                  ),
                  const SizedBox(height: 3),
                  Expanded(
                    child: Text(
                      text,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 10.5,
                        color: Colors.black54,
                        height: 1.15,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SectionTitle extends StatelessWidget {
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  const SectionTitle({
    super.key,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(
          Icons.inventory_2,
          color: marineBlue,
        ),

        const SizedBox(width: 10),

        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: darkBlue,
                ),
              ),
              Text(
                subtitle,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.black54,
                ),
              ),
            ],
          ),
        ),

        TextButton(
          onPressed: onTap,
          child: const Text('View All →'),
        ),
      ],
    );
  }
}

class ProductMiniCard extends StatelessWidget {
  final Product product;

  const ProductMiniCard({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: const Color(0xFFD7E9EE),
        ),
      ),
      child: Column(
        children: [
          Expanded(
            child: Image.asset(
              product.image,
              fit: BoxFit.contain,
              errorBuilder: (_, __, ___) {
                return const Icon(
                  Icons.image_not_supported,
                  size: 50,
                  color: marineBlue,
                );
              },
            ),
          ),

          Text(
            product.name.toUpperCase(),
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              color: darkBlue,
              fontWeight: FontWeight.bold,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}

class StoryCard extends StatelessWidget {
  final String image;
  final String title;
  final String location;

  const StoryCard({
    super.key,
    required this.image,
    required this.title,
    required this.location,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 170,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        image: DecorationImage(
          image: AssetImage(image),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.transparent,
              Colors.black.withOpacity(.75),
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Icon(
              Icons.play_circle_outline,
              color: Colors.white,
              size: 32,
            ),

            const SizedBox(height: 6),

            Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
            ),

            Text(
              location,
              style: const TextStyle(
                color: Colors.white70,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class WaterTool extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;

  const WaterTool({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 3),
        padding: const EdgeInsets.symmetric(
          vertical: 13,
          horizontal: 3,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14),
        ),
        child: Column(
          children: [
            Icon(
              icon,
              color: const Color(0xFF168CE2),
              size: 30,
            ),
            const SizedBox(height: 5),
            Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 12,
                color: darkBlue,
              ),
            ),
            Text(
              subtitle,
              style: const TextStyle(
                fontSize: 9,
                color: Colors.black54,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class GuideCard extends StatelessWidget {
  final String image;
  final String title;
  final String subtitle;

  const GuideCard({
    super.key,
    required this.image,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Image.asset(
            image,
            height: 105,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
        ),

        const SizedBox(height: 7),

        Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: darkBlue,
          ),
        ),

        Text(
          subtitle,
          style: const TextStyle(
            fontSize: 11,
            color: Colors.black54,
          ),
        ),
      ],
    );
  }
}

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
        borderRadius: BorderRadius.circular(18),
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
              color: Colors.black54,
              height: 1.4,
            ),
          ),
        ],
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
    return ListTile(
      onTap: onTap,
      tileColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18),
      ),
      leading: CircleAvatar(
        backgroundColor: const Color(0xFFDDF3F8),
        child: Icon(
          icon,
          color: marineBlue,
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
        size: 16,
      ),
    );
  }
}

class ProfileItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  const ProfileItem({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: Icon(
        icon,
        color: marineBlue,
      ),
      title: Text(title),
      trailing: const Icon(
        Icons.arrow_forward_ios,
        size: 16,
      ),
    );
  }
}
