import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  try {
    await Firebase.initializeApp();
  } catch (e) {
    debugPrint("Firebase initialization error: $e");
  }

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
        fontFamily: 'Roboto',
        scaffoldBackgroundColor: const Color(0xFFF5FAFD),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF0875B9),
        ),
      ),
      home: const SplashScreen(),
    );
  }
}

// ============================================================
// COLORS
// ============================================================

const Color marineBlue = Color(0xFF073F70);
const Color marineLightBlue = Color(0xFF159BD3);
const Color marineCyan = Color(0xFF13A8C2);
const Color pageBackground = Color(0xFFF5FAFD);

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

      final user = FirebaseAuth.instance.currentUser;

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) =>
              user == null ? const LoginPage() : const HomePage(),
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
                  fontSize: 21,
                  fontWeight: FontWeight.bold,
                  color: marineBlue,
                ),
              ),
              const SizedBox(height: 12),
              const Text(
                'Marine Aqua Technologies',
                style: TextStyle(
                  fontSize: 18,
                  color: marineBlue,
                ),
              ),
              const SizedBox(height: 35),
              const CircularProgressIndicator(
                color: marineLightBlue,
              ),
            ],
          ),
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

  bool isSending = false;

  String verificationId = '';

  @override
  void dispose() {
    phoneController.dispose();
    super.dispose();
  }

  Future<void> sendOTP() async {
    String phone = phoneController.text.trim();

    if (phone.length != 10) {
      showMessage('Please enter a valid 10-digit mobile number.');
      return;
    }

    setState(() {
      isSending = true;
    });

    try {
      await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: '+91$phone',

        verificationCompleted: (PhoneAuthCredential credential) async {
          try {
            await FirebaseAuth.instance.signInWithCredential(credential);

            if (!mounted) return;

            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (_) => const HomePage(),
              ),
              (route) => false,
            );
          } catch (e) {
            showMessage(e.toString());
          }
        },

        verificationFailed: (FirebaseAuthException e) {
          if (!mounted) return;

          setState(() {
            isSending = false;
          });

          showMessage(
            e.message ?? 'OTP verification failed.',
          );
        },

        codeSent: (String id, int? resendToken) {
          verificationId = id;

          if (!mounted) return;

          setState(() {
            isSending = false;
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

        codeAutoRetrievalTimeout: (String id) {
          verificationId = id;

          if (mounted) {
            setState(() {
              isSending = false;
            });
          }
        },
      );
    } catch (e) {
      if (!mounted) return;

      setState(() {
        isSending = false;
      });

      showMessage(e.toString());
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
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(
            horizontal: 32,
            vertical: 25,
          ),
          child: Column(
            children: [
              const SizedBox(height: 20),

              Image.asset(
                'assets/products/marine logo.png',
                width: 170,
                height: 170,
                fit: BoxFit.contain,
              ),

              const SizedBox(height: 15),

              const Text(
                'ఆక్వా సాగులో ప్రతి దశలో... మీకు తోడుగా',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: marineBlue,
                ),
              ),

              const SizedBox(height: 10),

              const Text(
                'Marine Aqua Technologies',
                style: TextStyle(
                  fontSize: 20,
                  color: marineBlue,
                ),
              ),

              const SizedBox(height: 45),

              const Text(
                'Enter Your Mobile Number',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: marineBlue,
                ),
              ),

              const SizedBox(height: 12),

              const Text(
                'We will send a 6-digit OTP to verify\nyour mobile number.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.grey,
                  height: 1.4,
                ),
              ),

              const SizedBox(height: 35),

              TextField(
                controller: phoneController,
                keyboardType: TextInputType.phone,
                maxLength: 10,
                decoration: InputDecoration(
                  counterText: '',
                  hintText: 'Enter 10-digit number',
                  hintStyle: const TextStyle(
                    color: Colors.grey,
                    fontSize: 18,
                  ),
                  prefixIcon: const Icon(
                    Icons.phone_android,
                    color: marineCyan,
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(28),
                    borderSide: const BorderSide(
                      color: Color(0xFFB6E3EE),
                      width: 2,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(28),
                    borderSide: const BorderSide(
                      color: marineLightBlue,
                      width: 2,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 22),

              SizedBox(
                width: double.infinity,
                height: 62,
                child: ElevatedButton(
                  onPressed: isSending ? null : sendOTP,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: marineLightBlue,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(32),
                    ),
                  ),
                  child: isSending
                      ? const SizedBox(
                          height: 25,
                          width: 25,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            color: Colors.white,
                          ),
                        )
                      : const Text(
                          'Send OTP  →',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                ),
              ),

              const SizedBox(height: 65),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: const [
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
          size: 50,
          color: marineCyan,
        ),
        const SizedBox(height: 10),
        Text(
          title,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 15,
            color: Colors.grey,
          ),
        ),
      ],
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

  bool isVerifying = false;

  @override
  void dispose() {
    otpController.dispose();
    super.dispose();
  }

  Future<void> verifyOTP() async {
    final otp = otpController.text.trim();

    if (otp.length != 6) {
      showMessage('Please enter the 6-digit OTP.');
      return;
    }

    setState(() {
      isVerifying = true;
    });

    try {
      final credential = PhoneAuthProvider.credential(
        verificationId: widget.verificationId,
        smsCode: otp,
      );

      await FirebaseAuth.instance.signInWithCredential(credential);

      if (!mounted) return;

      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (_) => const HomePage(),
        ),
        (route) => false,
      );
    } on FirebaseAuthException catch (e) {
      if (!mounted) return;

      setState(() {
        isVerifying = false;
      });

      showMessage(
        e.message ?? 'Invalid OTP.',
      );
    } catch (e) {
      if (!mounted) return;

      setState(() {
        isVerifying = false;
      });

      showMessage(e.toString());
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
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(
            horizontal: 30,
            vertical: 20,
          ),
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(
                    Icons.arrow_back,
                    size: 35,
                  ),
                ),
              ),

              const SizedBox(height: 10),

              Image.asset(
                'assets/products/marine logo.png',
                width: 150,
                height: 150,
                fit: BoxFit.contain,
              ),

              const SizedBox(height: 25),

              const Text(
                'Verify OTP',
                style: TextStyle(
                  fontSize: 34,
                  fontWeight: FontWeight.bold,
                  color: marineBlue,
                ),
              ),

              const SizedBox(height: 15),

              const Text(
                'Enter the 6-digit OTP sent to your\nmobile number.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.grey,
                  height: 1.4,
                ),
              ),

              const SizedBox(height: 40),

              TextField(
                controller: otpController,
                keyboardType: TextInputType.number,
                maxLength: 6,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 24,
                  letterSpacing: 8,
                ),
                decoration: InputDecoration(
                  counterText: '',
                  hintText: 'Enter 6-digit OTP',
                  hintStyle: const TextStyle(
                    fontSize: 18,
                    color: Colors.grey,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
              ),

              const SizedBox(height: 25),

              SizedBox(
                width: double.infinity,
                height: 62,
                child: ElevatedButton(
                  onPressed: isVerifying ? null : verifyOTP,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: marineLightBlue,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(32),
                    ),
                  ),
                  child: isVerifying
                      ? const CircularProgressIndicator(
                          color: Colors.white,
                        )
                      : const Text(
                          'Verify OTP  →',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                ),
              ),

              const SizedBox(height: 80),

              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text(
                  'Resend OTP',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: marineLightBlue,
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
// HOME PAGE
// ============================================================

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;

  final List<Widget> pages = const [
    HomeContent(),
    ProductsPage(),
    SupportPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: pageBackground,
      body: pages[selectedIndex],
      bottomNavigationBar: NavigationBar(
        selectedIndex: selectedIndex,
        backgroundColor: Colors.white,
        indicatorColor: const Color(0xFFD7F3FB),
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
            icon: Icon(Icons.support_agent_outlined),
            selectedIcon: Icon(Icons.support_agent),
            label: 'Support',
          ),
        ],
      ),
    );
  }
}

