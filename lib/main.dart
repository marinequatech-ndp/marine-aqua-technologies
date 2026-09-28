import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

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
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF006A91),
        ),
      ),
      home: const LoginScreen(),
    );
  }
}

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

      final user = FirebaseAuth.instance.currentUser;

      if (user != null) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (_) => const MainNavigation(),
          ),
        );
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (_) => const LoginPage(),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Image.asset(
          'assets/products/marine logo.png',
          width: 190,
          errorBuilder: (_, __, ___) {
            return const Icon(
              Icons.water_drop,
              size: 100,
              color: Color(0xFF006A91),
            );
          },
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

  bool loading = false;

  Future<void> sendOTP() async {
    String phone = phoneController.text.trim();

    if (phone.length != 10) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Enter valid 10 digit mobile number'),
        ),
      );
      return;
    }

    setState(() {
      loading = true;
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
          loading = false;
        });

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              e.message ?? 'OTP verification failed',
            ),
          ),
        );
      },

      codeSent: (String verificationId, int? resendToken) {
        if (!mounted) return;

        setState(() {
          loading = false;
        });

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => OTPPage(
              verificationId: verificationId,
              phoneNumber: phone,
            ),
          ),
        );
      },

      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5FBFE),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 28),
            child: Column(
              children: [
                const SizedBox(height: 30),

                Image.asset(
                  'assets/products/marine logo.png',
                  width: 180,
                  height: 100,
                  fit: BoxFit.contain,
                  errorBuilder: (_, __, ___) {
                    return const Icon(
                      Icons.water_drop,
                      size: 90,
                      color: Color(0xFF006A91),
                    );
                  },
                ),

                const SizedBox(height: 25),

                const Text(
                  'MARINE AQUA',
                  style: TextStyle(
                    fontSize: 27,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF006A91),
                  ),
                ),

                const Text(
                  'TECHNOLOGIES',
                  style: TextStyle(
                    fontSize: 27,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF006A91),
                  ),
                ),

                const SizedBox(height: 10),

                const Text(
                  'Smart Aquaculture. Better Results.',
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.grey,
                  ),
                ),

                const SizedBox(height: 45),

                Container(
                  padding: const EdgeInsets.all(22),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(25),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.08),
                        blurRadius: 20,
                        offset: const Offset(0, 8),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Login',
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF006A91),
                          ),
                        ),
                      ),

                      const SizedBox(height: 8),

                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Enter your mobile number to continue',
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                      ),

                      const SizedBox(height: 25),

                      TextField(
                        controller: phoneController,
                        keyboardType: TextInputType.phone,
                        maxLength: 10,
                        decoration: InputDecoration(
                          counterText: '',
                          prefixText: '+91 ',
                          prefixIcon: const Icon(
                            Icons.phone,
                            color: Color(0xFF006A91),
                          ),
                          hintText: 'Mobile Number',
                          filled: true,
                          fillColor: const Color(0xFFF3F8FA),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),

                      const SizedBox(height: 20),

                      SizedBox(
                        width: double.infinity,
                        height: 55,
                        child: ElevatedButton(
                          onPressed: loading ? null : sendOTP,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF006A91),
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                          child: loading
                              ? const SizedBox(
                                  height: 22,
                                  width: 22,
                                  child: CircularProgressIndicator(
                                    strokeWidth: 2,
                                    color: Colors.white,
                                  ),
                                )
                              : const Text(
                                  'SEND OTP',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/* ============================================================
                          OTP PAGE
============================================================ */

class OTPPage extends StatefulWidget {
  final String verificationId;
  final String phoneNumber;

  const OTPPage({
    super.key,
    required this.verificationId,
    required this.phoneNumber,
  });

  @override
  State<OTPPage> createState() => _OTPPageState();
}

class _OTPPageState extends State<OTPPage> {
  final TextEditingController otpController = TextEditingController();

  bool loading = false;

  Future<void> verifyOTP() async {
    String otp = otpController.text.trim();

    if (otp.length != 6) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Enter 6 digit OTP'),
        ),
      );
      return;
    }

    setState(() {
      loading = true;
    });

    try {
      PhoneAuthCredential credential =
          PhoneAuthProvider.credential(
        verificationId: widget.verificationId,
        smsCode: otp,
      );

      await FirebaseAuth.instance.signInWithCredential(
        credential,
      );

      if (!mounted) return;

      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (_) => const MainNavigation(),
        ),
        (route) => false,
      );
    } catch (e) {
      if (!mounted) return;

      setState(() {
        loading = false;
      });

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Invalid OTP'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5FBFE),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(28),
          child: Column(
            children: [
              const SizedBox(height: 50),

              Image.asset(
                'assets/products/marine logo.png',
                width: 150,
                height: 90,
                fit: BoxFit.contain,
              ),

              const SizedBox(height: 35),

              const Text(
                'VERIFY OTP',
                style: TextStyle(
                  fontSize: 27,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF006A91),
                ),
              ),

              const SizedBox(height: 10),

              Text(
                'OTP sent to +91 ${widget.phoneNumber}',
                style: const TextStyle(
                  color: Colors.grey,
                ),
              ),

              const SizedBox(height: 35),

              TextField(
                controller: otpController,
                keyboardType: TextInputType.number,
                maxLength: 6,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 28,
                  letterSpacing: 12,
                  fontWeight: FontWeight.bold,
                ),
                decoration: InputDecoration(
                  counterText: '',
                  hintText: '••••••',
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),

              const SizedBox(height: 25),

              SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                  onPressed: loading ? null : verifyOTP,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF006A91),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  child: loading
                      ? const CircularProgressIndicator(
                          color: Colors.white,
                        )
                      : const Text(
                          'VERIFY & CONTINUE',
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
    HomePage(),
    ProductsPage(),
    SupportPage(),
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
        indicatorColor: const Color(0xFFD8F3FF),
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

/* ============================================================
                         HOME PAGE
============================================================ */

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4FAFD),

      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: _homeHeader(context),
            ),

            SliverToBoxAdapter(
              child: _heroBanner(),
            ),

            SliverToBoxAdapter(
              child: _shortcutSection(context),
            ),

            SliverToBoxAdapter(
              child: _pondParameters(),
            ),

            const SliverToBoxAdapter(
              child: SizedBox(height: 25),
            ),
          ],
        ),
      ),
    );
  }

  Widget _homeHeader(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(25, 25, 25, 20),
      color: Colors.white,
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'MARINE AQUA',
                  style: TextStyle(
                    fontSize: 27,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF006A91),
                  ),
                ),

                const Text(
                  'TECHNOLOGIES',
                  style: TextStyle(
                    fontSize: 27,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF006A91),
                  ),
                ),

                const SizedBox(height: 8),

                const Text(
                  'ఆక్వా సాగులో ప్రతి దశలో... మీకు తోడుగా',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF006A91),
                  ),
                ),

                const SizedBox(height: 5),

                const Text(
                  'Smart Aquaculture. Better Results.',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),

          Column(
            children: [
              Image.asset(
                'assets/products/marine logo.png',
                width: 55,
                height: 55,
                fit: BoxFit.contain,
              ),

              const SizedBox(height: 5),

              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.notifications_none,
                  color: Color(0xFF006A91),
                  size: 30,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _heroBanner() {
    return Container(
      margin: const EdgeInsets.fromLTRB(20, 20, 20, 10),
      height: 220,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(28),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.10),
            blurRadius: 15,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(28),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(
              'assets/products/hero_shrimp.jpg',
              fit: BoxFit.cover,
              errorBuilder: (_, __, ___) {
                return Container(
                  color: const Color(0xFF006A91),
                );
              },
            ),

            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.black.withOpacity(0.15),
                    Colors.black.withOpacity(0.70),
                  ],
                ),
              ),
            ),

            const Positioned(
              left: 25,
              bottom: 25,
              right: 20,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'ఆరోగ్యకరమైన\nచెరువులు',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      height: 1.05,
                    ),
                  ),

                  SizedBox(height: 8),

                  Text(
                    'బలమైన రొయ్యలు',
                    style: TextStyle(
                      color: Colors.yellow,
                      fontSize: 23,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  SizedBox(height: 4),

                  Text(
                    'అధిక లాభాలు',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
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

  Widget _shortcutSection(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 5),
      child: Column(
        children: [
          Row(
            children: [
              const Expanded(
                child: Text(
                  'ఆక్వా సమాచారం',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF006A91),
                  ),
                ),
              ),

              Icon(
                Icons.arrow_forward,
                size: 32,
                color: const Color(0xFF0077A5),
              ),
            ],
          ),

          const SizedBox(height: 15),

          SizedBox(
            height: 155,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                _shortcutCard(
                  image: 'assets/products/shrimp_guide.png',
                  title: 'రొయ్యల సాగు గైడ్',
                  onTap: () {
                    _openInfo(
                      context,
                      'రొయ్యల సాగు గైడ్',
                      'రొయ్యల సాగు, నీటి నిర్వహణ, ఫీడ్ మేనేజ్‌మెంట్ మరియు మంచి సాగు పద్ధతులకు సంబంధించిన సమాచారం.',
                    );
                  },
                ),

                _shortcutCard(
                  image: 'assets/products/biomass_calculator.png',
                  title: 'బయోమాస్ కాలిక్యులేటర్',
                  onTap: () {
                    _openBiomassCalculator(context);
                  },
                ),

                _shortcutCard(
                  image: 'assets/products/shrimp_diseases.png',
                  title: 'రొయ్యల వ్యాధులు',
                  onTap: () {
                    _openInfo(
                      context,
                      'రొయ్యల వ్యాధులు',
                      'రొయ్యలలో కనిపించే సాధారణ సమస్యలు, లక్షణాలు మరియు చెరువు నిర్వహణకు సంబంధించిన సమాచారం.',
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _shortcutCard({
    required String image,
    required String title,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 210,
        margin: const EdgeInsets.only(right: 14),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(22),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.06),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(22),
          child: Image.asset(
            image,
            fit: BoxFit.cover,
            errorBuilder: (_, __, ___) {
              return Container(
                color: const Color(0xFFEAF6FA),
                child: const Icon(
                  Icons.image_not_supported_outlined,
                  size: 45,
                  color: Colors.grey,
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _pondParameters() {
    return Container(
      margin: const EdgeInsets.fromLTRB(20, 25, 20, 0),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: const Color(0xFFE9F8FD),
        borderRadius: BorderRadius.circular(25),
        border: Border.all(
          color: const Color(0xFFB8E7F5),
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
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF006A91),
                  ),
                ),
              ),

              Icon(
                Icons.edit_outlined,
                color: const Color(0xFF0077A5),
              ),
            ],
          ),

          const SizedBox(height: 18),

          Row(
            children: [
              _parameter(
                icon: Icons.science_outlined,
                title: 'pH',
                value: '7.8',
                unit: '',
              ),

              _parameter(
                icon: Icons.water,
                title: 'Salinity',
                value: '18',
                unit: 'ppt',
              ),

              _parameter(
                icon: Icons.air,
                title: 'DO',
                value: '5.6',
                unit: 'mg/L',
              ),

              _parameter(
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

  Widget _parameter({
    required IconData icon,
    required String title,
    required String value,
    required String unit,
  }) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 4),
        padding: const EdgeInsets.symmetric(
          vertical: 13,
          horizontal: 4,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18),
        ),
        child: Column(
          children: [
            Icon(
              icon,
              color: const Color(0xFF1596BD),
              size: 27,
            ),

            const SizedBox(height: 5),

            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Color(0xFF31586A),
                fontSize: 13,
              ),
            ),

            const SizedBox(height: 4),

            Text(
              value,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Color(0xFF006A91),
              ),
            ),

            if (unit.isNotEmpty)
              Text(
                unit,
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

  void _openInfo(
    BuildContext context,
    String title,
    String description,
  ) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(25),
        ),
      ),
      builder: (_) {
        return Padding(
          padding: const EdgeInsets.all(25),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF006A91),
                ),
              ),

              const SizedBox(height: 15),

              Text(
                description,
                style: const TextStyle(
                  fontSize: 16,
                  height: 1.5,
                ),
              ),

              const SizedBox(height: 20),
            ],
          ),
        );
      },
    );
  }

  void _openBiomassCalculator(BuildContext context) {
    final countController = TextEditingController();
    final averageWeightController = TextEditingController();

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(25),
        ),
      ),
      builder: (_) {
        return Padding(
          padding: EdgeInsets.only(
            left: 25,
            right: 25,
            top: 25,
            bottom: MediaQuery.of(context).viewInsets.bottom + 25,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'బయోమాస్ కాలిక్యులేటర్',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF006A91),
                ),
              ),

              const SizedBox(height: 20),

              TextField(
                controller: countController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Shrimp Count',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),

              const SizedBox(height: 15),

              TextField(
                controller: averageWeightController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Average Weight (grams)',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              SizedBox(
                width: double.infinity,
                height: 52,
                child: ElevatedButton(
                  onPressed: () {
                    double count =
                        double.tryParse(countController.text) ?? 0;

                    double weight =
                        double.tryParse(
                              averageWeightController.text,
                            ) ??
                            0;

                    double biomass =
                        (count * weight) / 1000;

                    Navigator.pop(context);

                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          'Estimated Biomass: ${biomass.toStringAsFixed(2)} kg',
                        ),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF006A91),
                    foregroundColor: Colors.white,
                  ),
                  child: const Text(
                    'CALCULATE',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

/* ============================================================
                        PRODUCTS PAGE
============================================================ */

class ProductsPage extends StatelessWidget {
  const ProductsPage({super.key});

  final List<Map<String, String>> products = const [
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
      backgroundColor: const Color(0xFFF4FAFD),

      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Marine Products',
          style: TextStyle(
            color: Color(0xFF006A91),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: GridView.builder(
        padding: const EdgeInsets.all(16),
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
            child: Column(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Image.asset(
                      product['image']!,
                      fit: BoxFit.contain,
                      errorBuilder: (_, __, ___) {
                        return const Icon(
                          Icons.image_not_supported_outlined,
                          size: 45,
                          color: Colors.grey,
                        );
                      },
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(12),
                  child: Text(
                    product['name']!,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF006A91),
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

/* ============================================================
                        SUPPORT PAGE
============================================================ */

class SupportPage extends StatelessWidget {
  const SupportPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4FAFD),

      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Support',
          style: TextStyle(
            color: Color(0xFF006A91),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          _supportCard(
            icon: Icons.phone,
            title: 'Call Support',
            subtitle: 'Talk to Marine Aqua Technologies team',
          ),

          _supportCard(
            icon: Icons.chat,
            title: 'WhatsApp Support',
            subtitle: 'Get quick assistance',
          ),

          _supportCard(
            icon: Icons.location_on,
            title: 'Technical Support',
            subtitle: 'Aquaculture technical guidance',
          ),

          _supportCard(
            icon: Icons.info_outline,
            title: 'About Marine Aqua',
            subtitle: 'Smart Aquaculture. Better Results.',
          ),

          const SizedBox(height: 20),

          Center(
            child: TextButton(
              onPressed: () async {
                await FirebaseAuth.instance.signOut();

                if (!context.mounted) return;

                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const LoginPage(),
                  ),
                  (route) => false,
                );
              },
              child: const Text(
                'Logout',
                style: TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _supportCard({
    required IconData icon,
    required String title,
    required String subtitle,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: const Color(0xFFE1F5FB),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Icon(
              icon,
              color: const Color(0xFF006A91),
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
                    color: Color(0xFF006A91),
                  ),
                ),

                const SizedBox(height: 4),

                Text(
                  subtitle,
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 13,
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
