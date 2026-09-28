import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MarineAquaApp());
}

// ============================================================
// COLORS
// ============================================================

const Color marineBlue = Color(0xFF075985);
const Color marineBlueDark = Color(0xFF064E7A);
const Color marineCyan = Color(0xFF129BCB);
const Color pageBg = Color(0xFFF4FAFD);

// ============================================================
// APP
// ============================================================

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
        colorScheme: ColorScheme.fromSeed(
          seedColor: marineBlue,
        ),
      ),
      home: const SplashScreen(),
    );
  }
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
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/logo.png',
                width: 180,
                height: 180,
                fit: BoxFit.contain,
                errorBuilder: (_, __, ___) {
                  return const Icon(
                    Icons.water_drop,
                    size: 120,
                    color: marineCyan,
                  );
                },
              ),

              const SizedBox(height: 25),

              const Text(
                'ఆక్వా సాగులో ప్రతి దశలో... మీకు తోడుగా',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: marineBlueDark,
                ),
              ),

              const SizedBox(height: 12),

              const Text(
                'Marine Aqua Technologies',
                style: TextStyle(
                  fontSize: 19,
                  color: marineBlue,
                ),
              ),

              const SizedBox(height: 35),

              const CircularProgressIndicator(
                color: marineCyan,
                strokeWidth: 3,
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

  bool get isValidMobile =>
      mobileController.text.trim().length == 10;

  @override
  void dispose() {
    mobileController.dispose();
    super.dispose();
  }

  void sendOtp() {
    if (!isValidMobile) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'దయచేసి 10-digit mobile number నమోదు చేయండి',
          ),
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
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(
            horizontal: 28,
            vertical: 24,
          ),
          child: Column(
            children: [
              const SizedBox(height: 15),

              Image.asset(
                'assets/logo.png',
                width: 145,
                height: 145,
                fit: BoxFit.contain,
              ),

              const SizedBox(height: 15),

              const Text(
                'ఆక్వా సాగులో ప్రతి దశలో... మీకు తోడుగా',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: marineBlueDark,
                ),
              ),

              const SizedBox(height: 8),

              const Text(
                'Marine Aqua Technologies',
                style: TextStyle(
                  fontSize: 18,
                  color: marineBlue,
                ),
              ),

              const SizedBox(height: 55),

              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Enter Your Mobile Number',
                  style: TextStyle(
                    fontSize: 27,
                    fontWeight: FontWeight.bold,
                    color: marineBlueDark,
                  ),
                ),
              ),

              const SizedBox(height: 10),

              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'We will send a 6-digit OTP to verify\nyour mobile number.',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                    height: 1.4,
                  ),
                ),
              ),

              const SizedBox(height: 25),

              TextField(
                controller: mobileController,
                keyboardType: TextInputType.phone,
                maxLength: 10,
                onChanged: (_) {
                  setState(() {});
                },
                decoration: InputDecoration(
                  counterText: '',
                  hintText: 'Enter 10-digit number',
                  prefixIcon: const Icon(
                    Icons.phone_android,
                    color: marineCyan,
                  ),
                  filled: true,
                  fillColor: const Color(0xFFF8FCFE),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(18),
                    borderSide: const BorderSide(
                      color: Color(0xFFB7E3EF),
                      width: 1.5,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(18),
                    borderSide: const BorderSide(
                      color: marineCyan,
                      width: 2,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 18),

              SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  onPressed: isValidMobile ? sendOtp : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: marineCyan,
                    disabledBackgroundColor: Colors.grey.shade300,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: const Text(
                    'Send OTP  →',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 55),

              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  LoginFeature(
                    icon: Icons.verified_user,
                    title: 'Secure\nLogin',
                  ),
                  LoginFeature(
                    icon: Icons.eco,
                    title: 'Trusted by\nAqua Farmers',
                  ),
                  LoginFeature(
                    icon: Icons.groups,
                    title: 'Better\nTogether',
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ============================================================
// LOGIN FEATURE
// ============================================================

class LoginFeature extends StatelessWidget {
  final IconData icon;
  final String title;

  const LoginFeature({
    super.key,
    required this.icon,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
          size: 38,
          color: marineCyan,
        ),
        const SizedBox(height: 8),
        Text(
          title,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 13,
            color: Colors.grey,
          ),
        ),
      ],
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

  bool get isValidOtp =>
      otpController.text.trim().length == 6;

  @override
  void dispose() {
    otpController.dispose();
    super.dispose();
  }

  void verifyOtp() {
    if (!isValidOtp) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('6-digit OTP నమోదు చేయండి'),
        ),
      );
      return;
    }

    // DEMO OTP
    if (otpController.text.trim() != '123456') {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Demo OTP: 123456'),
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
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(
            horizontal: 28,
            vertical: 20,
          ),
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.arrow_back,
                    size: 30,
                  ),
                ),
              ),

              const SizedBox(height: 5),

              Image.asset(
                'assets/logo.png',
                width: 120,
                height: 120,
                fit: BoxFit.contain,
              ),

              const SizedBox(height: 18),

              const Text(
                'Verify OTP',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: marineBlueDark,
                ),
              ),

              const SizedBox(height: 10),

              Text(
                'Enter the 6-digit OTP sent to\n'
                '+91 ${widget.mobileNumber}',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                  height: 1.4,
                ),
              ),

              const SizedBox(height: 35),

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
                onChanged: (_) {
                  setState(() {});
                },
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
                      color: marineCyan,
                      width: 2,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 18),

              SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  onPressed: isValidOtp ? verifyOtp : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: marineCyan,
                    disabledBackgroundColor: Colors.grey.shade300,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: const Text(
                    'Verify OTP  →',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 35),

              const Text(
                'Demo OTP: 123456',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 13,
                ),
              ),

              const SizedBox(height: 25),

              TextButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('OTP resend requested'),
                    ),
                  );
                },
                child: const Text(
                  'Resend OTP',
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: marineCyan,
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

class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({super.key});

  @override
  State<MainNavigationScreen> createState() =>
      _MainNavigationScreenState();
}

