import 'package:flutter/material.dart';
import 'package:flutter_application_1/views/screens/addadressscreen.dart';


class ShippingAddress extends StatefulWidget {
  const ShippingAddress({super.key});

  @override
  State<ShippingAddress> createState() => _ShippingAddressState();
}

class _ShippingAddressState extends State<ShippingAddress> {
  final List<Map<String, String>> _addresses = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7E5DC),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF4CFC3),
        elevation: 0,
        iconTheme: const IconThemeData(color: Color(0xFF3D3D3D)),
        title: const Text(
          'Shiipping Location',
          style: TextStyle(
            color: Color(0xFF3D3D3D),
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Your Addresses",
                style: TextStyle(
                  fontSize: 16,
                  color: Color(0xFFB88C73),
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 16),
              if (_addresses.isEmpty)
                Center(
                  child: Text(
                    "No saved addresses yet.",
                    style: TextStyle(color: Colors.grey[700]),
                  ),
                )
              else
                ..._addresses.map((addr) => _buildAddressCard(
                      name: addr["name"]!,
                      addressLine: addr["address"]!,
                      phone: addr["phone"]!,
                    )),
              const SizedBox(height: 30),
              Center(
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFD4AF37),
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                  ),
                  onPressed: () async {
                    final result = await Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const AddAddressScreen()),
                    );

                    if (result != null && result is Map<String, String>) {
                      setState(() {
                        _addresses.add(result);
                      });
                    }
                  },
                  icon: const Icon(Icons.add_location_alt_outlined, size: 20),
                  label: const Text(
                    "Add New Address",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAddressCard({
    required String name,
    required String addressLine,
    required String phone,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.5),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white.withOpacity(0.2)),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10,
            offset: Offset(2, 4),
          ),
        ],
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        title: Text(
          name,
          style: const TextStyle(
            color: Color(0xFF3D3D3D),
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 4),
            Text(
              addressLine,
              style: const TextStyle(color: Colors.black87, fontSize: 14),
            ),
            const SizedBox(height: 4),
            Text(
              "Phone: $phone",
              style: const TextStyle(color: Colors.black54, fontSize: 13),
            ),
          ],
        ),
      ),
    );
  }
}
