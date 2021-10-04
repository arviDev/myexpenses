import 'package:flutter/material.dart';

class AppBarCustom extends StatefulWidget implements PreferredSizeWidget {
  final bool isSearch;
  final Function onPress;
  final Function onChange;
  const AppBarCustom(
      {Key? key,
      required this.isSearch,
      required this.onPress,
      required this.onChange})
      : super(key: key);

  @override
  _AppBarCustomState createState() => _AppBarCustomState();

  @override
  Size get preferredSize => const Size.fromHeight(60);
}

class _AppBarCustomState extends State<AppBarCustom> {
  final String title = 'Minhas Despesas';
  final String hint = 'Pesquisar por descrição...';
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: AnimatedSwitcher(
        duration: const Duration(
          milliseconds: 300,
        ),
        transitionBuilder: (Widget child, Animation<double> animation) {
          return ScaleTransition(
            child: child,
            scale: animation,
          );
        },
        child: !widget.isSearch
            ? Text(title)
            : TextField(
                autofocus: true,
                showCursor: false,
                onChanged: (value) => widget.onChange(value),
                textAlign: TextAlign.left,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: hint,
                ),
              ),
      ),
      actions: [
        IconButton(
          tooltip: 'Pesquisar',
          onPressed: () => widget.onPress(),
          icon: AnimatedSwitcher(
            duration: const Duration(
              milliseconds: 300,
            ),
            transitionBuilder: (Widget child, Animation<double> animation) {
              return ScaleTransition(
                child: child,
                scale: animation,
              );
            },
            child: !widget.isSearch
                ? const Icon(Icons.search)
                : const Icon(Icons.close),
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.filter_alt_outlined),
        ),
        IconButton(
          onPressed: () {
            Navigator.pushNamed(context, '/category');
          },
          icon: const Icon(Icons.category),
        )
      ],
    );
  }
}
