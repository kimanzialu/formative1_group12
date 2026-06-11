import 'package:flutter/material.dart';

class CommunitiesScreen extends StatelessWidget {
  const CommunitiesScreen({super.key});

  static const Color bgColor = Color(0xFF041C45);
  static const Color cardColor = Color(0xFF0A2A5F);
  static const Color accent = Color(0xFFF6B21A);

  @override
  Widget build(BuildContext context) {
    final communities = [
      {
        "name": "ALU Debate Society",
        "members": "124",
        "joined": false,
      },
      {
        "name": "Entrepreneurship Club",
        "members": "250",
        "joined": true,
      },
      {
        "name": "Women in Leadership",
        "members": "180",
        "joined": false,
      },
      {
        "name": "Tech & Innovation Hub",
        "members": "210",
        "joined": false,
      },
    ];

    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(18),
          child: Column(
            children: [
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Communities",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              const SizedBox(height: 20),

              Container(
                height: 48,
                decoration: BoxDecoration(
                  color: Colors.white10,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: accent),
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: const Center(
                          child: Text(
                            "All Clubs",
                            style: TextStyle(
                              color: accent,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const Expanded(
                      child: Center(
                        child: Text(
                          "My Clubs",
                          style: TextStyle(
                            color: Colors.white70,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              Expanded(
                child: ListView.builder(
                  itemCount: communities.length,
                  itemBuilder: (context, index) {
                    final item = communities[index];

                    return Container(
                      margin: const EdgeInsets.only(bottom: 16),
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: cardColor,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.white,
                            child: Icon(
                              Icons.groups,
                              color: bgColor,
                            ),
                          ),

                          const SizedBox(width: 14),

                          Expanded(
                            child: Column(
                              crossAxisAlignment:
                                  CrossAxisAlignment.start,
                              children: [
                                Text(
                                  item["name"].toString(),
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  "${item["members"]} members",
                                  style: const TextStyle(
                                    color: Colors.white54,
                                  ),
                                ),
                              ],
                            ),
                          ),

                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: item["joined"] == true
                                  ? Colors.green
                                  : Colors.transparent,
                              side: BorderSide(
                                color: item["joined"] == true
                                    ? Colors.green
                                    : accent,
                              ),
                            ),
                            onPressed: () {},
                            child: Text(
                              item["joined"] == true
                                  ? "Joined"
                                  : "Join",
                            ),
                          )
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),

      bottomNavigationBar: _buildBottomNav(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: accent,
        onPressed: () {},
        child: const Icon(Icons.add, color: Colors.black),
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.centerDocked,
    );
  }

  Widget _buildBottomNav() {
    return BottomAppBar(
      color: bgColor,
      child: Row(
        mainAxisAlignment:
            MainAxisAlignment.spaceAround,
        children: const [
          Icon(Icons.home, color: Colors.white70),
          Icon(Icons.search, color: Colors.white70),
          SizedBox(width: 40),
          Icon(Icons.chat_bubble_outline,
              color: Colors.white70),
          Icon(Icons.person_outline,
              color: Colors.white70),
        ],
      ),
    );
  }
}
