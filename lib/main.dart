import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MarineAquaApp());
}

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
        scaffoldBackgroundColor: const Color(0xFFF4FAFD),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF087DA8),
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
      backgroundColor: const Color(0xFFF4FAFD),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/products/marine logo.png',
                width: 185,
                height: 185,
                fit: BoxFit.contain,
                errorBuilder: (_, __, ___) {
                  return const Icon(
                    Icons.water,
                    size: 110,
                    color: Color(0xFF0799C6),
                  );
                },
              ),

              const SizedBox(height: 22),

              const Text(
                'MARINE AQUA',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w800,
                  color: Color(0xFF086F96),
                ),
              ),

              const Text(
                'TECHNOLOGIES',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w800,
                  color: Color(0xFF086F96),
                ),
              ),

              const SizedBox(height: 10),

              const Text(
                'ఆక్వా సాగులో ప్రతి దశలో... మీకు తోడుగా',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF075078),
                ),
              ),

              const SizedBox(height: 8),

              const Text(
                'Smart Aquaculture. Better Results.',
                style: TextStyle(
                  fontSize: 13,
                  color: Colors.grey,
                ),
              ),

              const SizedBox(height: 35),

              const SizedBox(
                width: 28,
                height: 28,
                child: CircularProgressIndicator(
                  strokeWidth: 3,
                  color: Color(0xFF0A91BA),
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
// LOGIN
// ============================================================

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController mobileController =
      TextEditingController();

  bool get isValidMobile {
    return mobileController.text.trim().length == 10;
  }

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
      backgroundColor: const Color(0xFFF4FAFD),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(28, 20, 28, 25),
          child: Column(
            children: [
              const SizedBox(height: 5),

              Image.asset(
                'assets/products/marine logo.png',
                width: 135,
                height: 135,
                fit: BoxFit.contain,
              ),

              const SizedBox(height: 10),

              const Text(
                'MARINE AQUA',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w800,
                  color: Color(0xFF086F96),
                ),
              ),

              const Text(
                'TECHNOLOGIES',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w800,
                  color: Color(0xFF086F96),
                ),
              ),

              const SizedBox(height: 8),

              const Text(
                'ఆక్వా సాగులో ప్రతి దశలో... మీకు తోడుగా',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF075078),
                ),
              ),

              const SizedBox(height: 5),

              const Text(
                'Smart Aquaculture. Better Results.',
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey,
                ),
              ),

              const SizedBox(height: 42),

              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(22),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(28),
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
                      'Welcome Back',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.w800,
                        color: Color(0xFF075078),
                      ),
                    ),

                    const SizedBox(height: 5),

                    const Text(
                      'Login with your mobile number',
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.grey,
                      ),
                    ),

                    const SizedBox(height: 22),

                    TextField(
                      controller: mobileController,
                      keyboardType: TextInputType.phone,
                      maxLength: 10,
                      onChanged: (_) {
                        setState(() {});
                      },
                      decoration: InputDecoration(
                        counterText: '',
                        hintText: 'Enter mobile number',
                        prefixIcon: const Icon(
                          Icons.phone_android,
                          color: Color(0xFF087DA8),
                        ),
                        filled: true,
                        fillColor: const Color(0xFFEAF8FC),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(18),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),

                    const SizedBox(height: 15),

                    SizedBox(
                      width: double.infinity,
                      height: 55,
                      child: ElevatedButton(
                        onPressed:
                            isValidMobile ? sendOtp : null,
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color(0xFF087DA8),
                          foregroundColor: Colors.white,
                          disabledBackgroundColor:
                              Colors.grey.shade300,
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(28),
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

              const SizedBox(height: 28),

              const Row(
                mainAxisAlignment:
                    MainAxisAlignment.spaceAround,
                children: [
                  LoginFeature(
                    icon: Icons.verified_user,
                    title: 'Secure Login',
                  ),
                  LoginFeature(
                    icon: Icons.eco,
                    title: 'Aqua Farming',
                  ),
                  LoginFeature(
                    icon: Icons.support_agent,
                    title: 'Expert Support',
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
          size: 32,
          color: const Color(0xFF0A91BA),
        ),
        const SizedBox(height: 7),
        Text(
          title,
          style: const TextStyle(
            fontSize: 11,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}

// ============================================================
// OTP
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

  bool get isValidOtp {
    return otpController.text.trim().length == 6;
  }

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

    // LOCAL DEMO OTP
    if (otpController.text.trim() != '123456') {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Demo OTP తప్పు. OTP: 123456'),
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
      backgroundColor: const Color(0xFFF4FAFD),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(28, 15, 28, 25),
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
                    size: 28,
                  ),
                ),
              ),

              const SizedBox(height: 5),

              Image.asset(
                'assets/products/marine logo.png',
                width: 115,
                height: 115,
              ),

              const SizedBox(height: 12),

              const Text(
                'Verify OTP',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w800,
                  color: Color(0xFF075078),
                ),
              ),

              const SizedBox(height: 8),

              Text(
                'Enter the 6-digit OTP sent to\n'
                '+91 ${widget.mobileNumber}',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                  height: 1.4,
                ),
              ),

              const SizedBox(height: 28),

              TextField(
                controller: otpController,
                keyboardType: TextInputType.number,
                maxLength: 6,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 24,
                  letterSpacing: 7,
                  fontWeight: FontWeight.bold,
                ),
                onChanged: (_) {
                  setState(() {});
                },
                decoration: InputDecoration(
                  counterText: '',
                  hintText: 'Enter OTP',
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(18),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),

              const SizedBox(height: 15),

              SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                  onPressed: isValidOtp ? verifyOtp : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        const Color(0xFF087DA8),
                    foregroundColor: Colors.white,
                    disabledBackgroundColor:
                        Colors.grey.shade300,
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(28),
                    ),
                  ),
                  child: const Text(
                    'VERIFY OTP',
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 25),

              const Text(
                'Demo OTP: 123456',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 13,
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
        height: 76,
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

// ============================================================
// HOME SCREEN
// ============================================================

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4FAFD),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            const SliverToBoxAdapter(
              child: HomeHeader(),
            ),

            SliverPadding(
              padding: const EdgeInsets.fromLTRB(
                16,
                10,
                16,
                25,
              ),
              sliver: SliverList(
                delegate: SliverChildListDelegate(
                  [
                    const HeroBanner(),

                    const SizedBox(height: 16),

                    const QuickActions(),

                    const SizedBox(height: 18),

                    const WaterQualitySection(),

                    const SizedBox(height: 20),

                    const HomeProductsSection(),

                    const SizedBox(height: 20),

                    const TechnicalSupportCard(),

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
      padding: const EdgeInsets.fromLTRB(
        12,
        10,
        10,
        8,
      ),
      color: const Color(0xFFF4FAFD),
      child: Row(
        children: [
          Container(
            width: 62,
            height: 62,
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(17),
            ),
            child: Image.asset(
              'assets/products/marine logo.png',
              fit: BoxFit.contain,
            ),
          ),

          const SizedBox(width: 10),

          const Expanded(
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start,
              children: [
                Text(
                  'MARINE AQUA',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                    color: Color(0xFF08749A),
                  ),
                ),
                Text(
                  'TECHNOLOGIES',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                    color: Color(0xFF08749A),
                  ),
                ),
                SizedBox(height: 2),
                Text(
                  'Smart Aquaculture. Better Results.',
                  style: TextStyle(
                    fontSize: 11,
                    color: Color(0xFF2E5668),
                  ),
                ),
              ],
            ),
          ),

          IconButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text(
                    'ప్రస్తుతం కొత్త notifications ఏమీ లేవు.',
                  ),
                ),
              );
            },
            icon: const Icon(
              Icons.notifications_none,
              size: 29,
              color: Color(0xFF075078),
            ),
          ),

          Container(
            width: 52,
            height: 52,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0xFFDDF3FA),
            ),
            child: const Icon(
              Icons.person,
              size: 29,
              color: Color(0xFF08749A),
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
      borderRadius: BorderRadius.circular(26),
      child: SizedBox(
        width: double.infinity,
        height: 275,
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(
              'assets/shrimp_hero.jpg',
              fit: BoxFit.cover,
            ),

            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [
                    Colors.black.withOpacity(0.72),
                    Colors.black.withOpacity(0.35),
                    Colors.transparent,
                  ],
                ),
              ),
            ),

            const Padding(
              padding: EdgeInsets.fromLTRB(
                20,
                22,
                20,
                18,
              ),
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start,
                mainAxisAlignment:
                    MainAxisAlignment.center,
                children: [
                  Text(
                    'Healthy Ponds',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.w800,
                      height: 1.05,
                    ),
                  ),

                  Text(
                    'Stronger Shrimp',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.w800,
                      height: 1.05,
                    ),
                  ),

                  Text(
                    'Higher Profits',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.w800,
                      height: 1.05,
                    ),
                  ),

                  SizedBox(height: 13),

                  Text(
                    'Complete Aquaculture Solutions\n'
                    'for a Better Tomorrow',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      height: 1.35,
                    ),
                  ),

                  SizedBox(height: 13),

                  SizedBox(
                    height: 46,
                    child: ElevatedButton(
                      onPressed: null,
                      style: ButtonStyle(
                        backgroundColor:
                            WidgetStatePropertyAll(
                          Colors.white,
                        ),
                        foregroundColor:
                            WidgetStatePropertyAll(
                          Color(0xFF075078),
                        ),
                        shape:
                            WidgetStatePropertyAll(
                          RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(
                              Radius.circular(14),
                            ),
                          ),
                        ),
                      ),
                      child: Text(
                        'Explore Products  →',
                        style: TextStyle(
                          fontSize: 15,
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
    );
  }
}

