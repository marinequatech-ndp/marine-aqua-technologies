import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

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
        fontFamily: 'Roboto',
        scaffoldBackgroundColor: const Color(0xFFF2FBFE),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF08799B),
        ),
      ),
      home: const SplashScreen(),
    );
  }
}

/* =========================================================
                         COLORS
========================================================= */

const Color marineBlue = Color(0xFF08799B);
const Color marineDark = Color(0xFF05627F);
const Color marineLight = Color(0xFFE5F7FC);
const Color pageBg = Color(0xFFF2FBFE);

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

      final user = FirebaseAuth.instance.currentUser;

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => user == null
              ? const LoginScreen()
              : const MainNavigation(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: pageBg,
      body: SafeArea(
        child: Column(
          children: [
            const Spacer(),

            Image.asset(
              'assets/products/marine logo.png',
              width: 300,
              fit: BoxFit.contain,
              errorBuilder: (_, __, ___) {
                return const Icon(
                  Icons.water,
                  size: 120,
                  color: marineBlue,
                );
              },
            ),

            const SizedBox(height: 28),

            const Text(
              'MARINE AQUA',
              style: TextStyle(
                fontSize: 42,
                fontWeight: FontWeight.w800,
                color: marineDark,
                letterSpacing: 1,
              ),
            ),

            const Text(
              'TECHNOLOGIES',
              style: TextStyle(
                fontSize: 38,
                fontWeight: FontWeight.w800,
                color: marineDark,
                letterSpacing: 1,
              ),
            ),

            const SizedBox(height: 22),

            const Text(
              'ఆక్వా సాగులో ప్రతి దశలో... మీకు తోడుగా',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 19,
                fontWeight: FontWeight.w700,
                color: marineDark,
              ),
            ),

            const SizedBox(height: 10),

            const Text(
              'Smart Aquaculture. Better Results.',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),

            const Spacer(),

            const CircularProgressIndicator(
              strokeWidth: 3,
              color: marineBlue,
            ),

            const SizedBox(height: 50),
          ],
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
  final TextEditingController phoneController = TextEditingController();

  bool sendingOtp = false;

  Future<void> sendOTP() async {
    String phone = phoneController.text.trim();

    if (phone.length != 10) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please enter a valid 10 digit mobile number'),
        ),
      );
      return;
    }

    setState(() {
      sendingOtp = true;
    });

    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: '+91$phone',

      verificationCompleted: (PhoneAuthCredential credential) async {
        await FirebaseAuth.instance.signInWithCredential(credential);

        if (!mounted) return;

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (_) => const MainNavigation(),
          ),
        );
      },

      verificationFailed: (FirebaseAuthException e) {
        if (!mounted) return;

        setState(() {
          sendingOtp = false;
        });

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(e.message ?? 'OTP sending failed'),
          ),
        );
      },

      codeSent: (String verificationId, int? resendToken) {
        if (!mounted) return;

        setState(() {
          sendingOtp = false;
        });

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => OTPVerificationScreen(
              verificationId: verificationId,
              phoneNumber: phone,
            ),
          ),
        );
      },

      codeAutoRetrievalTimeout: (String verificationId) {},
      timeout: const Duration(seconds: 60),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: pageBg,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 35),

              Image.asset(
                'assets/products/marine logo.png',
                width: 220,
              ),

              const SizedBox(height: 18),

              const Text(
                'MARINE AQUA',
                style: TextStyle(
                  fontSize: 34,
                  fontWeight: FontWeight.w800,
                  color: marineDark,
                ),
              ),

              const Text(
                'TECHNOLOGIES',
                style: TextStyle(
                  fontSize: 34,
                  fontWeight: FontWeight.w800,
                  color: marineDark,
                ),
              ),

              const SizedBox(height: 14),

              const Text(
                'ఆక్వా సాగులో ప్రతి దశలో... మీకు తోడుగా',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w700,
                  color: marineDark,
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

              const SizedBox(height: 35),

              Container(
                margin: const EdgeInsets.symmetric(horizontal: 28),
                padding: const EdgeInsets.all(28),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(32),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(.06),
                      blurRadius: 25,
                      offset: const Offset(0, 10),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Center(
                      child: Text(
                        'Welcome Back',
                        style: TextStyle(
                          fontSize: 31,
                          fontWeight: FontWeight.w800,
                          color: marineDark,
                        ),
                      ),
                    ),

                    const SizedBox(height: 8),

                    const Center(
                      child: Text(
                        'Login with your mobile number',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                        ),
                      ),
                    ),

                    const SizedBox(height: 28),

                    Container(
                      height: 62,
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
                          border: InputBorder.none,
                          prefixIcon: Icon(
                            Icons.phone_android,
                            color: marineBlue,
                          ),
                          prefixText: '+91  ',
                          prefixStyle: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                          hintText: 'Enter mobile number',
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),

                    SizedBox(
                      width: double.infinity,
                      height: 58,
                      child: ElevatedButton(
                        onPressed: sendingOtp ? null : sendOTP,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: marineBlue,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18),
                          ),
                        ),
                        child: sendingOtp
                            ? const SizedBox(
                                width: 23,
                                height: 23,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2.5,
                                  color: Colors.white,
                                ),
                              )
                            : const Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'SEND OTP',
                                    style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w800,
                                    ),
                                  ),
                                  SizedBox(width: 12),
                                  Icon(Icons.arrow_forward),
                                ],
                              ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 35),
            ],
          ),
        ),
      ),
    );
  }
}

