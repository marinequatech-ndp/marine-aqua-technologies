```dart
import 'package:flutter/material.dart';

void main() {
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
        scaffoldBackgroundColor: const Color(0xFFF3FBFE),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF08789B),
        ),
      ),
      home: const LoginPage(),
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

  void sendOtp() {
    final mobile = mobileController.text.trim();

    if (mobile.length != 10) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please enter a valid 10-digit mobile number'),
        ),
      );
      return;
    }

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => OtpPage(mobileNumber: mobile),
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
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 55),

              // LOGO
              Image.asset(
                'assets/products/marine logo.png',
                width: 270,
                height: 150,
                fit: BoxFit.contain,
                errorBuilder: (_, __, ___) {
                  return const Icon(
                    Icons.water,
                    size: 90,
                    color: Color(0xFF08789B),
                  );
                },
              ),

              const SizedBox(height: 15),

              const Text(
                'MARINE AQUA',
                style: TextStyle(
                  fontSize: 42,
                  fontWeight: FontWeight.w800,
                  color: Color(0xFF086B8C),
                  letterSpacing: 1,
                ),
              ),

              const Text(
                'TECHNOLOGIES',
                style: TextStyle(
                  fontSize: 38,
                  fontWeight: FontWeight.w800,
                  color: Color(0xFF086B8C),
                  letterSpacing: 1,
                ),
              ),

              const SizedBox(height: 18),

              const Text(
                'ఆక్వా సాగులో ప్రతి దశలో... మీకు తోడుగా',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF086B8C),
                ),
              ),

              const SizedBox(height: 8),

              const Text(
                'Smart Aquaculture. Better Results.',
                style: TextStyle(
                  fontSize: 17,
                  color: Colors.grey,
                ),
              ),

              const SizedBox(height: 35),

              // LOGIN CARD
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 25),
                padding: const EdgeInsets.fromLTRB(28, 35, 28, 35),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(38),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.06),
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
                        color: Color(0xFF086B8C),
                      ),
                    ),

                    const SizedBox(height: 8),

                    const Text(
                      'Login with your mobile number',
                      style: TextStyle(
                        fontSize: 19,
                        color: Colors.grey,
                      ),
                    ),

                    const SizedBox(height: 28),

                    Container(
                      decoration: BoxDecoration(
                        color: const Color(0xFFEAF8FC),
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: TextField(
                        controller: mobileController,
                        keyboardType: TextInputType.phone,
                        maxLength: 10,
                        style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w600,
                        ),
                        decoration: const InputDecoration(
                          counterText: '',
                          border: InputBorder.none,
                          prefixIcon: Icon(
                            Icons.phone_android,
                            color: Color(0xFF08789B),
                            size: 30,
                          ),
                          prefixText: '+91  ',
                          prefixStyle: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF08789B),
                          ),
                          hintText: 'Enter mobile number',
                          hintStyle: TextStyle(
                            color: Colors.grey,
                            fontSize: 18,
                          ),
                          contentPadding: EdgeInsets.symmetric(
                            vertical: 20,
                            horizontal: 10,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 25),

                    SizedBox(
                      width: double.infinity,
                      height: 62,
                      child: ElevatedButton(
                        onPressed: sendOtp,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF08789B),
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                        ),
                        child: const Text(
                          'SEND OTP',
                          style: TextStyle(
                            fontSize: 19,
                            fontWeight: FontWeight.w800,
                          ),
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
  final TextEditingController otpController = TextEditingController();

  void verifyOtp() {
    if (otpController.text.trim() == '123456') {
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
          content: Text('Wrong OTP. Demo OTP is 123456'),
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
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 28),
          child: Column(
            children: [
              const SizedBox(height: 30),

              Image.asset(
                'assets/products/marine logo.png',
                width: 180,
                height: 100,
                fit: BoxFit.contain,
              ),

              const SizedBox(height: 25),

              const Text(
                'Verify OTP',
                style: TextStyle(
                  fontSize: 34,
                  fontWeight: FontWeight.w800,
                  color: Color(0xFF086B8C),
                ),
              ),

              const SizedBox(height: 10),

              Text(
                'Enter OTP sent to +91 ${widget.mobileNumber}',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 17,
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
                  letterSpacing: 10,
                ),
                decoration: InputDecoration(
                  counterText: '',
                  hintText: '••••••',
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(22),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),

              const SizedBox(height: 25),

              SizedBox(
                width: double.infinity,
                height: 60,
                child: ElevatedButton(
                  onPressed: verifyOtp,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF08789B),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(22),
                    ),
                  ),
                  child: const Text(
                    'VERIFY OTP',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 15),

              const Text(
                'Demo OTP: 123456',
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
// MAIN NAVIGATION
// ============================================================

class MainNavigation extends StatefulWidget {
  const MainNavigation({super.key});

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int selectedIndex = 0;

  final List<Widget> pages = const [
    HomePage(),
    ProductsPage(),
    SupportPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[selectedIndex],
      bottomNavigationBar: NavigationBar(
        selectedIndex: selectedIndex,
        backgroundColor: const Color(0xFFEFF3F7),
        indicatorColor: const Color(0xFFC9F1FF),
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
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.only(bottom: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // HEADER
            Padding(
              padding: const EdgeInsets.fromLTRB(22, 18, 18, 12),
              child: Row(
                children: [
                  Image.asset(
                    'assets/products/marine logo.png',
                    width: 105,
                    height: 70,
                    fit: BoxFit.contain,
                  ),

                  const SizedBox(width: 12),

                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'MARINE AQUA',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w900,
                            color: Color(0xFF086B8C),
                          ),
                        ),
                        Text(
                          'TECHNOLOGIES',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w900,
                            color: Color(0xFF086B8C),
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          'ఆక్వా సాగులో ప్రతి దశలో... మీకు తోడుగా',
                          style: TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFF086B8C),
                          ),
                        ),
                      ],
                    ),
                  ),

                  const Icon(
                    Icons.notifications_none,
                    size: 32,
                    color: Color(0xFF08789B),
                  ),
                ],
              ),
            ),

            // HERO BANNER
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(32),
                child: Image.asset(
                  'assets/products/hero_shrimp.jpg',
                  height: 215,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),

            const SizedBox(height: 25),

            // AQUA SAMACHARAM
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'ఆక్వా సమాచారం',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w900,
                      color: Color(0xFF08789B),
                    ),
                  ),
                  const Icon(
                    Icons.arrow_forward,
                    size: 35,
                    color: Color(0xFF08789B),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 18),

            // THREE SHORTCUT CARDS
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Expanded(
                    child: ShortcutCard(
                      image: 'assets/products/shrimp_guide.png',
                      title: 'రొయ్యల సాగు గైడ్',
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: ShortcutCard(
                      image: 'assets/products/biomass_calculator.png',
                      title: 'బయోమాస్\nకాలిక్యులేటర్',
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: ShortcutCard(
                      image: 'assets/products/shrimp_diseases.png',
                      title: 'రొయ్యల\nవ్యాధులు',
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 25),

            // WATER PARAMETERS
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: const Color(0xFFE8F8FD),
                borderRadius: BorderRadius.circular(30),
                border: Border.all(
                  color: const Color(0xFFB8E5F2),
                  width: 2,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        'చెరువు నీటి పరిస్థితులు',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w900,
                          color: Color(0xFF08789B),
                        ),
                      ),
                      Icon(
                        Icons.edit,
                        color: Color(0xFF08789B),
                      ),
                    ],
                  ),

                  const SizedBox(height: 18),

                  Row(
                    children: const [
                      Expanded(
                        child: ParameterCard(
                          icon: Icons.science_outlined,
                          title: 'pH',
                          value: '7.8',
                          unit: '6.5 - 8.5',
                        ),
                      ),
                      SizedBox(width: 8),
                      Expanded(
                        child: ParameterCard(
                          icon: Icons.water,
                          title: 'Salinity',
                          value: '18',
                          unit: 'ppt',
                        ),
                      ),
                      SizedBox(width: 8),
                      Expanded(
                        child: ParameterCard(
                          icon: Icons.air,
                          title: 'DO',
                          value: '5.6',
                          unit: 'mg/L',
                        ),
                      ),
                      SizedBox(width: 8),
                      Expanded(
                        child: ParameterCard(
                          icon: Icons.science,
                          title: 'Alkalinity',
                          value: '140',
                          unit: 'ppm',
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            // FEATURED PRODUCTS
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 25),
              child: Text(
                'Featured Products',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w900,
                  color: Color(0xFF08789B),
                ),
              ),
            ),

            const SizedBox(height: 18),

            SizedBox(
              height: 245,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                children: const [
                  ProductCard(
                    image: 'assets/products/marine 6g.png',
                    name: 'Marine 6G',
                  ),
                  ProductCard(
                    image: 'assets/products/marine protab.png',
                    name: 'Marine ProTab',
                  ),
                  ProductCard(
                    image: 'assets/products/marine volt-x.png',
                    name: 'Marine Volt-X',
                  ),
                  ProductCard(
                    image: 'assets/products/Marine vibrio shield.png',
                    name: 'Marine Vibrio Shield',
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
// SHORTCUT CARD
// ============================================================

class ShortcutCard extends StatelessWidget {
  final String image;
  final String title;

  const ShortcutCard({
    super.key,
    required this.image,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 175,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.07),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      clipBehavior: Clip.antiAlias,
      child: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              image,
              fit: BoxFit.cover,
              errorBuilder: (_, __, ___) {
                return Container(
                  color: const Color(0xFFEAF8FC),
                  child: const Icon(
                    Icons.image_not_supported,
                    size: 45,
                    color: Color(0xFF08789B),
                  ),
                );
              },
            ),
          ),

          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 6,
                vertical: 9,
              ),
              color: Colors.black.withOpacity(0.48),
              child: Text(
                title,
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 13,
                  fontWeight: FontWeight.w900,
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
// WATER PARAMETER CARD
// ============================================================

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
    return Container(
      height: 145,
      padding: const EdgeInsets.symmetric(
        horizontal: 5,
        vertical: 12,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: const Color(0xFF1595B4),
            size: 28,
          ),
          const SizedBox(height: 6),
          Text(
            title,
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: const TextStyle(
              fontSize: 23,
              fontWeight: FontWeight.w900,
              color: Color(0xFF08789B),
            ),
          ),
          Text(
            unit,
            style: const TextStyle(
              fontSize: 11,
              color: Colors.grey,
            ),
          ),
        ],
      ),
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
      width: 185,
      margin: const EdgeInsets.only(right: 15),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(28),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 12,
            offset: const Offset(0, 5),
          ),
        ],
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
                  color: Color(0xFF08789B),
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
              fontSize: 17,
              fontWeight: FontWeight.w900,
              color: Color(0xFF08789B),
            ),
          ),
          const SizedBox(height: 8),
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
    final products = [
      ['assets/products/marine 6g.png', 'Marine 6G'],
      ['assets/products/marine protab.png', 'Marine ProTab'],
      ['assets/products/marine volt-x.png', 'Marine Volt-X'],
      ['assets/products/Marine vibrio shield.png', 'Marine Vibrio Shield'],
      ['assets/products/Bio sludge.png', 'Bio Sludge'],
      ['assets/products/Bio soil.png', 'Bio Soil'],
      ['assets/products/Free moult.png', 'Free Moult'],
      ['assets/products/Hi-Soft.png', 'Hi-Soft'],
      ['assets/products/Red thunder.png', 'Red Thunder'],
      ['assets/products/Starmin.png', 'Starmin'],
      ['assets/products/Yucca Pro.png', 'Yucca Pro'],
      ['assets/products/Zeoneem.png', 'Zeoneem'],
      ['assets/products/marine white shield.png', 'Marine White Shield'],
      ['assets/products/nutrimin.png', 'Nutrimin'],
      ['assets/products/oxytab plus.png', 'OxyTab Plus'],
    ];

    return SafeArea(
      child: Column(
        children: [
          const SizedBox(height: 20),

          const Text(
            'Our Products',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w900,
              color: Color(0xFF08789B),
            ),
          ),

          const SizedBox(height: 15),

          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(18),
              gridDelegate:
                  const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 14,
                mainAxisSpacing: 14,
                childAspectRatio: 0.82,
              ),
              itemCount: products.length,
              itemBuilder: (context, index) {
                return ProductCard(
                  image: products[index][0],
                  name: products[index][1],
                );
              },
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
      child: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),

            const Text(
              'Support',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.w900,
                color: Color(0xFF08789B),
              ),
            ),

            const SizedBox(height: 25),

            SupportTile(
              icon: Icons.phone,
              title: 'Call Support',
              subtitle: 'Contact Marine Aqua Technologies',
              onTap: () {},
            ),

            SupportTile(
              icon: Icons.chat,
              title: 'WhatsApp Support',
              subtitle: 'Chat with our support team',
              onTap: () {},
            ),

            SupportTile(
              icon: Icons.location_on,
              title: 'Office',
              subtitle: 'Marine Aqua Technologies',
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
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      child: ListTile(
        onTap: onTap,
        contentPadding: const EdgeInsets.all(15),
        tileColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(22),
        ),
        leading: CircleAvatar(
          radius: 27,
          backgroundColor: const Color(0xFFE2F7FC),
          child: Icon(
            icon,
            color: const Color(0xFF08789B),
          ),
        ),
        title: Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(subtitle),
        trailing: const Icon(
          Icons.arrow_forward_ios,
          size: 18,
        ),
      ),
    );
  }
}
```