// ============================================================
// QUICK ACTION IMAGE CARDS
// ============================================================

class QuickActions extends StatelessWidget {
  const QuickActions({super.key});

  static const List<Map<String, String>> cards = [
    {
      'image': 'assets/success_stories/story1.jpg',
      'title': 'రొయ్యల సాగు గైడ్',
      'subtitle':
          'రొయ్యల సాగులో ముఖ్యమైన సూచనలు తెలుసుకోండి.',
    },
    {
      'image': 'assets/success_stories/story2.jpg',
      'title': 'బయోమాస్ కాలిక్యులేటర్',
      'subtitle':
          'మీ చెరువులో బయోమాస్‌ను సులభంగా తెలుసుకోండి.',
    },
    {
      'image': 'assets/success_stories/story3.jpg',
      'title': 'రొయ్యల వ్యాధులు',
      'subtitle':
          'సాధారణ రొయ్యల వ్యాధులను గుర్తించి నివారించండి.',
    },
    {
      'image': 'assets/success_stories/story4.jpg',
      'title': 'టిప్స్ ఆఫ్ ది డే',
      'subtitle':
          'ప్రతి రోజు ఆక్వా సాగుకు ఉపయోగపడే ముఖ్యమైన టిప్స్.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics:
          const NeverScrollableScrollPhysics(),
      itemCount: cards.length,
      gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: 0.82,
      ),
      itemBuilder: (context, index) {
        final card = cards[index];

        return ImageHomeCard(
          image: card['image']!,
          title: card['title']!,
          subtitle: card['subtitle']!,
        );
      },
    );
  }
}