/* =========================================================
                         OTP SCREEN
========================================================= */

class OTPVerificationScreen extends StatefulWidget {
  final String verificationId;
  final String phoneNumber;

  const OTPVerificationScreen({
    super.key,
    required this.verificationId,
    required this.phoneNumber,
  });

  @override
  State<OTPVerificationScreen> createState() =>
      _OTPVerificationScreenState();
}

class _OTPVerificationScreenState
    extends State<OTPVerificationScreen> {
  final TextEditingController otpController = TextEditingController();

  bool verifying = false;

  Future<void> verifyOTP() async {
    if (otpController.text.length != 6) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Enter 6 digit OTP'),
        ),
      );
      return;
    }

    setState(() {
      verifying = true;
    });

    try {
      PhoneAuthCredential credential =
          PhoneAuthProvider.credential(
        verificationId: widget.verificationId,
        smsCode: otpController.text.trim(),
      );

      await FirebaseAuth.instance.signInWithCredential(credential);

      if (!mounted) return;

      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (_) => const MainNavigation(),
        ),
        (route) => false,
      );
    } on FirebaseAuthException catch (e) {
      if (!mounted) return;

      setState(() {
        verifying = false;
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(e.message ?? 'Invalid OTP'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: pageBg,
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 50),

            Align(
              alignment: Alignment.centerLeft,
              child: IconButton(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(
                  Icons.arrow_back,
                  size: 30,
                ),
              ),
            ),

            const SizedBox(height: 30),

            Image.asset(
              'assets/products/marine logo.png',
              width: 220,
            ),

            const SizedBox(height: 30),

            const Text(
              'Verify OTP',
              style: TextStyle(
                fontSize: 34,
                fontWeight: FontWeight.w800,
                color: marineDark,
              ),
            ),

            const SizedBox(height: 10),

            Text(
              'OTP sent to +91 ${widget.phoneNumber}',
              style: const TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),

            const SizedBox(height: 35),

            Container(
              margin: const EdgeInsets.symmetric(horizontal: 30),
              child: TextField(
                controller: otpController,
                keyboardType: TextInputType.number,
                maxLength: 6,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 15,
                ),
                decoration: InputDecoration(
                  counterText: '',
                  filled: true,
                  fillColor: Colors.white,
                  hintText: '• • • • • •',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(18),
                    borderSide: const BorderSide(
                      color: Colors.blueAccent,
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 30),

            Container(
              margin: const EdgeInsets.symmetric(horizontal: 30),
              width: double.infinity,
              height: 58,
              child: ElevatedButton(
                onPressed: verifying ? null : verifyOTP,
                style: ElevatedButton.styleFrom(
                  backgroundColor: marineBlue,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18),
                  ),
                ),
                child: verifying
                    ? const CircularProgressIndicator(
                        color: Colors.white,
                      )
                    : const Text(
                        'VERIFY & CONTINUE',
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
              ),
            ),

            const SizedBox(height: 20),

            const Text(
              'You can resend OTP after 30 seconds',
              style: TextStyle(
                color: Colors.grey,
              ),
            ),

            const Spacer(),
          ],
        ),
      ),
    );
  }
}

/* =========================================================
                    MAIN NAVIGATION
========================================================= */

class MainNavigation extends StatefulWidget {
  const MainNavigation({super.key});

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int selectedIndex = 0;

