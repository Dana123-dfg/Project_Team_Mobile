import 'package:flutter/material.dart';

class SearchWidget extends StatefulWidget {
  final void Function()? onTap;

  const SearchWidget({super.key, this.onTap});

  @override
  State<SearchWidget> createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        height: 52,
        padding: const EdgeInsets.symmetric(horizontal: 14),
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 255, 253, 253),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.grey.shade300, width: 1),
        ),
        child: Row(
          children: [
            Icon(Icons.search, size: 22, color: Colors.grey.shade600),
            const SizedBox(width: 10),
            Expanded(
              // child: TextField(
              //   decoration: InputDecoration(
              //     hintText: "Search",
              //     hintStyle: TextStyle(
              //       color: Colors.grey.shade600,
              //       fontSize: 15,
              //       fontWeight: FontWeight.w500,
              //     ),
              //     border: InputBorder.none,
              //     enabledBorder: InputBorder.none,
              //     focusedBorder: InputBorder.none,
              //     disabledBorder: InputBorder.none,
              //     isDense: true,
              //   ),
              // ),
              child: Text("Search",style: TextStyle(
                    color: Colors.grey.shade600,
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),),
              
            ),
          ],
        ),
      ),
    );
  }
}
