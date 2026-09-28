import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  try {
    await Firebase.initializeApp();
  } catch (e) {
    debugPrint('Firebase initialization error: $e');
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
        fontFamily: 'Arial',
        scaffoldBackgroundColor: const Color(0xFFF4FAFC),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF0068A5),
        ),
      ),
      home: const SplashScreen(),
    );
  }
}

// ============================================================
// COLORS
// ============================================================

const Color marineBlue = Color(0xFF0068A5);
const Color marineDarkBlue = Color(0xFF123B5D);
const Color marineLightBlue = Color(0xFFE4F5FB);
const Color pageBackground = Color(0xFFF4FAFC);

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
              user == null ? const LoginPage() : const MainHomePage(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: pageBackground,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/marine_logo.png',
              width: 150,
              height: 150,
              fit: BoxFit.contain,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  width: 130,
                  height: 130,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: marineBlue,
                  ),
                  child: const Icon(
                    Icons.water_drop,
                    size: 70,
                    color: Colors.white,
                  ),
                );
              },
            ),

            const SizedBox(height: 28),

            const Text(
              'Marine Aqua Technologies',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: marineDarkBlue,
              ),
            ),

            const SizedBox(height: 10),

            const Text(
              'Smart Aquaculture. Better Results.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey,
              ),
            ),

            const SizedBox(height: 35),

            const SizedBox(
              width: 28,
              height: 28,
              child: CircularProgressIndicator(
                strokeWidth: 3,
                color: marineBlue,
              ),
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
  final TextEditingController mobileController = TextEditingController();

  bool sendingOtp = false;

  Future<void> sendOtp() async {
    String mobile = mobileController.text.trim();

    if (mobile.length != 10) {
      showMessage('Please enter a valid 10-digit mobile number.');
      return;
    }

    setState(() {
      sendingOtp = true;
    });

    String phoneNumber = '+91$mobile';

    try {
      await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: phoneNumber,

        verificationCompleted: (PhoneAuthCredential credential) async {
          try {
            await FirebaseAuth.instance.signInWithCredential(credential);

            if (!mounted) return;

            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (_) => const MainHomePage(),
              ),
            );
          } catch (e) {
            showMessage('Automatic verification failed.');
          }
        },

        verificationFailed: (FirebaseAuthException e) {
          setState(() {
            sendingOtp = false;
          });

          showMessage(
            e.message ?? 'OTP verification failed.',
          );
        },

        codeSent: (String verificationId, int? resendToken) {
          setState(() {
            sendingOtp = false;
          });

          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => OtpPage(
                verificationId: verificationId,
                phoneNumber: phoneNumber,
              ),
            ),
          );
        },

        codeAutoRetrievalTimeout: (String verificationId) {
          setState(() {
            sendingOtp = false;
          });
        },

        timeout: const Duration(seconds: 60),
      );
    } catch (e) {
      setState(() {
        sendingOtp = false;
      });

      showMessage('Unable to send OTP. Please try again.');
    }
  }

  void showMessage(String message) {
    if (!mounted) return;

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
      backgroundColor: pageBackground,
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.symmetric(
            horizontal: 28,
            vertical: 35,
          ),
          child: SizedBox(
            height: MediaQuery.of(context).size.height - 70,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/marine_logo.png',
                  width: 105,
                  height: 105,
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) {
                    return const Icon(
                      Icons.water_drop,
                      size: 90,
                      color: marineBlue,
                    );
                  },
                ),

                const SizedBox(height: 25),

                const Text(
                  'Welcome',
                  style: TextStyle(
                    fontSize: 42,
                    fontWeight: FontWeight.bold,
                    color: marineDarkBlue,
                  ),
                ),

                const SizedBox(height: 8),

                const Text(
                  'Marine Aqua Technologies',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.grey,
                  ),
                ),

                const SizedBox(height: 55),

                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 22,
                  ),
                  child: TextField(
                    controller: mobileController,
                    keyboardType: TextInputType.phone,
                    maxLength: 10,
                    decoration: const InputDecoration(
                      counterText: '',
                      border: InputBorder.none,
                      icon: Icon(
                        Icons.phone_android,
                        color: marineBlue,
                      ),
                      prefixText: '+91  ',
                      prefixStyle: TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.bold,
                        color: marineDarkBlue,
                      ),
                      hintText: 'Mobile Number',
                    ),
                  ),
                ),

                const SizedBox(height: 22),

                SizedBox(
                  width: double.infinity,
                  height: 64,
                  child: ElevatedButton(
                    onPressed: sendingOtp ? null : sendOtp,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: marineBlue,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                    child: sendingOtp
                        ? const CircularProgressIndicator(
                            color: Colors.white,
                          )
                        : const Text(
                            'SEND OTP',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
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

class OtpPage extends StatefulWidget {
  final String verificationId;
  final String phoneNumber;

  const OtpPage({
    super.key,
    required this.verificationId,
    required this.phoneNumber,
  });

  @override
  State<OtpPage> createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  final TextEditingController otpController = TextEditingController();

  bool verifying = false;

  Future<void> verifyOtp() async {
    String otp = otpController.text.trim();

    if (otp.length != 6) {
      showMessage('Please enter the 6-digit OTP.');
      return;
    }

    setState(() {
      verifying = true;
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
          builder: (_) => const MainHomePage(),
        ),
        (route) => false,
      );
    } on FirebaseAuthException catch (e) {
      setState(() {
        verifying = false;
      });

      showMessage(
        e.message ?? 'Invalid OTP.',
      );
    } catch (e) {
      setState(() {
        verifying = false;
      });

      showMessage('OTP verification failed.');
    }
  }

  void showMessage(String message) {
    if (!mounted) return;

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
      backgroundColor: pageBackground,
      appBar: AppBar(
        backgroundColor: pageBackground,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: marineDarkBlue,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 28,
          ),
          child: Column(
            children: [
              const SizedBox(height: 55),

              const Icon(
                Icons.sms_outlined,
                size: 85,
                color: marineBlue,
              ),

              const SizedBox(height: 25),

              const Text(
                'Verify OTP',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: marineDarkBlue,
                ),
              ),

              const SizedBox(height: 12),

              Text(
                'OTP sent to ${widget.phoneNumber}',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),

              const SizedBox(height: 45),

              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: TextField(
                  controller: otpController,
                  keyboardType: TextInputType.number,
                  maxLength: 6,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 8,
                  ),
                  decoration: const InputDecoration(
                    counterText: '',
                    hintText: '------',
                    border: InputBorder.none,
                  ),
                ),
              ),

              const SizedBox(height: 25),

              SizedBox(
                width: double.infinity,
                height: 62,
                child: ElevatedButton(
                  onPressed: verifying ? null : verifyOtp,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: marineBlue,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                  child: verifying
                      ? const CircularProgressIndicator(
                          color: Colors.white,
                        )
                      : const Text(
                          'VERIFY OTP',
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
      ),
    );
  }
}

// ============================================================
// MAIN HOME PAGE
// ============================================================

class MainHomePage extends StatefulWidget {
  const MainHomePage({super.key});

  @override
  State<MainHomePage> createState() => _MainHomePageState();
}

class _MainHomePageState extends State<MainHomePage> {
  int currentIndex = 0;

  final List<Widget> pages = const [
    HomePage(),
    ProductsPage(),
    SupportPage(),
    ProfilePage(),
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
        indicatorColor: marineLightBlue,

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
            icon: Icon(Icons.support_agent_outlined),
            selectedIcon: Icon(Icons.support_agent),
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
// HOME PAGE
// ============================================================

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: pageBackground,
      appBar: AppBar(
        backgroundColor: pageBackground,
        elevation: 0,
        title: const Text(
          'Marine Aqua Technologies',
          style: TextStyle(
            color: marineDarkBlue,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Smart Aquaculture',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: marineDarkBlue,
              ),
            ),

            const SizedBox(height: 8),

            const Text(
              'Better Results.',
              style: TextStyle(
                fontSize: 22,
                color: marineBlue,
                fontWeight: FontWeight.w600,
              ),
            ),

            const SizedBox(height: 25),

            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(25),
              decoration: BoxDecoration(
                color: marineBlue,
                borderRadius: BorderRadius.circular(25),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'MARINE AQUA TECHNOLOGIES',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 15),
                  Text(
                    'ఆక్వా సాగులో ప్రతి దశలో…\nమీకు తోడుగా Marine Aqua Technologies',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      height: 1.5,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            const Text(
              'Our Products',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: marineDarkBlue,
              ),
            ),

            const SizedBox(height: 15),

            const ProductPreview(
              name: 'Marine 6G',
              image: 'assets/products/marine 6g.png',
            ),

            const SizedBox(height: 15),

            const ProductPreview(
              name: 'Marine Volt-X',
              image: 'assets/products/volt-x.png',
            ),
          ],
        ),
      ),
    );
  }
}