// ============================================================
// IMAGE HOME CARD
// ============================================================

class ImageHomeCard extends StatelessWidget {
  final String image;
  final String title;
  final String subtitle;

  const ImageHomeCard({
    super.key,
    required this.image,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(23),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 9,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment:
            CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 6,
            child: Image.asset(
              image,
              width: double.infinity,
              fit: BoxFit.cover,
              errorBuilder: (_, __, ___) {
                return Container(
                  color: const Color(0xFFEAF7FC),
                  child: const Center(
                    child: Icon(
                      Icons.image_outlined,
                      size: 42,
                      color: Color(0xFF087DA8),
                    ),
                  ),
                );
              },
            ),
          ),

          Expanded(
            flex: 4,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(
                12,
                9,
                12,
                8,
              ),
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    maxLines: 1,
                    overflow:
                        TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w800,
                      color: Color(0xFF075078),
                    ),
                  ),

                  const SizedBox(height: 4),

                  Text(
                    subtitle,
                    maxLines: 2,
                    overflow:
                        TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 11.5,
                      height: 1.3,
                      color: Colors.grey,
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

// ============================================================
// WATER QUALITY
// ============================================================

class WaterQualitySection extends StatelessWidget {
  const WaterQualitySection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(
        14,
        14,
        14,
        15,
      ),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            Color(0xFFDDF5FF),
            Color(0xFFF0FAFF),
          ],
        ),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: const Color(0xFFB5E5FA),
        ),
      ),
      child: Column(
        crossAxisAlignment:
            CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Expanded(
                child: Text(
                  'చెరువు నీటి పరిస్థితులు',
                  style: TextStyle(
                    color: Color(0xFF075078),
                    fontSize: 21,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),

              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.edit,
                  color: Color(0xFF0B79B2),
                  size: 20,
                ),
              ),
            ],
          ),

          const SizedBox(height: 7),

          Row(
            children: [
              Expanded(
                child: ParameterCard(
                  icon: Icons.science_outlined,
                  name: 'pH',
                  value: '7.8',
                  unit: '',
                  range: '6.5 - 8.5',
                ),
              ),

              const SizedBox(width: 6),

              Expanded(
                child: ParameterCard(
                  icon: Icons.water_outlined,
                  name: 'Salinity',
                  value: '18',
                  unit: 'ppt',
                  range: '10 - 25',
                ),
              ),

              const SizedBox(width: 6),

              Expanded(
                child: ParameterCard(
                  icon: Icons.air,
                  name: 'DO',
                  value: '5.6',
                  unit: 'mg/L',
                  range: '≥ 5.0',
                ),
              ),

              const SizedBox(width: 6),

              Expanded(
                child: ParameterCard(
                  icon: Icons.science,
                  name: 'Alkalinity',
                  value: '140',
                  unit: 'ppm',
                  range: '80 - 200',
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
// PARAMETER CARD
// ============================================================

class ParameterCard extends StatelessWidget {
  final IconData icon;
  final String name;
  final String value;
  final String unit;
  final String range;

  const ParameterCard({
    super.key,
    required this.icon,
    required this.name,
    required this.value,
    required this.unit,
    required this.range,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 4,
        vertical: 10,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(17),
      ),
      child: Column(
        children: [
          Icon(
            icon,
            size: 23,
            color: const Color(0xFF149AD6),
          ),

          const SizedBox(height: 4),

          Text(
            name,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Color(0xFF075078),
              fontWeight: FontWeight.bold,
              fontSize: 10,
            ),
          ),

          const SizedBox(height: 2),

          Text(
            value,
            style: const TextStyle(
              color: Color(0xFF075078),
              fontSize: 20,
              fontWeight: FontWeight.w800,
            ),
          ),

          Text(
            unit,
            style: const TextStyle(
              color: Colors.grey,
              fontSize: 8,
            ),
          ),

          const SizedBox(height: 2),

          Text(
            '($range)',
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.grey,
              fontSize: 7,
            ),
          ),

          const SizedBox(height: 5),

          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 7,
              vertical: 3,
            ),
            decoration: BoxDecoration(
              color: const Color(0xFFC8F2D5),
              borderRadius:
                  BorderRadius.circular(20),
            ),
            child: const Text(
              'సరైనది',
              style: TextStyle(
                color: Color(0xFF188044),
                fontSize: 7,
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
// HOME PRODUCTS
// ============================================================

class HomeProductsSection extends StatelessWidget {
  const HomeProductsSection({super.key});

  static const List<Map<String, String>>
      products = [
    {
      'name': 'Marine 6G',
      'image':
          'assets/products/marine 6g.png',
    },
    {
      'name': 'Marine ProTab',
      'image':
          'assets/products/marine protab.png',
    },
    {
      'name': 'Marine Vibrio Shield',
      'image':
          'assets/products/marine vibrio shield.png',
    },
    {
      'name': 'Marine Volt-X',
      'image':
          'assets/products/marine volt-x.png',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const Text(
              'Featured Products',
              style: TextStyle(
                color: Color(0xFF075078),
                fontSize: 24,
                fontWeight: FontWeight.w800,
              ),
            ),

            const Spacer(),

            TextButton(
              onPressed: () {},
              child: const Text(
                'View All →',
                style: TextStyle(
                  color: Color(0xFF0877AC),
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
              ),
            ),
          ],
        ),

        const SizedBox(height: 3),

        GridView.builder(
          shrinkWrap: true,
          physics:
              const NeverScrollableScrollPhysics(),
          itemCount: products.length,
          gridDelegate:
              const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 0.88,
          ),
          itemBuilder: (context, index) {
            return ProductCard(
              image: products[index]['image']!,
              name: products[index]['name']!,
            );
          },
        ),
      ],
    );
  }
}

// ============================================================
// PRODUCT CARD
// ============================================================

class ProductCard extends StatelessWidget {
  final String image;
  final String name;

  const ProductCard({
    super.key,
    required this.image,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(9),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: const Color(0xFFE0EEF5),
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
                  size: 55,
                  color: Color(0xFF075985),
                );
              },
            ),
          ),

          const SizedBox(height: 5),

          Text(
            name,
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 13,
              color: Color(0xFF064E7A),
            ),
          ),

          const SizedBox(height: 7),

          Container(
            width: double.infinity,
            padding:
                const EdgeInsets.symmetric(
              vertical: 6,
            ),
            decoration: BoxDecoration(
              color: const Color(0xFFE1F4FD),
              borderRadius:
                  BorderRadius.circular(20),
            ),
            child: const Text(
              'View Details',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFF075078),
                fontSize: 10,
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
// TECHNICAL SUPPORT CARD
// ============================================================

class TechnicalSupportCard
    extends StatelessWidget {
  const TechnicalSupportCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(22),
        gradient: const LinearGradient(
          colors: [
            Color(0xFFDFF4FF),
            Color(0xFFEAF9FF),
          ],
        ),
      ),
      child: Row(
        children: [
          const Icon(
            Icons.headset_mic,
            size: 45,
            color: Color(0xFF075985),
          ),

          const SizedBox(width: 12),

          const Expanded(
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start,
              children: [
                Text(
                  'టెక్నికల్ సపోర్ట్',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF064E7A),
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  'మా నిపుణుల బృందంతో సంప్రదించండి',
                  style: TextStyle(
                    fontSize: 11.5,
                    color: Colors.black87,
                  ),
                ),
              ],
            ),
          ),

          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              foregroundColor:
                  const Color(0xFF075985),
              elevation: 1,
              padding:
                  const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 9,
              ),
              shape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.circular(22),
              ),
            ),
            child: const Text(
              'సంప్రదించండి',
              style: TextStyle(
                fontSize: 11,
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
// PRODUCTS SCREEN - 16 PRODUCTS
// ============================================================

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  static const List<Map<String, String>>
      products = [
    {
      'name': 'Marine 6G',
      'image':
          'assets/products/marine 6g.png',
    },
    {
      'name': 'Marine Volt-X',
      'image':
          'assets/products/marine volt-x.png',
    },
    {
      'name': 'Bio Sludge-X',
      'image':
          'assets/products/Bio sludge.png',
    },
    {
      'name': 'Marine ProTab',
      'image':
          'assets/products/marine protab.png',
    },
    {
      'name': 'Marine Vibrio Shield',
      'image':
          'assets/products/marine vibrio shield.png',
    },
    {
      'name': 'Marine White Shield',
      'image':
          'assets/products/marine white shield.png',
    },
    {
      'name': 'Free Moult',
      'image':
          'assets/products/Free moult.png',
    },
    {
      'name': 'Red Thunder',
      'image':
          'assets/products/Red thunder.png',
    },
    {
      'name': 'Starmin',
      'image':
          'assets/products/Starmin.png',
    },
    {
      'name': 'Yucca Pro',
      'image':
          'assets/products/Yucca Pro.png',
    },
    {
      'name': 'Zeoneem',
      'image':
          'assets/products/Zeoneem.png',
    },
    {
      'name': 'Chlorides',
      'image':
          'assets/products/chlorides.png',
    },
    {
      'name': 'Nutrimin',
      'image':
          'assets/products/nutrimin.png',
    },
    {
      'name': 'OXYTAB Plus',
      'image':
          'assets/products/oxytab plus.png',
    },
    {
      'name': 'Bio Soil',
      'image':
          'assets/products/Bio soil.png',
    },
    {
      'name': 'Hi-Soft',
      'image':
          'assets/products/Hi-Soft.png',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4FAFD),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'మా ప్రొడక్ట్స్',
          style: TextStyle(
            color: Color(0xFF064E7A),
            fontWeight: FontWeight.bold,
            fontSize: 23,
          ),
        ),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(14),
        itemCount: products.length,
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          childAspectRatio: 0.82,
        ),
        itemBuilder: (context, index) {
          final product = products[index];

          return ProductGridCard(
            name: product['name']!,
            image: product['image']!,
          );
        },
      ),
    );
  }
}

