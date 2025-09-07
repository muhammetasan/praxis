import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          surfaceTintColor: Colors.white, // Prevents tint on scroll
          elevation: 1.0,
        ),
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late PageController _pageController;
  int _currentPage = 0;
  final _formKey = GlobalKey<FormState>();

  // Function to launch a URL
  void _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      // Could not launch the URL
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Could not launch $url')),
        );
      }
    }
  }

  // TODO: Replace with your actual image filenames
  final List<String> clinicImages = [
    'assets/clinic/01.jpg',
    'assets/clinic/02.jpg',
    'assets/clinic/03.jpg',
    'assets/clinic/04.jpg',
    'assets/clinic/05.jpg',
    'assets/clinic/06.jpg',
  ];

  @override
  void initState() {
    super.initState();
    // Initialize PageController here. Viewport fraction will be set in build methods.
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // This is empty now to avoid re-creating controllers unnecessarily
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(130.0), // Increased max height
        child: Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            border: Border(bottom: BorderSide(color: Color(0xFF002c57), width: 1.0)),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 16.0), // Increased vertical padding
            child: SafeArea(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/clinicLogo.png',
                    height: 40, // Adjust height to fit in AppBar
                  ),
                  const SizedBox(width: 16),
                  const Text(
                    'orthoRPM',
                    style: TextStyle(
                      color: Color(0xFF002c57),
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(width: 16),
                  const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.phone, color: Color(0xFF002c57)),
                      SizedBox(width: 8),
                      Text(
                        '030 1234 5678',
                        style: TextStyle(color: Color(0xFF002c57), fontSize: 16),
                      ),
                    ],
                  ),
                  const SizedBox(width: 16),
                  const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.location_on, color: Color(0xFF002c57)),
                      SizedBox(width: 8),
                      Text(
                        'Am Treptower Park 1, 12435 Berlin',
                        style: TextStyle(color: Color(0xFF002c57), fontSize: 16),
                      ),
                    ],
                  ),
                  const SizedBox(width: 16),
                  const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.email, color: Color(0xFF002c57)),
                      SizedBox(width: 8),
                      Text(
                        'info@orthorpm.de',
                        style: TextStyle(color: Color(0xFF002c57), fontSize: 16),
                      ),
                    ],
                  ),
                  const Spacer(), // Pushes the icons to the right
                  ElevatedButton(
                    onPressed: () {
                      _launchURL('https://www.doctolib.de/praxis/berlin/orthorpm');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF002c57), // Primary dark blue
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    ),
                    child: Image.asset(
                      'assets/doctolib.png',
                      height: 20,
                    ),
                  ),
                   const SizedBox(width: 16),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.camera_alt_outlined), // Placeholder for Instagram
                        color: const Color(0xFF002c57),
                        onPressed: () {
                          // TODO: Implement Instagram link
                        },
                      ),
                      IconButton(
                        icon: const Icon(Icons.facebook),
                        color: const Color(0xFF002c57),
                        onPressed: () {
                           // TODO: Implement Facebook link
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth < 600) {
            return _buildMobileLayout();
          } else {
            return _buildDesktopLayout();
          }
        },
      ),
    );
  }

  Widget _buildDesktopLayout() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(24.0, 12.0, 24.0, 24.0),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Top-Left: Logo
                SizedBox(
                  width: 300, // Constrains the width of the left column
                  height: 250, // Match the gallery height for alignment
                  child: Image.asset(
                    'assets/firat.png',
                    fit: BoxFit.contain,
                    alignment: Alignment.centerLeft,
                  ),
                ),
                const SizedBox(width: 24),
                // Top-Right: Image Gallery
                Expanded(
                  child: _buildClinicGallery(isMobile: false),
                ),
              ],
            ),
            const SizedBox(height: 24),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Bottom-Left: Biography
                SizedBox(
                  width: 300, // Constrains the width of the left column
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Firat Polat',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF002c57),
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        'Dr Tip (Trakya Univ.)',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF002c57),
                        ),
                      ),
                      SizedBox(height: 12),
                      Text(
                        'Firat Polat is a specialist in Physical and Rehabilitative Medicine with extensive experience from various clinics in Berlin. His work focuses on pain therapy (Schmerztherapie), manual medicine (Manuelle Medizin), and acupuncture (Akupunktur) to help patients regain their mobility and well-being.',
                        style: TextStyle(fontSize: 16, height: 1.5, color: Color(0xFF002c57)),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 24),
                // Bottom-Right: Services/Hours and Contact Form side-by-side
                Expanded(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 1,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              'Services Offered',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF002c57),
                              ),
                            ),
                            SizedBox(height: 8),
                            Text('• Schmerztherapie', style: TextStyle(color: Color(0xFF002c57), fontSize: 16)),
                            SizedBox(height: 4),
                            Text('• Manuelle Medizin', style: TextStyle(color: Color(0xFF002c57), fontSize: 16)),
                            SizedBox(height: 4),
                            Text('• Akupunktur', style: TextStyle(color: Color(0xFF002c57), fontSize: 16)),
                            SizedBox(height: 4),
                            Text('• Physikalische und Rehabilitative Medizin', style: TextStyle(color: Color(0xFF002c57), fontSize: 16)),
                            SizedBox(height: 24),
                            Text(
                              'Opening Hours',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF002c57),
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              'Monday - Friday: 9:00 - 18:00',
                              style: TextStyle(fontSize: 16, color: Color(0xFF002c57)),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 24),
                      Expanded(
                        flex: 2, // Give contact form more space
                        child: _buildContactForm(isMobile: false),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMobileLayout() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 220,
              width: double.infinity,
              child: Image.asset(
                'assets/firat.png',
                fit: BoxFit.contain,
                alignment: Alignment.centerLeft,
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'Firat Polat',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Color(0xFF002c57),
              ),
            ),
            const SizedBox(height: 4),
            const Text(
              'Dr Tip (Trakya Univ.)',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Color(0xFF002c57),
              ),
            ),
            const SizedBox(height: 12),
            const Text(
              'Firat Polat is a specialist in Physical and Rehabilitative Medicine with extensive experience from various clinics in Berlin. His work focuses on pain therapy (Schmerztherapie), manual medicine (Manuelle Medizin), and acupuncture (Akupunktur) to help patients regain their mobility and well-being.',
              style: TextStyle(fontSize: 15, height: 1.5, color: Color(0xFF002c57)),
            ),
            const SizedBox(height: 24),
            const Text(
              'Services Offered',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xFF002c57),
              ),
            ),
            const SizedBox(height: 8),
            const Text('• Schmerztherapie', style: TextStyle(color: Color(0xFF002c57), fontSize: 15)),
            const SizedBox(height: 4),
            const Text('• Manuelle Medizin', style: TextStyle(color: Color(0xFF002c57), fontSize: 15)),
            const SizedBox(height: 4),
            const Text('• Akupunktur', style: TextStyle(color: Color(0xFF002c57), fontSize: 15)),
            const SizedBox(height: 4),
            const Text('• Physikalische und Rehabilitative Medizin', style: TextStyle(color: Color(0xFF002c57), fontSize: 15)),
            const SizedBox(height: 24),
            const Text(
              'Opening Hours',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xFF002c57),
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Monday - Friday: 9:00 - 18:00',
              style: TextStyle(fontSize: 15, color: Color(0xFF002c57)),
            ),
            const SizedBox(height: 32),
            _buildClinicGallery(isMobile: true),
            const SizedBox(height: 32),
            _buildContactForm(isMobile: true),
          ],
        ),
      ),
    );
  }

  Widget _buildClinicGallery({required bool isMobile}) {
    final double viewportFraction = isMobile ? 0.9 : 0.45;
    _pageController = PageController(
      initialPage: 5000, // Start in the middle of the "infinite" list
      viewportFraction: viewportFraction,
    );

    return SizedBox(
      height: isMobile ? 220 : 250, // Define a consistent height for the carousel
      child: Stack(
        alignment: Alignment.center,
        children: [
          PageView.builder(
            controller: _pageController,
            // No itemCount needed for a truly infinite scroll
            onPageChanged: (int page) {
              setState(() {
                _currentPage = page;
              });
            },
            itemBuilder: (context, index) {
              final int realIndex = index % clinicImages.length;
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.asset(
                    clinicImages[realIndex],
                    fit: BoxFit.cover,
                  ),
                ),
              );
            },
          ),
          // Left Arrow
          Align(
            alignment: Alignment.centerLeft,
            child: IconButton(
              icon: const Icon(Icons.arrow_back_ios, color: Colors.white70, size: 30),
              onPressed: () {
                _pageController.previousPage(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                );
              },
            ),
          ),
          // Right Arrow
          Align(
            alignment: Alignment.centerRight,
            child: IconButton(
              icon: const Icon(Icons.arrow_forward_ios, color: Colors.white70, size: 30),
              onPressed: () {
                _pageController.nextPage(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContactForm({required bool isMobile}) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Contact Us',
            style: TextStyle(
              fontSize: isMobile ? 18 : 20,
              fontWeight: FontWeight.bold,
              color: const Color(0xFF002c57),
            ),
          ),
          const SizedBox(height: 16),
          TextFormField(
            decoration: const InputDecoration(
              labelText: 'Name',
              border: OutlineInputBorder(),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your name';
              }
              return null;
            },
          ),
          const SizedBox(height: 12),
          TextFormField(
            decoration: const InputDecoration(
              labelText: 'Email',
              border: OutlineInputBorder(),
            ),
            validator: (value) {
              if (value == null || value.isEmpty || !value.contains('@')) {
                return 'Please enter a valid email';
              }
              return null;
            },
          ),
          const SizedBox(height: 12),
          TextFormField(
            decoration: const InputDecoration(
              labelText: 'Message',
              border: OutlineInputBorder(),
              alignLabelWithHint: true,
            ),
            maxLines: 4,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your message';
              }
              return null;
            },
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF002c57),
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
            ),
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                // TODO: Implement email sending logic
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Sending Message...')),
                );
              }
            },
            child: const Text('Send'),
          ),
        ],
      ),
    );
  }
}
