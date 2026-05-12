import 'package:flutter/material.dart';

class Todo extends StatefulWidget {
  final String title;
  final String desc;
  final bool check;

  const Todo({
    super.key,
    required this.title,
    required this.desc,
    required this.check,
  });

  @override
  State<Todo> createState() => _TodoState();
}

class _TodoState extends State<Todo> {
  late bool isChecked;

  @override
  void initState() {
    super.initState();
    // Initialize the mutable state from the widget's final parameter
    isChecked = widget.check;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      child: Material(
        color: Colors.transparent, // Required for InkWell to show properly
        child: InkWell(
          onTap: () {
            setState(() {
              isChecked = !isChecked;
            });
          },
          borderRadius: BorderRadius.circular(12.0),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            padding: const EdgeInsets.all(12.0),
            decoration: BoxDecoration(
              // Background changes based on state (Green for done, light Grey for pending)
              color: isChecked
                  ? Colors.green.withValues(alpha: 0.1)
                  : Colors.white,
              borderRadius: BorderRadius.circular(12.0),
              border: Border.all(
                color: isChecked ? Colors.green : Colors.grey.shade300,
                width: 1.5,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.05),
                  blurRadius: 4,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Row(
              children: [
                // 1. The Checkbox
                Checkbox(
                  value: isChecked,
                  activeColor: Colors.green,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                  onChanged: (bool? value) {
                    setState(() {
                      isChecked = value ?? false;
                    });
                  },
                ),
                const SizedBox(width: 8),
                // 2. The Text Content
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.title,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: isChecked ? Colors.grey : Colors.black87,
                          decoration: isChecked
                              ? TextDecoration.lineThrough
                              : TextDecoration.none,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        widget.desc,
                        style: TextStyle(
                          fontSize: 14,
                          color: isChecked ? Colors.grey : Colors.black54,
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