// ============================================================
// PRODUCT GRID CARD
// ============================================================

class ProductGridCard extends StatelessWidget {
  final String name;
  final String image;

  const ProductGridCard({
    super.key,
    required this.name,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(19),
        border: Border.all(
          color: const Color(0xFFE0EEF5),
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
                  color: Color(0xFF075985),
                );
              },
            ),
          ),

          const SizedBox(height: 6),

          Text(
            name,
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Color(0xFF064E7A),
            ),
          ),

          const SizedBox(height: 8),

          SizedBox(
            width: double.infinity,
            height: 36,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor:
                    const Color(0xFFDFF5FC),
                foregroundColor:
                    const Color(0xFF064E7A),
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(20),
                ),
              ),
              child: const Text(
                'View Details',
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ============================================================
// MY PONDS
// ============================================================

class MyPondsScreen extends StatelessWidget {
  const MyPondsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4FAFD),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'My Ponds',
          style: TextStyle(
            color: Color(0xFF064E7A),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(18),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(22),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius:
                    BorderRadius.circular(24),
              ),
              child: const Column(
                children: [
                  Icon(
                    Icons.water,
                    size: 65,
                    color: Color(0xFF087DA8),
                  ),
                  SizedBox(height: 12),
                  Text(
                    'My Pond',
                    style: TextStyle(
                      fontSize: 23,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF075078),
                    ),
                  ),
                  SizedBox(height: 7),
                  Text(
                    'మీ చెరువు వివరాలను ఇక్కడ నిర్వహించవచ్చు.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 18),

            const PondParameter(
              title: 'pH',
              value: '7.8',
              icon: Icons.science_outlined,
            ),

            const PondParameter(
              title: 'Salinity',
              value: '18 ppt',
              icon: Icons.water_outlined,
            ),

            const PondParameter(
              title: 'DO',
              value: '5.6 mg/L',
              icon: Icons.air,
            ),

            const PondParameter(
              title: 'Alkalinity',
              value: '140 ppm',
              icon: Icons.science,
            ),
          ],
        ),
      ),
    );
  }
}

