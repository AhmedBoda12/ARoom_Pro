import 'package:flutter/material.dart';

class confirmationitem extends StatelessWidget {
  const confirmationitem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[
          Image.asset(
            'assets/chair.png',
            width: 100,
            height: 100,
          ),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'lazy boy chair for your office',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'Ergonomic black office chair with adjustable height and smooth-rolling.',
                  style: TextStyle(fontSize: 14),
                ),
                SizedBox(height: 8),
                Row(
                  children: List.generate(4, (index) {
                    return Icon(
                      Icons.star,
                      color: Colors.orange,
                    );
                  })
                    ..add(
                      Icon(
                        Icons.star_border,
                        color: Colors.orange,
                      ),
                    ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
