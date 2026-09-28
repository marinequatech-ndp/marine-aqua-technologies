import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  try {
    await Firebase.initializeApp();
  } catch (_) {
    // Firebase configuration can be added later.
  }

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
        scaffoldBackgroundColor: const Color(0xFFF4FBFF),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF0875A1),
        ),
      ),
      home: const LoginPage(),
    );
  }
}

// ============================================================
// COLORS
// ============================================================

const Color marineBlue = Color(0xFF075F87);
const Color marineBlue2 = Color(0xFF0B83B5);
const Color lightBlue = Color(0xFFEAF8FF);
const Color cardBlue = Color(0xFFDDF4FF);
const Color green = Color(0xFF28A66A);
const Color darkText = Color(0xFF064F70);

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
    String phone = phoneController.text.trim();

    if (phone.length != 10) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Enter a valid 10 digit mobile number'),
        ),
      );
      return;
    }

    setState(() {
      loading = true;
    });

    String fullPhone = '+91$phone';

    try {
      await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: fullPhone,
        verificationCompleted: (PhoneAuthCredential credential) async {
          try {
            await FirebaseAuth.instance.signInWithCredential(credential);
          } catch (_) {}
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

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Unable to send OTP'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 25,
              vertical: 30,
            ),
            child: Column(
              children: [
                const SizedBox(height: 25),

                Image.asset(
                  'assets/products/marine logo.png',
                  height: 110,
                  errorBuilder: (_, __, ___) {
                    return const Icon(
                      Icons.water_drop,
                      size: 80,
                      color: marineBlue,
                    );
                  },
                ),

                const SizedBox(height: 15),

                const Text(
                  'MARINE AQUA',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: marineBlue,
                  ),
                ),

                const Text(
                  'TECHNOLOGIES',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: marineBlue,
                  ),
                ),

                const SizedBox(height: 8),

                const Text(
                  'ఆక్వా సాగులో ప్రతి దశలో... మీకు తోడుగా',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                    color: marineBlue,
                  ),
                ),

                const SizedBox(height: 4),

                const Text(
                  'Smart Aquaculture. Better Results.',
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.grey,
                  ),
                ),

                const SizedBox(height: 45),

                Container(
                  padding: const EdgeInsets.all(25),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(28),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 20,
                        color: Colors.black.withOpacity(0.08),
                        offset: const Offset(0, 8),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Welcome Back',
                          style: TextStyle(
                            fontSize: 27,
                            fontWeight: FontWeight.bold,
                            color: darkText,
                          ),
                        ),
                      ),

                      const SizedBox(height: 8),

                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Login with your mobile number',
                          style: TextStyle(
                            fontSize: 15,
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
                          prefixText: '+91  ',
                          prefixStyle: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: darkText,
                          ),
                          hintText: 'Mobile Number',
                          prefixIcon: const Icon(
                            Icons.phone_android,
                            color: marineBlue2,
                          ),
                          filled: true,
                          fillColor: lightBlue,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(18),
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
                            backgroundColor: marineBlue,
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18),
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
                                  'GET OTP',
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

                const SizedBox(height: 30),

                const Text(
                  'Secure • Simple • Smart Aquaculture',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 13,
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

  bool verifying = false;

  Future<void> verifyOTP() async {
    if (otpController.text.trim().length != 6) {
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
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(25),
          child: Column(
            children: [
              const SizedBox(height: 50),

              Image.asset(
                'assets/products/marine logo.png',
                height: 90,
                errorBuilder: (_, __, ___) {
                  return const Icon(
                    Icons.water_drop,
                    size: 70,
                    color: marineBlue,
                  );
                },
              ),

              const SizedBox(height: 30),

              const Text(
                'Verify OTP',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: darkText,
                ),
              ),

              const SizedBox(height: 10),

              Text(
                'OTP sent to ${widget.phoneNumber}',
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
                  fontWeight: FontWeight.bold,
                  letterSpacing: 8,
                ),
                decoration: InputDecoration(
                  counterText: '',
                  hintText: '------',
                  filled: true,
                  fillColor: lightBlue,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(18),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),

              const SizedBox(height: 25),

              SizedBox(
                width: double.infinity,
                height: 55,
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
        onDestinationSelected: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        backgroundColor: Colors.white,
        indicatorColor: const Color(0xFFD9F3FF),
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
    return SafeArea(
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: _homeHeader(),
          ),

          SliverToBoxAdapter(
            child: _heroBanner(),
          ),

          SliverToBoxAdapter(
            child: _shortcutSection(),
          ),

          SliverToBoxAdapter(
            child: _waterParameters(),
          ),

          SliverToBoxAdapter(
            child: _problemsSection(),
          ),

          const SliverToBoxAdapter(
            child: SizedBox(height: 30),
          ),
        ],
      ),
    );
  }

  Widget _homeHeader() {
    return Container(
      padding: const EdgeInsets.fromLTRB(
        18,
        12,
        18,
        15,
      ),
      color: Colors.white,
      child: Row(
        children: [
          Image.asset(
            'assets/products/marine logo.png',
            width: 85,
            height: 70,
            fit: BoxFit.contain,
            errorBuilder: (_, __, ___) {
              return const Icon(
                Icons.water_drop,
                color: marineBlue2,
                size: 55,
              );
            },
          ),

          const SizedBox(width: 10),

          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'MARINE AQUA',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: marineBlue,
                  ),
                ),
                Text(
                  'TECHNOLOGIES',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
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
            Icons.notifications_none_rounded,
            color: marineBlue,
            size: 32,
          ),
        ],
      ),
    );
  }

  Widget _heroBanner() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(
        18,
        15,
        18,
        10,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(28),
        child: AspectRatio(
          aspectRatio: 1.55,
          child: Stack(
            fit: StackFit.expand,
            children: [
              Image.asset(
                'assets/products/hero_shrimp.jpg',
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) {
                  return Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Color(0xFF3E4448),
                          Color(0xFFE3E5E6),
                        ],
                      ),
                    ),
                  );
                },
              ),

              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [
                      Colors.black.withOpacity(0.72),
                      Colors.black.withOpacity(0.15),
                    ],
                  ),
                ),
              ),

              const Padding(
                padding: EdgeInsets.all(28),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'ఆరోగ్యకరమైన',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 27,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'చెరువులు',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 27,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        'బలమైన రొయ్యలు',
                        style: TextStyle(
                          color: Color(0xFFFFD900),
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
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _shortcutSection() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(
        18,
        10,
        18,
        15,
      ),
      child: Column(
        children: [
          Row(
            children: [
              const Expanded(
                child: Text(
                  'ఆక్వా సమాచార',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: darkText,
                  ),
                ),
              ),
              Icon(
                Icons.arrow_forward_rounded,
                color: marineBlue2,
                size: 32,
              ),
            ],
          ),

          const SizedBox(height: 12),

          SizedBox(
            height: 205,
            child: Row(
              children: [
                Expanded(
                  child: _imageCard(
                    'assets/products/shrimp_guide.png',
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _imageCard(
                    'assets/products/biomass_calculator.png',
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _imageCard(
                    'assets/products/shrimp_diseases.png',
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _imageCard(String imagePath) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(25),
      child: Container(
        color: Colors.white,
        child: Image.asset(
          imagePath,
          width: double.infinity,
          height: double.infinity,
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
    );
  }

  Widget _waterParameters() {
    return Container(
      margin: const EdgeInsets.fromLTRB(
        18,
        12,
        18,
        15,
      ),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: const Color(0xFFE9F8FF),
        borderRadius: BorderRadius.circular(30),
        border: Border.all(
          color: const Color(0xFFB8E5F6),
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
                    fontWeight: FontWeight.bold,
                    color: darkText,
                  ),
                ),
              ),
              Icon(
                Icons.edit,
                color: marineBlue2,
                size: 28,
              ),
            ],
          ),

          const SizedBox(height: 15),

          Row(
            children: [
              Expanded(
                child: _parameterCard(
                  Icons.science_outlined,
                  'pH',
                  '7.8',
                  '(6.5 - 8.5)',
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: _parameterCard(
                  Icons.water,
                  'Salinity',
                  '18',
                  '(10 - 25)',
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: _parameterCard(
                  Icons.air,
                  'DO',
                  '5.6',
                  '(≥ 5.0)',
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: _parameterCard(
                  Icons.science,
                  'Alkalinity',
                  '140',
                  '(80 - 200)',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _parameterCard(
    IconData icon,
    String title,
    String value,
    String range,
  ) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 7,
        vertical: 13,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
      ),
      child: Column(
        children: [
          Icon(
            icon,
            color: marineBlue2,
            size: 30,
          ),

          const SizedBox(height: 7),

          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: darkText,
              fontSize: 13,
            ),
          ),

          const SizedBox(height: 7),

          Text(
            value,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: darkText,
            ),
          ),

          Text(
            range,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 9,
              color: Colors.grey,
            ),
          ),

          const SizedBox(height: 7),

          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 8,
              vertical: 4,
            ),
            decoration: BoxDecoration(
              color: const Color(0xFFD2F5DE),
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Text(
              'సరైనది',
              style: TextStyle(
                fontSize: 10,
                color: green,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _problemsSection() {
    final problems = [
      {
        'title': 'Vibrio',
        'sub': 'Vibrio problem',
        'icon': Icons.bug_report_outlined,
      },
      {
        'title': 'White Gut',
        'sub': 'Gut health problem',
        'icon': Icons.health_and_safety_outlined,
      },
      {
        'title': 'Slow Growth',
        'sub': 'Growth problem',
        'icon': Icons.trending_down,
      },
      {
        'title': 'Low DO',
        'sub': 'Oxygen problem',
        'icon': Icons.water_drop_outlined,
      },
      {
        'title': 'Soft Shell',
        'sub': 'Shell problem',
        'icon': Icons.shield_outlined,
      },
      {
        'title': 'Water Quality',
        'sub': 'Water problem',
        'icon': Icons.science_outlined,
      },
    ];

    return Container(
      margin: const EdgeInsets.fromLTRB(
        18,
        10,
        18,
        0,
      ),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFFE9F8FF),
        borderRadius: BorderRadius.circular(30),
        border: Border.all(
          color: const Color(0xFFB8E5F6),
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
                    fontSize: 27,
                    fontWeight: FontWeight.bold,
                    color: darkText,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(13),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(18),
                ),
                child: const Icon(
                  Icons.manage_search,
                  color: marineBlue2,
                  size: 28,
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

          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: problems.length,
            gridDelegate:
                const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: 1.45,
            ),
            itemBuilder: (context, index) {
              final item = problems[index];

              return Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      item['icon'] as IconData,
                      size: 38,
                      color: marineBlue2,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      item['title'] as String,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: darkText,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      item['sub'] as String,
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              );
            },
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
      'name': 'NutriMin',
      'image': 'assets/products/nutrimin.png',
    },
    {
      'name': 'OXYTAB+',
      'image': 'assets/products/oxytab plus.png',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Container(
              padding: const EdgeInsets.fromLTRB(
                20,
                20,
                20,
                15,
              ),
              color: Colors.white,
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Our Products',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: darkText,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    'Marine Aqua Technologies',
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          ),

          SliverPadding(
            padding: const EdgeInsets.all(16),
            sliver: SliverGrid(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  final product = products[index];

                  return _productCard(
                    product['name']!,
                    product['image']!,
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

  Widget _productCard(
    String name,
    String image,
  ) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Expanded(
              child: Image.asset(
                image,
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

            const SizedBox(height: 8),

            Text(
              name,
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: darkText,
                fontSize: 15,
              ),
            ),

            const SizedBox(height: 8),

            SizedBox(
              width: double.infinity,
              height: 38,
              child: OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  foregroundColor: marineBlue2,
                  side: const BorderSide(
                    color: marineBlue2,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
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
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const SizedBox(height: 15),

            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Support',
                style: TextStyle(
                  fontSize: 31,
                  fontWeight: FontWeight.bold,
                  color: darkText,
                ),
              ),
            ),

            const SizedBox(height: 8),

            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'We are here to support your aquaculture journey.',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 15,
                ),
              ),
            ),

            const SizedBox(height: 25),

            _supportCard(
              Icons.phone,
              'Call Support',
              'Talk to our technical team',
            ),

            _supportCard(
              Icons.chat,
              'WhatsApp Support',
              'Get quick assistance',
            ),

            _supportCard(
              Icons.location_on_outlined,
              'Technical Officer',
              'Connect with your local officer',
            ),

            _supportCard(
              Icons.help_outline,
              'FAQs',
              'Frequently asked questions',
            ),

            const SizedBox(height: 25),

            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(22),
              decoration: BoxDecoration(
                color: lightBlue,
                borderRadius: BorderRadius.circular(25),
              ),
              child: const Column(
                children: [
                  Icon(
                    Icons.water_drop,
                    size: 50,
                    color: marineBlue2,
                  ),
                  SizedBox(height: 12),
                  Text(
                    'Marine Aqua Technologies',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: darkText,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    'Smart Aquaculture. Better Results.',
                    style: TextStyle(
                      color: Colors.grey,
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

  Widget _supportCard(
    IconData icon,
    String title,
    String subtitle,
  ) {
    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 10,
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: lightBlue,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Icon(
              icon,
              color: marineBlue2,
              size: 27,
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
                    color: darkText,
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