// ============================================================
// POND PARAMETER
// ============================================================

class PondParameter extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;

  const PondParameter({
    super.key,
    required this.title,
    required this.value,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(17),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Row(
        children: [
          Icon(
            icon,
            color: const Color(0xFF087DA8),
            size: 28,
          ),

          const SizedBox(width: 14),

          Expanded(
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Color(0xFF075078),
              ),
            ),
          ),

          Text(
            value,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w800,
              color: Color(0xFF087DA8),
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

class SupportScreen extends StatelessWidget {
  const SupportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4FAFD),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'టెక్నికల్ సపోర్ట్',
          style: TextStyle(
            color: Color(0xFF064E7A),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(18),
        child: Column(
          children: [
            const SizedBox(height: 15),

            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(25),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius:
                    BorderRadius.circular(24),
              ),
              child: const Column(
                children: [
                  Icon(
                    Icons.support_agent,
                    size: 72,
                    color: Color(0xFF129BCB),
                  ),

                  SizedBox(height: 15),

                  Text(
                    'మా నిపుణుల బృందంతో సంప్రదించండి',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF064E7A),
                    ),
                  ),

                  SizedBox(height: 10),

                  Text(
                    'మీ చెరువు నిర్వహణ, రొయ్యల ఆరోగ్యం '
                    'మరియు ప్రొడక్ట్ వినియోగంపై సహాయం కోసం '
                    'మా Technical Support Team ను సంప్రదించండి.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 13,
                      height: 1.5,
                      color: Colors.black87,
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
                icon: const Icon(Icons.phone),
                label: const Text(
                  'సంప్రదించండి',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      const Color(0xFF129BCB),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(28),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 12),

            SizedBox(
              width: double.infinity,
              height: 52,
              child: OutlinedButton.icon(
                onPressed: () {},
                icon: const Icon(
                  Icons.chat,
                  color: Color(0xFF075985),
                ),
                label: const Text(
                  'WhatsApp Support',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF075985),
                  ),
                ),
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(
                    color: Color(0xFFB7E3EF),
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(28),
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
// PROFILE
// ============================================================

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4FAFD),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Profile',
          style: TextStyle(
            color: Color(0xFF064E7A),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(18),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(25),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius:
                    BorderRadius.circular(24),
              ),
              child: const Column(
                children: [
                  CircleAvatar(
                    radius: 42,
                    backgroundColor:
                        Color(0xFFDDF3FA),
                    child: Icon(
                      Icons.person,
                      size: 48,
                      color: Color(0xFF087DA8),
                    ),
                  ),

                  SizedBox(height: 12),

                  Text(
                    'Marine Aqua Farmer',
                    style: TextStyle(
                      fontSize: 21,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF075078),
                    ),
                  ),

                  SizedBox(height: 5),

                  Text(
                    'Aquaculture User',
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 15),

            ProfileOption(
              icon: Icons.person_outline,
              title: 'Personal Details',
            ),

            ProfileOption(
              icon: Icons.water_outlined,
              title: 'My Pond Details',
            ),

            ProfileOption(
              icon: Icons.notifications_none,
              title: 'Notifications',
            ),

            ProfileOption(
              icon: Icons.help_outline,
              title: 'Help & Support',
            ),

            ProfileOption(
              icon: Icons.info_outline,
              title: 'About Marine Aqua Technologies',
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
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(17),
      ),
      child: ListTile(
        leading: Icon(
          icon,
          color: const Color(0xFF087DA8),
        ),
        title: Text(
          title,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Color(0xFF075078),
          ),
        ),
        trailing: const Icon(
          Icons.chevron_right,
          color: Colors.grey,
        ),
        onTap: () {},
      ),
    );
  }
}
