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
          seedColor: const Color(0xFF0879A8),
        ),
      ),
      home: const AuthGate(),
    );
  }
}

// ============================================================
// AUTH GATE
// ============================================================

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const SplashScreen();
        }

        if (snapshot.hasData) {
          return const MainNavigation();
        }

        return const LoginPage();
      },
    );
  }
}

// ============================================================
// SPLASH
// ============================================================

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5FBFE),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/logo.png',
              width: 130,
              height: 130,
              fit: BoxFit.contain,
              errorBuilder: (_, __, ___) {
                return const Icon(
                  Icons.water_drop,
                  size: 90,
                  color: Color(0xFF0879A8),
                );
              },
            ),
            const SizedBox(height: 20),
            const Text(
              'MARINE AQUA\nTECHNOLOGIES',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xFF075B80),
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Smart Aquaculture. Better Results.',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 30),
            const CircularProgressIndicator(
              color: Color(0xFF0879A8),
            ),
          ],
        ),
      ),
    );
  }
}

// ============================================================
// LOGIN PAGE
// ============================================================

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController phoneController = TextEditingController();

  bool loading = false;

  Future<void> sendOTP() async {
    final phone = phoneController.text.trim();

    if (phone.length != 10) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please enter a valid 10 digit mobile number'),
        ),
      );
      return;
    }

    setState(() {
      loading = true;
    });

    try {
      await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: '+91$phone',

        verificationCompleted: (PhoneAuthCredential credential) async {
          await FirebaseAuth.instance.signInWithCredential(credential);
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

        codeAutoRetrievalTimeout: (String verificationId) {
          if (mounted) {
            setState(() {
              loading = false;
            });
          }
        },
      );
    } catch (e) {
      setState(() {
        loading = false;
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(e.toString()),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4FBFE),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(
              horizontal: 28,
              vertical: 30,
            ),
            child: Column(
              children: [
                Image.asset(
                  'assets/logo.png',
                  width: 130,
                  height: 130,
                  fit: BoxFit.contain,
                  errorBuilder: (_, __, ___) {
                    return const Icon(
                      Icons.water_drop,
                      size: 100,
                      color: Color(0xFF0879A8),
                    );
                  },
                ),

                const SizedBox(height: 20),

                const Text(
                  'MARINE AQUA',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF075B80),
                  ),
                ),

                const Text(
                  'TECHNOLOGIES',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF075B80),
                  ),
                ),

                const SizedBox(height: 8),

                const Text(
                  'ఆక్వా సాగులో ప్రతి దశలో... మీకు తోడుగా',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15,
                    color: Color(0xFF075B80),
                    fontWeight: FontWeight.w600,
                  ),
                ),

                const SizedBox(height: 6),

                const Text(
                  'Smart Aquaculture. Better Results.',
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),

                const SizedBox(height: 45),

                Container(
                  padding: const EdgeInsets.all(22),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(24),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.08),
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
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF075B80),
                        ),
                      ),

                      const SizedBox(height: 8),

                      const Text(
                        'Login with your mobile number',
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),

                      const SizedBox(height: 25),

                      TextField(
                        controller: phoneController,
                        keyboardType: TextInputType.phone,
                        maxLength: 10,
                        decoration: InputDecoration(
                          counterText: '',
                          prefixIcon: const Icon(
                            Icons.phone_android,
                            color: Color(0xFF0879A8),
                          ),
                          prefixText: '+91  ',
                          labelText: 'Mobile Number',
                          hintText: 'Enter mobile number',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: const BorderSide(
                              color: Color(0xFF0879A8),
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
                          onPressed: loading ? null : sendOTP,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF0879A8),
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                          child: loading
                              ? const SizedBox(
                                  width: 23,
                                  height: 23,
                                  child: CircularProgressIndicator(
                                    strokeWidth: 2,
                                    color: Colors.white,
                                  ),
                                )
                              : const Text(
                                  'SEND OTP',
                                  style: TextStyle(
                                    fontSize: 16,
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
    );
  }
}

// ============================================================
// OTP PAGE
// ============================================================

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
    final otp = otpController.text.trim();

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
      final credential = PhoneAuthProvider.credential(
        verificationId: widget.verificationId,
        smsCode: otp,
      );

      await FirebaseAuth.instance.signInWithCredential(
        credential,
      );
    } on FirebaseAuthException catch (e) {
      setState(() {
        loading = false;
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            e.message ?? 'Invalid OTP',
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4FBFE),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(
          color: Color(0xFF075B80),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(28),
          child: Column(
            children: [
              const SizedBox(height: 30),

              Image.asset(
                'assets/logo.png',
                width: 100,
                height: 100,
                errorBuilder: (_, __, ___) {
                  return const Icon(
                    Icons.water_drop,
                    size: 80,
                    color: Color(0xFF0879A8),
                  );
                },
              ),

              const SizedBox(height: 25),

              const Text(
                'Verify OTP',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF075B80),
                ),
              ),

              const SizedBox(height: 10),

              Text(
                'OTP sent to +91 ${widget.phoneNumber}',
                textAlign: TextAlign.center,
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
                  fontSize: 25,
                  letterSpacing: 12,
                  fontWeight: FontWeight.bold,
                ),
                decoration: InputDecoration(
                  counterText: '',
                  hintText: '------',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
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
                    backgroundColor: const Color(0xFF0879A8),
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
                          'VERIFY OTP',
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
      ),
    );
  }
}