// ============================================================
// PRODUCT PREVIEW
// ============================================================

class ProductPreview extends StatelessWidget {
  final String name;
  final String image;

  const ProductPreview({
    super.key,
    required this.name,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
      ),
      child: Row(
        children: [
          Image.asset(
            image,
            width: 90,
            height: 90,
            fit: BoxFit.contain,
            errorBuilder: (_, __, ___) {
              return const Icon(
                Icons.inventory_2,
                size: 70,
                color: marineBlue,
              );
            },
          ),

          const SizedBox(width: 18),

          Expanded(
            child: Text(
              name,
              style: const TextStyle(
                fontSize: 21,
                fontWeight: FontWeight.bold,
                color: marineDarkBlue,
              ),
            ),
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
  final String category;
  final String image;
  final String description;
  final String composition;
  final String dosage;

  const Product({
    required this.name,
    required this.category,
    required this.image,
    required this.description,
    required this.composition,
    required this.dosage,
  });
}

// ============================================================
// PRODUCTS
// ============================================================

const List<Product> products = [
  Product(
    name: 'Marine 6G',
    category: 'Liquid Minerals',
    image: 'assets/products/marine 6g.png',
    description:
        'Liquid mineral support for shrimp mineral balance, moulting and shell formation.',
    composition:
        'Liquid mineral blend.',
    dosage:
        'Use as recommended based on pond condition and culture requirement.',
  ),

  Product(
    name: 'Marine Volt-X',
    category: 'Growth Support',
    image: 'assets/products/volt-x.png',
    description:
        'Growth support formulation designed to support feed utilization, growth and shrimp performance.',
    composition:
        'Essential amino acids and Beta Glucan immune supporters.',
    dosage:
        '5 ml per 1 kg feed daily.',
  ),

  Product(
    name: 'Bio Sludge-X',
    category: 'Sludge Management',
    image: 'assets/products/bio sludge -x.png',
    description:
        'Supports organic sludge management and helps improve pond bottom conditions.',
    composition:
        'Nitrifying bacterial complex and enzyme activation system.',
    dosage:
        'Use according to pond condition and recommended application.',
  ),

  Product(
    name: 'Marine ProTab',
    category: 'Probiotic Tablets',
    image: 'assets/products/protab.png',
    description:
        'Probiotic tablet support for maintaining beneficial microbial balance in shrimp ponds.',
    composition:
        'Mannan Oligosaccharides and Beta Glucans.',
    dosage:
        '500 g per acre. Apply after Vibrio Shield as recommended.',
  ),

  Product(
    name: 'Marine Vibrio Shield',
    category: 'Vibrio Control',
    image: 'assets/products/vibrio shield.png',
    description:
        'Pond management product designed to support Vibrio control and improve pond microbial balance.',
    composition:
        'Vibrio management formulation.',
    dosage:
        '1 L per acre.',
  ),

  Product(
    name: 'Marine White Shield',
    category: 'Shrimp Health',
    image: 'assets/products/white shield.png',
    description:
        'Supports shrimp health and pond management during challenging culture conditions.',
    composition:
        'Specialized aquaculture formulation.',
    dosage:
        'Use according to pond condition and recommended dosage.',
  ),

  Product(
    name: 'OxyTab Plus',
    category: 'Oxygen Support',
    image: 'assets/products/oxytab.png',
    description:
        'Oxygen support tablets for aquaculture ponds.',
    composition:
        'Sodium Percarbonate based oxygen releasing formulation.',
    dosage:
        'Apply according to pond oxygen requirement and product recommendation.',
  ),

  Product(
    name: 'Free Moult',
    category: 'Moulting Support',
    image: 'assets/products/free moult.png',
    description:
        'Advanced moulting support for shrimp culture.',
    composition:
        'Mineral and moulting support formulation.',
    dosage:
        'Use according to culture stage and recommended application.',
  ),

  Product(
    name: 'Red Thunder',
    category: 'Growth & Health',
    image: 'assets/products/red thunder.png',
    description:
        'Aquaculture support formulation designed for shrimp performance and culture management.',
    composition:
        'Specialized aquaculture formulation.',
    dosage:
        'Use as recommended.',
  ),

  Product(
    name: 'Zeoneem',
    category: 'Pond Management',
    image: 'assets/products/zeoneem.png',
    description:
        'Granular pond management product for maintaining favorable pond conditions.',
    composition:
        'Granular pond management formulation.',
    dosage:
        'Use according to pond condition and recommended dosage.',
  ),

  Product(
    name: 'Starmin',
    category: 'Mineral Support',
    image: 'assets/products/starmin.png',
    description:
        'Mineral support product for shrimp culture and pond mineral management.',
    composition:
        'Aquaculture mineral formulation.',
    dosage:
        'Use as recommended.',
  ),

  Product(
    name: 'Nutrimin',
    category: 'Chelated Minerals',
    image: 'assets/products/nutrimin.png',
    description:
        'Chelated mineral support for shrimp culture.',
    composition:
        'Chelated mineral blend.',
    dosage:
        'Use according to culture requirement and recommended dosage.',
  ),

  Product(
    name: 'Bio Soil',
    category: 'Soil Fertility Enhancer',
    image: 'assets/products/bio soil.png',
    description:
        'Soil fertility enhancer for aquaculture pond bottom management.',
    composition:
        'Soil and pond management formulation.',
    dosage:
        'Use according to pond soil condition and recommendation.',
  ),

  Product(
    name: 'Chlorides',
    category: 'Mineral Management',
    image: 'assets/products/chlorides.png',
    description:
        'Chloride mineral support for maintaining appropriate ionic balance in aquaculture ponds.',
    composition:
        'Chloride mineral formulation.',
    dosage:
        'Use based on water analysis and recommended application.',
  ),

  Product(
    name: 'Yucca Pro',
    category: 'Toxin Binder',
    image: 'assets/products/yucca pro.png',
    description:
        'Toxin-binding and pond management support product.',
    composition:
        'Yucca-based toxin binder formulation.',
    dosage:
        'Use according to pond condition and recommended dosage.',
  ),

  Product(
    name: 'Hi-Soft',
    category: 'Aquaculture Support',
    image: 'assets/products/hi-soft.png',
    description:
        'Aquaculture support product for shrimp pond management.',
    composition:
        'Specialized aquaculture formulation.',
    dosage:
        'Use according to culture requirement and recommendation.',
  ),
];

// ============================================================
// PRODUCTS PAGE
// ============================================================

class ProductsPage extends StatelessWidget {
  const ProductsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: pageBackground,

      appBar: AppBar(
        backgroundColor: pageBackground,
        elevation: 0,
        title: const Text(
          'Our Products',
          style: TextStyle(
            color: marineDarkBlue,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: GridView.builder(
        padding: const EdgeInsets.fromLTRB(
          16,
          10,
          16,
          30,
        ),
        itemCount: products.length,
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 14,
          mainAxisSpacing: 14,
          childAspectRatio: 0.68,
        ),
        itemBuilder: (context, index) {
          final product = products[index];

          return ProductCard(
            product: product,
          );
        },
      ),
    );
  }
}

// ============================================================
// PRODUCT CARD
// ============================================================

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
        borderRadius: BorderRadius.circular(24),
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
            child: Image.asset(
              product.image,
              fit: BoxFit.contain,
              errorBuilder: (_, __, ___) {
                return const Icon(
                  Icons.inventory_2_outlined,
                  size: 75,
                  color: marineBlue,
                );
              },
            ),
          ),

          const SizedBox(height: 8),

          Text(
            product.name,
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: marineDarkBlue,
            ),
          ),

          const SizedBox(height: 10),

          SizedBox(
            width: double.infinity,
            height: 42,
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
                backgroundColor: marineLightBlue,
                foregroundColor: marineBlue,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(22),
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

  Widget infoCard(
    IconData icon,
    String title,
    String text,
  ) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(22),
      margin: const EdgeInsets.only(bottom: 18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                icon,
                color: marineBlue,
                size: 30,
              ),
              const SizedBox(width: 12),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: marineBlue,
                ),
              ),
            ],
          ),

          const SizedBox(height: 15),

          Text(
            text,
            style: const TextStyle(
              fontSize: 17,
              height: 1.55,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: pageBackground,

      appBar: AppBar(
        backgroundColor: pageBackground,
        elevation: 0,
        title: Text(
          product.name,
          style: const TextStyle(
            color: marineDarkBlue,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Container(
              height: 330,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Image.asset(
                product.image,
                fit: BoxFit.contain,
                errorBuilder: (_, __, ___) {
                  return const Icon(
                    Icons.inventory_2_outlined,
                    size: 100,
                    color: marineBlue,
                  );
                },
              ),
            ),

            const SizedBox(height: 22),

            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                product.name,
                style: const TextStyle(
                  fontSize: 34,
                  fontWeight: FontWeight.bold,
                  color: marineDarkBlue,
                ),
              ),
            ),

            const SizedBox(height: 8),

            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 18,
                  vertical: 10,
                ),
                decoration: BoxDecoration(
                  color: marineLightBlue,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Text(
                  product.category,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: marineBlue,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 25),

            infoCard(
              Icons.description_outlined,
              'Description',
              product.description,
            ),

            infoCard(
              Icons.science_outlined,
              'Composition',
              product.composition,
            ),

            infoCard(
              Icons.medication_outlined,
              'Dosage',
              product.dosage,
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
    return Scaffold(
      backgroundColor: pageBackground,

      appBar: AppBar(
        backgroundColor: pageBackground,
        elevation: 0,
        title: const Text(
          'Support',
          style: TextStyle(
            color: marineDarkBlue,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(25),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25),
              ),
              child: const Column(
                children: [
                  Icon(
                    Icons.support_agent,
                    size: 70,
                    color: marineBlue,
                  ),

                  SizedBox(height: 15),

                  Text(
                    'Need Help?',
                    style: TextStyle(
                      fontSize: 27,
                      fontWeight: FontWeight.bold,
                      color: marineDarkBlue,
                    ),
                  ),

                  SizedBox(height: 10),

                  Text(
                    'For product information, dosage guidance and aquaculture support, contact Marine Aqua Technologies.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                      height: 1.5,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            SupportTile(
              icon: Icons.phone,
              title: 'Call Support',
              subtitle: 'Contact our support team',
              onTap: () {},
            ),

            SupportTile(
              icon: Icons.email_outlined,
              title: 'Email Support',
              subtitle: 'Send us your query',
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}

// ============================================================
// SUPPORT TILE
// ============================================================

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
    return Card(
      color: Colors.white,
      elevation: 0,
      child: ListTile(
        contentPadding: const EdgeInsets.all(12),
        leading: CircleAvatar(
          backgroundColor: marineLightBlue,
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
          size: 16,
        ),
        onTap: onTap,
      ),
    );
  }
}

// ============================================================
// PROFILE PAGE
// ============================================================

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;

    String mobile = user?.phoneNumber ?? 'Not available';

    return Scaffold(
      backgroundColor: pageBackground,

      appBar: AppBar(
        backgroundColor: pageBackground,
        elevation: 0,
        title: const Text(
          'Profile',
          style: TextStyle(
            color: marineDarkBlue,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(
                vertical: 30,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(28),
              ),
              child: const Column(
                children: [
                  CircleAvatar(
                    radius: 48,
                    backgroundColor: marineLightBlue,
                    child: Icon(
                      Icons.person,
                      size: 55,
                      color: marineBlue,
                    ),
                  ),

                  SizedBox(height: 15),

                  Text(
                    'User Profile',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: marineDarkBlue,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(22),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25),
              ),
              child: Row(
                children: [
                  const Icon(
                    Icons.phone_android,
                    color: marineBlue,
                    size: 32,
                  ),

                  const SizedBox(width: 18),

                  Expanded(
                    child: Column(
                      crossAxisAlignment:
                          CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Mobile Number',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 14,
                          ),
                        ),

                        const SizedBox(height: 5),

                        Text(
                          mobile,
                          style: const TextStyle(
                            fontSize: 19,
                            fontWeight: FontWeight.bold,
                            color: marineDarkBlue,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(22),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25),
              ),
              child: const Row(
                children: [
                  Icon(
                    Icons.business,
                    color: marineBlue,
                    size: 32,
                  ),

                  SizedBox(width: 18),

                  Expanded(
                    child: Column(
                      crossAxisAlignment:
                          CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Company',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 14,
                          ),
                        ),

                        SizedBox(height: 5),

                        Text(
                          'Marine Aqua Technologies',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: marineDarkBlue,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            SizedBox(
              width: double.infinity,
              height: 58,
              child: OutlinedButton.icon(
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
                    borderRadius: BorderRadius.circular(20),
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
