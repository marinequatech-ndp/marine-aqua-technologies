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
          seedColor: const Color(0xFF08789A),
        ),
      ),
      home: const SplashScreen(),
    );
  }
}

/* =========================================================
   COLORS
========================================================= */

const Color marineBlue = Color(0xFF087A9B);
const Color darkBlue = Color(0xFF075A78);
const Color lightBg = Color(0xFFF3FBFE);
const Color cardBlue = Color(0xFFE5F6FB);

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
      backgroundColor: lightBg,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.water_drop_rounded,
                size: 100,
                color: marineBlue,
              ),

              const SizedBox(height: 20),

              const Text(
                'MARINE',
                style: TextStyle(
                  fontSize: 48,
                  fontWeight: FontWeight.w900,
                  color: marineBlue,
                  letterSpacing: 1,
                ),
              ),

              const Text(
                'AQUA TECHNOLOGIES',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: marineBlue,
                  letterSpacing: 1,
                ),
              ),

              const SizedBox(height: 30),

              const Text(
                'MARINE AQUA TECHNOLOGIES',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w800,
                  color: darkBlue,
                ),
              ),

              const SizedBox(height: 10),

              const Text(
                'ఆక్వా సాగులో ప్రతి దశలో... మీకు తోడుగా',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w700,
                  color: marineBlue,
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

              const SizedBox(height: 50),

              const SizedBox(
                width: 24,
                height: 24,
                child: CircularProgressIndicator(
                  strokeWidth: 3,
                  color: marineBlue,
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
   LOGIN SCREEN
========================================================= */

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController phoneController =
      TextEditingController();

  String generatedOtp = '123456';

  bool otpSent = false;

  void sendOtp() {
    if (phoneController.text.trim().length != 10) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please enter a valid 10 digit mobile number'),
        ),
      );
      return;
    }

    setState(() {
      otpSent = true;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Demo OTP: 123456'),
      ),
    );
  }

  void verifyOtp(String otp) {
    if (otp == generatedOtp) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => const MainNavigation(),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Incorrect OTP. Use 123456'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightBg,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 28,
            ),
            child: Column(
              children: [
                const SizedBox(height: 45),

                const Icon(
                  Icons.water_drop_rounded,
                  size: 95,
                  color: marineBlue,
                ),

                const SizedBox(height: 15),

                const Text(
                  'MARINE AQUA',
                  style: TextStyle(
                    fontSize: 34,
                    fontWeight: FontWeight.w900,
                    color: marineBlue,
                  ),
                ),

                const Text(
                  'TECHNOLOGIES',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w900,
                    color: marineBlue,
                  ),
                ),

                const SizedBox(height: 10),

                const Text(
                  'ఆక్వా సాగులో ప్రతి దశలో... మీకు తోడుగా',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    color: marineBlue,
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

                const SizedBox(height: 35),

                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.fromLTRB(
                    28,
                    32,
                    28,
                    30,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(35),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.06),
                        blurRadius: 20,
                        offset: const Offset(0, 8),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment:
                        CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Welcome Back',
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.w900,
                          color: marineBlue,
                        ),
                      ),

                      const SizedBox(height: 8),

                      Text(
                        otpSent
                            ? 'Enter the OTP sent to your mobile'
                            : 'Login with your mobile number',
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                        ),
                      ),

                      const SizedBox(height: 25),

                      if (!otpSent)
                        TextField(
                          controller: phoneController,
                          keyboardType: TextInputType.phone,
                          maxLength: 10,
                          decoration: InputDecoration(
                            counterText: '',
                            hintText: 'Enter mobile number',
                            prefixIcon: const Icon(
                              Icons.phone_android,
                              color: marineBlue,
                            ),
                            prefixText: '+91  ',
                            filled: true,
                            fillColor: const Color(0xFFE8F7FB),
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.circular(28),
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),

                      if (otpSent)
                        TextField(
                          keyboardType: TextInputType.number,
                          maxLength: 6,
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                            hintText: 'Enter 6 digit OTP',
                            counterText: '',
                            filled: true,
                            fillColor:
                                const Color(0xFFE8F7FB),
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.circular(28),
                              borderSide: BorderSide.none,
                            ),
                          ),
                          onChanged: (value) {
                            if (value.length == 6) {
                              verifyOtp(value);
                            }
                          },
                        ),

                      const SizedBox(height: 20),

                      SizedBox(
                        width: double.infinity,
                        height: 58,
                        child: ElevatedButton(
                          onPressed: () {
                            if (!otpSent) {
                              sendOtp();
                            } else {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(
                                const SnackBar(
                                  content:
                                      Text('Enter OTP: 123456'),
                                ),
                              );
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: marineBlue,
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(28),
                            ),
                          ),
                          child: Text(
                            otpSent ? 'VERIFY OTP' : 'SEND OTP',
                            style: const TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),

                      if (otpSent)
                        Center(
                          child: TextButton(
                            onPressed: () {
                              setState(() {
                                otpSent = false;
                              });
                            },
                            child: const Text(
                              'Change mobile number',
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

/* =========================================================
   MAIN NAVIGATION
========================================================= */

class MainNavigation extends StatefulWidget {
  const MainNavigation({super.key});

  @override
  State<MainNavigation> createState() =>
      _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
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
        selectedIndex: currentIndex,
        backgroundColor: const Color(0xFFF0F3F7),
        indicatorColor: const Color(0xFFD4F2FB),
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
      backgroundColor: lightBg,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverPadding(
              padding: const EdgeInsets.fromLTRB(
                20,
                15,
                20,
                25,
              ),
              sliver: SliverList(
                delegate: SliverChildListDelegate(
                  [
                    /* HEADER */

                    Row(
                      children: [
                        Container(
                          width: 62,
                          height: 62,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.circular(18),
                          ),
                          child: const Icon(
                            Icons.water_drop_rounded,
                            color: marineBlue,
                            size: 42,
                          ),
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
                                  fontSize: 22,
                                  fontWeight:
                                      FontWeight.w900,
                                  color: marineBlue,
                                ),
                              ),
                              Text(
                                'TECHNOLOGIES',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight:
                                      FontWeight.w900,
                                  color: marineBlue,
                                ),
                              ),
                              SizedBox(height: 3),
                              Text(
                                'ఆక్వా సాగులో ప్రతి దశలో... మీకు తోడుగా',
                                style: TextStyle(
                                  fontSize: 11,
                                  fontWeight:
                                      FontWeight.w700,
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

                    const SizedBox(height: 22),

                    /* HERO BANNER */

                    Container(
                      height: 210,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(30),
                        gradient: const LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Color(0xFF0B88A8),
                            Color(0xFF064E6A),
                          ],
                        ),
                      ),
                      child: Stack(
                        children: [
                          Positioned(
                            right: 0,
                            bottom: 0,
                            child: Icon(
                              Icons.water,
                              size: 220,
                              color: Colors.white
                                  .withOpacity(0.08),
                            ),
                          ),

                          Padding(
                            padding:
                                const EdgeInsets.all(24),
                            child: Column(
                              crossAxisAlignment:
                                  CrossAxisAlignment.start,
                              mainAxisAlignment:
                                  MainAxisAlignment.center,
                              children: const [
                                Text(
                                  'MARINE AQUA',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 28,
                                    fontWeight:
                                        FontWeight.w900,
                                  ),
                                ),
                                Text(
                                  'TECHNOLOGIES',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 25,
                                    fontWeight:
                                        FontWeight.w900,
                                  ),
                                ),
                                SizedBox(height: 10),
                                Text(
                                  'Smart Aquaculture.\nBetter Results.',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight:
                                        FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 28),

                    /* SECTION TITLE */

                    Row(
                      mainAxisAlignment:
                          MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'ఆక్వా సమాచారం',
                          style: TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.w900,
                            color: darkBlue,
                          ),
                        ),
                        Icon(
                          Icons.arrow_forward,
                          size: 34,
                          color: marineBlue,
                        ),
                      ],
                    ),

                    const SizedBox(height: 15),

                    /* 3 CARDS */

                    SizedBox(
                      height: 170,
                      child: Row(
                        children: [
                          Expanded(
                            child: ShortcutCard(
                              image:
                                  'assets/shortcut_card_1_royyala_sagu_guide.png',
                              title: 'రొయ్యల సాగు గైడ్',
                            ),
                          ),

                          const SizedBox(width: 12),

                          Expanded(
                            child: ShortcutCard(
                              image:
                                  'assets/shortcut_card_2_biomass_calculator.png',
                              title: 'బయోమాస్ కాలిక్యులేటర్',
                            ),
                          ),

                          const SizedBox(width: 12),

                          Expanded(
                            child: ShortcutCard(
                              image:
                                  'assets/shortcut_card_3_royyala_vyadhulu.png',
                              title: 'రొయ్యల వ్యాధులు',
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 25),

                    /* WATER PARAMETERS */

                    Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: cardBlue,
                        borderRadius:
                            BorderRadius.circular(28),
                        border: Border.all(
                          color: const Color(0xFFA9DDEB),
                          width: 1.5,
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment:
                            CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment:
                                MainAxisAlignment
                                    .spaceBetween,
                            children: [
                              const Text(
                                'చెరువు నీటి పరిస్థితులు',
                                style: TextStyle(
                                  fontSize: 22,
                                  fontWeight:
                                      FontWeight.w900,
                                  color: darkBlue,
                                ),
                              ),
                              Icon(
                                Icons.edit,
                                color: marineBlue,
                              ),
                            ],
                          ),

                          const SizedBox(height: 18),

                          Row(
                            children: const [
                              ParameterCard(
                                icon: Icons.science_outlined,
                                title: 'pH',
                                value: '7.8',
                                bottom: '6.5 - 8.5',
                              ),
                              SizedBox(width: 8),
                              ParameterCard(
                                icon: Icons.waves,
                                title: 'Salinity',
                                value: '18',
                                bottom: 'ppt',
                              ),
                              SizedBox(width: 8),
                              ParameterCard(
                                icon: Icons.air,
                                title: 'DO',
                                value: '5.6',
                                bottom: 'mg/L',
                              ),
                              SizedBox(width: 8),
                              ParameterCard(
                                icon: Icons.science,
                                title: 'Alkalinity',
                                value: '140',
                                bottom: 'ppm',
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 28),

                    /* FEATURED PRODUCTS */

                    const Text(
                      'Featured Products',
                      style: TextStyle(
                        fontSize: 27,
                        fontWeight: FontWeight.w900,
                        color: darkBlue,
                      ),
                    ),

                    const SizedBox(height: 15),

                    SizedBox(
                      height: 250,
                      child: ListView(
                        scrollDirection:
                            Axis.horizontal,
                        children: const [
                          ProductPreviewCard(
                            image:
                                'assets/marine 6g.png',
                            name: 'Marine 6G',
                          ),
                          SizedBox(width: 15),
                          ProductPreviewCard(
                            image:
                                'assets/protab.png',
                            name: 'Marine ProTab',
                          ),
                          SizedBox(width: 15),
                          ProductPreviewCard(
                            image:
                                'assets/oxytab.png',
                            name: 'OXYTAB+',
                          ),
                        ],
                      ),
                    ),
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
   SHORTCUT CARD
========================================================= */

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
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
          ),
        ],
      ),
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            image,
            fit: BoxFit.cover,
            errorBuilder: (_, __, ___) {
              return Container(
                color: cardBlue,
                child: const Icon(
                  Icons.image_not_supported,
                  color: marineBlue,
                  size: 40,
                ),
              );
            },
          ),

          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 6,
                vertical: 7,
              ),
              color: Colors.black.withOpacity(0.55),
              child: Text(
                title,
                maxLines: 2,
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  color: Colors.white,
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
   PARAMETER CARD
========================================================= */

class ParameterCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;
  final String bottom;

  const ParameterCard({
    super.key,
    required this.icon,
    required this.title,
    required this.value,
    required this.bottom,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 135,
        padding: const EdgeInsets.symmetric(
          horizontal: 4,
          vertical: 12,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(22),
        ),
        child: Column(
          children: [
            Icon(
              icon,
              color: marineBlue,
              size: 25,
            ),

            const SizedBox(height: 5),

            Text(
              title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 5),

            Text(
              value,
              style: const TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.w900,
                color: marineBlue,
              ),
            ),

            Text(
              bottom,
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
}

/* =========================================================
   PRODUCT PREVIEW
========================================================= */

class ProductPreviewCard extends StatelessWidget {
  final String image;
  final String name;

  const ProductPreviewCard({
    super.key,
    required this.image,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 190,
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
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
              errorBuilder: (_, __, ___) {
                return const Icon(
                  Icons.inventory_2,
                  size: 80,
                  color: marineBlue,
                );
              },
            ),
          ),

          const SizedBox(height: 8),

          Text(
            name,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w900,
              color: marineBlue,
            ),
          ),
        ],
      ),
    );
  }
}

/* =========================================================
   PRODUCTS SCREEN
========================================================= */

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final products = [
      ['assets/marine 6g.png', 'Marine 6G'],
      ['assets/protab.png', 'Marine ProTab'],
      ['assets/oxytab.png', 'OXYTAB+'],
      ['assets/vibrio shield.png', 'Marine Vibrio Shield'],
      ['assets/volt-x.png', 'Marine Volt-X'],
      ['assets/bio sludge -x.png', 'Bio Sludge-X'],
      ['assets/white shield.png', 'White Shield'],
      ['assets/free moult.png', 'Free Moult'],
    ];

    return Scaffold(
      backgroundColor: lightBg,
      appBar: AppBar(
        backgroundColor: lightBg,
        elevation: 0,
        title: const Text(
          'Our Products',
          style: TextStyle(
            color: darkBlue,
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(18),
        itemCount: products.length,
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 14,
          mainAxisSpacing: 14,
          childAspectRatio: 0.78,
        ),
        itemBuilder: (context, index) {
          return Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(24),
            ),
            child: Column(
              children: [
                Expanded(
                  child: Image.asset(
                    products[index][0],
                    fit: BoxFit.contain,
                    errorBuilder: (_, __, ___) {
                      return const Icon(
                        Icons.image_not_supported,
                        size: 60,
                        color: marineBlue,
                      );
                    },
                  ),
                ),

                const SizedBox(height: 8),

                Text(
                  products[index][1],
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w900,
                    color: marineBlue,
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

/* =========================================================
   SUPPORT SCREEN
========================================================= */

class SupportScreen extends StatelessWidget {
  const SupportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightBg,
      appBar: AppBar(
        backgroundColor: lightBg,
        elevation: 0,
        title: const Text(
          'Support',
          style: TextStyle(
            color: darkBlue,
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            SupportCard(
              icon: Icons.phone,
              title: 'Call Support',
              subtitle: 'Talk to our technical team',
              onTap: () {},
            ),

            const SizedBox(height: 15),

            SupportCard(
              icon: Icons.chat,
              title: 'WhatsApp Support',
              subtitle: 'Get aquaculture assistance',
              onTap: () {},
            ),

            const SizedBox(height: 15),

            SupportCard(
              icon: Icons.location_on,
              title: 'Technical Officer',
              subtitle: 'Connect with our field team',
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}

class SupportCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  const SupportCard({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(25),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(25),
        ),
        child: Row(
          children: [
            Container(
              width: 55,
              height: 55,
              decoration: BoxDecoration(
                color: cardBlue,
                borderRadius: BorderRadius.circular(18),
              ),
              child: Icon(
                icon,
                color: marineBlue,
                size: 28,
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
                      fontWeight: FontWeight.w900,
                      color: darkBlue,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    subtitle,
                    style: const TextStyle(
                      fontSize: 13,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),

            const Icon(
              Icons.arrow_forward_ios,
              size: 17,
              color: marineBlue,
            ),
          ],
        ),
      ),
    );
  }
}
