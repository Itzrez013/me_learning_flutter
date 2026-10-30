import 'package:flutter/material.dart';
import 'package:first/features/bots/models/bot.dart';

class Home extends StatefulWidget {
  const Home({super.key});
  @override
  State<Home> createState() => _HomeState();
}
class _HomeState extends State<Home> {
  List<Bot> bots = [];

  void get_bots() async {
    bots = [
      Bot('bot1', '123'),
      Bot('bot2', '456'),
      Bot('bot3', '789'),
    ];


}

  @override
  void initState() {
    super.initState();
    get_bots();
  }
@override
Widget build(BuildContext context) {
  return Scaffold(
    backgroundColor: const Color(0xFF080D18),

    appBar: AppBar(
      backgroundColor: const Color(0xFF080D18),
      elevation: 0,
      centerTitle: false,
      title: const Row(
        children: [
          Icon(
            Icons.telegram,
            color: Color(0xFF38BDF8),
            size: 30,
          ),
          SizedBox(width: 8),
          Text(
            'TeleForge',
            style: TextStyle(
              color: Colors.white,
              fontSize: 23,
              fontWeight: FontWeight.bold,
              letterSpacing: 0.5,
            ),
          ),
        ],
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.notifications_none_rounded,
            color: Colors.white70,
          ),
        ),
        const SizedBox(width: 8),
      ],
    ),

    body: SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 24),
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [
                    Color(0xFF123B68),
                    Color(0xFF10233E),
                    Color(0xFF101827),
                  ],
                ),
                borderRadius: BorderRadius.circular(24),
                border: Border.all(
                  color: const Color(0xFF38BDF8).withValues(alpha: 0.18),
                ),
              ),
              child: Column(
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: const Color(0xFF38BDF8).withValues(alpha: 0.12),
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: const Icon(
                      Icons.smart_toy_rounded,
                      color: Color(0xFF38BDF8),
                      size: 50,
                    ),
                  ),

                  const SizedBox(height: 20),

                  const Text(
                    'مدیریت ربات‌های تلگرام',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 8),

                  const Text(
                    'ربات‌هات رو در یک مکان مدیریت کن.',
                    style: TextStyle(
                      color: Color(0xFFB0C4DE),
                      fontSize: 14,
                    ),
                  ),

                  const SizedBox(height: 22),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                      Icons.check_circle_outline_outlined,
                        color: Color(0xFF38BDF8),
                        size: 20,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        '${bots.length} ربات ثبت‌شده',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),

                      SizedBox(width: 24),

                      const Icon(
                      Icons.info_outline_rounded,
                        color: Color(0xFF38BDF8),
                        size: 20,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        '${bots.length} ربات به روز نشده',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),

                      SizedBox(width: 24),

                      const Icon(
                      Icons.code_sharp,
                        color: Color(0xFF38BDF8),
                        size: 20,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        '${bots.length} دستور',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),

                    ],
                  ),
                ],
              ),
            ),
          ),

          // Section title
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Container(
                  width: 4,
                  height: 22,
                  decoration: BoxDecoration(
                    color: const Color(0xFF38BDF8),
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                const SizedBox(width: 10),
                const Text(
                  'ربات‌های من',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Spacer(),
                Text(
                  '${bots.length} مورد',
                  style: const TextStyle(
                    color: Color(0xFF8293AA),
                    fontSize: 13,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 16),

          // Bots list
            Expanded(

              child: bots.isEmpty
                  ? Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.smart_toy_outlined,
                            size: 64,
                            color: Colors.blueGrey.shade700,
                          ),
                          const SizedBox(height: 16),
                          const Text(
                            'هنوز رباتی اضافه نکردی',
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(height: 8),
                          const Text(
                            'برای شروع، یک ربات جدید بساز.',
                            style: TextStyle(
                              color: Color(0xFF8293AA),
                              fontSize: 13,
                            ),
                          ),
                        ],
                      ),
                    )
                  : ListView.separated(
                      padding: const EdgeInsets.fromLTRB(20, 0, 20, 100),
                      itemCount: bots.length,
                      separatorBuilder: (context, index) =>
                          const SizedBox(height: 12),
                      itemBuilder: (context, index) {
                        final bot = bots[index];

                        return Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: const Color(0xFF111A2A),
                            borderRadius: BorderRadius.circular(18),
                            border: Border.all(
                              color: const Color(0xFF26354B),
                            ),
                          ),
                          child: Row(
                            children: [
                              // Bot icon
                              Container(
                                width: 54,
                                height: 54,
                                decoration: BoxDecoration(
                                  color: const Color(0xFF38BDF8)
                                      .withValues(alpha: 0.12),
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                child: const Icon(
                                  Icons.smart_toy_rounded,
                                  color: Color(0xFF38BDF8),
                                  size: 29,
                                ),
                              ),

                              const SizedBox(width: 14),

                              // Bot information
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      bot.name,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),

                                    const SizedBox(height: 8),

                                    Row(
                                      children: [
                                        Container(
                                          width: 7,
                                          height: 7,
                                          decoration: const BoxDecoration(
                                            color: Color(0xFF38BDF8),
                                            shape: BoxShape.circle,
                                          ),
                                        ),
                                        const SizedBox(width: 6),
                                        const Text(
                                          'ثبت‌شده',
                                          style: TextStyle(
                                            color: Color(0xFF8EA3BC),
                                            fontSize: 12,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),

                              IconButton(
                                onPressed: () {},
                                tooltip: 'مدیریت ربات',
                                icon: const Icon(
                                  Icons.arrow_forward_ios_rounded,
                                  color: Color(0xFF38BDF8),
                                  size: 18,
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
            ),
        ],
      ),
    ),

    floatingActionButton: FloatingActionButton.extended(
      onPressed: () {
        // TODO: Open the add-bot page.
      },
      backgroundColor: const Color(0xFF38BDF8),
      foregroundColor: const Color(0xFF080D18),
      elevation: 8,
      icon: const Icon(Icons.add_rounded),
      label: const Text(
        'افزودن ربات',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
    ),
  );
}

}