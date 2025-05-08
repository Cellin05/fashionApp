import 'package:flutter/material.dart';
import 'package:flutter_application_1/views/screens/editprof.dart';
import 'package:flutter_application_1/views/screens/orders.dart';
import 'package:flutter_application_1/views/screens/paymentmethod.dart';
import 'package:flutter_application_1/views/screens/settings.dart';
import 'package:flutter_application_1/views/screens/shippinglacation.dart';
import 'package:flutter_application_1/views/screens/helpcenter.dart';
import 'package:flutter_application_1/views/screens/signin.dart';


class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFF4CFC3), Color(0xFFF7E5DC)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(Icons.person, color: Color(0xFFD4AF37), size: 24),
                    SizedBox(width: 8),
                    Text(
                      'My Profile',
                      style: TextStyle(
                        color: Color(0xFFD4AF37),
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                Row(
                  children: [
                    const CircleAvatar(
                      radius: 40,
                      backgroundImage: AssetImage('assets/images/profile.jpg'),
                    ),
                    const SizedBox(width: 16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Hi, Deone!',
                          style: TextStyle(
                            color: Color(0xFF3D3D3D),
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 4),
                        TextButton(
                          onPressed: () {
                     Navigator.push(
                             context,
                             MaterialPageRoute(builder: (context) => const EditProfile()),
                                 );
                             },

                          child: const Text(
                            'Edit Profile',
                            style: TextStyle(
                              color: Color(0xFFD4AF37),
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                const SizedBox(height: 30),
                _buildSectionTitle('Account'),
                _buildGlassTile(Icons.shopping_bag_outlined, 'My Orders',
                 onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Orders(),
                      ),
                    );
                  },
                ),
                _buildGlassTile(
                  Icons.location_on_outlined,
                  'Shipping Address',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ShippingAddress(),
                      ),
                    );
                  },
                ),
                _buildGlassTile(
                  Icons.credit_card,
                  'Payment Methods',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const PaymentMethods(),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 24),
                _buildSectionTitle('Support'),
                _buildGlassTile(
                  Icons.help_outline,
                  'Help Center',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HelpCenter(),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 24),
                _buildSectionTitle('Settings'),
                _buildGlassTile(
                  Icons.settings,
                  'App Settings',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const AppSettings(),
                      ),
                    );
                  },
                ),
                _buildGlassTile(
                  Icons.logout,
                  'Logout',
                  iconColor: Colors.redAccent,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (e) => const Signin(),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Text(
        title,
        style: const TextStyle(
          color: Color(0xFFB88C73),
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Widget _buildGlassTile(IconData icon, String title,
      {Color? iconColor, VoidCallback? onTap}) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.3),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white.withOpacity(0.1)),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            offset: Offset(2, 4),
          )
        ],
      ),
      child: ListTile(
        leading: Icon(icon, color: iconColor ?? const Color(0xFF3D3D3D)),
        title: Text(
          title,
          style: const TextStyle(color: Color(0xFF3D3D3D)),
        ),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.black45),
        onTap: onTap,
      ),
    );
  }
}
