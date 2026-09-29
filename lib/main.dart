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
              height: 165,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(22),
                image: const DecorationImage(
                  image: AssetImage(
                    'assets/products/hero_shrimp.jpg',
                  ),
                  fit: BoxFit.cover,
                ),
              ),
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(22),
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
                        fontSize: 22,
                        height: 1.02,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    SizedBox(height: 10),

                    Text(
                      'Complete Aquaculture Solutions\nfor a Better Tomorrow',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
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
                          horizontal: 13,
                          vertical: 8,
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
                    icon: Icons.lightbulb_outline,
                    title: 'Tip Of The Day',
                    text: 'Maintain proper dissolved oxygen levels for better growth.',
                    color: const Color(0xFFDDF7E8),
                  ),
                ),

                const SizedBox(width: 12),

                Expanded(
                  child: QuickCard(
                    icon: Icons.menu_book,
                    title: 'Shrimp Culture Guide',
                    text: 'Learn setup, management & best practices.',
                    color: const Color(0xFFDDEEFF),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 12),

            Row(
              children: [
                Expanded(
                  child: QuickCard(
                    icon: Icons.calculate_outlined,
                    title: 'Biomass Calculator',
                    text: 'Get estimated biomass in 3 easy steps.',
                    color: const Color(0xFFDDF7E8),
                  ),
                ),

                const SizedBox(width: 12),

                Expanded(
                  child: QuickCard(
                    icon: Icons.health_and_safety_outlined,
                    title: 'Shrimp Diseases',
                    text: 'Identify, prevent & manage common diseases.',
                    color: const Color(0xFFFFE2E2),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 15),

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
              height: 165,
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
              padding: const EdgeInsets.all(15),
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
  final String description;
  final String dosage;
  final String usage;
  final String fullMatter;

  const Product({
    required this.name,
    required this.image,
    required this.description,
    required this.dosage,
    required this.usage,
    required this.fullMatter,
  });
}

const List<Product> products = [
  Product(
    name: 'Marine 6G',
    image: 'assets/products/marine 6g.png',
    description: '',
    dosage: '',
    usage: '',
    fullMatter: r'''**పొట్టు మారే ప్రక్రియకు ఖనిజాల సహాయం**

మరైన్-6G లిక్విడ్ మినరల్స్ రొయ్యలు పొట్టు మార్చే సమయంలో అవసరమైన ఖనిజాల అందుబాటును మెరుగుపరచడంలో సహాయపడుతుంది. కొత్త పొట్టు ఏర్పడటం, పొట్టు గట్టిపడటం మరియు పొట్టు మారిన తర్వాత రొయ్యలు త్వరగా కోలుకోవడానికి అవసరమైన ఖనిజ సహాయాన్ని అందిస్తుంది. సరైన ఖనిజ సమతుల్యతతో పొట్టు మారే ప్రక్రియ సజావుగా సాగేందుకు, రొయ్యల ఆరోగ్యకరమైన ఎదుగుదలకు మరియు మెరుగైన పనితీరుకు తోడ్పడుతుంది.

**మోతాదు:** ఎకరానికి **2 లీటర్లు**.

**వినియోగ విధానం:** అవసరమైన మోతాదులో మరైన్-6Gను నీటితో బాగా కలిపి, చెరువులో సమానంగా విస్తరించే విధంగా సాయంత్రం సమయంలో పాండ్‌లో అప్లై చేయాలి. రొయ్యల పెరుగుదల దశ, చెరువులోని ఖనిజాల స్థాయి మరియు నీటి పరిస్థితులను బట్టి వినియోగాన్ని నిర్వహించాలి.''',
  ),
  Product(
    name: 'Marine Volt-X',
    image: 'assets/products/marine volt-x.png',
    description: '',
    dosage: '',
    usage: '',
    fullMatter: r'''**వేగవంతమైన ఎదుగుదలకు గ్రోత్ బూస్టర్**

మరైన్ వోల్ట్-X రొయ్యలలో వేగవంతమైన ఎదుగుదల, మెరుగైన ఆహార వినియోగం మరియు ఆరోగ్యకరమైన శరీర అభివృద్ధికి సహాయపడే గ్రోత్ బూస్టర్. ఇందులోని ప్రోబయోటిక్స్ మరియు ఎంజైమ్‌ల ఆధారిత సహాయం రొయ్యలు తీసుకున్న ఆహారం సులభంగా జీర్ణమై, అందులోని పోషకాలు శరీరానికి సమర్థవంతంగా అందుబాటులోకి రావడానికి తోడ్పడుతుంది. దీంతో ఆహార వినియోగ సామర్థ్యం మెరుగుపడి, రొయ్యల ఎదుగుదల మరియు ఆరోగ్యానికి అవసరమైన పోషక సహాయం లభిస్తుంది.

**మోతాదు:** ప్రతి **1 కిలో ఫీడ్‌కు 5 మి.లీ.**

**వినియోగ విధానం:** అవసరమైన మోతాదులో మరైన్ వోల్ట్-Xను ఫీడ్‌పై సమానంగా కలిపి, బాగా కోట్ అయ్యేలా మిక్స్ చేసి రొయ్యలకు ఇవ్వాలి. **ప్రతిరోజూ ఫీడ్‌తో కలిపి ఉపయోగించాలి.** సరైన మోతాదు మరియు క్రమబద్ధమైన వినియోగం ద్వారా రొయ్యల జీర్ణక్రియ, ఫీడ్ వినియోగం మరియు ఆరోగ్యకరమైన ఎదుగుదలకు తోడ్పడుతుంది.''',
  ),
  Product(
    name: 'Bio Sludge',
    image: 'assets/products/Bio sludge.png',
    description: '',
    dosage: '',
    usage: '',
    fullMatter: r'''**చెరువు అడుగుభాగంలోని స్లడ్జ్ నియంత్రణకు**

బయో స్లడ్జ్-X చెరువు అడుగుభాగంలో పేరుకుపోయే స్లడ్జ్ మరియు సేంద్రీయ వ్యర్థాలను విచ్ఛిన్నం చేయడానికి సహాయపడుతుంది. ఇందులోని సూక్ష్మజీవులు మరియు ఎంజైమ్ ఆధారిత చర్య స్లడ్జ్‌ను క్రమంగా కరిగించి, అడుగుభాగాన్ని శుభ్రంగా ఉంచేందుకు తోడ్పడుతుంది. స్లడ్జ్ తగ్గడం ద్వారా చెరువులో పేరుకుపోయే సేంద్రీయ వ్యర్థాల ప్రభావాన్ని తగ్గించడంలో మరియు హానికరమైన వాయువుల ఏర్పాటును నియంత్రించడంలో సహాయపడుతుంది. తద్వారా చెరువు అడుగుభాగం మెరుగుపడి, రొయ్యలకు ఆరోగ్యకరమైన నీటి వాతావరణాన్ని కొనసాగించడానికి తోడ్పడుతుంది.

**మోతాదు:** ఎకరానికి 500 గ్రాములు.

**వినియోగ విధానం:** 500 గ్రాముల బయో స్లడ్జ్-Xను నీటిలో బాగా కలిపి, చెరువులో స్లడ్జ్ ఎక్కువగా ఉన్న ప్రాంతాల్లో సమానంగా విస్తరించేలా అప్లై చేయాలి. ఇది చెరువు అడుగుభాగంలో పేరుకుపోయిన సేంద్రీయ వ్యర్థాలు మరియు స్లడ్జ్‌ను విచ్ఛిన్నం చేయడంలో సహాయపడుతుంది.''',
  ),
  Product(
    name: 'Marine ProTab',
    image: 'assets/products/marine protab.png',
    description: '',
    dosage: '',
    usage: '',
    fullMatter: r'''**మరైన్ ప్రోటాబ్ – ప్రోబయోటిక్ టాబ్లెట్లు**

మరైన్ ప్రోటాబ్ రొయ్యల చెరువులో ఉపయోగకరమైన ప్రోబయోటిక్ సూక్ష్మజీవుల సమతుల్యతను మెరుగుపరచడానికి రూపొందించబడిన ప్రోబయోటిక్ టాబ్లెట్లు. ఇవి చెరువులోని నీటి నాణ్యతను మెరుగుపరచడంలో, సేంద్రీయ వ్యర్థాల నిర్వహణలో మరియు రొయ్యలకు అనుకూలమైన ఆరోగ్యకరమైన నీటి వాతావరణాన్ని కొనసాగించడంలో సహాయపడతాయి.

**మోతాదు:** ఎకరానికి 500 గ్రాములు.

**వినియోగ విధానం:** అవసరమైన మోతాదులో మరైన్ ప్రోటాబ్ టాబ్లెట్లను చెరువులో సమానంగా విస్తరించే విధంగా అప్లై చేయాలి. టాబ్లెట్లను చెరువులో సమానంగా పంపిణీ చేయడం ద్వారా ప్రోబయోటిక్ చర్య మొత్తం చెరువులో మెరుగ్గా జరిగేందుకు సహాయపడుతుంది.''',
  ),
  Product(
    name: 'Vibrio Shield & Marine ProTab',
    image: 'assets/products/Marine vibrio shield.png',
    description: '',
    dosage: '',
    usage: '',
    fullMatter: r'''**వైబ్రియో నియంత్రణకు శక్తివంతమైన రక్షణ**

మరైన్ వైబ్రియో షీల్డ్ రొయ్యల చెరువుల్లో హానికరమైన వైబ్రియో బ్యాక్టీరియా పెరుగుదలను నియంత్రించడానికి రూపొందించిన లిక్విడ్ ఫార్ములేషన్. ఇది వైబ్రియో బ్యాక్టీరియా విస్తరణను నియంత్రించడంలో సహాయపడుతూ, చెరువులోని సూక్ష్మజీవుల సమతుల్యతను మెరుగుపరచడానికి మరియు రొయ్యల ఆరోగ్యాన్ని కాపాడుకోవడానికి తోడ్పడుతుంది. వైబ్రియో ఒత్తిడి తగ్గించడం ద్వారా రొయ్యలు ఆరోగ్యంగా పెరగడానికి మరియు మంచి ఉత్పత్తి ఫలితాలు సాధించడానికి అనుకూలమైన చెరువు వాతావరణాన్ని కొనసాగించడంలో సహాయపడుతుంది.

**మోతాదు:** ఎకరానికి **1 లీటర్**.

**వినియోగ విధానం**

**1. ముందుగా – మరైన్ వైబ్రియో షీల్డ్:** చెరువులో వైబ్రియో నియంత్రణ కోసం ఎకరానికి **1 లీటర్ మరైన్ వైబ్రియో షీల్డ్**‌ను నీటిలో కలిపి సమానంగా అప్లై చేయాలి.

**2. 24 గంటల విరామం:** వైబ్రియో షీల్డ్ అప్లై చేసిన తర్వాత **24 గంటలు వేచి ఉండాలి.**

**3. తర్వాత – మరైన్ ప్రోటాబ్:** 24 గంటల తర్వాత ఎకరానికి **500 గ్రాముల మరైన్ ప్రోటాబ్** టాబ్లెట్లను చెరువులో సమానంగా విస్తరించే విధంగా అప్లై చేయాలి.

**4. లక్ష్యం:** ఈ క్రమంలో ఉపయోగించడం ద్వారా ముందుగా వైబ్రియో నియంత్రణకు సహాయపడుతూ, ఆ తర్వాత ఉపయోగకరమైన ప్రోబయోటిక్ సూక్ష్మజీవుల సహాయంతో చెరువులో సూక్ష్మజీవుల సమతుల్యతను మెరుగుపరచడానికి తోడ్పడుతుంది.''',
  ),
  Product(
    name: 'Marine White Gut',
    image: 'assets/products/marine white shield.png',
    description: '',
    dosage: '',
    usage: '',
    fullMatter: r'''**రొయ్యల పేగు ఆరోగ్యానికి ప్రత్యేక ఫార్ములా**

మరైన్ వైట్ షీల్డ్ రొయ్యల పేగు ఆరోగ్యాన్ని మెరుగుపరచడానికి రూపొందించిన అడ్వాన్స్‌డ్ గట్ హెల్త్ ఫార్ములా. ఇది జీర్ణవ్యవస్థ సక్రమంగా పనిచేయడానికి, ఆహారం జీర్ణమయ్యే విధానాన్ని మెరుగుపరచడానికి మరియు ఆరోగ్యకరమైన గట్‌ను కాపాడుకోవడానికి సహాయపడుతుంది. తద్వారా రొయ్యలు ఆహారంలోని పోషకాలను సమర్థవంతంగా వినియోగించుకుని ఆరోగ్యకరమైన ఎదుగుదలకు తోడ్పడుతుంది.

**వైట్ గట్ సాధారణ లక్షణాలు:**
- పేగు తెల్లగా లేదా పాలలాంటి రంగులో కనిపించడం.
- పేగులో ఆహారం సరిగా కనిపించకపోవడం.
- ఫీడ్ తీసుకోవడం తగ్గడం.
- రొయ్యల ఎదుగుదల మందగించడం.
- ఫీడ్ ట్రేలో ఆహారం మిగిలిపోవడం.

**మోతాదు:** ప్రతి **1 కిలో ఫీడ్‌కు 5–10 మి.లీ.**

**వినియోగ విధానం:** అవసరమైన మోతాదులో మరైన్ వైట్ షీల్డ్‌ను **1 కిలో ఫీడ్‌కు 5–10 మి.లీ. చొప్పున** తీసుకుని, ఫీడ్‌పై సమానంగా కలిసేలా బాగా కోట్ చేయాలి. కలిపిన ఫీడ్‌ను కొద్దిసేపు ఉంచి, అనంతరం రొయ్యలకు ఇవ్వాలి. గట్ ఆరోగ్యాన్ని మెరుగుపరచడానికి మరియు వైట్ గట్ లక్షణాల సమయంలో ఉత్పత్తిని సూచించిన మోతాదులో ఉపయోగించాలి.''',
  ),
  Product(
    name: 'Oxytab Plus',
    image: 'assets/products/oxytab plus.png',
    description: '',
    dosage: '',
    usage: '',
    fullMatter: r'''**చెరువులో ఆక్సిజన్ స్థాయిని మెరుగుపరచడానికి**

OXYTAB+ ఆక్సిజన్ టాబ్లెట్లు చెరువులో కరిగిన ఆక్సిజన్ స్థాయిని మెరుగుపరచడానికి రూపొందించబడ్డాయి. నీటిలో ఆక్సిజన్ తగ్గినప్పుడు రొయ్యలకు అవసరమైన ఆక్సిజన్ అందుబాటులో ఉండేలా సహాయపడుతూ, ఆక్సిజన్ లోపం వల్ల కలిగే ఒత్తిడిని తగ్గించడంలో తోడ్పడుతుంది. ముఖ్యంగా తెల్లవారుజామున DO తక్కువగా ఉన్నప్పుడు, మబ్బులు లేదా వర్షపు వాతావరణంలో మరియు అత్యవసర ఆక్సిజన్ అవసరమైన సందర్భాల్లో ఉపయోగించవచ్చు.

**మోతాదు:** ఎకరానికి **500 గ్రాములు**.

**వినియోగ విధానం:** అవసరమైన మోతాదులో OXYTAB+ టాబ్లెట్లను చెరువులో సమానంగా విస్తరించే విధంగా అప్లై చేయాలి. టాబ్లెట్లు నీటిలోకి వెళ్లిన తర్వాత చెరువు అడుగుభాగానికి చేరి ఆక్సిజన్ విడుదలకు సహాయపడతాయి. DO స్థాయి తగ్గినప్పుడు లేదా ఆక్సిజన్ అవసరం ఉన్న సమయంలో ఉపయోగించాలి.

**టాబ్లెట్ వినియోగ విధానం**

**1. మోతాదు నిర్ణయించండి:** ఎకరానికి **500 గ్రాముల OXYTAB+** తీసుకోవాలి.

**2. చెరువులో సమానంగా వేయండి:** టాబ్లెట్లను చెరువులో ఒకే ప్రాంతంలో కాకుండా, **చెరువు అంతటా సమానంగా విస్తరించేలా** వేయాలి.

**3. DO తక్కువగా ఉన్న ప్రాంతాలకు ప్రాధాన్యత ఇవ్వండి:** ఆక్సిజన్ స్థాయి తక్కువగా ఉన్న ప్రాంతాలు లేదా రొయ్యలు ఎక్కువగా గుమిగూడే ప్రాంతాల్లో సమానంగా అప్లై చేయాలి.

**4. అప్లికేషన్ సమయం:** DO స్థాయి తగ్గినప్పుడు, ముఖ్యంగా **తెల్లవారుజామున**, మబ్బులు లేదా వర్షపు వాతావరణంలో అవసరాన్ని బట్టి ఉపయోగించవచ్చు.

**5. అప్లికేషన్ తర్వాత:** టాబ్లెట్లు నీటిలో కరిగి ఆక్సిజన్ విడుదల చేయడం ప్రారంభిస్తాయి. అప్లికేషన్ తర్వాత **DO స్థాయిని పర్యవేక్షించడం** మంచిది.''',
  ),
  Product(
    name: 'Free Moult',
    image: 'assets/products/Free moult.png',
    description: '',
    dosage: '',
    usage: '',
    fullMatter: r'''**రొయ్యల పొట్టు మారే ప్రక్రియకు ప్రత్యేక మద్దతు**

ఫ్రీ మౌల్ట్ వనామీ రొయ్యలలో పొట్టు మారే ప్రక్రియకు అవసరమైన ఖనిజాలు, సూక్ష్మ మూలకాలు మరియు సహాయక పోషకాలను అందించడానికి రూపొందించబడింది. ఇందులోని అవసరమైన ఖనిజాలు, బయో-యాక్టివ్ పదార్థాలు మరియు సహజ మౌల్టింగ్ కారకాలు కొత్త పొట్టు ఏర్పడటం మరియు పొట్టు గట్టిపడే ప్రక్రియకు తోడ్పడతాయి. సరైన మౌల్టింగ్‌కు సహాయపడటం ద్వారా రొయ్యల ఆరోగ్యకరమైన ఎదుగుదలకు మరియు మెరుగైన ఉత్పత్తి పనితీరుకు అనుకూల పరిస్థితులను కల్పిస్తుంది.

**మోతాదు:** ఎకరానికి 10 కిలోలు.

**వినియోగ విధానం:** 10 కిలోల ఫ్రీ మౌల్ట్‌ను తగిన పరిమాణంలో నీటితో బాగా కలిపి, చెరువులో సమానంగా విస్తరించే విధంగా అప్లై చేయాలి. రొయ్యలు మౌల్టింగ్ దశలో ఉన్నప్పుడు మరియు మౌల్టింగ్ తర్వాత రికవరీ దశలో ఉపయోగించడం ద్వారా కొత్త పొట్టు ఏర్పడటం, పొట్టు గట్టిపడటం మరియు మౌల్టింగ్ తర్వాత రొయ్యలు త్వరగా కోలుకోవడానికి అవసరమైన ఖనిజ సహాయాన్ని అందించడంలో తోడ్పడుతుంది.''',
  ),
  Product(
    name: 'Red Thunder',
    image: 'assets/products/Red thunder.png',
    description: '',
    dosage: '',
    usage: '',
    fullMatter: r'''**వైరస్ మరియు హానికరమైన సూక్ష్మజీవుల నియంత్రణకు**

రెడ్ థండర్ రొయ్యల చెరువుల్లో వైరస్, హానికరమైన బ్యాక్టీరియా, వైబ్రియో మరియు ఫంగస్ నియంత్రణకు రూపొందించిన ప్రత్యేక ఫార్ములేషన్. ఇది చెరువు నీటి పరిశుభ్రతను మెరుగుపరచడంలో, హానికరమైన సూక్ష్మజీవుల ప్రభావాన్ని తగ్గించడంలో మరియు రొయ్యలకు ఆరోగ్యకరమైన నీటి వాతావరణాన్ని కొనసాగించడంలో సహాయపడుతుంది. తద్వారా రొయ్యల ఆరోగ్యం మరియు జీవించే సామర్థ్యాన్ని మెరుగుపరచడానికి తోడ్పడుతుంది.

**మోతాదు:** ఎకరానికి **1 లీటర్**.

**వినియోగ విధానం:** అవసరమైన మోతాదులో రెడ్ థండర్‌ను తగిన పరిమాణంలో నీటితో బాగా కలిపి, చెరువులో సమానంగా విస్తరించే విధంగా అప్లై చేయాలి. చెరువు నీటి పరిస్థితి మరియు సూక్ష్మజీవుల స్థాయిని పరిగణనలోకి తీసుకుని ఉత్పత్తి సూచించిన విధంగా వినియోగించాలి.''',
  ),
  Product(
    name: 'Zeoneem',
    image: 'assets/products/Zeoneem.png',
    description: '',
    dosage: '',
    usage: '',
    fullMatter: r'''**చెరువు నీటి నాణ్యత మరియు హానికరమైన గ్యాస్‌ల నియంత్రణకు**

ZEONEEM అనేది **Neem Extract ఆధారిత Zeolite మరియు Probiotics** కలయికతో రూపొందించిన గ్రాన్యూల్ ఫార్ములేషన్. Zeolite యొక్క శోషణ లక్షణాలు చెరువులోని **అమోనియా (NH₃)** వంటి అవాంఛిత పదార్థాలను నియంత్రించడంలో సహాయపడతాయి. ఇందులోని ప్రోబయోటిక్స్ చెరువులోని సేంద్రీయ పదార్థాల బయోడిగ్రేడేషన్‌కు సహాయపడుతూ, నీటి నాణ్యతను స్థిరంగా ఉంచడంలో తోడ్పడతాయి. Neem-derived bioactive compounds సూక్ష్మజీవుల ఒత్తిడిని నిర్వహించడంలో సహాయక పాత్ర పోషిస్తాయి.

**పరిస్థితుల ఆధారంగా మోతాదు ఎంపిక**

చెరువులో నీటి నాణ్యత, అమోనియా స్థాయి, సేంద్రీయ వ్యర్థాల పరిమాణం మరియు బాటమ్ పరిస్థితిని బట్టి ZEONEEM మోతాదును ఎంచుకోవాలి.

**5 kg/ఎకరం:** నీటి నాణ్యత సాధారణంగా ఉండి, సేంద్రీయ లోడ్ తక్కువగా ఉన్నప్పుడు మరియు సాధారణ నిర్వహణ కోసం ఉపయోగించవచ్చు.

**7–8 kg/ఎకరం:** సేంద్రీయ వ్యర్థాలు పెరిగినప్పుడు, బాటమ్‌లో మలినాలు పేరుకుపోతున్నప్పుడు లేదా నీటి నాణ్యతలో స్వల్ప మార్పులు కనిపించినప్పుడు ఉపయోగించవచ్చు.

**10 kg/ఎకరం:** అధిక సేంద్రీయ లోడ్, బాటమ్‌లో ఎక్కువ వ్యర్థాలు లేదా అమోనియా సమస్య ఎక్కువగా ఉన్నప్పుడు ఉపయోగించవచ్చు.

**వినియోగ సూచన:** మోతాదు నిర్ణయించే ముందు **NH₃, pH, DO మరియు బాటమ్ పరిస్థితులను** పరిశీలించడం మంచిది. తీవ్రమైన నీటి నాణ్యత సమస్యలలో కేవలం ఒక ఉత్పత్తిపై ఆధారపడకుండా, మొత్తం చెరువు నిర్వహణ విధానంతో పాటు ఉపయోగించాలి.''',
  ),
  Product(
    name: 'Starmin',
    image: 'assets/products/Starmin.png',
    description: '',
    dosage: '',
    usage: '',
    fullMatter: r'''అధిక సాంద్రత కలిగిన మినరల్స్ మరియు ప్రోబయోటిక్స్

రొయ్యల ఆరోగ్యకరమైన ఎదుగుదల, ఖనిజాల సమతుల్యత మరియు చెరువులోని సూక్ష్మజీవుల సమతుల్యతకు సహాయపడే అధిక సాంద్రత కలిగిన మినరల్స్ మరియు ప్రోబయోటిక్స్ ఆధారిత ఫార్ములేషన్. రొయ్యల శరీర నిర్మాణం, పొట్టు ఏర్పడటం మరియు మౌల్టింగ్ సమయంలో అవసరమైన ఖనిజాల అందుబాటుకు సహాయపడటంతో పాటు, ప్రోబయోటిక్స్ ద్వారా చెరువులోని అనుకూలమైన సూక్ష్మజీవుల వాతావరణాన్ని నిర్వహించడంలో తోడ్పడుతుంది.

**ముఖ్యమైన ప్రయోజనాలు**
- రొయ్యల ఆరోగ్యకరమైన ఎదుగుదలకు అవసరమైన ఖనిజాల సపోర్ట్ అందిస్తుంది.
- కొత్త పొట్టు ఏర్పడటం మరియు పొట్టు గట్టిపడే ప్రక్రియకు సహాయపడుతుంది.
- మౌల్టింగ్ సమయంలో అవసరమైన ఖనిజాల అందుబాటుకు తోడ్పడుతుంది.
- మౌల్టింగ్ తర్వాత రొయ్యల రికవరీకి సహాయపడుతుంది.
- ప్రోబయోటిక్స్ ద్వారా చెరువులో అనుకూలమైన సూక్ష్మజీవుల సమతుల్యతను కొనసాగించడంలో సహాయపడుతుంది.
- చెరువు నీరు మరియు బాటమ్ పరిస్థితుల నిర్వహణకు తోడ్పడుతుంది.
- రొయ్యల ఆరోగ్యకరమైన పెరుగుదలకు సహాయపడుతుంది.

**వినియోగ విధానం:** చెరువు పరిస్థితి మరియు రొయ్యల పెరుగుదల దశను బట్టి నిర్ణయించిన మోతాదులో MARINE STAR-M ను చెరువులో సమానంగా అప్లై చేయాలి.

**మోతాదు:** ఉత్పత్తి సూచించిన మోతాదు ప్రకారం ఉపయోగించాలి.''',
  ),
  Product(
    name: 'Nutrimin',
    image: 'assets/products/nutrimin.png',
    description: '',
    dosage: '',
    usage: '',
    fullMatter: r'''Nutrimin అనేది రొయ్యలకు సులభంగా అందుబాటులో ఉండే Chelated Minerals ఆధారిత మినరల్ ఫార్ములేషన్. రొయ్యల శరీరంలో అవసరమైన ఖనిజాల అందుబాటును మెరుగుపరచడంలో, పొట్టు ఏర్పడటం మరియు గట్టిపడటం, మౌల్టింగ్ ప్రక్రియ, శరీర నిర్మాణం మరియు ఆరోగ్యకరమైన ఎదుగుదలకు అవసరమైన మినరల్ సపోర్ట్ అందించడంలో సహాయపడుతుంది. Chelated రూపంలోని ఖనిజాలు నీటిలోని ఇతర పదార్థాలతో బంధించబడకుండా రొయ్యలకు అందుబాటులో ఉండేలా సహాయపడటంతో మినరల్ వినియోగ సామర్థ్యాన్ని మెరుగుపరచడానికి తోడ్పడతాయి.

**ముఖ్యమైన ప్రయోజనాలు**
- రొయ్యల శరీరానికి అవసరమైన ఖనిజాల అందుబాటును మెరుగుపరచడంలో సహాయపడుతుంది.
- కొత్త పొట్టు ఏర్పడటం మరియు పొట్టు గట్టిపడటానికి అవసరమైన మినరల్ సపోర్ట్ అందిస్తుంది.
- మౌల్టింగ్ సమయంలో రొయ్యలకు అవసరమైన ఖనిజాల అందుబాటుకు తోడ్పడుతుంది.
- మౌల్టింగ్ తర్వాత రికవరీ మరియు ఆరోగ్యకరమైన ఎదుగుదలకు సహాయపడుతుంది.
- రొయ్యల శరీర నిర్మాణం మరియు సాధారణ జీవక్రియ ప్రక్రియలకు అవసరమైన మినరల్ సపోర్ట్ అందిస్తుంది.

**మోతాదు:** ఎకరానికి 10 కిలోలు.

**వినియోగ విధానం:** 10 కిలోల Nutrimin ను తగిన పరిమాణంలో నీటితో బాగా కలిపి చెరువులో సమానంగా విస్తరించే విధంగా అప్లై చేయాలి. చెరువులోని మినరల్ స్థాయిలు, నీటి నాణ్యత మరియు రొయ్యల మౌల్టింగ్ పరిస్థితిని పరిగణనలోకి తీసుకుని వినియోగించాలి.''',
  ),
  Product(
    name: 'Bio Soil',
    image: 'assets/products/Bio soil.png',
    description: '',
    dosage: '',
    usage: '',
    fullMatter: r'''చెరువు అడుగు మట్టి నాణ్యతను మెరుగుపరచడానికి మరియు మట్టి సారాన్ని పెంచడానికి రూపొందించిన Soil Fertility Enhancer. చెరువు బాటమ్‌లో పేరుకుపోయే సేంద్రీయ వ్యర్థాలు మరియు మట్టి సంబంధిత సమస్యలను నిర్వహించడంలో సహాయపడుతూ, ప్రయోజనకరమైన సూక్ష్మజీవుల కార్యకలాపాలకు అనుకూలమైన వాతావరణాన్ని ఏర్పరచడానికి తోడ్పడుతుంది. దీని ద్వారా చెరువు బాటమ్ పరిస్థితులను మెరుగుపరచడం, సేంద్రీయ పదార్థాల విచ్ఛిన్న ప్రక్రియకు సహాయం చేయడం మరియు రొయ్యల పెరుగుదలకు అనుకూలమైన చెరువు వాతావరణాన్ని కొనసాగించడంలో సహాయపడుతుంది.

**ముఖ్యమైన ప్రయోజనాలు**
- చెరువు బాటమ్ మట్టి నాణ్యతను మెరుగుపరచడంలో సహాయపడుతుంది.
- మట్టి సారాన్ని మరియు ప్రయోజనకరమైన సూక్ష్మజీవుల కార్యకలాపాలను పెంచడంలో తోడ్పడుతుంది.
- బాటమ్‌లో పేరుకుపోయిన సేంద్రీయ పదార్థాల నిర్వహణకు సహాయపడుతుంది.
- సేంద్రీయ పదార్థాల సహజ విచ్ఛిన్న ప్రక్రియకు తోడ్పడుతుంది.
- చెరువు బాటమ్‌లో అనుకూలమైన సూక్ష్మజీవుల వాతావరణాన్ని ఏర్పరచడంలో సహాయపడుతుంది.
- రొయ్యలకు ఆరోగ్యకరమైన మరియు స్థిరమైన చెరువు వాతావరణాన్ని నిర్వహించడానికి తోడ్పడుతుంది.

**వినియోగ విధానం:** BIO-SOIL ను చెరువు బాటమ్ పరిస్థితిని బట్టి తగిన మోతాదులో నీటితో కలిపి చెరువులో సమానంగా అప్లై చేయాలి. బాటమ్‌లో సేంద్రీయ వ్యర్థాల స్థాయి మరియు మట్టి పరిస్థితిని పరిశీలించి అవసరమైన మోతాదును నిర్ణయించాలి.

**మోతాదు:** ఎకరానికి 10 కిలోలు.''',
  ),
  Product(
    name: 'Chlorides',
    image: 'assets/products/chlorides.png',
    description: '',
    dosage: '',
    usage: '',
    fullMatter: r'''**MARINE MAG+**

MARINE MAG+ రొయ్యల పెంపకంలో అవసరమైన మెగ్నీషియం ఖనిజాన్ని అందించే ప్రత్యేక మినరల్ సప్లిమెంట్. ఇది చెరువు నీటిలో ఖనిజ సమతుల్యతను, రొయ్యల శరీరంలోని ద్రవ సమతుల్యతను నిర్వహించడంలో సహాయపడుతుంది. మౌల్టింగ్ సమయంలో అవసరమైన ఖనిజ సహాయాన్ని అందించి, కొత్త పెంకు ఏర్పడటం మరియు మౌల్టింగ్ తర్వాత రికవరీకి తోడ్పడుతుంది. మెగ్నీషియం లోపం ఉన్న పరిస్థితుల్లో రొయ్యల ఆరోగ్యం, చురుకుదనం మరియు ఎదుగుదలకు సహాయపడుతుంది.

**MARINE POTASH MAX**

MARINE POTASH MAX రొయ్యల పెంపకంలో అవసరమైన పొటాషియం ఖనిజాన్ని అందించే ప్రత్యేక ఉత్పత్తి. ఇది రొయ్యల శరీరంలోని నీరు–ఖనిజ సమతుల్యతను నిర్వహించడంలో సహాయపడుతుంది. మౌల్టింగ్ సమయంలో అవసరమైన ఖనిజ సహాయాన్ని అందిస్తూ, ఒత్తిడి పరిస్థితులను ఎదుర్కొనే సామర్థ్యానికి తోడ్పడుతుంది. చెరువులో పొటాషియం స్థాయి తక్కువగా ఉన్నప్పుడు ఖనిజ సమతుల్యతను మెరుగుపరచి, రొయ్యల చురుకుదనం, ఆరోగ్యం మరియు ఎదుగుదలకు సహాయపడుతుంది.

**MARINE CA MAX**

MARINE CA MAX రొయ్యల పెంపకంలో అవసరమైన కాల్షియం ఖనిజాన్ని అందించే ప్రత్యేక మినరల్ సప్లిమెంట్. కాల్షియం రొయ్యల పెంకు ఏర్పడటం, పెంకు గట్టిపడటం మరియు మౌల్టింగ్ ప్రక్రియలో ముఖ్యమైన పాత్ర పోషిస్తుంది. ఈ ఉత్పత్తి కాల్షియం లోపాన్ని నిర్వహించడంలో సహాయపడుతూ, మౌల్టింగ్ తర్వాత కొత్త పెంకు అభివృద్ధి మరియు రికవరీకి తోడ్పడుతుంది. చెరువు నీటిలో కాల్షియం సమతుల్యతను నిర్వహించడం ద్వారా రొయ్యల ఆరోగ్యం మరియు ఎదుగుదలకు సహాయపడుతుంది.''',
  ),
  Product(
    name: 'Yucca Pro',
    image: 'assets/products/Yucca Pro.png',
    description: '',
    dosage: '',
    usage: '',
    fullMatter: r'''**YUCCAPRO**

YUCCAPRO రొయ్యల చెరువుల్లో ఏర్పడే హానికరమైన టాక్సిన్లు, అమోనియా మరియు సేంద్రీయ వ్యర్థాల ప్రభావాన్ని తగ్గించేందుకు ఉపయోగించే టాక్సిన్ బైండర్. ఇది చెరువు నీటి నాణ్యతను మెరుగుపరచడంలో, హానికరమైన వాయువుల ప్రభావాన్ని నియంత్రించడంలో మరియు చెరువులోని ఆర్గానిక్ లోడ్‌ను నిర్వహించడంలో సహాయపడుతుంది. తద్వారా రొయ్యలకు అనుకూలమైన, ఆరోగ్యకరమైన నీటి వాతావరణాన్ని కొనసాగించడానికి తోడ్పడుతుంది. ముఖ్యంగా అమోనియా స్థాయిలు పెరిగినప్పుడు, అధిక ఆర్గానిక్ లోడ్ లేదా నీటి నాణ్యత సమస్యలు ఉన్న సమయంలో ఉపయోగకరంగా ఉంటుంది.

**డోసేజ్: ఎకరానికి 500 గ్రాములు**, చెరువు నీటిలో సమానంగా విస్తరించేలా అప్లై చేయాలి.''',
  ),
  Product(
    name: 'Hi-Soft',
    image: 'assets/products/Hi-Soft.png',
    description: '',
    dosage: '',
    usage: '',
    fullMatter: r'''**ఆక్వా కల్చర్‌లో నీటి Hardness & Alkalinity**

ఆక్వా కల్చర్‌లో నీటి **కాఠిన్యం, క్షారత్వం మరియు ఖనిజ సమతుల్యత** సరైన స్థాయిలో ఉండటం రొయ్యల ఆరోగ్యం, పొట్టుబట్టడం మరియు పెంకు ఏర్పడటానికి చాలా ముఖ్యం. **హై-సాఫ్ట్** నీటిలోని కాఠిన్యం మరియు క్షారత్వాన్ని సమతుల్యం చేయడంలో సహాయపడే నీటి నిర్వహణ ఉత్పత్తి. లేబుల్ ప్రకారం దీని **మోతాదు ఎకరానికి 1 కిలో**.''',
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

class _ProductInfoSection extends StatelessWidget {
  final String title;
  final String value;

  const _ProductInfoSection({
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
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
              fontSize: 17,
              fontWeight: FontWeight.bold,
              color: darkBlue,
            ),
          ),
          const SizedBox(height: 7),
          Text(
            value,
            style: const TextStyle(
              fontSize: 14,
              height: 1.45,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }
}

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

            _ProductInfoSection(
              title: 'Product Details',
              value: product.fullMatter.replaceAll('**', ''),
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
  final IconData icon;
  final String title;
  final String text;
  final Color color;

  const QuickCard({
    super.key,
    required this.icon,
    required this.title,
    required this.text,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 145,
      padding: const EdgeInsets.all(13),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(22),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            icon,
            size: 30,
            color: marineBlue,
          ),

          const SizedBox(height: 7),

          Text(
            title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: darkBlue,
            ),
          ),

          const SizedBox(height: 4),

          Expanded(
            child: Text(
              text,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 12,
                color: Colors.black54,
              ),
            ),
          ),

          const Align(
            alignment: Alignment.bottomRight,
            child: Icon(
              Icons.arrow_forward,
              color: darkBlue,
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
      height: 150,
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
            height: 90,
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
