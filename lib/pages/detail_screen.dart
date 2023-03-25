import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../model/news.dart';

class DetailScreen extends StatefulWidget {
  final News news;

  const DetailScreen({required this.news, Key? key}) : super(key: key);

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  final List<String> _comments = [];
  final TextEditingController _commentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text("Detail News"),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  widget.news.title,
                  style: GoogleFonts.poppins(
                    textStyle: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w800,
                      color: Colors.black54,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16, right: 16, top: 8.0),
                child: Text(
                  widget.news.description,
                  style: GoogleFonts.poppins(
                    textStyle: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w300,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 32,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.news.author,
                      style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.black54),
                      ),
                    ),
                    Text(
                      widget.news.createdAt,
                      style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 56.0,
              ),
              const Padding(
                padding: EdgeInsets.all(16),
                child: Text("Comment"),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: TextField(
                  controller: _commentController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Give me ur opinion',
                  ),
                  onSubmitted: (String value) {
                    setState(() {
                      _comments.add(value);
                      _commentController.clear();
                    });
                  },
                ),
              ),
              const SizedBox(
                height: 24.0,
              ),
              const Divider(),
              const SizedBox(
                height: 24.0,
              ),
              _comments.isEmpty
                  ? const Center(child: Text("Theres no comment!"))
                  : const Center(child: Text("Theres a comment!"))
            ],
          ),
        ),
      ),
    );
  }
}
