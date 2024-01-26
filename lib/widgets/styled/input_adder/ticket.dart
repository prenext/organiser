import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TicketsAdder extends StatefulWidget {
  final TextEditingController ticketsController;
  final TextEditingController costPerTicketController;
  bool setEventTime = true;
  bool setEventTickets = true;

  TicketsAdder(
      {required this.ticketsController, required this.costPerTicketController});

  @override
  _TicketsAdder createState() => _TicketsAdder();
}

class _TicketsAdder extends State<TicketsAdder> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 10.0, ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: 25,
                child: ToggleButtons(
                  children: [
                    Text(
                      'Tickets',
                      style:
                          TextStyle(fontSize: 10, fontWeight: FontWeight.w300),
                    ),
                    Text(
                      'No Ticket',
                      style:
                          TextStyle(fontSize: 10, fontWeight: FontWeight.w300),
                    ),
                  ],
                  isSelected: [widget.setEventTickets, !widget.setEventTickets],
                  onPressed: (index) {
                    setState(() {
                      widget.setEventTickets = index == 0 ? true : false;
                    });
                  },
                  borderRadius: BorderRadius.circular(50.0),
                ),
              ),
              Text("Add Tickets",
                  style: TextStyle(
                      color: Theme.of(context).hintColor,
                      fontSize: 14,
                      decoration: widget.setEventTickets
                          ? TextDecoration.underline
                          : TextDecoration.lineThrough,
                      decorationThickness: 2)),
            ],
          ),
        ),
         if (widget.setEventTickets)
          SizedBox(
          height: 15,
        ),
        if (widget.setEventTickets)
          Row(
            children: [
              Expanded(
                child: _buildRoundedTextField(
                  controller: TextEditingController(),
                  labelText: 'Number of tickets',
                  myIcon: Icons.calculate_outlined,
                  context: context,
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                child: _buildRoundedTextField(
                  controller: TextEditingController(),
                  labelText: 'Cost Per Ticket',
                  myIcon: Icons.attach_money_rounded,
                  context: context,
                ),
              ),
            ],
          )
      ],
    );
  }

  Widget _buildRoundedTextField(
      {required TextEditingController controller,
      required String labelText,
      required IconData myIcon,
      required BuildContext context}) {
    return TextField(
      controller: controller,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        fillColor: Theme.of(context).colorScheme.secondary.withOpacity(0.5),
        filled: true,
        labelText: labelText,
        labelStyle: TextStyle(fontSize: 13),
        suffixIcon: Icon(myIcon),
        border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(15)),
      ),
    );
  }
}
