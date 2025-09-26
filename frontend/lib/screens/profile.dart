import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Header
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/header_bg.jpg'), // Your header image
                    fit: BoxFit.cover,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Welcome Back",
                            style: TextStyle(color: Colors.black)),
                        Row(
                          children: [
                            Text("Username", style: TextStyle(color: Colors.black)),
                            SizedBox(width: 5),
                            Icon(Icons.person_outline, color: Colors.black),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    // Search Bar
                    Container(
                      height: 35,
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        // ignore: deprecated_member_use
                        color: Colors.white.withOpacity(0.8),
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.grey),
                      ),
                      child: Row(
                        children: [
                          Icon(Icons.search, size: 18),
                          SizedBox(width: 8),
                          Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "My Property",
                                hintStyle: TextStyle(fontSize: 14),
                              ),
                            ),
                          ),
                          Icon(Icons.tune, size: 18),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 15),

              // My Profile Label
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text("My Profile",
                    style: TextStyle(fontWeight: FontWeight.bold)),
              ),

              const SizedBox(height: 15),

              // Profile Picture + Basic Info
              Column(
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundColor: Colors.black,
                    child: Icon(Icons.person, color: Colors.white, size: 50),
                  ),
                  const SizedBox(height: 10),
                  Text("Name: Michelle Martin"),
                  Text("Email: name@gmail.com"),
                  Text("Phone Number: 07*******"),
                  Text("Role: Property Owner"),
                  Text("Language: Swahili, English"),
                  Text("Call Hours: 8AM - 10PM"),
                ],
              ),

              const SizedBox(height: 20),

              // Details
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Details", style: TextStyle(fontWeight: FontWeight.bold)),
                        Icon(Icons.arrow_forward),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Text("Verification"),
                    Text("ID Verification Status: Approved"),
                    Text("Business Registration No: *****"),
                    Text("Number of properties: 4"),
                    Text("Number Of listed Tenants:"),
                    Text("Rating:"),
                  ],
                ),
              ),

              const SizedBox(height: 50),
            ],
          ),
        ),
      ),

      // Edit Button
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        backgroundColor: Colors.grey[400],
        label: Text("Edit"),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
