import 'package:flutter/material.dart';

class ECommerceScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple,
      appBar: _buildAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
            child: Column(
          children: <Widget>[
            _buildToggleBar(),
            //Image.asset('assets/woman_shopping.jpg'),
            DealButtons(),
            _buildProductTitle(context),
          ],
        )),
      ),
    );
  }

  Row _buildToggleBar() {
    return Row(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: Text(
            'Recommended',
            style: TextStyle(
              color: Colors.white,
              fontSize: 17,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: Text(
            'Formal Wear',
            style: TextStyle(
              color: Colors.white54,
              fontSize: 17,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: Text(
            'Casual Wear',
            style: TextStyle(
              color: Colors.white54,
              fontSize: 17,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }

  Container _buildProductTitle(BuildContext context) {
    return Container(
      height: 200,
      color: Colors.white,
      child: Row(
        children: <Widget>[
          Image.asset(
            'assets/textiles.jpg',
            fit: BoxFit.fitHeight,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Lorem Ipsum',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  Text(
                      'Dolor sit amet, consectetur adipiscing elit. Quisque faucibus.')
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.purpleAccent,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(30))),
      leading: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Icon(Icons.home),
      ),
      title: Text('Let\'s go shopping!'),
      elevation: 0,
      actions: <Widget>[
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Icon(Icons.shopping_cart),
        )
      ],
    );
  }
}

class DealButtons extends StatelessWidget {
  const DealButtons({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 15),
        Row(
          children: <Widget>[
            DealButton(color: Colors.orangeAccent, text: 'Best Sellers'),
            SizedBox(width: 10),
            DealButton(color: Colors.blue, text: 'Daily Deals')
          ],
        ),
        SizedBox(height: 15),
        Row(
          children: <Widget>[
            DealButton(
              color: Colors.lightGreen,
              text: 'Must by in summer',
            ),
            SizedBox(width: 10),
            DealButton(color: Colors.redAccent, text: 'Last Change')
          ],
        ),
        SizedBox(height: 15),
      ],
    );
  }
}

class DealButton extends StatelessWidget {
  final String text;
  final Color color;

  const DealButton({Key? key, required this.color, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 80,
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Center(
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