// ============================================================
// MAIN NAVIGATION
// ============================================================

class MainNavigation extends StatefulWidget {
  const MainNavigation({super.key});

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int selectedIndex = 0;

  final pages = const [
    HomePage(),
    ProductsPage(),
    SupportPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: selectedIndex,
        children: pages,
      ),

      bottomNavigationBar: NavigationBar(
        selectedIndex: selectedIndex,
        backgroundColor: Colors.white,
        indicatorColor: const Color(0xFFD8F2FB),
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

// ============================================================
// HOME PAGE
// ============================================================

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4FBFE),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // HEADER
              Container(
                width: double.infinity,
                color: Colors.white,
                padding: const EdgeInsets.fromLTRB(
                  18,
                  15,
                  18,
                  18,
                ),
                child: Row(
                  children: [
                    Image.asset(
                      'assets/logo.png',
                      width: 80,
                      height: 80,
                      fit: BoxFit.contain,
                      errorBuilder: (_, __, ___) {
                        return const Icon(
                          Icons.water_drop,
                          size: 55,
                          color: Color(0xFF0879A8),
                        );
                      },
                    ),

                    const SizedBox(width: 12),

                    const Expanded(
                      child: Column(
                        crossAxisAlignment:
                            CrossAxisAlignment.start,
                        children: [
                          Text(
                            'MARINE AQUA',
                            style: TextStyle(
                              fontSize: 27,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF075B80),
                            ),
                          ),
                          Text(
                            'TECHNOLOGIES',
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF075B80),
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            'ఆక్వా సాగులో ప్రతి దశలో... మీకు తోడుగా',
                            style: TextStyle(
                              fontSize: 11,
                              color: Color(0xFF075B80),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 3),
                          Text(
                            'Smart Aquaculture. Better Results.',
                            style: TextStyle(
                              fontSize: 11,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),

                    const Icon(
                      Icons.notifications_none,
                      size: 32,
                      color: Color(0xFF075B80),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 14),

              // =================================================
              // HERO BANNER
              // =================================================

              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 18,
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(25),
                  child: AspectRatio(
                    aspectRatio: 16 / 8,
                    child: Image.asset(
                      'assets/hero_banner.png',
                      fit: BoxFit.cover,
                      errorBuilder: (_, __, ___) {
                        return Container(
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              colors: [
                                Color(0xFF30363B),
                                Color(0xFFDDE2E5),
                              ],
                            ),
                            borderRadius:
                                BorderRadius.circular(25),
                          ),
                          padding: const EdgeInsets.all(25),
                          child: const Column(
                            crossAxisAlignment:
                                CrossAxisAlignment.start,
                            mainAxisAlignment:
                                MainAxisAlignment.center,
                            children: [
                              Text(
                                'ఆరోగ్యకరమైన\nచెరువులు',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 10),
                              Text(
                                'బలమైన రొయ్యలు',
                                style: TextStyle(
                                  color: Colors.yellow,
                                  fontSize: 27,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                'అధిక లాభాలు',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 27,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 22),

              // =================================================
              // 3 CARDS TITLE
              // =================================================

              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 22,
                ),
                child: Row(
                  children: [
                    const Expanded(
                      child: Text(
                        'ఆక్వా సమాచారం',
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF075B80),
                        ),
                      ),
                    ),
                    const Icon(
                      Icons.arrow_forward,
                      color: Color(0xFF0879A8),
                      size: 30,
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 14),

              // =================================================
              // 3 IMAGE CARDS
              // =================================================

              SizedBox(
                height: 210,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 18,
                  ),
                  children: const [
                    AquaInfoCard(
                      image:
                          'assets/shortcut_card_1_royyala_sagu_guide.png',
                      title: 'రొయ్యల సాగు గైడ్',
                    ),

                    AquaInfoCard(
                      image:
                          'assets/shortcut_card_2_biomass_calculator.png',
                      title: 'బయోమాస్ కాలిక్యులేటర్',
                    ),

                    AquaInfoCard(
                      image:
                          'assets/shortcut_card_3_royyala_vyadhulu.png',
                      title: 'రొయ్యల వ్యాధులు',
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 22),

              // =================================================
              // WATER PARAMETERS
              // =================================================

              const WaterParameters(),

              const SizedBox(height: 22),

              // =================================================
              // PROBLEMS
              // =================================================

              const ProblemsSection(),

              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}

// ============================================================
// AQUA INFO CARD
// ============================================================

class AquaInfoCard extends StatelessWidget {
  final String image;
  final String title;

  const AquaInfoCard({
    super.key,
    required this.image,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 185,
      margin: const EdgeInsets.only(right: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.07),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: [
          Expanded(
            child: Image.asset(
              image,
              width: double.infinity,
              fit: BoxFit.cover,
              errorBuilder: (_, __, ___) {
                return Container(
                  color: const Color(0xFFEAF7FB),
                  child: const Center(
                    child: Icon(
                      Icons.image_not_supported_outlined,
                      size: 55,
                      color: Colors.grey,
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 8,
              vertical: 10,
            ),
            child: Text(
              title,
              textAlign: TextAlign.center,
              maxLines: 2,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Color(0xFF075B80),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ============================================================
// WATER PARAMETERS
// ============================================================

class WaterParameters extends StatelessWidget {
  const WaterParameters({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 18,
      ),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: const Color(0xFFE8F8FD),
        borderRadius: BorderRadius.circular(25),
        border: Border.all(
          color: const Color(0xFFB9E8F6),
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
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF075B80),
                  ),
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.edit,
                  color: Color(0xFF0879A8),
                ),
              ),
            ],
          ),

          const SizedBox(height: 12),

          Row(
            children: const [
              ParameterCard(
                icon: Icons.science_outlined,
                name: 'pH',
                value: '7.8',
                unit: '',
                range: '(6.5 - 8.5)',
              ),
              ParameterCard(
                icon: Icons.waves,
                name: 'Salinity',
                value: '18',
                unit: 'ppt',
                range: '(10 - 25)',
              ),
              ParameterCard(
                icon: Icons.air,
                name: 'DO',
                value: '5.6',
                unit: 'mg/L',
                range: '(≥ 5.0)',
              ),
              ParameterCard(
                icon: Icons.science,
                name: 'Alkalinity',
                value: '140',
                unit: 'ppm',
                range: '(80 - 200)',
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
    return Expanded(
      child: Container(
        margin: const EdgeInsets.symmetric(
          horizontal: 3,
        ),
        padding: const EdgeInsets.symmetric(
          vertical: 12,
          horizontal: 4,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          children: [
            Icon(
              icon,
              color: const Color(0xFF1594C0),
              size: 32,
            ),

            const SizedBox(height: 7),

            Text(
              name,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Color(0xFF075B80),
                fontSize: 13,
              ),
            ),

            const SizedBox(height: 6),

            Text(
              value,
              style: const TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Color(0xFF075B80),
              ),
            ),

            if (unit.isNotEmpty)
              Text(
                unit,
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 10,
                ),
              ),

            const SizedBox(height: 5),

            Text(
              range,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.grey,
                fontSize: 9,
              ),
            ),

            const SizedBox(height: 7),

            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 8,
                vertical: 4,
              ),
              decoration: BoxDecoration(
                color: const Color(0xFFD0F5DD),
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Text(
                'సరైనది',
                style: TextStyle(
                  color: Color(0xFF219653),
                  fontSize: 9,
                  fontWeight: FontWeight.bold,
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
// PROBLEMS SECTION
// ============================================================

class ProblemsSection extends StatelessWidget {
  const ProblemsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 18,
      ),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: const Color(0xFFE8F8FD),
        borderRadius: BorderRadius.circular(25),
        border: Border.all(
          color: const Color(0xFFB9E8F6),
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
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF075B80),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: const Icon(
                  Icons.manage_search,
                  color: Color(0xFF0879A8),
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

          GridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 2,
            mainAxisSpacing: 12,
            crossAxisSpacing: 12,
            childAspectRatio: 1.35,
            children: const [
              ProblemCard(
                icon: Icons.bug_report_outlined,
                title: 'Vibrio',
                subtitle: 'Vibrio problem',
              ),
              ProblemCard(
                icon: Icons.health_and_safety_outlined,
                title: 'White Gut',
                subtitle: 'Gut health problem',
              ),
              ProblemCard(
                icon: Icons.trending_down,
                title: 'Slow Growth',
                subtitle: 'Growth problem',
              ),
              ProblemCard(
                icon: Icons.water_drop_outlined,
                title: 'Low DO',
                subtitle: 'Oxygen problem',
              ),
              ProblemCard(
                icon: Icons.shield_outlined,
                title: 'Soft Shell',
                subtitle: 'Shell problem',
              ),
              ProblemCard(
                icon: Icons.science_outlined,
                title: 'Water Quality',
                subtitle: 'Water problem',
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
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: const Color(0xFF0879A8),
            size: 42,
          ),

          const SizedBox(height: 8),

          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xFF075B80),
            ),
          ),

          const SizedBox(height: 4),

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
    );
  }
}

// ============================================================
// PRODUCTS PAGE
// ============================================================

class ProductsPage extends StatelessWidget {
  const ProductsPage({super.key});

  final List<Map<String, String>> products = const [
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
      backgroundColor: const Color(0xFFF4FBFE),
      appBar: AppBar(
        title: const Text(
          'Our Products',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Color(0xFF075B80),
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
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
                  color: Colors.black.withOpacity(0.05),
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
                          size: 55,
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
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF075B80),
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
// SUPPORT PAGE
// ============================================================

class SupportPage extends StatelessWidget {
  const SupportPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4FBFE),
      appBar: AppBar(
        title: const Text(
          'Support',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Color(0xFF075B80),
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const SizedBox(height: 15),

          Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(25),
            ),
            child: Column(
              children: [
                const Icon(
                  Icons.support_agent,
                  size: 70,
                  color: Color(0xFF0879A8),
                ),

                const SizedBox(height: 15),

                const Text(
                  'Need Help?',
                  style: TextStyle(
                    fontSize: 27,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF075B80),
                  ),
                ),

                const SizedBox(height: 8),

                const Text(
                  'Marine Aqua Technologies support team is here to help you.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 15,
                  ),
                ),

                const SizedBox(height: 25),

                SizedBox(
                  width: double.infinity,
                  height: 52,
                  child: ElevatedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.phone),
                    label: const Text('Contact Support'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          const Color(0xFF0879A8),
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(15),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 20),

          _supportTile(
            Icons.water_drop,
            'Water Quality',
            'Get guidance for pond water parameters.',
          ),

          _supportTile(
            Icons.health_and_safety,
            'Disease Support',
            'Get information about shrimp health problems.',
          ),

          _supportTile(
            Icons.inventory_2,
            'Product Support',
            'Learn about Marine Aqua Technologies products.',
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
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: const Color(0xFFE5F7FC),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Icon(
              icon,
              color: const Color(0xFF0879A8),
              size: 30,
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
                    color: Color(0xFF075B80),
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
        ],
      ),
    );
  }
}
