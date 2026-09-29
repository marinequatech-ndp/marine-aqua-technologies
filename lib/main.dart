import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MarineAquaApp());
}

/* =========================================================
   APP
========================================================= */

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
        scaffoldBackgroundColor: const Color(0xFFF4FAFD),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF075985),
        ),
      ),
      home: const SplashScreen(),
    );
  }
}

/* =========================================================
   SPLASH SCREEN
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
                'assets/products/marine logo.png',
                width: 190,
                height: 190,
                fit: BoxFit.contain,
                errorBuilder: (_, __, ___) {
                  return const Icon(
                    Icons.water,
                    size: 120,
                    color: Color(0xFF129BCB),
                  );
                },
              ),

              const SizedBox(height: 25),

              const Text(
                'ఆక్వా సాగులో ప్రతి దశలో... మీకు తోడుగా',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 21,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF064E7A),
                ),
              ),

              const SizedBox(height: 14),

              const Text(
                'Marine Aqua Technologies',
                style: TextStyle(
                  fontSize: 19,
                  color: Color(0xFF075985),
                ),
              ),

              const SizedBox(height: 35),

              const CircularProgressIndicator(
                strokeWidth: 3,
                color: Color(0xFF129BCB),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/* =========================================================
   LOGIN SCREEN
========================================================= */

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
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(
            horizontal: 28,
            vertical: 24,
          ),
          child: Column(
            children: [
              const SizedBox(height: 10),

              Image.asset(
                'assets/products/marine logo.png',
                width: 145,
                height: 145,
                fit: BoxFit.contain,
                errorBuilder: (_, __, ___) {
                  return const Icon(
                    Icons.water,
                    size: 100,
                    color: Color(0xFF129BCB),
                  );
                },
              ),

              const SizedBox(height: 12),

              const Text(
                'ఆక్వా సాగులో ప్రతి దశలో... మీకు తోడుగా',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF064E7A),
                ),
              ),

              const SizedBox(height: 10),

              const Text(
                'Marine Aqua Technologies',
                style: TextStyle(
                  fontSize: 18,
                  color: Color(0xFF075985),
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
                    color: Color(0xFF064E7A),
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
                    color: Color(0xFF129BCB),
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
                      color: Color(0xFF129BCB),
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
                    backgroundColor: const Color(0xFF129BCB),
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

              const SizedBox(height: 50),

              const Row(
                mainAxisAlignment:
                    MainAxisAlignment.spaceAround,
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

/* =========================================================
   LOGIN FEATURE
========================================================= */

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
          color: const Color(0xFF16A5B8),
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

/* =========================================================
   OTP SCREEN
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

    // DEMO OTP
    // Real Firebase OTP later connect cheddam.
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
                'assets/products/marine logo.png',
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
                  color: Color(0xFF064E7A),
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
                      color: Color(0xFF129BCB),
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
                    backgroundColor: const Color(0xFF129BCB),
                    disabledBackgroundColor:
                        Colors.grey.shade300,
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
                    color: Color(0xFF129BCB),
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

/* =========================================================
   MAIN NAVIGATION
========================================================= */

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
        height: 72,
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

/* =========================================================
   HOME SCREEN
========================================================= */

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
                12,
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

                    const SizedBox(height: 18),

                    const SuccessStoriesSection(),

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

/* =========================================================
   HOME HEADER
========================================================= */

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(
        16,
        12,
        12,
        10,
      ),
      color: Colors.white,
      child: Row(
        children: [
          Image.asset(
            'assets/products/marine logo.png',
            width: 55,
            height: 55,
            fit: BoxFit.contain,
            errorBuilder: (_, __, ___) {
              return const Icon(
                Icons.water,
                size: 50,
                color: Color(0xFF129BCB),
              );
            },
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
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF064E7A),
                    letterSpacing: 0.4,
                  ),
                ),
                Text(
                  'TECHNOLOGIES',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF064E7A),
                    letterSpacing: 0.4,
                  ),
                ),
                SizedBox(height: 2),
                Text(
                  'ఆక్వా సాగులో ప్రతి దశలో... మీకు తోడుగా',
                  style: TextStyle(
                    fontSize: 9.5,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF064E7A),
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
              size: 29,
              color: Color(0xFF064E7A),
            ),
          ),
        ],
      ),
    );
  }
}

