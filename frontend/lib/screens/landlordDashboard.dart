import 'package:flutter/material.dart';
import 'package:frontend/screens/chat.dart';

class LandlordDashboard extends StatefulWidget {
  const LandlordDashboard({super.key});

  @override
  State<LandlordDashboard> createState() => _LandlordDashboardState();
}

class _LandlordDashboardState extends State<LandlordDashboard> {
  int _selectedIndex = 0;
  int unreadMessages = 3; // Example count
  bool isMenuCollapsed = false; // New toggle state

  final List<String> _menuTitles = [
    'Profile',
    'Add Property',
    'View Property',
    'Notifications',
    'Tenant Details',
  ];

  final List<IconData> _menuIcons = [
    Icons.person_outline,
    Icons.add_home,
    Icons.apartment,
    Icons.notifications_none,
    Icons.groups_outlined,
  ];

  final List<Widget> _pages = [
    Center(child: Text('Profile Page')),
    Center(child: Text('Add Property Page')),
    Center(child: Text('View Property Page')),
    Center(child: Text('Notifications Page')),
    Center(child: Text('Tenant Details Page')),
  ];

  Widget _buildMenuItem(IconData icon, String label, int index) {
    return ListTile(
      leading: Icon(icon, size: 28, color: Colors.grey[700]),
      title: isMenuCollapsed
          ? null
          : Text(
              label,
              style: const TextStyle(
                fontSize: 18,
                fontFamily: 'Cursive',
                color: Colors.black54,
              ),
            ),
      trailing: isMenuCollapsed
          ? null
          : const Icon(Icons.arrow_forward, color: Colors.grey),
      onTap: () {
        setState(() {
          _selectedIndex = index;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          // Sidebar menu
          AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            width: isMenuCollapsed ? 70 : 200,
            color: Colors.grey[200],
            child: Column(
              children: [
                IconButton(
                  icon: Icon(isMenuCollapsed ? Icons.menu_open : Icons.menu),
                  onPressed: () {
                    setState(() {
                      isMenuCollapsed = !isMenuCollapsed;
                    });
                  },
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: _menuTitles.length,
                    itemBuilder: (context, index) {
                      return _buildMenuItem(
                        _menuIcons[index],
                        _menuTitles[index],
                        index,
                      );
                    },
                  ),
                ),
              ],
            ),
          ),

          // Main content area
          Expanded(
            child: Column(
              children: [
                // Top curved header
                ClipPath(
                  clipper: CurvedHeaderClipper(),
                  child: Container(
                    height: 180,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/house interer.webp'),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: SafeArea(
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Row(
                              children: [
                                const Text(
                                  "Welcome Back",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontFamily: 'Cursive',
                                    color: Colors.black,
                                  ),
                                ),
                                const Spacer(),
                                const Text(
                                  "Username",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontFamily: 'Cursive',
                                    color: Colors.black,
                                  ),
                                ),
                                const SizedBox(width: 5),
                                const Icon(Icons.account_circle, size: 22),
                              ],
                            ),
                            const SizedBox(height: 10),

                            // Search bar + chat icon
                            Row(
                              children: [
                                Expanded(
                                  child: TextField(
                                    decoration: InputDecoration(
                                      hintText: 'My Property',
                                      hintStyle: const TextStyle(
                                        fontFamily: 'Cursive',
                                        fontSize: 16,
                                      ),
                                      prefixIcon: const Icon(Icons.search),
                                      filled: true,
                                      fillColor:
                                          Colors.white.withOpacity(0.9),
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                              vertical: 0),
                                      border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(8),
                                        borderSide: BorderSide.none,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 8),
                                Stack(
                                  children: [
                                    IconButton(
                                      icon: const Icon(
                                        Icons.chat_bubble_outline,
                                        size: 28,
                                      ),
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                const ChatPage(),
                                          ),
                                        );
                                      },
                                    ),
                                    if (unreadMessages > 0)
                                      Positioned(
                                        right: 6,
                                        top: 6,
                                        child: Container(
                                          padding: const EdgeInsets.all(4),
                                          decoration: const BoxDecoration(
                                            color: Colors.red,
                                            shape: BoxShape.circle,
                                          ),
                                          child: Text(
                                            '$unreadMessages',
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
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),

                // Page title
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(
                    _menuTitles[_selectedIndex],
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Cursive',
                    ),
                  ),
                ),

                // Page content
                Expanded(
                  child: _pages[_selectedIndex],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Curved header
class CurvedHeaderClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height - 40);
    path.quadraticBezierTo(
      size.width / 2, size.height,
      size.width, size.height - 40,
    );
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