// ============================================================
// HOME CONTENT
// ============================================================

class HomeContent extends StatelessWidget {
  const HomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: HomeHeader(),
          ),

          SliverToBoxAdapter(
            child: const SizedBox(height: 10),
          ),

          SliverToBoxAdapter(
            child: HeroBanner(),
          ),

          SliverToBoxAdapter(
            child: const SizedBox(height: 18),
          ),

          SliverToBoxAdapter(
            child: QuickActions(),
          ),

          SliverToBoxAdapter(
            child: const SizedBox(height: 22),
          ),

          SliverToBoxAdapter(
            child: ProductSection(),
          ),

          SliverToBoxAdapter(
            child: const SizedBox(height: 20),
          ),

          SliverToBoxAdapter(
            child: WaterParameters(),
          ),

          SliverToBoxAdapter(
            child: const SizedBox(height: 20),
          ),

          SliverToBoxAdapter(
            child: SupportBanner(),
          ),

          SliverToBoxAdapter(
            child: const SizedBox(height: 25),
          ),
        ],
      ),
    );
  }
}

// ============================================================
// HEADER
// ============================================================

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(18, 15, 18, 15),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(25),
        ),
      ),
      child: Row(
        children: [
          Image.asset(
            'assets/products/marine logo.png',
            width: 85,
            height: 85,
            fit: BoxFit.contain,
          ),

          const SizedBox(width: 10),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'MARINE AQUA',
                  style: TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.bold,
                    color: marineBlue,
                  ),
                ),
                Text(
                  'TECHNOLOGIES',
                  style: TextStyle(
                    fontSize: 18,
                    letterSpacing: 2,
                    fontWeight: FontWeight.bold,
                    color: marineBlue,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  'ఆక్వా సాగులో ప్రతి దశలో... మీకు తోడుగా',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: marineBlue,
                  ),
                ),
                SizedBox(height: 3),
                Text(
                  'Smart Aquaculture. Better Results.',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),

          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.notifications_none,
              size: 32,
              color: marineBlue,
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
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 18),
      height: 260,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(28),
        gradient: const LinearGradient(
          colors: [
            Color(0xFF07518B),
            Color(0xFF0E9DD0),
            Color(0xFF22B7C6),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            right: -15,
            bottom: 0,
            child: Icon(
              Icons.water,
              size: 230,
              color: Colors.white.withOpacity(.12),
            ),
          ),

          Padding(
            padding: const EdgeInsets.fromLTRB(
              25,
              25,
              20,
              15,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'ఆరోగ్యకరమైన చెరువులు',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 29,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const Text(
                  'బలమైన రొయ్యలు',
                  style: TextStyle(
                    color: Color(0xFFFFD600),
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const Text(
                  'అధిక లాభాలు',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 29,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 8),

                const Text(
                  'మెరుగైన రేపటి కోసం\nసంపూర్ణ ఆక్వాకల్చర్ సొల్యూషన్స్',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                    height: 1.35,
                  ),
                ),

                const Spacer(),

                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: marineBlue,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 22,
                      vertical: 12,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(28),
                    ),
                  ),
                  child: const Text(
                    'ప్రొడక్ట్స్ చూడండి  →',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
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

// ============================================================
// QUICK ACTIONS
// ============================================================

class QuickActions extends StatelessWidget {
  const QuickActions({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: Row(
        children: [
          Expanded(
            child: QuickCard(
              color: const Color(0xFFDDF2FC),
              icon: Icons.menu_book,
              iconColor: const Color(0xFF1689D0),
              title: 'రొయ్యల\nసాగు గైడ్',
              subtitle: 'పూర్తి సాగు విధానం,\nమెరుగైన ఫలితాల కోసం',
            ),
          ),

          const SizedBox(width: 12),

          Expanded(
            child: QuickCard(
              color: const Color(0xFFDDF7E9),
              icon: Icons.calculate,
              iconColor: const Color(0xFF00966D),
              title: 'బయోమాస్\nకాలిక్యులేటర్',
              subtitle: '3 స్టెప్స్‌లో మీ చెరువు\nబయోమాస్ అంచనా',
            ),
          ),

          const SizedBox(width: 12),

          Expanded(
            child: QuickCard(
              color: const Color(0xFFFFE1E1),
              icon: Icons.health_and_safety,
              iconColor: const Color(0xFFF04444),
              title: 'రొయ్యల\nవ్యాధులు',
              subtitle: 'సాధారణ వ్యాధులు,\nలక్షణాలు & నివారణ',
            ),
          ),
        ],
      ),
    );
  }
}

class QuickCard extends StatelessWidget {
  final Color color;
  final Color iconColor;
  final IconData icon;
  final String title;
  final String subtitle;

  const QuickCard({
    super.key,
    required this.color,
    required this.iconColor,
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 190,
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            icon,
            size: 42,
            color: iconColor,
          ),

          const SizedBox(height: 10),

          Text(
            title,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: marineBlue,
            ),
          ),

          const SizedBox(height: 7),

          Expanded(
            child: Text(
              subtitle,
              style: const TextStyle(
                fontSize: 12,
                color: Color(0xFF52606D),
                height: 1.3,
              ),
            ),
          ),

          Align(
            alignment: Alignment.bottomRight,
            child: CircleAvatar(
              radius: 19,
              backgroundColor: iconColor,
              child: const Icon(
                Icons.arrow_forward,
                color: Colors.white,
                size: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ============================================================
// PRODUCT SECTION
// ============================================================

class ProductSection extends StatelessWidget {
  const ProductSection({super.key});

  @override
  Widget build(BuildContext context) {
    final products = ProductData.products.take(4).toList();

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 18),
      padding: const EdgeInsets.fromLTRB(18, 15, 18, 18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Column(
        children: [
          Row(
            children: [
              const Text(
                'మా ప్రొడక్ట్స్',
                style: TextStyle(
                  fontSize: 27,
                  fontWeight: FontWeight.bold,
                  color: marineBlue,
                ),
              ),

              const Spacer(),

              TextButton(
                onPressed: () {},
                child: const Text(
                  'అన్ని చూడండి  →',
                  style: TextStyle(
                    color: marineLightBlue,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 8),

          SizedBox(
            height: 230,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: products.length,
              separatorBuilder: (_, __) =>
                  const SizedBox(width: 12),
              itemBuilder: (context, index) {
                final product = products[index];

                return ProductHomeCard(
                  product: product,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class ProductHomeCard extends StatelessWidget {
  final Product product;

  const ProductHomeCard({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 175,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: const Color(0xFFE4EEF3),
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
                  Icons.inventory_2,
                  size: 70,
                  color: marineBlue,
                );
              },
            ),
          ),

          const SizedBox(height: 6),

          Text(
            product.name,
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: marineBlue,
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
      margin: const EdgeInsets.symmetric(horizontal: 18),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: const Color(0xFFEAF7FD),
        borderRadius: BorderRadius.circular(25),
        border: Border.all(
          color: const Color(0xFFD0EAF6),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: const [
              Icon(
                Icons.water_drop,
                color: marineLightBlue,
                size: 35,
              ),
              SizedBox(width: 8),
              Text(
                'చెరువు నీటి పరామితులు',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: marineBlue,
                ),
              ),
            ],
          ),

          const SizedBox(height: 8),

          const Text(
            'మీ చెరువు నీటి నాణ్యతను గమనించండి',
            style: TextStyle(
              color: Colors.grey,
              fontSize: 13,
            ),
          ),

          const SizedBox(height: 15),

          Row(
            children: const [
              Expanded(
                child: ParameterBox(
                  title: 'pH',
                  value: '7.8',
                  icon: Icons.waves,
                ),
              ),
              SizedBox(width: 8),
              Expanded(
                child: ParameterBox(
                  title: 'సాలినిటీ (ppt)',
                  value: '18',
                  icon: Icons.water_drop,
                ),
              ),
            ],
          ),

          const SizedBox(height: 8),

          Row(
            children: const [
              Expanded(
                child: ParameterBox(
                  title: 'DO (mg/L)',
                  value: '5.6',
                  icon: Icons.air,
                ),
              ),
              SizedBox(width: 8),
              Expanded(
                child: ParameterBox(
                  title: 'ఆల్కలినిటీ (ppm)',
                  value: '140',
                  icon: Icons.science,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ParameterBox extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;

  const ParameterBox({
    super.key,
    required this.title,
    required this.value,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(13),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 12,
                  ),
                ),
                const SizedBox(height: 5),
                Row(
                  children: [
                    Text(
                      value,
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: marineBlue,
                      ),
                    ),
                    const SizedBox(width: 5),
                    Container(
                      width: 8,
                      height: 8,
                      decoration: const BoxDecoration(
                        color: Colors.green,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Icon(
            icon,
            color: marineLightBlue,
            size: 30,
          ),
        ],
      ),
    );
  }
}

// ============================================================
// SUPPORT BANNER
// ============================================================

class SupportBanner extends StatelessWidget {
  const SupportBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 18),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        gradient: const LinearGradient(
          colors: [
            Color(0xFFDDF3FC),
            Color(0xFFEFFAFF),
          ],
        ),
      ),
      child: Row(
        children: [
          const Icon(
            Icons.headset_mic,
            size: 55,
            color: marineBlue,
          ),

          const SizedBox(width: 15),

          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'టెక్నికల్ సపోర్ట్',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: marineBlue,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  'మా నిపుణుల బృందంతో సంప్రదించండి',
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),

          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: marineLightBlue,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
              ),
            ),
            child: const Text(
              'సంప్రదించండి  →',
              style: TextStyle(
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
// PRODUCTS PAGE
// ============================================================

class ProductsPage extends StatelessWidget {
  const ProductsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.fromLTRB(22, 20, 22, 10),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Our Products',
                    style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                      color: marineBlue,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Marine Aqua Technologies',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          ),

          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(18),
              itemCount: ProductData.products.length,
              gridDelegate:
                  const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 15,
                mainAxisSpacing: 15,
                childAspectRatio: .72,
              ),
              itemBuilder: (context, index) {
                return ProductCard(
                  product: ProductData.products[index],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
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
            child: Image.asset(
              product.image,
              fit: BoxFit.contain,
              errorBuilder: (_, __, ___) {
                return const Icon(
                  Icons.inventory_2,
                  size: 75,
                  color: marineBlue,
                );
              },
            ),
          ),

          const SizedBox(height: 10),

          Text(
            product.name,
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.bold,
              color: marineBlue,
            ),
          ),

          const SizedBox(height: 12),

          SizedBox(
            width: double.infinity,
            height: 48,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => ProductDetailsPage(
                      product: product,
                    ),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFD8F4FC),
                foregroundColor: marineBlue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
              ),
              child: const Text(
                'View Details',
                style: TextStyle(
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
// PRODUCT DETAILS
// ============================================================

class ProductDetailsPage extends StatelessWidget {
  final Product product;

  const ProductDetailsPage({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: pageBackground,
      appBar: AppBar(
        title: Text(product.name),
        backgroundColor: Colors.white,
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
                borderRadius: BorderRadius.circular(25),
              ),
              child: Image.asset(
                product.image,
                fit: BoxFit.contain,
              ),
            ),

            const SizedBox(height: 20),

            Text(
              product.name,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: marineBlue,
              ),
            ),

            const SizedBox(height: 25),

            InfoSection(
              title: 'Benefits',
              content: product.benefits,
            ),

            InfoSection(
              title: 'Composition',
              content: product.composition,
            ),

            InfoSection(
              title: 'Dosage',
              content: product.dosage,
            ),
          ],
        ),
      ),
    );
  }
}

class InfoSection extends StatelessWidget {
  final String title;
  final String content;

  const InfoSection({
    super.key,
    required this.title,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: marineBlue,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            content,
            style: const TextStyle(
              fontSize: 15,
              color: Colors.black87,
              height: 1.5,
            ),
          ),
        ],
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
        padding: const EdgeInsets.all(22),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Technical Support',
              style: TextStyle(
                fontSize: 34,
                fontWeight: FontWeight.bold,
                color: marineBlue,
              ),
            ),

            const SizedBox(height: 8),

            const Text(
              'Marine Aqua Technologies',
              style: TextStyle(
                fontSize: 18,
                color: Colors.grey,
              ),
            ),

            const SizedBox(height: 25),

            SupportOption(
              icon: Icons.phone,
              title: 'Call Support',
              subtitle: 'Talk to our technical team',
            ),

            SupportOption(
              icon: Icons.chat,
              title: 'WhatsApp Support',
              subtitle: 'Get quick technical assistance',
            ),

            SupportOption(
              icon: Icons.location_on,
              title: 'Technical Team',
              subtitle: 'Connect with our field team',
            ),
          ],
        ),
      ),
    );
  }
}

class SupportOption extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;

  const SupportOption({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 28,
            backgroundColor: const Color(0xFFDDF3FB),
            child: Icon(
              icon,
              color: marineLightBlue,
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
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: marineBlue,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  subtitle,
                  style: const TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
          const Icon(
            Icons.arrow_forward_ios,
            color: marineBlue,
            size: 18,
          ),
        ],
      ),
    );
  }
}

// ============================================================
// PRODUCT MODEL
// ============================================================

class Product {
  final String name;
  final String image;
  final String benefits;
  final String composition;
  final String dosage;

  const Product({
    required this.name,
    required this.image,
    required this.benefits,
    required this.composition,
    required this.dosage,
  });
}

// ============================================================
// PRODUCTS
// ============================================================

class ProductData {
  static const List<Product> products = [
    Product(
      name: 'Marine 6G',
      image: 'assets/products/marine 6g.png',
      benefits: 'Liquid mineral support for shell formation and moulting.',
      composition: 'Liquid Minerals.',
      dosage: 'As per technical recommendation.',
    ),

    Product(
      name: 'Marine Volt-X',
      image: 'assets/products/marine volt-x.png',
      benefits: 'Supports shrimp growth and feed utilization.',
      composition: 'Essential Amino Acids, Beta Glucan Immune Supporters.',
      dosage: '5 ml per 1 kg feed.',
    ),

    Product(
      name: 'Bio Sludge-X',
      image: 'assets/products/Bio sludge.png',
      benefits: 'Supports organic waste and pond microbial management.',
      composition: 'Nitrifying bacterial complex and enzyme activation system.',
      dosage: 'As per technical recommendation.',
    ),

    Product(
      name: 'Marine ProTab',
      image: 'assets/products/marine protab.png',
      benefits: 'Probiotic support for pond and shrimp health.',
      composition: 'Mannan Oligosaccharides and Beta Glucans.',
      dosage: '500 g per acre after Vibrio Shield application.',
    ),

    Product(
      name: 'Marine Vibrio Shield',
      image: 'assets/products/Marine vibrio shield.png',
      benefits: 'Supports Vibrio management in aquaculture ponds.',
      composition: 'Vibrio management formulation.',
      dosage: '1 L per acre.',
    ),

    Product(
      name: 'Marine White Shield',
      image: 'assets/products/marine white shield.png',
      benefits: 'Supports management of white gut related problems.',
      composition: 'Aquaculture support formulation.',
      dosage: 'As per technical recommendation.',
    ),

    Product(
      name: 'Free moult',
      image: 'assets/products/Free moult.png',
      benefits: 'Supports smooth moulting and mineral balance.',
      composition: 'Aquaculture mineral support.',
      dosage: 'As per technical recommendation.',
    ),

    Product(
      name: 'Red thunder',
      image: 'assets/products/Red thunder.png',
      benefits: 'Aquaculture pond support product.',
      composition: 'Specialized aquaculture formulation.',
      dosage: 'As per technical recommendation.',
    ),

    Product(
      name: 'Starmin',
      image: 'assets/products/Starmin.png',
      benefits: 'Supports mineral requirements in aquaculture.',
      composition: 'Mineral formulation.',
      dosage: 'As per technical recommendation.',
    ),

    Product(
      name: 'Yucca Pro',
      image: 'assets/products/Yucca Pro.png',
      benefits: 'Supports pond water quality management.',
      composition: 'Yucca based pond support formulation.',
      dosage: 'As per technical recommendation.',
    ),

    Product(
      name: 'Zeoneem',
      image: 'assets/products/Zeoneem.png',
      benefits: 'Supports pond bottom and water quality management.',
      composition: 'Aquaculture pond management formulation.',
      dosage: 'As per technical recommendation.',
    ),

    Product(
      name: 'chlorides',
      image: 'assets/products/chlorides.png',
      benefits: 'Supports chloride and mineral balance.',
      composition: 'Chloride mineral formulation.',
      dosage: 'As per technical recommendation.',
    ),

    Product(
      name: 'nutrimin',
      image: 'assets/products/nutrimin.png',
      benefits: 'Supports nutritional requirements in aquaculture.',
      composition: 'Aquaculture nutritional formulation.',
      dosage: 'As per technical recommendation.',
    ),

    Product(
      name: 'oxytab plus',
      image: 'assets/products/oxytab plus.png',
      benefits: 'Supports dissolved oxygen management.',
      composition: 'Sodium Percarbonate based oxygen support.',
      dosage: 'As per technical recommendation.',
    ),

    Product(
      name: 'Bio soil',
      image: 'assets/products/Bio soil.png',
      benefits: 'Supports pond soil and bottom management.',
      composition: 'Aquaculture soil management formulation.',
      dosage: 'As per technical recommendation.',
    ),

    Product(
      name: 'Hi-Soft',
      image: 'assets/products/Hi-Soft.png',
      benefits: 'Aquaculture pond support formulation.',
      composition: 'Specialized aquaculture formulation.',
      dosage: 'As per technical recommendation.',
    ),
  ];
}