/* =========================================================
   HERO BANNER
   NO PRODUCT BUTTON
========================================================= */

class HeroBanner extends StatelessWidget {
  const HeroBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 275,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        image: const DecorationImage(
          image: AssetImage(
            'assets/shrimp_hero.jpg',
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        padding: const EdgeInsets.fromLTRB(
          20,
          24,
          18,
          18,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [
              Colors.black.withOpacity(0.70),
              Colors.black.withOpacity(0.40),
              Colors.transparent,
            ],
          ),
        ),
        child: const Column(
          crossAxisAlignment:
              CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'ఆరోగ్యకరమైన చెరువులు',
              style: TextStyle(
                color: Colors.white,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),

            SizedBox(height: 4),

            Text(
              'బలమైన రొయ్యలు',
              style: TextStyle(
                color: Color(0xFFFFD600),
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),

            Text(
              'అధిక లాభాలు',
              style: TextStyle(
                color: Colors.white,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),

            SizedBox(height: 14),

            Text(
              'మెరుగైన ఫలితాల కోసం\n'
              'సంపూర్ణ ఆక్వాకల్చర్ సొల్యూషన్స్',
              style: TextStyle(
                color: Colors.white,
                fontSize: 15,
                height: 1.4,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/* =========================================================
   QUICK ACTIONS
========================================================= */

class QuickActions extends StatelessWidget {
  const QuickActions({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: HomeCard(
                image: 'assets/products/card1.png',
                title: 'రొయ్యల సాగు గైడ్',
                text: 'రొయ్యల సాగులో ముఖ్యమైన సూచనలు తెలుసుకోండి.',
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: HomeCard(
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
              child: HomeCard(
                image: 'assets/products/card3.png',
                title: 'రొయ్యల వ్యాధులు',
                text: 'సాధారణ రొయ్యల వ్యాధులను గుర్తించి నివారించండి.',
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: HomeCard(
                image: 'assets/products/card4.png',
                title: 'టిప్ ఆఫ్ ది డే',
                text: 'ప్రతి రోజు ఆక్వా సాగుకు ఉపయోగపడే ముఖ్యమైన టిప్స్.',
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class HomeCard extends StatelessWidget {
  final String image;
  final String title;
  final String text;

  const HomeCard({
    super.key,
    required this.image,
    required this.title,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 315,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
        border: Border.all(
          color: const Color(0xFFE1EEF4),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 175,
            width: double.infinity,
            child: Image.asset(
              image,
              fit: BoxFit.cover,
              errorBuilder: (_, __, ___) {
                return Container(
                  color: const Color(0xFFEAF7FC),
                  alignment: Alignment.center,
                  child: const Icon(
                    Icons.image_not_supported_outlined,
                    size: 42,
                    color: Color(0xFF0B79B2),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 13, 12, 5),
            child: Text(
              title,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontWeight: FontWeight.w800,
                fontSize: 20,
                height: 1.15,
                color: Color(0xFF064E7A),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 12, 12),
            child: Text(
              text,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 14,
                height: 1.35,
                color: Colors.black54,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/* =========================================================
   SUCCESS STORIES
   HORIZONTAL SCROLL
========================================================= */

class SuccessStoriesSection extends StatelessWidget {
  const SuccessStoriesSection({super.key});

  static const List<String> stories = [
    'assets/success_stories/story1.jpg',
    'assets/success_stories/story2.jpg',
    'assets/success_stories/story3.jpg',
    'assets/success_stories/story4.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Expanded(
              child: Text(
                'మా సక్సెస్ స్టోరీస్',
                style: TextStyle(
                  color: Color(0xFF064E7A),
                  fontSize: 27,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
            const Text(
              'మరిన్ని చూడండి →',
              style: TextStyle(
                color: Color(0xFF0877AC),
                fontSize: 13,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        SizedBox(
          height: 190,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            itemCount: stories.length,
            separatorBuilder: (_, __) => const SizedBox(width: 12),
            itemBuilder: (context, index) {
              return Container(
                width: 275,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(22),
                  border: Border.all(
                    color: const Color(0xFFE0EEF5),
                  ),
                ),
                clipBehavior: Clip.antiAlias,
                child: Image.asset(
                  stories[index],
                  fit: BoxFit.cover,
                  errorBuilder: (_, __, ___) {
                    return Container(
                      color: const Color(0xFFEAF7FC),
                      alignment: Alignment.center,
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.photo_library_outlined,
                            size: 48,
                            color: Color(0xFF0B79B2),
                          ),
                          SizedBox(height: 8),
                          Text(
                            'Success Story',
                            style: TextStyle(
                              color: Color(0xFF075078),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

/* =========================================================
   WATER QUALITY
========================================================= */

class WaterQualitySection extends StatelessWidget {
  const WaterQualitySection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(
        14,
        14,
        14,
        16,
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
                    fontSize: 23,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),

              const Icon(
                Icons.edit,
                color: Color(0xFF0B79B2),
                size: 20,
              ),
            ],
          ),

          const SizedBox(height: 12),

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

              const SizedBox(width: 7),

              Expanded(
                child: ParameterCard(
                  icon: Icons.water_outlined,
                  name: 'Salinity',
                  value: '18',
                  unit: 'ppt',
                  range: '10 - 25',
                ),
              ),

              const SizedBox(width: 7),

              Expanded(
                child: ParameterCard(
                  icon: Icons.air,
                  name: 'DO',
                  value: '5.6',
                  unit: 'mg/L',
                  range: '≥ 5.0',
                ),
              ),

              const SizedBox(width: 7),

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
        horizontal: 5,
        vertical: 11,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(17),
      ),
      child: Column(
        children: [
          Icon(
            icon,
            size: 25,
            color: const Color(0xFF149AD6),
          ),

          const SizedBox(height: 4),

          Text(
            name,
            style: const TextStyle(
              color: Color(0xFF075078),
              fontWeight: FontWeight.bold,
              fontSize: 11,
            ),
          ),

          const SizedBox(height: 2),

          Text(
            value,
            style: const TextStyle(
              color: Color(0xFF075078),
              fontSize: 21,
              fontWeight: FontWeight.w800,
            ),
          ),

          Text(
            unit,
            style: const TextStyle(
              color: Colors.grey,
              fontSize: 9,
            ),
          ),

          const SizedBox(height: 2),

          Text(
            '($range)',
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.grey,
              fontSize: 8,
            ),
          ),

          const SizedBox(height: 6),

          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 8,
              vertical: 3,
            ),
            decoration: BoxDecoration(
              color: const Color(0xFFC8F2D5),
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Text(
              'సరైనది',
              style: TextStyle(
                color: Color(0xFF188044),
                fontSize: 8,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/* =========================================================
   HOME PRODUCTS
   NO HORIZONTAL SCROLL
========================================================= */

class HomeProductsSection extends StatelessWidget {
  const HomeProductsSection({super.key});

  static const List<Map<String, String>> products = [
    {
      'name': 'Marine 6G',
      'image': 'assets/products/marine 6g.png',
    },
    {
      'name': 'Marine ProTab',
      'image': 'assets/products/marine protab.png',
    },
    {
      'name': 'Marine Vibrio Shield',
      'image':
          'assets/products/marine vibrio shield.png',
    },
    {
      'name': 'Marine Volt-X',
      'image': 'assets/products/marine volt-x.png',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const Text(
              'మా ప్రొడక్ట్స్',
              style: TextStyle(
                color: Color(0xFF064E7A),
                fontSize: 27,
                fontWeight: FontWeight.w800,
              ),
            ),

            const Spacer(),

            TextButton(
              onPressed: () {},
              child: const Text(
                'అన్ని చూడండి →',
                style: TextStyle(
                  color: Color(0xFF0877AC),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),

        const SizedBox(height: 5),

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
            childAspectRatio: 0.82,
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

/* =========================================================
   PRODUCT CARD
========================================================= */

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
      padding: const EdgeInsets.all(10),
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
                  size: 60,
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
              fontWeight: FontWeight.bold,
              fontSize: 14,
              color: Color(0xFF064E7A),
            ),
          ),

          const SizedBox(height: 8),

          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(
              vertical: 7,
            ),
            decoration: BoxDecoration(
              color: const Color(0xFFE1F4FD),
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Text(
              'View Details',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFF075078),
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

/* =========================================================
   FEATURED PRODUCT
========================================================= */

class FeaturedProduct extends StatelessWidget {
  const FeaturedProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            Color(0xFFE4F8E9),
            Color(0xFFF5FFF7),
          ],
        ),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Row(
        children: [
          Container(
            width: 90,
            height: 90,
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(18),
            ),
            child: Image.asset(
              'assets/products/marine 6g.png',
              fit: BoxFit.contain,
            ),
          ),

          const SizedBox(width: 14),

          const Expanded(
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start,
              children: [
                Text(
                  'మీ చెరువుకు సరైన పరిష్కారం',
                  style: TextStyle(
                    color: Color(0xFF087348),
                    fontSize: 16,
                    fontWeight: FontWeight.w800,
                  ),
                ),

                SizedBox(height: 4),

                Text(
                  'నీటి Mineral Balance కోసం',
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 12,
                  ),
                ),

                SizedBox(height: 2),

                Text(
                  'Marine 6G',
                  style: TextStyle(
                    color: Color(0xFF075078),
                    fontSize: 21,
                    fontWeight: FontWeight.w800,
                  ),
                ),

                Text(
                  'చెరువు నీటి నాణ్యతకు మద్దతు',
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 11,
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

/* =========================================================
   TECHNICAL SUPPORT
========================================================= */

class TechnicalSupportCard extends StatelessWidget {
  const TechnicalSupportCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(17),
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
            size: 48,
            color: Color(0xFF075985),
          ),

          const SizedBox(width: 13),

          const Expanded(
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start,
              children: [
                Text(
                  'టెక్నికల్ సపోర్ట్',
                  style: TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF064E7A),
                  ),
                ),

                SizedBox(height: 4),

                Text(
                  'మా నిపుణుల బృందంతో సంప్రదించండి',
                  style: TextStyle(
                    fontSize: 12.5,
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
                horizontal: 14,
                vertical: 10,
              ),
              shape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.circular(22),
              ),
            ),
            child: const Text(
              'సంప్రదించండి',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/* =========================================================
   PRODUCTS SCREEN - 16 PRODUCTS
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
            fontSize: 25,
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

/* =========================================================
   PRODUCT GRID CARD
========================================================= */

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
        borderRadius: BorderRadius.circular(18),
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
                  size: 70,
                  color: Color(0xFF075985),
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
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: Color(0xFF064E7A),
            ),
          ),

          const SizedBox(height: 8),

          SizedBox(
            width: double.infinity,
            height: 38,
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
                  fontSize: 12,
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

/* =========================================================
   SUPPORT SCREEN
========================================================= */

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
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius:
                    BorderRadius.circular(24),
              ),
              child: const Column(
                children: [
                  Icon(
                    Icons.support_agent,
                    size: 75,
                    color: Color(0xFF129BCB),
                  ),

                  SizedBox(height: 15),

                  Text(
                    'మా నిపుణుల బృందంతో సంప్రదించండి',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
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
                      fontSize: 14,
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
                    fontSize: 16,
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
                    fontSize: 16,
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
