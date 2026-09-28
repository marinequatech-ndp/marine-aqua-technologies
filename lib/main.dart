import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
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
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF08658A),
        ),
        scaffoldBackgroundColor: const Color(0xFFF4FBFE),
      ),
      home: const SplashScreen(),
    );
  }
}

/* =========================================================
   COLORS
========================================================= */

const Color marineBlue = Color(0xFF08658A);
const Color marineDarkBlue = Color(0xFF07506D);
const Color lightBlue = Color(0xFFEAF8FD);
const Color cardBlue = Color(0xFFE7F7FC);

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
          builder: (_) =>
              user == null ? const LoginScreen() : const MainNavigation(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3FBFE),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/products/marine logo.png',
              width: 250,
              height: 160,
              fit: BoxFit.contain,
              errorBuilder: (_, __, ___) {
                return const Icon(
                  Icons.water_drop,
                  size: 100,
                  color: marineBlue,
                );
              },
            ),
            const SizedBox(height: 20),
            const Text(
              'MARINE AQUA',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w800,
                color: marineBlue,
                letterSpacing: 1,
              ),
            ),
            const Text(
              'TECHNOLOGIES',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w800,
                color: marineBlue,
                letterSpacing: 1,
              ),
            ),
            const SizedBox(height: 12),
            const Text(
              'ఆక్వా సాగులో ప్రతి దశలో... మీకు తోడుగా',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: marineBlue,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Smart Aquaculture. Better Results.',
              style: TextStyle(
                fontSize: 16,
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
   LOGIN SCREEN
========================================================= */

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController phoneController = TextEditingController();

  bool loading = false;

  @override
  void dispose() {
    phoneController.dispose();
    super.dispose();
  }

  Future<void> sendOTP() async {
    String phone = phoneController.text.trim();

    if (phone.length != 10) {
      showMessage('Enter a valid 10-digit mobile number');
      return;
    }

    setState(() {
      loading = true;
    });

    final fullPhone = '+91$phone';

    try {
      await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: fullPhone,

        timeout: const Duration(seconds: 60),

        verificationCompleted: (PhoneAuthCredential credential) async {
          try {
            await FirebaseAuth.instance.signInWithCredential(credential);

            if (!mounted) return;

            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (_) => const MainNavigation(),
              ),
              (route) => false,
            );
          } catch (e) {
            if (mounted) {
              showMessage('Automatic verification failed');
            }
          }
        },

        verificationFailed: (FirebaseAuthException e) {
          if (!mounted) return;

          setState(() {
            loading = false;
          });

          String message = 'Unable to send OTP';

          if (e.code == 'invalid-phone-number') {
            message = 'Invalid phone number';
          } else if (e.code == 'too-many-requests') {
            message = 'Too many attempts. Try again later.';
          } else if (e.code == 'operation-not-allowed') {
            message = 'Phone Authentication is not enabled in Firebase.';
          } else if (e.message != null) {
            message = e.message!;
          }

          showMessage(message);
        },

        codeSent: (String verificationId, int? resendToken) {
          if (!mounted) return;

          setState(() {
            loading = false;
          });

          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => OTPVerificationScreen(
                verificationId: verificationId,
                phoneNumber: fullPhone,
              ),
            ),
          );
        },

        codeAutoRetrievalTimeout: (String verificationId) {},
      );
    } catch (e) {
      if (!mounted) return;

      setState(() {
        loading = false;
      });

      showMessage('Unable to send OTP');
    }
  }

  void showMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3FBFE),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 35),

              /* LOGO */
              Image.asset(
                'assets/products/marine logo.png',
                width: 260,
                height: 150,
                fit: BoxFit.contain,
                errorBuilder: (_, __, ___) {
                  return const Icon(
                    Icons.water_drop,
                    size: 90,
                    color: marineBlue,
                  );
                },
              ),

              const SizedBox(height: 10),

              const Text(
                'MARINE AQUA',
                style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.w800,
                  color: marineBlue,
                ),
              ),

              const Text(
                'TECHNOLOGIES',
                style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.w800,
                  color: marineBlue,
                ),
              ),

              const SizedBox(height: 10),

              const Text(
                'ఆక్వా సాగులో ప్రతి దశలో... మీకు తోడుగా',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: marineBlue,
                ),
              ),

              const SizedBox(height: 6),

              const Text(
                'Smart Aquaculture. Better Results.',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),

              const SizedBox(height: 45),

              /* LOGIN CARD */
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 24),
                padding: const EdgeInsets.fromLTRB(28, 30, 28, 32),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(32),
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
                        fontSize: 34,
                        fontWeight: FontWeight.w800,
                        color: marineDarkBlue,
                      ),
                    ),

                    const SizedBox(height: 8),

                    const Text(
                      'Login with your mobile number',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.grey,
                      ),
                    ),

                    const SizedBox(height: 28),

                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 18,
                      ),
                      decoration: BoxDecoration(
                        color: lightBlue,
                        borderRadius: BorderRadius.circular(22),
                      ),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.phone_android,
                            color: marineBlue,
                            size: 34,
                          ),

                          const SizedBox(width: 12),

                          const Text(
                            '+91',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: marineDarkBlue,
                            ),
                          ),

                          const SizedBox(width: 8),

                          Expanded(
                            child: TextField(
                              controller: phoneController,
                              keyboardType: TextInputType.phone,
                              maxLength: 10,
                              decoration: const InputDecoration(
                                hintText: 'Mobile number',
                                counterText: '',
                                border: InputBorder.none,
                              ),
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 24),

                    SizedBox(
                      width: double.infinity,
                      height: 62,
                      child: ElevatedButton(
                        onPressed: loading ? null : sendOTP,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: marineBlue,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        child: loading
                            ? const SizedBox(
                                height: 25,
                                width: 25,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2.5,
                                  color: Colors.white,
                                ),
                              )
                            : const Text(
                                'GET OTP',
                                style: TextStyle(
                                  fontSize: 19,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 28),

              const Text(
                'Secure • Simple • Smart Aquaculture',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 15,
                ),
              ),

              const SizedBox(height: 25),
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

  bool loading = false;

  Future<void> verifyOTP() async {
    final otp = otpController.text.trim();

    if (otp.length != 6) {
      showMessage('Enter 6-digit OTP');
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
    } on FirebaseAuthException catch (e) {
      setState(() {
        loading = false;
      });

      showMessage(
        e.message ?? 'Invalid OTP',
      );
    } catch (e) {
      setState(() {
        loading = false;
      });

      showMessage('OTP verification failed');
    }
  }

  void showMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3FBFE),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(
          color: marineBlue,
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(25),
          child: Column(
            children: [
              const SizedBox(height: 30),

              Image.asset(
                'assets/products/marine logo.png',
                width: 190,
                height: 120,
                fit: BoxFit.contain,
              ),

              const SizedBox(height: 30),

              const Text(
                'Verify OTP',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w800,
                  color: marineDarkBlue,
                ),
              ),

              const SizedBox(height: 10),

              Text(
                'OTP sent to ${widget.phoneNumber}',
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),

              const SizedBox(height: 35),

              TextField(
                controller: otpController,
                keyboardType: TextInputType.number,
                maxLength: 6,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  counterText: '',
                  hintText: 'Enter OTP',
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide.none,
                  ),
                ),
                style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 10,
                ),
              ),

              const SizedBox(height: 25),

              SizedBox(
                width: double.infinity,
                height: 60,
                child: ElevatedButton(
                  onPressed: loading ? null : verifyOTP,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: marineBlue,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: loading
                      ? const CircularProgressIndicator(
                          color: Colors.white,
                        )
                      : const Text(
                          'VERIFY OTP',
                          style: TextStyle(
                            fontSize: 18,
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

/* =========================================================
   MAIN NAVIGATION
========================================================= */

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
      body: pages[currentIndex],

      bottomNavigationBar: NavigationBar(
        selectedIndex: currentIndex,
        onDestinationSelected: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        backgroundColor: Colors.white,
        indicatorColor: const Color(0xFFDDF4FC),
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
   HOME PAGE
========================================================= */

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(
                20,
                18,
                20,
                8,
              ),
              child: Row(
                children: [
                  Image.asset(
                    'assets/products/marine logo.png',
                    width: 62,
                    height: 62,
                    fit: BoxFit.contain,
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
                            fontSize: 20,
                            fontWeight: FontWeight.w800,
                            color: marineBlue,
                          ),
                        ),
                        Text(
                          'TECHNOLOGIES',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w800,
                            color: marineBlue,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          'ఆక్వా సాగులో ప్రతి దశలో... మీకు తోడుగా',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                            color: marineBlue,
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
                ],
              ),
            ),
          ),

          /* =================================================
             HERO CARD
          ================================================= */

          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(
                20,
                15,
                20,
                20,
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(28),
                child: SizedBox(
                  height: 205,
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      Image.asset(
                        'assets/products/hero_shrimp.jpg',
                        fit: BoxFit.cover,
                        errorBuilder: (_, __, ___) {
                          return Container(
                            color: marineBlue,
                          );
                        },
                      ),

                      Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            colors: [
                              Colors.black.withOpacity(0.75),
                              Colors.black.withOpacity(0.25),
                              Colors.transparent,
                            ],
                          ),
                        ),
                      ),

                      const Padding(
                        padding: EdgeInsets.all(25),
                        child: Column(
                          crossAxisAlignment:
                              CrossAxisAlignment.start,
                          mainAxisAlignment:
                              MainAxisAlignment.center,
                          children: [
                            Text(
                              'ఆరోగ్యకరమైన',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                            Text(
                              'చెరువులు',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              'బలమైన రొయ్యలు',
                              style: TextStyle(
                                color: Colors.yellow,
                                fontSize: 27,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(
                              'అధిక లాభాలు',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 27,
                                fontWeight: FontWeight.w800,
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
          ),

          /* =================================================
             SHORTCUT TITLE
          ================================================= */

          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(
                20,
                0,
                20,
                15,
              ),
              child: Row(
                children: [
                  const Expanded(
                    child: Text(
                      'ఆక్వా సమాచారం',
                      style: TextStyle(
                        fontSize: 27,
                        fontWeight: FontWeight.w800,
                        color: marineBlue,
                      ),
                    ),
                  ),
                  Icon(
                    Icons.arrow_forward,
                    color: marineBlue,
                    size: 30,
                  ),
                ],
              ),
            ),
          ),

          /* =================================================
             3 SHORTCUT CARDS
          ================================================= */

          SliverToBoxAdapter(
            child: SizedBox(
              height: 175,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                children: [
                  ShortcutCard(
                    image:
                        'assets/products/shrimp_guide.png',
                    title: 'రొయ్యల సాగు గైడ్',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const InfoPage(
                            title: 'రొయ్యల సాగు గైడ్',
                            image:
                                'assets/products/shrimp_guide.png',
                            description:
                                'రొయ్యల సాగులో ముఖ్యమైన నిర్వహణ సూచనలు, నీటి నాణ్యత, ఫీడ్ మేనేజ్‌మెంట్ మరియు సాధారణ జాగ్రత్తలు.',
                          ),
                        ),
                      );
                    },
                  ),

                  ShortcutCard(
                    image:
                        'assets/products/biomass_calculator.png',
                    title: 'బయోమాస్ కాలిక్యులేటర్',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) =>
                              const BiomassCalculatorPage(),
                        ),
                      );
                    },
                  ),

                  ShortcutCard(
                    image:
                        'assets/products/shrimp_diseases.png',
                    title: 'రొయ్యల వ్యాధులు',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const InfoPage(
                            title: 'రొయ్యల వ్యాధులు',
                            image:
                                'assets/products/shrimp_diseases.png',
                            description:
                                'రొయ్యల సాగులో కనిపించే సాధారణ వ్యాధుల లక్షణాలు మరియు నిర్వహణకు సంబంధించిన ప్రాథమిక సమాచారం.',
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),

          /* =================================================
             WATER PARAMETERS
          ================================================= */

          SliverToBoxAdapter(
            child: WaterParametersCard(),
          ),

          /* =================================================
             PRODUCTS
          ================================================= */

          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(
                20,
                25,
                20,
                12,
              ),
              child: Row(
                children: [
                  const Expanded(
                    child: Text(
                      'Featured Products',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w800,
                        color: marineBlue,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      'View All',
                      style: TextStyle(
                        color: marineBlue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          SliverPadding(
            padding: const EdgeInsets.fromLTRB(
              20,
              0,
              20,
              30,
            ),
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
                childAspectRatio: 0.78,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/* =========================================================
   SHORTCUT CARD
========================================================= */

class ShortcutCard extends StatelessWidget {
  final String image;
  final String title;
  final VoidCallback onTap;

  const ShortcutCard({
    super.key,
    required this.image,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 155,
        margin: const EdgeInsets.only(right: 14),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(22),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.07),
              blurRadius: 12,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Column(
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(22),
                ),
                child: Image.asset(
                  image,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  errorBuilder: (_, __, ___) {
                    return const Center(
                      child: Icon(
                        Icons.image_not_supported_outlined,
                        size: 45,
                        color: Colors.grey,
                      ),
                    );
                  },
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(10),
              child: Text(
                title,
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: marineDarkBlue,
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

class WaterParametersCard extends StatelessWidget {
  WaterParametersCard({super.key});

  final List<Map<String, String>> parameters = [
    {
      'name': 'pH',
      'value': '7.8',
      'unit': '',
      'range': '6.5 - 8.5',
      'icon': '⚗',
    },
    {
      'name': 'Salinity',
      'value': '18',
      'unit': 'ppt',
      'range': '10 - 35',
      'icon': '〰',
    },
    {
      'name': 'DO',
      'value': '5.6',
      'unit': 'mg/L',
      'range': '> 4.0',
      'icon': '≋',
    },
    {
      'name': 'Alkalinity',
      'value': '140',
      'unit': 'ppm',
      'range': '100 - 180',
      'icon': '⚗',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(
        20,
        25,
        20,
        0,
      ),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: cardBlue,
        borderRadius: BorderRadius.circular(28),
        border: Border.all(
          color: const Color(0xFFA9E4F4),
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
                    fontSize: 23,
                    fontWeight: FontWeight.w800,
                    color: marineBlue,
                  ),
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.edit_outlined,
                  color: marineBlue,
                ),
              ),
            ],
          ),

          const SizedBox(height: 12),

          Row(
            children: parameters.map((parameter) {
              return Expanded(
                child: Container(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 3,
                  ),
                  padding: const EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 4,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(18),
                  ),
                  child: Column(
                    children: [
                      Text(
                        parameter['icon']!,
                        style: const TextStyle(
                          fontSize: 25,
                          color: marineBlue,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        parameter['name']!,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: marineDarkBlue,
                          fontSize: 12,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        parameter['value']!,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w800,
                          color: marineBlue,
                        ),
                      ),
                      Text(
                        parameter['unit']!,
                        style: const TextStyle(
                          fontSize: 10,
                          color: Colors.grey,
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
    );
  }
}

/* =========================================================
   PRODUCTS DATA
========================================================= */

class ProductData {
  final String name;
  final String image;
  final String description;

  const ProductData({
    required this.name,
    required this.image,
    required this.description,
  });
}

const List<ProductData> products = [
  ProductData(
    name: 'Bio Sludge',
    image: 'assets/products/Bio sludge.png',
    description:
        'Organic sludge management and pond conditioning support.',
  ),

  ProductData(
    name: 'Bio Soil',
    image: 'assets/products/Bio soil.png',
    description:
        'Supports pond bottom and soil management.',
  ),

  ProductData(
    name: 'Free Moult',
    image: 'assets/products/Free moult.png',
    description:
        'Supports healthy moulting and shell formation.',
  ),

  ProductData(
    name: 'Hi-Soft',
    image: 'assets/products/Hi-Soft.png',
    description:
        'Aquaculture support product for shrimp management.',
  ),

  ProductData(
    name: 'Marine Vibrio Shield',
    image:
        'assets/products/Marine vibrio shield.png',
    description:
        'Vibrio management support for shrimp ponds.',
  ),

  ProductData(
    name: 'Red Thunder',
    image: 'assets/products/Red thunder.png',
    description:
        'Aquaculture performance support product.',
  ),

  ProductData(
    name: 'Starmin',
    image: 'assets/products/Starmin.png',
    description:
        'Mineral support for aquaculture applications.',
  ),

  ProductData(
    name: 'Yucca Pro',
    image: 'assets/products/Yucca Pro.png',
    description:
        'Supports pond water and organic load management.',
  ),

  ProductData(
    name: 'Zeoneem',
    image: 'assets/products/Zeoneem.png',
    description:
        'Aquaculture pond management support.',
  ),

  ProductData(
    name: 'Marine 6G',
    image: 'assets/products/marine 6g.png',
    description:
        'Liquid minerals for shell formation and moulting support.',
  ),

  ProductData(
    name: 'Marine ProTab',
    image: 'assets/products/marine protab.png',
    description:
        'Probiotic tablet for pond microbial management.',
  ),

  ProductData(
    name: 'Marine Volt-X',
    image: 'assets/products/marine volt-x.png',
    description:
        'Growth and feed support product.',
  ),

  ProductData(
    name: 'Marine White Shield',
    image:
        'assets/products/marine white shield.png',
    description:
        'Support for white gut and shrimp health management.',
  ),

  ProductData(
    name: 'Nutramin',
    image: 'assets/products/nutramin.png',
    description:
        'Nutritional and mineral support.',
  ),

  ProductData(
    name: 'OXYTAB Plus',
    image: 'assets/products/oxytab plus.png',
    description:
        'Oxygen support tablet for aquaculture ponds.',
  ),
];

/* =========================================================
   PRODUCT CARD
========================================================= */

class ProductCard extends StatelessWidget {
  final ProductData product;

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
            builder: (_) => ProductDetailsPage(
              product: product,
            ),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(22),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.06),
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Image.asset(
                  product.image,
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
                10,
                4,
                10,
                12,
              ),
              child: Text(
                product.name,
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w800,
                  color: marineDarkBlue,
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
   PRODUCTS PAGE
========================================================= */

class ProductsPage extends StatelessWidget {
  const ProductsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                children: [
                  Image.asset(
                    'assets/products/marine logo.png',
                    width: 55,
                    height: 55,
                  ),
                  const SizedBox(width: 12),
                  const Text(
                    'Our Products',
                    style: TextStyle(
                      fontSize: 27,
                      fontWeight: FontWeight.w800,
                      color: marineBlue,
                    ),
                  ),
                ],
              ),
            ),
          ),

          SliverPadding(
            padding: const EdgeInsets.fromLTRB(
              20,
              0,
              20,
              30,
            ),
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
                childAspectRatio: 0.78,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/* =========================================================
   PRODUCT DETAILS
========================================================= */

class ProductDetailsPage extends StatelessWidget {
  final ProductData product;

  const ProductDetailsPage({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4FBFE),
      appBar: AppBar(
        title: Text(product.name),
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: marineBlue,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Container(
              height: 300,
              width: double.infinity,
              padding: const EdgeInsets.all(25),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(28),
              ),
              child: Image.asset(
                product.image,
                fit: BoxFit.contain,
              ),
            ),

            const SizedBox(height: 25),

            Text(
              product.name,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w800,
                color: marineBlue,
              ),
            ),

            const SizedBox(height: 20),

            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(22),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(24),
              ),
              child: Text(
                product.description,
                style: const TextStyle(
                  fontSize: 17,
                  height: 1.6,
                  color: Colors.black87,
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
   INFO PAGE
========================================================= */

class InfoPage extends StatelessWidget {
  final String title;
  final String image;
  final String description;

  const InfoPage({
    super.key,
    required this.title,
    required this.image,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4FBFE),
      appBar: AppBar(
        title: Text(title),
        foregroundColor: marineBlue,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(25),
              child: Image.asset(
                image,
                width: double.infinity,
                height: 240,
                fit: BoxFit.cover,
              ),
            ),

            const SizedBox(height: 25),

            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w800,
                color: marineBlue,
              ),
            ),

            const SizedBox(height: 18),

            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(22),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(24),
              ),
              child: Text(
                description,
                style: const TextStyle(
                  fontSize: 17,
                  height: 1.7,
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
   BIOMASS CALCULATOR
========================================================= */

class BiomassCalculatorPage extends StatefulWidget {
  const BiomassCalculatorPage({super.key});

  @override
  State<BiomassCalculatorPage> createState() =>
      _BiomassCalculatorPageState();
}

class _BiomassCalculatorPageState
    extends State<BiomassCalculatorPage> {
  final TextEditingController countController =
      TextEditingController();

  final TextEditingController averageWeightController =
      TextEditingController();

  double biomass = 0;

  void calculate() {
    final count =
        double.tryParse(countController.text) ?? 0;

    final weight =
        double.tryParse(averageWeightController.text) ?? 0;

    setState(() {
      biomass = (count * weight) / 1000;
    });
  }

  @override
  void dispose() {
    countController.dispose();
    averageWeightController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4FBFE),
      appBar: AppBar(
        title: const Text('Biomass Calculator'),
        foregroundColor: marineBlue,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: countController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Shrimp Count',
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18),
                  borderSide: BorderSide.none,
                ),
              ),
            ),

            const SizedBox(height: 15),

            TextField(
              controller: averageWeightController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Average Weight (g)',
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18),
                  borderSide: BorderSide.none,
                ),
              ),
            ),

            const SizedBox(height: 20),

            SizedBox(
              width: double.infinity,
              height: 58,
              child: ElevatedButton(
                onPressed: calculate,
                style: ElevatedButton.styleFrom(
                  backgroundColor: marineBlue,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18),
                  ),
                ),
                child: const Text(
                  'CALCULATE',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 30),

            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(25),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25),
              ),
              child: Column(
                children: [
                  const Text(
                    'Estimated Biomass',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '${biomass.toStringAsFixed(2)} kg',
                    style: const TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.w800,
                      color: marineBlue,
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

/* =========================================================
   SUPPORT PAGE
========================================================= */

class SupportPage extends StatelessWidget {
  const SupportPage({super.key});

  Future<void> logout(BuildContext context) async {
    await FirebaseAuth.instance.signOut();

    if (!context.mounted) return;

    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (_) => const LoginScreen(),
      ),
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Image.asset(
              'assets/products/marine logo.png',
              width: 140,
              height: 110,
            ),

            const Text(
              'MARINE AQUA TECHNOLOGIES',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w800,
                color: marineBlue,
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
              subtitle: 'Get aquaculture assistance',
              onTap: () {},
            ),

            SupportTile(
              icon: Icons.location_on,
              title: 'Technical Support',
              subtitle: 'Pond related guidance',
              onTap: () {},
            ),

            const SizedBox(height: 20),

            SizedBox(
              width: double.infinity,
              height: 55,
              child: OutlinedButton.icon(
                onPressed: () => logout(context),
                icon: const Icon(Icons.logout),
                label: const Text(
                  'LOGOUT',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.red,
                  side: const BorderSide(
                    color: Colors.red,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18),
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

/* =========================================================
   SUPPORT TILE
========================================================= */

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
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: ListTile(
        onTap: onTap,
        contentPadding: const EdgeInsets.all(12),
        leading: Container(
          width: 52,
          height: 52,
          decoration: BoxDecoration(
            color: lightBlue,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Icon(
            icon,
            color: marineBlue,
          ),
        ),
        title: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: marineDarkBlue,
          ),
        ),
        subtitle: Text(subtitle),
        trailing: const Icon(
          Icons.arrow_forward_ios,
          size: 18,
          color: marineBlue,
        ),
      ),
    );
  }
}
