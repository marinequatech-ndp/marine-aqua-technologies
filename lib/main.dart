from pathlib import Path

main_dart = r'''import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MarineAquaApp());
}

const marineBlue = Color(0xFF075985);
const brightBlue = Color(0xFF129BCB);
const pageBg = Color(0xFFF4FAFD);
const lightBlue = Color(0xFFE5F6FC);

class MarineAquaApp extends StatelessWidget {
  const MarineAquaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Marine Aqua Technologies',
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: pageBg,
        colorScheme: ColorScheme.fromSeed(seedColor: marineBlue),
      ),
      // IMPORTANT: App always starts with Splash -> Login.
      home: const SplashScreen(),
    );
  }
}

/* =========================================================
   SPLASH
   ========================================================= */

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
        MaterialPageRoute(builder: (_) => const LoginScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/products/marine logo.png',
                width: 180,
                height: 180,
                fit: BoxFit.contain,
                errorBuilder: (_, __, ___) => const Icon(
                  Icons.water_drop,
                  size: 110,
                  color: brightBlue,
                ),
              ),
              const SizedBox(height: 24),
              const Text(
                'ఆక్వా సాగులో ప్రతి దశలో... మీకు తోడుగా',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: marineBlue,
                  fontSize: 19,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'MARINE AQUA TECHNOLOGIES',
                style: TextStyle(
                  color: marineBlue,
                  fontSize: 17,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 0.5,
                ),
              ),
              const SizedBox(height: 30),
              const CircularProgressIndicator(
                color: brightBlue,
                strokeWidth: 3,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/* =========================================================
   LOGIN
   ========================================================= */

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final mobileController = TextEditingController();

  @override
  void dispose() {
    mobileController.dispose();
    super.dispose();
  }

  void sendOtp() {
    final mobile = mobileController.text.trim();

    if (mobile.length != 10 || int.tryParse(mobile) == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('దయచేసి సరైన 10-digit mobile number నమోదు చేయండి'),
        ),
      );
      return;
    }

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => OtpScreen(mobileNumber: mobile),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(28, 35, 28, 25),
          child: Column(
            children: [
              const SizedBox(height: 10),
              Image.asset(
                'assets/products/marine logo.png',
                width: 145,
                height: 145,
                fit: BoxFit.contain,
                errorBuilder: (_, __, ___) => const Icon(
                  Icons.water_drop,
                  size: 100,
                  color: brightBlue,
                ),
              ),
              const SizedBox(height: 15),
              const Text(
                'MARINE AQUA TECHNOLOGIES',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: marineBlue,
                  fontSize: 23,
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'ఆక్వా సాగులో ప్రతి దశలో... మీకు తోడుగా',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: marineBlue,
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 55),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Mobile Login',
                  style: TextStyle(
                    color: marineBlue,
                    fontSize: 28,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Enter your mobile number to continue',
                  style: TextStyle(color: Colors.grey, fontSize: 15),
                ),
              ),
              const SizedBox(height: 25),
              TextField(
                controller: mobileController,
                keyboardType: TextInputType.phone,
                maxLength: 10,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 1.2,
                ),
                decoration: InputDecoration(
                  counterText: '',
                  prefixIcon: const Padding(
                    padding: EdgeInsets.only(left: 15, right: 8),
                    child: Center(
                      widthFactor: 0,
                      child: Text(
                        '+91',
                        style: TextStyle(
                          color: marineBlue,
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  hintText: 'Mobile number',
                  filled: true,
                  fillColor: const Color(0xFFF6FBFD),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(18),
                    borderSide: const BorderSide(color: Color(0xFFB9E4F0)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(18),
                    borderSide: const BorderSide(color: Color(0xFFB9E4F0)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(18),
                    borderSide: const BorderSide(
                      color: brightBlue,
                      width: 2,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 22),
              SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  onPressed: sendOtp,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: marineBlue,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                  ),
                  child: const Text(
                    'SEND OTP',
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.8,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'By continuing, you agree to use Marine Aqua Technologies services.',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey, fontSize: 12),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/* =========================================================
   OTP
   NOTE: This is DEMO OTP until Firebase Phone Auth is connected.
   Demo OTP = 123456
   ========================================================= */

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
  final otpController = TextEditingController();

  @override
  void dispose() {
    otpController.dispose();
    super.dispose();
  }

  void verifyOtp() {
    final otp = otpController.text.trim();

    if (otp.length != 6) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('6-digit OTP నమోదు చేయండి')),
      );
      return;
    }

    // DEMO OTP.
    // Replace this section with Firebase Phone Authentication later.
    if (otp != '123456') {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Demo OTP తప్పు. Test కోసం 123456 ఉపయోగించండి.'),
        ),
      );
      return;
    }

    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (_) => const MainNavigationScreen(),
      ),
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(28, 20, 28, 25),
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(Icons.arrow_back, size: 30),
                ),
              ),
              const SizedBox(height: 5),
              Image.asset(
                'assets/products/marine logo.png',
                width: 125,
                height: 125,
                fit: BoxFit.contain,
                errorBuilder: (_, __, ___) => const Icon(
                  Icons.water_drop,
                  size: 90,
                  color: brightBlue,
                ),
              ),
              const SizedBox(height: 18),
              const Text(
                'Verify OTP',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: marineBlue,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'Enter the 6-digit OTP sent to\n+91 ${widget.mobileNumber}',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                  height: 1.4,
                ),
              ),
              const SizedBox(height: 30),
              TextField(
                controller: otpController,
                keyboardType: TextInputType.number,
                maxLength: 6,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 25,
                  letterSpacing: 8,
                  fontWeight: FontWeight.bold,
                ),
                decoration: InputDecoration(
                  counterText: '',
                  hintText: 'Enter 6-digit OTP',
                  filled: true,
                  fillColor: const Color(0xFFF8FCFE),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(18),
                    borderSide: const BorderSide(
                      color: Color(0xFFB7E3EF),
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(18),
                    borderSide: const BorderSide(
                      color: brightBlue,
                      width: 2,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 18),
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
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'DEMO OTP: 123456',
                style: TextStyle(
                  color: brightBlue,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/* =========================================================
   MAIN NAVIGATION
   ========================================================= */

class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({super.key});

  @override
  State<MainNavigationScreen> createState() =>
      _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  int currentIndex = 0;

  final pages = const [
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
        indicatorColor: const Color(0xFFD5F3FC),
        onDestinationSelected: (index) {
          setState(() => currentIndex = index);
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
   HOME
   ========================================================= */

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(child: _homeHeader()),
          SliverToBoxAdapter(child: _heroBanner(context)),
          SliverToBoxAdapter(child: _quickTools(context)),
          SliverToBoxAdapter(child: _dealerCard()),
          SliverToBoxAdapter(child: _sectionTitle('Our Aquaculture Solutions')),
          SliverToBoxAdapter(child: _homeProducts()),
          SliverToBoxAdapter(child: _sectionTitle('Success Stories')),
          SliverToBoxAdapter(child: _successStories()),
          SliverToBoxAdapter(child: _waterQualityTools()),
          SliverToBoxAdapter(child: _growthGuide()),
          const SliverToBoxAdapter(child: SizedBox(height: 25)),
        ],
      ),
    );
  }

  Widget _homeHeader() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(18, 12, 18, 10),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(18),
            child: Image.asset(
              'assets/products/marine logo.png',
              width: 62,
              height: 62,
              fit: BoxFit.contain,
              errorBuilder: (_, __, ___) => Container(
                width: 62,
                height: 62,
                decoration: BoxDecoration(
                  color: lightBlue,
                  borderRadius: BorderRadius.circular(18),
                ),
                child: const Icon(
                  Icons.water_drop,
                  color: brightBlue,
                  size: 35,
                ),
              ),
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
                    color: marineBlue,
                    fontSize: 22,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                Text(
                  'TECHNOLOGIES',
                  style: TextStyle(
                    color: marineBlue,
                    fontSize: 20,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                SizedBox(height: 3),
                Text(
                  'Smart Aquaculture. Better Results.',
                  style: TextStyle(
                    color: marineBlue,
                    fontSize: 10.5,
                    fontWeight: FontWeight.w600,
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
          CircleAvatar(
            radius: 23,
            backgroundColor: lightBlue,
            child: const Icon(
              Icons.person,
              color: marineBlue,
            ),
          ),
        ],
      ),
    );
  }

  Widget _heroBanner(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 5, 16, 14),
      child: Container(
        height: 190,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          gradient: const LinearGradient(
            colors: [
              Color(0xFF064E7A),
              Color(0xFF129BCB),
            ],
          ),
        ),
        clipBehavior: Clip.antiAlias,
        child: Stack(
          children: [
            Positioned.fill(
              child: Image.asset(
                'assets/products/hero_shrimp.jpg',
                fit: BoxFit.cover,
                opacity: const AlwaysStoppedAnimation(0.34),
                errorBuilder: (_, __, ___) => const SizedBox(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 15, 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Healthy Ponds\nStronger Shrimp\nHigher Profits',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 26,
                      height: 1.02,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Complete Aquaculture Solutions\nfor a Better Tomorrow',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 13,
                      height: 1.25,
                    ),
                  ),
                  const Spacer(),
                  ElevatedButton.icon(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const ProductsScreen(),
                        ),
                      );
                    },
                    icon: const Icon(Icons.arrow_forward),
                    label: const Text('Explore Products'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: marineBlue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
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

  Widget _quickTools(BuildContext context) {
    final items = [
      ['Tip Of The Day', 'Maintain proper dissolved oxygen levels for better growth.', Icons.lightbulb_outline, const Color(0xFFDDF7E8)],
      ['Shrimp Culture Guide', 'Learn setup, management & best practices.', Icons.menu_book_outlined, const Color(0xFFDDF0FF)],
      ['Biomass Calculator', 'Get estimated biomass in 3 easy steps.', Icons.calculate_outlined, const Color(0xFFDDF7E8)],
      ['Shrimp Diseases', 'Identify, prevent & manage common diseases.', Icons.health_and_safety_outlined, const Color(0xFFFFE1E1)],
    ];

    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: items.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          childAspectRatio: 1.18,
        ),
        itemBuilder: (_, index) {
          final item = items[index];
          return Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: item[3] as Color,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  item[2] as IconData,
                  color: index == 3 ? Colors.red : Colors.blue,
                  size: 34,
                ),
                const SizedBox(height: 8),
                Text(
                  item[0] as String,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: marineBlue,
                    fontSize: 17,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: 5),
                Expanded(
                  child: Text(
                    item[1] as String,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: Color(0xFF52708A),
                      fontSize: 12.5,
                      height: 1.2,
                    ),
                  ),
                ),
                const Align(
                  alignment: Alignment.bottomRight,
                  child: Icon(
                    Icons.arrow_forward,
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

  Widget _dealerCard() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 14),
      child: Container(
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
          color: const Color(0xFFE1F3FF),
          borderRadius: BorderRadius.circular(22),
          border: Border.all(color: const Color(0xFFB9E4F0)),
        ),
        child: Row(
          children: [
            Container(
              width: 70,
              height: 70,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(18),
              ),
              child: const Icon(
                Icons.location_on,
                color: Colors.red,
                size: 48,
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
                      color: marineBlue,
                      fontSize: 21,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    'Find our nearest dealers across India',
                    style: TextStyle(
                      color: Color(0xFF52708A),
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF1689D7),
                foregroundColor: Colors.white,
              ),
              child: const Text('Find Nearby'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _sectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(18, 8, 18, 10),
      child: Row(
        children: [
          Expanded(
            child: Text(
              title,
              style: const TextStyle(
                color: marineBlue,
                fontSize: 23,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
          const Text(
            'View All →',
            style: TextStyle(
              color: Color(0xFF1689D7),
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _homeProducts() {
    final items = ProductsScreen.products.take(5).toList();

    return SizedBox(
      height: 175,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        scrollDirection: Axis.horizontal,
        itemCount: items.length,
        separatorBuilder: (_, __) => const SizedBox(width: 10),
        itemBuilder: (_, index) {
          final product = items[index];
          return Container(
            width: 145,
            padding: const EdgeInsets.fromLTRB(8, 8, 8, 10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(18),
              border: Border.all(color: const Color(0xFFE0EDF2)),
            ),
            child: Column(
              children: [
                Expanded(
                  child: Image.asset(
                    product['image']!,
                    fit: BoxFit.contain,
                    errorBuilder: (_, __, ___) => const Icon(
                      Icons.image_not_supported_outlined,
                      size: 45,
                      color: Colors.grey,
                    ),
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  product['name']!,
                  maxLines: 2,
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: marineBlue,
                    fontWeight: FontWeight.w800,
                    fontSize: 13,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _successStories() {
    final stories = [
      ['40% Faster Growth', 'West Godavari, AP', 'assets/products/hero_shrimp.jpg'],
      ['Better Survival Rate', 'Krishna, AP', 'assets/products/shrimp_guide.png'],
    ];

    return SizedBox(
      height: 155,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        scrollDirection: Axis.horizontal,
        itemCount: stories.length,
        separatorBuilder: (_, __) => const SizedBox(width: 12),
        itemBuilder: (_, index) {
          final story = stories[index];
          return Container(
            width: 300,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: marineBlue,
              image: DecorationImage(
                image: AssetImage(story[2]),
                fit: BoxFit.cover,
                opacity: 0.65,
                onError: (_, __) {},
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(
                    Icons.play_circle_outline,
                    color: Colors.white,
                    size: 38,
                  ),
                  const Spacer(),
                  Text(
                    story[0],
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  Text(
                    story[1],
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _waterQualityTools() {
    final tools = [
      ['pH', 'Calculator', Icons.water_drop],
      ['Temperature', 'Guide', Icons.thermostat],
      ['Salinity', 'Calculator', Icons.science],
      ['DO', 'Calculator', Icons.bubble_chart],
    ];

    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 20, 16, 8),
      child: Container(
        padding: const EdgeInsets.fromLTRB(12, 18, 12, 16),
        decoration: BoxDecoration(
          color: const Color(0xFFDDF8E8),
          borderRadius: BorderRadius.circular(22),
        ),
        child: Column(
          children: [
            const Row(
              children: [
                Icon(Icons.science, color: Color(0xFF15966C), size: 34),
                SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Water Quality Tools',
                        style: TextStyle(
                          color: marineBlue,
                          fontSize: 21,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      Text(
                        'Calculate, monitor and maintain ideal water parameters',
                        style: TextStyle(
                          color: Color(0xFF52708A),
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 14),
            Row(
              children: tools.map((tool) {
                return Expanded(
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 3),
                    padding: const EdgeInsets.symmetric(
                      vertical: 14,
                      horizontal: 3,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Column(
                      children: [
                        Icon(
                          tool[2] as IconData,
                          color: const Color(0xFF1689D7),
                          size: 29,
                        ),
                        const SizedBox(height: 7),
                        Text(
                          tool[0] as String,
                          style: const TextStyle(
                            color: marineBlue,
                            fontWeight: FontWeight.bold,
                            fontSize: 11,
                          ),
                        ),
                        Text(
                          tool[1] as String,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: Color(0xFF52708A),
                            fontSize: 9,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _growthGuide() {
    final guides = [
      ['PL Selection', 'Choose healthy PL', 'assets/products/shrimp_guide.png'],
      ['Pond Preparation', 'Get your pond ready', 'assets/products/hero_shrimp.jpg'],
      ['Feeding Guide', 'Right feed, faster growth', 'assets/products/hero_shrimp.jpg'],
      ['Moulting Care', 'Stronger shell, better growth', 'assets/products/hero_shrimp.jpg'],
    ];

    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 18, 16, 0),
      child: Column(
        children: [
          const Row(
            children: [
              Icon(Icons.menu_book, color: Color(0xFF1689D7), size: 34),
              SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Shrimp Growth Guide',
                      style: TextStyle(
                        color: marineBlue,
                        fontSize: 21,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    Text(
                      'Step-by-step guidance from stocking to harvest',
                      style: TextStyle(
                        color: Color(0xFF52708A),
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                'View All →',
                style: TextStyle(
                  color: Color(0xFF1689D7),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          SizedBox(
            height: 150,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: guides.length,
              separatorBuilder: (_, __) => const SizedBox(width: 10),
              itemBuilder: (_, index) {
                final guide = guides[index];
                return SizedBox(
                  width: 185,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image.asset(
                          guide[2],
                          width: 185,
                          height: 92,
                          fit: BoxFit.cover,
                          errorBuilder: (_, __, ___) => Container(
                            width: 185,
                            height: 92,
                            color: lightBlue,
                            child: const Icon(
                              Icons.image_not_supported,
                              color: marineBlue,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        guide[0],
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          color: marineBlue,
                          fontSize: 12,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      Text(
                        guide[1],
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          color: Color(0xFF52708A),
                          fontSize: 10,
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
   PRODUCTS - ALL 16 ASSETS
   ========================================================= */

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  static const List<Map<String, String>> products = [
    {
      'name': 'Marine 6G',
      'image': 'assets/products/marine 6g.png',
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
      'name': 'Marine ProTab',
      'image': 'assets/products/marine protab.png',
    },
    {
      'name': 'Marine Vibrio Shield',
      'image': 'assets/products/Marine vibrio shield.png',
    },
    {
      'name': 'Marine White Shield',
      'image': 'assets/products/marine white shield.png',
    },
    {
      'name': 'Free Moult',
      'image': 'assets/products/Free moult.png',
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
      'name': 'Nutrimin',
      'image': 'assets/products/nutrimin.png',
    },
    {
      'name': 'OXYTAB Plus',
      'image': 'assets/products/oxytab plus.png',
    },
    {
      'name': 'Bio Soil',
      'image': 'assets/products/Bio soil.png',
    },
    {
      'name': 'Hi-Soft',
      'image': 'assets/products/Hi-Soft.png',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CustomScrollView(
        slivers: [
          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.fromLTRB(20, 20, 20, 14),
              child: Text(
                'Our Products',
                style: TextStyle(
                  color: marineBlue,
                  fontSize: 29,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 25),
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
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 0.78,
              ),
            ),
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
    return InkWell(
      borderRadius: BorderRadius.circular(24),
      onTap: () {
        showModalBottomSheet(
          context: context,
          backgroundColor: Colors.white,
          showDragHandle: true,
          builder: (_) => Padding(
            padding: const EdgeInsets.fromLTRB(24, 10, 24, 30),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: 180,
                  child: Image.asset(
                    image,
                    fit: BoxFit.contain,
                    errorBuilder: (_, __, ___) => const Icon(
                      Icons.image_not_supported,
                      size: 70,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  name,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: marineBlue,
                    fontSize: 23,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Product details, benefits, composition and dosage can be added here.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF52708A),
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.fromLTRB(10, 10, 10, 14),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24),
          border: Border.all(color: const Color(0xFFE1EDF2)),
        ),
        child: Column(
          children: [
            Expanded(
              child: Image.asset(
                image,
                fit: BoxFit.contain,
                errorBuilder: (_, __, ___) => Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(
                      Icons.image_not_supported_outlined,
                      color: Colors.grey,
                      size: 55,
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Image not found',
                      style: TextStyle(color: Colors.grey, fontSize: 11),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 7),
            Text(
              name,
              maxLines: 2,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                color: Color(0xFF087B9E),
                fontSize: 16,
                fontWeight: FontWeight.w900,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/* =========================================================
   MY PONDS
   ========================================================= */

class MyPondsScreen extends StatelessWidget {
  const MyPondsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(18, 22, 18, 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'My Ponds',
              style: TextStyle(
                color: marineBlue,
                fontSize: 29,
                fontWeight: FontWeight.w900,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Track your pond information and water parameters.',
              style: TextStyle(
                color: Color(0xFF52708A),
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 20),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(22),
              decoration: BoxDecoration(
                color: const Color(0xFFDDF8E8),
                borderRadius: BorderRadius.circular(22),
              ),
              child: const Column(
                children: [
                  Icon(
                    Icons.water,
                    color: Color(0xFF1689D7),
                    size: 55,
                  ),
                  SizedBox(height: 10),
                  Text(
                    'No pond added yet',
                    style: TextStyle(
                      color: marineBlue,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 6),
                  Text(
                    'Add your pond details to monitor your aquaculture activity.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF52708A),
                      fontSize: 13,
                    ),
                  ),
                  SizedBox(height: 18),
                  ElevatedButton(
                    onPressed: null,
                    child: Text('Add Pond'),
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

/* =========================================================
   SUPPORT
   ========================================================= */

class SupportScreen extends StatelessWidget {
  const SupportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(18, 22, 18, 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Support',
              style: TextStyle(
                color: marineBlue,
                fontSize: 29,
                fontWeight: FontWeight.w900,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Get help from the Marine Aqua Technologies team.',
              style: TextStyle(
                color: Color(0xFF52708A),
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 22),
            _supportCard(
              Icons.headset_mic,
              'Technical Support',
              'మా నిపుణుల బృందంతో సంప్రదించండి',
            ),
            _supportCard(
              Icons.phone,
              'Call Support',
              'Contact our support team for assistance.',
            ),
            _supportCard(
              Icons.location_on,
              'Dealer Support',
              'Find your nearest Marine Aqua dealer.',
            ),
            _supportCard(
              Icons.menu_book,
              'Aquaculture Guide',
              'Learn about pond management and shrimp culture.',
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
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 14),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0xFFE0EDF2)),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 28,
            backgroundColor: lightBlue,
            child: Icon(icon, color: marineBlue, size: 28),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: marineBlue,
                    fontSize: 18,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: const TextStyle(
                    color: Color(0xFF52708A),
                    fontSize: 12.5,
                  ),
                ),
              ],
            ),
          ),
          const Icon(
            Icons.arrow_forward_ios,
            color: brightBlue,
            size: 18,
          ),
        ],
      ),
    );
  }
}

/* =========================================================
   PROFILE
   ========================================================= */

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(18, 25, 18, 30),
        child: Column(
          children: [
            const CircleAvatar(
              radius: 45,
              backgroundColor: lightBlue,
              child: Icon(
                Icons.person,
                size: 55,
                color: marineBlue,
              ),
            ),
            const SizedBox(height: 14),
            const Text(
              'Marine Aqua User',
              style: TextStyle(
                color: marineBlue,
                fontSize: 23,
                fontWeight: FontWeight.w900,
              ),
            ),
            const SizedBox(height: 5),
            const Text(
              'Mobile login account',
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 25),
            _profileItem(Icons.person_outline, 'Personal Details'),
            _profileItem(Icons.notifications_none, 'Notifications'),
            _profileItem(Icons.language, 'Language'),
            _profileItem(Icons.privacy_tip_outlined, 'Privacy'),
            _profileItem(Icons.info_outline, 'About Marine Aqua'),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              height: 52,
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

  Widget _profileItem(IconData icon, String title) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(17),
        border: Border.all(color: const Color(0xFFE0EDF2)),
      ),
      child: Row(
        children: [
          Icon(icon, color: marineBlue),
          const SizedBox(width: 14),
          Expanded(
            child: Text(
              title,
              style: const TextStyle(
                color: marineBlue,
                fontSize: 15,
                fontWeight: FontWeight.w700,
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
'''

pubspec = r'''name: marine_aqua_technologies
description: MARINE AQUA TECHNOLOGIES - Smart Aquaculture. Better Results.
publish_to: "none"

version: 1.0.0+1

environment:
  sdk: ">=3.0.0 <4.0.0"

dependencies:
  flutter:
    sdk: flutter

  cupertino_icons: ^1.0.8

dev_dependencies:
  flutter_test:
    sdk: flutter
  flutter_lints: ^5.0.0

flutter:
  uses-material-design: true

  assets:
    - assets/products/
'''

Path("/mnt/data/main.dart").write_text(main_dart, encoding="utf-8")
Path("/mnt/data/pubspec.yaml").write_text(pubspec, encoding="utf-8")

print("Created:")
print("/mnt/data/main.dart")
print("/mnt/data/pubspec.yaml")
print("main.dart lines:", len(main_dart.splitlines()))
print("pubspec.yaml lines:", len(pubspec.splitlines()))