  final List<Widget> pages = const [
    HomeScreen(),
    ProductsScreen(),
    SupportScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[selectedIndex],
      bottomNavigationBar: NavigationBar(
        selectedIndex: selectedIndex,
        backgroundColor: Colors.white,
        indicatorColor: const Color(0xFFD4F4FD),
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
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(18, 16, 18, 8),
              child: Row(
                children: [
                  Image.asset(
                    'assets/products/marine logo.png',
                    width: 72,
                    height: 58,
                    fit: BoxFit.contain,
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
                            fontSize: 22,
                            fontWeight: FontWeight.w800,
                            color: marineDark,
                          ),
                        ),
                        Text(
                          'TECHNOLOGIES',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w800,
                            color: marineDark,
                          ),
                        ),
                        SizedBox(height: 3),
                        Text(
                          'ఆక్వా సాగులో ప్రతి దశలో... మీకు తోడుగా',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.w700,
                            color: marineDark,
                          ),
                        ),
                      ],
                    ),
                  ),

                  const Icon(
                    Icons.notifications_none,
                    size: 30,
                    color: marineDark,
                  ),
                ],
              ),
            ),
          ),

          /* HERO */
          SliverToBoxAdapter(
            child: Padding(
              padding:
                  const EdgeInsets.fromLTRB(18, 12, 18, 18),
              child: HeroBanner(),
            ),
          ),

          /* SHORTCUT TITLE */
          SliverToBoxAdapter(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  const Expanded(
                    child: Text(
                      'ఆక్వా సమాచారం',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w800,
                        color: marineDark,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Row(
                      children: [
                        Text('అన్ని చూడండి'),
                        SizedBox(width: 3),
                        Icon(Icons.arrow_forward),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          /* 3 CARDS */
          SliverToBoxAdapter(
            child: Padding(
              padding:
                  const EdgeInsets.fromLTRB(18, 4, 18, 20),
              child: Row(
                children: const [
                  Expanded(
                    child: InfoCard(
                      image:
                          'assets/products/shrimp_guide.png',
                      title: 'రొయ్యల\nసాగు గైడ్',
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: InfoCard(
                      image:
                          'assets/products/biomass_calculator.png',
                      title: 'బయోమాస్\nకాలిక్యులేటర్',
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: InfoCard(
                      image:
                          'assets/products/shrimp_diseases.png',
                      title: 'రొయ్యల\nవ్యాధులు',
                    ),
                  ),
                ],
              ),
            ),
          ),

          /* WATER PARAMETERS */
          SliverToBoxAdapter(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 18),
              child: WaterParameters(),
            ),
          ),

          /* FEATURED */
          SliverToBoxAdapter(
            child: Padding(
              padding:
                  const EdgeInsets.fromLTRB(20, 24, 20, 10),
              child: Row(
                children: [
                  const Expanded(
                    child: Text(
                      'Featured Products',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w800,
                        color: marineDark,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text('అన్ని చూడండి →'),
                  ),
                ],
              ),
            ),
          ),

          SliverToBoxAdapter(
            child: SizedBox(
              height: 205,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding:
                    const EdgeInsets.symmetric(horizontal: 18),
                children: const [
                  ProductMiniCard(
                    image:
                        'assets/products/marine 6g.png',
                    name: 'Marine 6G',
                  ),
                  ProductMiniCard(
                    image:
                        'assets/products/marine protab.png',
                    name: 'Marine ProTab',
                  ),
                  ProductMiniCard(
                    image:
                        'assets/products/marine volt-x.png',
                    name: 'Marine Volt-X',
                  ),
                  ProductMiniCard(
                    image:
                        'assets/products/oxytab plus.png',
                    name: 'OXYTAB+',
                  ),
                ],
              ),
            ),
          ),

          const SliverToBoxAdapter(
            child: SizedBox(height: 25),
          ),
        ],
      ),
    );
  }
}

/* =========================================================
                         HERO BANNER
========================================================= */

