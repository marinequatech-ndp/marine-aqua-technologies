import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MarineAquaApp());
}

// ============================================================
// COLORS
// ============================================================

const Color marineBlue = Color(0xFF07558A);
const Color marineDarkBlue = Color(0xFF123F63);
const Color marineCyan = Color(0xFFDDF5FC);
const Color backgroundColor = Color(0xFFF4FAFC);

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
          builder: (_) => const LoginPage(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Marine Logo
            Image.asset(
              'assets/logo.png',
              width: 130,
              height: 130,
              fit: BoxFit.contain,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  width: 130,
                  height: 130,
                  decoration: const BoxDecoration(
                    color: marineBlue,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.water_drop,
                    color: Colors.white,
                    size: 70,
                  ),
                );
              },
            ),

            const SizedBox(height: 25),

            const Text(
              'Marine Aqua Technologies',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: marineDarkBlue,
              ),
            ),

            const SizedBox(height: 8),

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
  final TextEditingController mobileController =
      TextEditingController();

  void sendOtp() {
    String mobile = mobileController.text.trim();

    if (mobile.length != 10) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Please enter a valid 10 digit mobile number',
          ),
        ),
      );
      return;
    }

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => OtpPage(
          mobileNumber: mobile,
        ),
      ),
    );
  }

  @override
  void dispose() {
    mobileController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(
            horizontal: 32,
            vertical: 45,
          ),
          child: Column(
            children: [
              const SizedBox(height: 25),

              Image.asset(
                'assets/logo.png',
                width: 125,
                height: 125,
                fit: BoxFit.contain,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    width: 125,
                    height: 125,
                    decoration: const BoxDecoration(
                      color: marineBlue,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.water_drop,
                      color: Colors.white,
                      size: 65,
                    ),
                  );
                },
              ),

              const SizedBox(height: 20),

              const Text(
                'Welcome',
                style: TextStyle(
                  fontSize: 44,
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

              const SizedBox(height: 60),

              // MOBILE NUMBER
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(28),
                ),
                child: TextField(
                  controller: mobileController,
                  keyboardType: TextInputType.phone,
                  maxLength: 10,
                  style: const TextStyle(
                    fontSize: 21,
                  ),
                  decoration: const InputDecoration(
                    counterText: '',
                    border: InputBorder.none,
                    prefixIcon: Icon(
                      Icons.phone_android,
                      color: marineBlue,
                      size: 30,
                    ),
                    prefixText: '+91  ',
                    prefixStyle: TextStyle(
                      color: marineDarkBlue,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                    hintText: 'Mobile Number',
                    hintStyle: TextStyle(
                      color: Colors.grey,
                    ),
                    contentPadding: EdgeInsets.symmetric(
                      vertical: 22,
                      horizontal: 15,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 28),

              // SEND OTP
              SizedBox(
                width: double.infinity,
                height: 64,
                child: ElevatedButton(
                  onPressed: sendOtp,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: marineBlue,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    elevation: 3,
                  ),
                  child: const Text(
                    'SEND OTP',
                    style: TextStyle(
                      fontSize: 21,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 40),

              const Text(
                'Login using your mobile number',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 14,
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
// OTP PAGE
// ============================================================

class OtpPage extends StatefulWidget {
  final String mobileNumber;

  const OtpPage({
    super.key,
    required this.mobileNumber,
  });

  @override
  State<OtpPage> createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  final TextEditingController otpController =
      TextEditingController();

  void verifyOtp() {
    String otp = otpController.text.trim();

    if (otp.length != 6) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please enter 6 digit OTP'),
        ),
      );
      return;
    }

    // Temporary demo OTP verification.
    // Real Firebase OTP will be connected later.
    if (otp == '123456') {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (_) => const MainNavigation(),
        ),
        (route) => false,
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Invalid OTP. For testing use 123456',
          ),
        ),
      );
    }
  }

  @override
  void dispose() {
    otpController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: backgroundColor,
        elevation: 0,
        iconTheme: const IconThemeData(
          color: marineDarkBlue,
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: Column(
            children: [
              const SizedBox(height: 25),

              Image.asset(
                'assets/logo.png',
                width: 100,
                height: 100,
                errorBuilder: (context, error, stackTrace) {
                  return const Icon(
                    Icons.water_drop,
                    color: marineBlue,
                    size: 90,
                  );
                },
              ),

              const SizedBox(height: 30),

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
                'OTP sent to +91 ${widget.mobileNumber}',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 16,
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
                    letterSpacing: 10,
                  ),
                  decoration: const InputDecoration(
                    counterText: '',
                    border: InputBorder.none,
                    hintText: '••••••',
                    contentPadding: EdgeInsets.symmetric(
                      vertical: 20,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 30),

              SizedBox(
                width: double.infinity,
                height: 62,
                child: ElevatedButton(
                  onPressed: verifyOtp,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: marineBlue,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: const Text(
                    'VERIFY OTP',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text(
                  'Change Mobile Number',
                  style: TextStyle(
                    color: marineBlue,
                    fontSize: 16,
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
    ProfilePage(),
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
        indicatorColor: marineCyan,
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
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(22),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 15),

              const Text(
                'Marine Aqua Technologies',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: marineDarkBlue,
                ),
              ),

              const SizedBox(height: 6),

              const Text(
                'Smart Aquaculture. Better Results.',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 16,
                ),
              ),

              const SizedBox(height: 30),

              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: marineBlue,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Welcome to',
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 17,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Marine Aqua Technologies',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 12),
                    Text(
                      'Your trusted partner in aquaculture solutions.',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 30),

              const Text(
                'Explore Our Products',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: marineDarkBlue,
                ),
              ),

              const SizedBox(height: 15),

              Row(
                children: [
                  Expanded(
                    child: _homeCard(
                      Icons.inventory_2,
                      'Products',
                      () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const ProductsPage(),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(width: 15),
                  Expanded(
                    child: _homeCard(
                      Icons.support_agent,
                      'Support',
                      () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const SupportPage(),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _homeCard(
    IconData icon,
    String title,
    VoidCallback onTap,
  ) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          children: [
            Icon(
              icon,
              color: marineBlue,
              size: 42,
            ),
            const SizedBox(height: 12),
            Text(
              title,
              style: const TextStyle(
                color: marineDarkBlue,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ],
        ),
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
  final String description;

  const Product({
    required this.name,
    required this.image,
    required this.description,
  });
}

// ============================================================
// PRODUCTS
// ============================================================

const List<Product> products = [
  Product(
    name: 'Marine 6G',
    image: 'assets/products/marine 6g.png',
    description:
        'Liquid Minerals designed to support mineral balance, shell formation and moulting management in aquaculture ponds.',
  ),
  Product(
    name: 'Marine Volt-X',
    image: 'assets/products/volt-x.png',
    description:
        'Growth support formulation containing Essential Amino Acids and Beta Glucan immune support components.',
  ),
  Product(
    name: 'Bio Sludge-X',
    image: 'assets/products/bio sludge -x.png',
    description:
        'Nitrifying bacterial complex with enzyme activation system for organic sludge and pond management.',
  ),
  Product(
    name: 'Marine ProTab',
    image: 'assets/products/protab.png',
    description:
        'Probiotic tablets containing Mannan Oligosaccharides and Beta Glucans for aquaculture pond management.',
  ),
  Product(
    name: 'Marine Vibrio Shield',
    image: 'assets/products/vibrio shield.png',
    description:
        'Vibrio management product designed for aquaculture pond applications.',
  ),
  Product(
    name: 'Marine White Shield',
    image: 'assets/products/white shield.png',
    description:
        'Aquaculture support product designed for white gut and related pond management requirements.',
  ),
  Product(
    name: 'OxyTab Plus',
    image: 'assets/products/oxytab.png',
    description:
        'Oxygen support tablets containing Sodium Percarbonate for controlled oxygen release in pond water.',
  ),
  Product(
    name: 'Free Moult',
    image: 'assets/products/free moult.png',
    description:
        'Advanced moulting support formulation for shrimp farming.',
  ),
  Product(
    name: 'Red Thunder',
    image: 'assets/products/red thunder.png',
    description:
        'Aquaculture pond support formulation for shrimp farming.',
  ),
  Product(
    name: 'Zeoneem',
    image: 'assets/products/zeoneem.png',
    description:
        'Granular pond management product designed for aquaculture applications.',
  ),
  Product(
    name: 'Starmin',
    image: 'assets/products/starmin.png',
    description:
        'Mineral and nutritional support product for shrimp farming.',
  ),
  Product(
    name: 'Nutrimin',
    image: 'assets/products/nutrimin.png',
    description:
        'Chelated mineral formulation designed for aquaculture mineral supplementation.',
  ),
  Product(
    name: 'Bio Soil',
    image: 'assets/products/bio soil.png',
    description:
        'Soil fertility enhancer designed for aquaculture pond soil management.',
  ),
  Product(
    name: 'Chlorides',
    image: 'assets/products/chlorides.png',
    description:
        'Chloride mineral products for aquaculture pond mineral management.',
  ),
  Product(
    name: 'Yucca Pro',
    image: 'assets/products/yucca pro.png',
    description:
        'Toxin binder product for aquaculture pond management.',
  ),
  Product(
    name: 'Hi-Soft',
    image: 'assets/products/hi-soft.png',
    description:
        'Aquaculture support product for pond and shrimp farming applications.',
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
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverPadding(
              padding: const EdgeInsets.fromLTRB(
                20,
                25,
                20,
                10,
              ),
              sliver: SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Our Products',
                      style: TextStyle(
                        fontSize: 34,
                        fontWeight: FontWeight.bold,
                        color: marineDarkBlue,
                      ),
                    ),
                    SizedBox(height: 6),
                    Text(
                      'Marine Aqua Technologies',
                      style: TextStyle(
                        fontSize: 17,
                        color: Colors.grey,
                      ),
                    ),
                    SizedBox(height: 20),
                  ],
                ),
              ),
            ),

            SliverPadding(
              padding: const EdgeInsets.symmetric(
                horizontal: 18,
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
                  childAspectRatio: 0.72,
                ),
              ),
            ),

            const SliverToBoxAdapter(
              child: SizedBox(height: 25),
            ),
          ],
        ),
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
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(5),
              child: Image.asset(
                product.image,
                fit: BoxFit.contain,
                errorBuilder: (
                  context,
                  error,
                  stackTrace,
                ) {
                  return const Icon(
                    Icons.inventory_2,
                    size: 75,
                    color: marineBlue,
                  );
                },
              ),
            ),
          ),

          const SizedBox(height: 5),

          Text(
            product.name,
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: 17,
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
                backgroundColor: marineCyan,
                foregroundColor: marineDarkBlue,
                elevation: 0,
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
      backgroundColor: backgroundColor,
      appBar: AppBar(
        title: Text(product.name),
        backgroundColor: backgroundColor,
        foregroundColor: marineDarkBlue,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(22),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: 300,
              padding: const EdgeInsets.all(25),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(28),
              ),
              child: Image.asset(
                product.image,
                fit: BoxFit.contain,
                errorBuilder: (
                  context,
                  error,
                  stackTrace,
                ) {
                  return const Icon(
                    Icons.inventory_2,
                    size: 100,
                    color: marineBlue,
                  );
                },
              ),
            ),

            const SizedBox(height: 25),

            Text(
              product.name,
              style: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: marineDarkBlue,
              ),
            ),

            const SizedBox(height: 18),

            const Text(
              'Product Details',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: marineBlue,
              ),
            ),

            const SizedBox(height: 10),

            Text(
              product.description,
              style: const TextStyle(
                fontSize: 17,
                height: 1.6,
                color: Colors.black87,
              ),
            ),

            const SizedBox(height: 25),

            // Full matter from your product document
            // can be placed here product-wise.
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Text(
                'Benefits\n\n'
                '• Supports aquaculture pond management\n'
                '• Designed for shrimp farming applications\n'
                '• Use according to the recommended product dosage\n\n'
                'Dosage\n\n'
                'Please follow the product label and recommended technical guidance.',
                style: TextStyle(
                  fontSize: 16,
                  height: 1.6,
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
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        title: const Text(
          'Support',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: backgroundColor,
        foregroundColor: marineDarkBlue,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(22),
        child: Column(
          children: [
            _supportCard(
              Icons.phone,
              'Call Support',
              'Contact Marine Aqua Technologies',
            ),
            const SizedBox(height: 15),
            _supportCard(
              Icons.chat,
              'Technical Support',
              'Get aquaculture product guidance',
            ),
            const SizedBox(height: 15),
            _supportCard(
              Icons.location_on,
              'Service Support',
              'Contact our technical team',
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
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 28,
            backgroundColor: marineCyan,
            child: Icon(
              icon,
              color: marineBlue,
              size: 28,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: marineDarkBlue,
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
        ],
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
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        title: const Text(
          'Profile',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: backgroundColor,
        foregroundColor: marineDarkBlue,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(22),
        child: Column(
          children: [
            const SizedBox(height: 20),

            const CircleAvatar(
              radius: 48,
              backgroundColor: marineCyan,
              child: Icon(
                Icons.person,
                size: 55,
                color: marineBlue,
              ),
            ),

            const SizedBox(height: 18),

            const Text(
              'User Profile',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: marineDarkBlue,
              ),
            ),

            const SizedBox(height: 30),

            _profileItem(
              Icons.phone,
              'Mobile Number',
              'Login mobile number',
            ),

            const SizedBox(height: 12),

            _profileItem(
              Icons.location_on,
              'Location',
              'Location information',
            ),

            const SizedBox(height: 12),

            _profileItem(
              Icons.business,
              'Marine Aqua Technologies',
              'Aquaculture Solutions',
            ),
          ],
        ),
      ),
    );
  }

  Widget _profileItem(
    IconData icon,
    String title,
    String value,
  ) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Icon(
            icon,
            color: marineBlue,
            size: 28,
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
                    fontSize: 15,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  value,
                  style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: marineDarkBlue,
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