class _MainNavigationScreenState
    extends State<MainNavigationScreen> {
  int currentIndex = 0;

  final List<Widget> pages = const [
    HomeScreen(),
    ProductsScreen(),
    SupportScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: currentIndex,
        children: pages,
      ),
      bottomNavigationBar: NavigationBar(
        height: 75,
        selectedIndex: currentIndex,
        backgroundColor: Colors.white,
        indicatorColor: const Color(0xFFD9F3FC),
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
// HOME SCREEN
// ============================================================

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: pageBg,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            const SliverToBoxAdapter(
              child: HomeHeader(),
            ),

            SliverPadding(
              padding: const EdgeInsets.fromLTRB(
                16,
                12,
                16,
                30,
              ),
              sliver: SliverList(
                delegate: SliverChildListDelegate(
                  [
                    const HeroBanner(),

                    const SizedBox(height: 20),

                    const QuickActionsTitle(),

                    const SizedBox(height: 12),

                    const QuickActions(),

                    const SizedBox(height: 22),

                    const WaterQualitySection(),

                    const SizedBox(height: 22),

                    const ProblemsSection(),

                    const SizedBox(height: 20),
                  ],
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
// HOME HEADER
// ============================================================

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.fromLTRB(
        16,
        12,
        12,
        12,
      ),
      child: Row(
        children: [
          Image.asset(
            'assets/logo.png',
            width: 58,
            height: 58,
            fit: BoxFit.contain,
          ),

          const SizedBox(width: 10),

          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'MARINE AQUA',
                  style: TextStyle(
                    fontSize: 21,
                    fontWeight: FontWeight.bold,
                    color: marineBlueDark,
                    letterSpacing: 0.3,
                  ),
                ),

                Text(
                  'TECHNOLOGIES',
                  style: TextStyle(
                    fontSize: 21,
                    fontWeight: FontWeight.bold,
                    color: marineBlueDark,
                    letterSpacing: 0.3,
                  ),
                ),

                SizedBox(height: 3),

                Text(
                  'ఆక్వా సాగులో ప్రతి దశలో... మీకు తోడుగా',
                  style: TextStyle(
                    fontSize: 9.5,
                    fontWeight: FontWeight.bold,
                    color: marineBlueDark,
                  ),
                ),

                SizedBox(height: 2),

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

          IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (_) {
                  return const AlertDialog(
                    title: Text('Notifications'),
                    content: Text(
                      'ప్రస్తుతం కొత్త notifications ఏమీ లేవు.',
                    ),
                  );
                },
              );
            },
            icon: const Icon(
              Icons.notifications_none,
              size: 30,
              color: marineBlueDark,
            ),
          ),
        ],
      ),
    );
  }
}

