import 'package:flutter/material.dart';

class SideMenuYao extends StatelessWidget {
  const SideMenuYao({
    super.key,
    required this.height,
  });

  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      padding: const EdgeInsets.symmetric(
        horizontal: 16.0,
        vertical: 30.0,
      ),
      decoration: const BoxDecoration(
        color: Color(0xffEFF3F6),
        borderRadius: BorderRadius.all(
          Radius.circular(30.0),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: 200.0,
            child: DrawerHeader(
              padding: const EdgeInsets.only(left: 6.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    'assets/images/juara.png',
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    'Diskominfo Kota Banjarbaru',
                    style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                          color: Colors.black54,
                          fontSize: 12.0,
                        ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 10.0,
          ),
          DashTile(
            onKlik: () {},
            title: "Dashboard",
            icon: const Icon(Icons.grid_view_outlined),
          ),
          DashTile(
            onKlik: () {},
            title: "Data",
            icon: const Icon(Icons.data_array_outlined),
          ),
          DashTile(
            onKlik: () {},
            title: "Laporan",
            icon: const Icon(
              Icons.info_outline_rounded,
            ),
          ),
          DashTile(
            onKlik: () {},
            title: "Chart",
            icon: const Icon(
              Icons.stacked_bar_chart_outlined,
            ),
          ),
          const Spacer(),
          DashTile(
            onKlik: () {},
            title: "Akun",
            icon: const Icon(
              Icons.person,
            ),
          ),
          DashTile(
            onKlik: () {},
            title: "Setting",
            icon: const Icon(
              Icons.settings,
            ),
          ),
        ],
      ),
    );
  }
}

class DashTile extends StatelessWidget {
  const DashTile({
    super.key,
    required this.title,
    required this.icon,
    required this.onKlik,
  });

  final String title;
  final Icon icon;
  final VoidCallback onKlik;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      visualDensity: const VisualDensity(vertical: 4.0),
      dense: true,
      onTap: onKlik,
      leading: Icon(icon.icon),
      title: Text(title),
    );
  }
}
