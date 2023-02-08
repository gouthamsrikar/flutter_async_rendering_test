class FractalRenderView extends StatelessWidget {
  int x = 99;
  int width = 100;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Center(
        child: FutureBuilder(
          builder: (context, snapshot) => snapshot.hasData
              ? snapshot.data as Widget
              : const CircularProgressIndicator(),
          future: fractal(200, 100),
        ),
      ),
    );
  }

  Future<Widget> fractal(double width, int x) async {
    print(x);
    Future.delayed(const Duration(milliseconds: 1000));
    return x != 0
        ? Container(
            width: width,
            height: width,
            color: x % 2 == 1 ? Colors.red : Colors.yellow,
            padding: EdgeInsets.all(1),
            child: FutureBuilder(
              builder: (context, snapshot) => snapshot.hasData
                  ? snapshot.data as Widget
                  : const CircularProgressIndicator(),
              future: fractal(width / 2, x - 1),
            ),
          )
        : const SizedBox();
  }
}