// ============================================================
// HERO BANNER
// ============================================================

class HeroBanner extends StatelessWidget {
  const HeroBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(24),
      child: SizedBox(
        width: double.infinity,
        height: 265,
        child: Image.asset(
          'assets/hero_banner.png',
          fit: BoxFit.cover,
          errorBuilder: (_, __, ___) {
            return Container(
              color: Colors.grey.shade300,
              alignment: Alignment.center,
              child: const Text(
                'Hero Banner Image Not Found',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 16,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

// ============================================================
// QUICK ACTIONS TITLE
// ============================================================

class QuickActionsTitle extends StatelessWidget {
  const QuickActionsTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
          child: Text(
            'ఆక్వా సమాచారం',
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
              color: marineBlueDark,
            ),
          ),
        ),

        Icon(
          Icons.arrow_forward,
          size: 30,
          color: marineCyan,
        ),
      ],
    );
  }
}

// ============================================================
// QUICK ACTIONS - 3 IMAGE CARDS
// ============================================================

class QuickActions extends StatelessWidget {
  const QuickActions({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 170,
      child: ListView(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        children: const [
          QuickImageCard(
            image:
                'assets/shortcut_card_1_royyala_sagu_guide.png',
          ),

          SizedBox(width: 12),

          QuickImageCard(
            image:
                'assets/shortcut_card_2_biomass_calculator.png',
          ),

          SizedBox(width: 12),

          QuickImageCard(
            image:
                'assets/shortcut_card_3_royyala_vyadhulu.png',
          ),
        ],
      ),
    );
  }
}

// ============================================================
// QUICK IMAGE CARD
// ============================================================

class QuickImageCard extends StatelessWidget {
  final String image;

