import 'package:flutter/material.dart';
import 'package:pendataanwarga/providers/berita_panel_provider.dart';
import 'package:pendataanwarga/providers/dashboard_provider.dart';
import 'package:provider/provider.dart';

class BeritaPanel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    context.read<BeritaPanelProvider>().muatdata();

    return Scaffold(
      appBar: AppBar(
        title: Text('Berita'),
        elevation: 0,
        backgroundColor: Colors.blue,
      ),
      body: Consumer<BeritaPanelProvider>(builder: (context, prov, w) {
        return ListView(
          children: [
            for (final data in prov.data)
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('${data['title']}'),
                  Image.network(data['image'] ?? '',
                      errorBuilder: (context, error, stackTrace) {
                    return Image.asset('assets/logo.png');
                  }),
                  Text('${data['description']}')
                ],
              )
          ],
        );
      }),
    );
  }
}