class HeroBanner extends StatelessWidget {
  const HeroBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(28),
      child: SizedBox(
        height: 225,
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(
              'assets/products/hero_shrimp.jpg',
              fit: BoxFit.cover,
            ),

            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [
                    Colors.black.withOpacity(.72),
                    Colors.black.withOpacity(.20),
                    Colors.transparent,
                  ],
                ),
              ),
            ),

            const Positioned(
              left: 20,
              top: 28,
              right: 120,
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start,
                children: [
                  Text(
                    'ఆరోగ్యకరమైన',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  Text(
                    'చెరువులు',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 29,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'బలమైన రొయ్యలు',
                    style: TextStyle(
                      color: Colors.yellow,
                      fontSize: 23,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  Text(
                    'అధిక లాభాలు',
                    style: TextStyle(
                      color: Colors.yellow,
                      fontSize: 23,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ],
              ),
            ),

            const Positioned(
              bottom: 14,
              right: 18,
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 4,
                    backgroundColor: Colors.white,
                  ),
                  SizedBox(width: 6),
                  CircleAvatar(
                    radius: 4,
                    backgroundColor: Colors.white54,
                  ),
                  SizedBox(width: 6),
                  CircleAvatar(
                    radius: 4,
                    backgroundColor: Colors.white54,
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
                       INFO CARD
========================================================= */

class InfoCard extends StatelessWidget {
  final String image;
  final String title;

  const InfoCard({
    super.key,
    required this.image,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: .82,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(
              image,
              fit: BoxFit.cover,
            ),

            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    Colors.black.withOpacity(.65),
                  ],
                ),
              ),
            ),

            Positioned(
              left: 8,
              right: 8,
              bottom: 10,
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  height: 1.1,
                  fontWeight: FontWeight.w900,
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
                    WATER PARAMETERS
========================================================= */

class WaterParameters extends StatelessWidget {
  const WaterParameters({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: marineLight,
        borderRadius: BorderRadius.circular(28),
        border: Border.all(
          color: const Color(0xFFB5E5F2),
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
                    color: marineDark,
                  ),
                ),
              ),
              Icon(
                Icons.edit,
                color: marineDark,
              ),
            ],
          ),

          const SizedBox(height: 16),

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
          vertical: 12,
          horizontal: 3,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18),
        ),
        child: Column(
          children: [
            Icon(
              icon,
              color: marineBlue,
              size: 26,
            ),
            const SizedBox(height: 5),
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              value,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w900,
                color: marineDark,
              ),
            ),
            Text(
              unit,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 9,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/* =========================================================
                   PRODUCT MINI CARD
========================================================= */

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
      margin: const EdgeInsets.only(right: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.05),
            blurRadius: 12,
          ),
        ],
      ),
      child: Column(
        children: [
          Expanded(
            child: Image.asset(
              image,
              fit: BoxFit.contain,
            ),
          ),
          const SizedBox(height: 7),
          Text(
            name,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w800,
              color: marineDark,
            ),
          ),
        ],
      ),
    );
  }
}

/* =========================================================
                       PRODUCTS
========================================================= */

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  static const products = [
    ['Marine 6G', 'assets/products/marine 6g.png'],
    ['Marine ProTab', 'assets/products/marine protab.png'],
    ['Marine Volt-X', 'assets/products/marine volt-x.png'],
    ['OXYTAB+', 'assets/products/oxytab plus.png'],
    ['Bio Sludge', 'assets/products/Bio sludge.png'],
    ['Bio Soil', 'assets/products/Bio soil.png'],
    ['Free Moult', 'assets/products/Free moult.png'],
    ['Hi-Soft', 'assets/products/Hi-Soft.png'],
    ['Vibrio Shield', 'assets/products/Marine vibrio shield.png'],
    ['Red Thunder', 'assets/products/Red thunder.png'],
    ['Starmin', 'assets/products/Starmin.png'],
    ['Yucca Pro', 'assets/products/Yucca Pro.png'],
    ['Zeoneem', 'assets/products/Zeoneem.png'],
    ['Marine White Shield', 'assets/products/marine white shield.png'],
    ['Nutrimin', 'assets/products/nutrimin.png'],
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(20),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Our Products',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w800,
                  color: marineDark,
                ),
              ),
            ),
          ),

          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.fromLTRB(
                18,
                0,
                18,
                20,
              ),
              gridDelegate:
                  const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 14,
                mainAxisSpacing: 14,
                childAspectRatio: .78,
              ),
              itemCount: products.length,
              itemBuilder: (context, index) {
                return Container(
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: Column(
                    children: [
                      Expanded(
                        child: Image.asset(
                          products[index][1],
                          fit: BoxFit.contain,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        products[index][0],
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w800,
                          color: marineDark,
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
                        SUPPORT
========================================================= */

class SupportScreen extends StatelessWidget {
  const SupportScreen({super.key});

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
                color: marineDark,
              ),
            ),

            const SizedBox(height: 25),

            SupportTile(
              icon: Icons.phone,
              title: 'Call Support',
              subtitle: 'Talk to our technical team',
              onTap: () {},
            ),

            SupportTile(
              icon: Icons.chat,
              title: 'WhatsApp Support',
              subtitle: 'Chat with Marine Aqua team',
              onTap: () {},
            ),

            SupportTile(
              icon: Icons.location_on,
              title: 'Technical Officer',
              subtitle: 'Get pond-level assistance',
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}

class SupportTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  const SupportTile({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      child: ListTile(
        onTap: onTap,
        tileColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        leading: CircleAvatar(
          backgroundColor: marineLight,
          child: Icon(
            icon,
            color: marineBlue,
          ),
        ),
        title: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.w800,
          ),
        ),
        subtitle: Text(subtitle),
        trailing: const Icon(
          Icons.arrow_forward_ios,
          size: 16,
        ),
      ),
    );
  }
}