  const QuickImageCard({
    super.key,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 205,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      clipBehavior: Clip.antiAlias,
      child: Image.asset(
        image,
        fit: BoxFit.cover,
        errorBuilder: (_, __, ___) {
          return Container(
            color: Colors.white,
            alignment: Alignment.center,
            child: const Icon(
              Icons.image_not_supported_outlined,
              size: 50,
              color: Colors.grey,
            ),
          );
        },
      ),
    );
  }
}

// ============================================================
// WATER QUALITY SECTION
// ============================================================

class WaterQualitySection extends StatelessWidget {
  const WaterQualitySection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(
        16,
        18,
        16,
        18,
      ),
      decoration: BoxDecoration(
        color: const Color(0xFFE9F8FD),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: const Color(0xFFB7E3EF),
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
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: marineBlueDark,
                  ),
                ),
              ),

              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.edit,
                  color: marineCyan,
                  size: 28,
                ),
              ),
            ],
          ),

          const SizedBox(height: 12),

          Row(
            children: const [
              Expanded(
                child: WaterCard(
                  icon: Icons.science_outlined,
                  title: 'pH',
                  value: '7.8',
                  unit: '',
                  range: '(6.5 - 8.5)',
                ),
              ),

              SizedBox(width: 8),

              Expanded(
                child: WaterCard(
                  icon: Icons.waves,
                  title: 'Salinity',
                  value: '18',
                  unit: 'ppt',
                  range: '(10 - 25)',
                ),
              ),

              SizedBox(width: 8),

              Expanded(
                child: WaterCard(
                  icon: Icons.air,
                  title: 'DO',
                  value: '5.6',
                  unit: 'mg/L',
                  range: '(≥ 5.0)',
                ),
              ),

              SizedBox(width: 8),

              Expanded(
                child: WaterCard(
                  icon: Icons.science,
                  title: 'Alkalinity',
                  value: '140',
                  unit: 'ppm',
                  range: '(80 - 200)',
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
// WATER CARD
// ============================================================

class WaterCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;
  final String unit;
  final String range;

  const WaterCard({
    super.key,
    required this.icon,
    required this.title,
    required this.value,
    required this.unit,
    required this.range,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 165,
      padding: const EdgeInsets.symmetric(
        horizontal: 5,
        vertical: 12,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 31,
            color: marineCyan,
          ),

          const SizedBox(height: 8),

          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.bold,
              color: marineBlueDark,
            ),
          ),

          const SizedBox(height: 5),

          Text(
            value,
            style: const TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: marineBlueDark,
            ),
          ),

          if (unit.isNotEmpty)
            Text(
              unit,
              style: const TextStyle(
                fontSize: 11,
                color: Colors.grey,
              ),
            ),

          const SizedBox(height: 4),

          Text(
            range,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 9,
              color: Colors.grey,
            ),
          ),

          const SizedBox(height: 5),

          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 4,
            ),
            decoration: BoxDecoration(
              color: const Color(0xFFD6F6E2),
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Text(
              'సరైనది',
              style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.bold,
                color: Color(0xFF159447),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ============================================================
// PROBLEMS SECTION
// ============================================================

class ProblemsSection extends StatelessWidget {
  const ProblemsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(
        16,
        18,
        16,
        20,
      ),
      decoration: BoxDecoration(
        color: const Color(0xFFE9F8FD),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: const Color(0xFFB7E3EF),
          width: 1.5,
        ),
      ),
      child: Column(
        children: [
          Row(
            children: [
              const Expanded(
                child: Text(
                  'Find Your Problems',
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: marineBlueDark,
                  ),
                ),
              ),

              Container(
                width: 52,
                height: 52,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: const Icon(
                  Icons.manage_search,
                  color: marineCyan,
                  size: 30,
                ),
              ),
            ],
          ),

          const SizedBox(height: 8),

          const Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'మీ చెరువులో ఉన్న సమస్యను ఎంచుకోండి',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
          ),

          const SizedBox(height: 18),

          Row(
            children: const [
              Expanded(
                child: ProblemCard(
                  icon: Icons.bug_report_outlined,
                  title: 'Vibrio',
                  subtitle: 'Vibrio problem',
                ),
              ),
              SizedBox(width: 12),
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
            children: const [
              Expanded(
                child: ProblemCard(
                  icon: Icons.trending_down,
                  title: 'Slow Growth',
                  subtitle: 'Growth problem',
                ),
              ),
              SizedBox(width: 12),
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
            children: const [
              Expanded(
                child: ProblemCard(
                  icon: Icons.shield_outlined,
                  title: 'Soft Shell',
                  subtitle: 'Shell problem',
                ),
              ),
              SizedBox(width: 12),
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
    return InkWell(
      borderRadius: BorderRadius.circular(20),
      onTap: () {
        showDialog(
          context: context,
          builder: (_) {
            return AlertDialog(
              title: Text(title),
              content: Text(
                '$subtitle\n\n'
                'త్వరలో ఈ సమస్యకు సంబంధించిన పూర్తి సమాచారం '
                'మరియు పరిష్కారాలు ఇక్కడ అందుబాటులో ఉంటాయి.',
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('OK'),
                ),
              ],
            );
          },
        );
      },
      child: Container(
        height: 145,
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 38,
              color: marineCyan,
            ),

            const SizedBox(height: 10),

            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
                color: marineBlueDark,
              ),
            ),

            const SizedBox(height: 5),

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
      ),
    );
  }
}

// ============================================================
// PRODUCTS SCREEN
// ============================================================

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  static const List<Map<String, String>> products = [
    {
      'name': 'Bio Sludge-X',
      'image': 'assets/bio sludge -x.png',
    },
    {
      'name': 'Free Moult',
      'image': 'assets/free moult.png',
    },
    {
      'name': 'Marine 6G',
      'image': 'assets/marine 6g.png',
    },
    {
      'name': 'White Shield',
      'image': 'assets/white shield.png',
    },
    {
      'name': 'OXYTAB',
      'image': 'assets/oxytab.png',
    },
    {
      'name': 'ProTab',
      'image': 'assets/protab.png',
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
      'name': 'Vibrio Shield',
      'image': 'assets/vibrio shield.png',
    },
    {
      'name': 'Volt-X',
      'image': 'assets/volt-x.png',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: pageBg,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Marine Products',
          style: TextStyle(
            color: marineBlueDark,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: products.length,
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          childAspectRatio: 0.78,
        ),
        itemBuilder: (context, index) {
          final product = products[index];

          return Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 8,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Column(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Image.asset(
                      product['image']!,
                      fit: BoxFit.contain,
                      errorBuilder: (_, __, ___) {
                        return const Icon(
                          Icons.image_not_supported_outlined,
                          size: 50,
                          color: Colors.grey,
                        );
                      },
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.fromLTRB(
                    8,
                    0,
                    8,
                    14,
                  ),
                  child: Text(
                    product['name']!,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: marineBlueDark,
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
// SUPPORT SCREEN
// ============================================================

class SupportScreen extends StatelessWidget {
  const SupportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: pageBg,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Support',
          style: TextStyle(
            color: marineBlueDark,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const SizedBox(height: 20),

            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                color: const Color(0xFFDDF5FC),
                borderRadius: BorderRadius.circular(50),
              ),
              child: const Icon(
                Icons.headset_mic,
                size: 55,
                color: marineCyan,
              ),
            ),

            const SizedBox(height: 20),

            const Text(
              'Marine Aqua Technologies',
              style: TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.bold,
                color: marineBlueDark,
              ),
            ),

            const SizedBox(height: 8),

            const Text(
              'మేము మీకు సహాయం చేయడానికి సిద్ధంగా ఉన్నాము',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),

            const SizedBox(height: 30),

            SupportButton(
              icon: Icons.phone,
              title: 'Call Support',
              subtitle: 'మాతో మాట్లాడండి',
              onTap: () {},
            ),

            const SizedBox(height: 12),

            SupportButton(
              icon: Icons.chat,
              title: 'WhatsApp Support',
              subtitle: 'WhatsApp ద్వారా సంప్రదించండి',
              onTap: () {},
            ),

            const SizedBox(height: 12),

            SupportButton(
              icon: Icons.location_on,
              title: 'Technical Officer',
              subtitle: 'మీ ప్రాంత Technical Officer ను సంప్రదించండి',
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}

// ============================================================
// SUPPORT BUTTON
// ============================================================

class SupportButton extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  const SupportButton({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(20),
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(17),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            Container(
              width: 55,
              height: 55,
              decoration: BoxDecoration(
                color: const Color(0xFFE1F5FB),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Icon(
                icon,
                color: marineCyan,
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
                      fontWeight: FontWeight.bold,
                      color: marineBlueDark,
                    ),
                  ),
                  const SizedBox(height: 4),
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
              color: marineCyan,
            ),
          ],
        ),
      ),
    );
  }
}
