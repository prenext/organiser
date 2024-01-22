import 'package:Organiser/widgets/shared/input/textfields.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TicketsAdder extends StatelessWidget {
  final TextEditingController ticketsController;
  final TextEditingController costPerTicketController;
  bool setEventTime = true;
  bool setEventTickets = true;

  TicketsAdder({
    required this.ticketsController,
    required this.costPerTicketController
  });


  void setState(Null Function() param0) {}

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              height: 25,
              child: ToggleButtons(
                children: [
                  Text(
                    'Tickets',
                    style: TextStyle(fontSize: 10, fontWeight: FontWeight.w300),
                  ),
                  Text(
                    'No Ticket',
                    style: TextStyle(fontSize: 10, fontWeight: FontWeight.w300),
                  ),
                ],
                isSelected: [setEventTickets, !setEventTickets],
                onPressed: (index) {
                  setState(() {
                    setEventTickets = index == 0 ? true : false;
                  });
                },
                borderRadius: BorderRadius.circular(50.0),
              ),
            ),
            Text("Does this event have tickets?",
                style: TextStyle(color: Theme.of(context).hintColor)),
          ],
        ),
        SizedBox(
          height: 15,
        ),
        if (setEventTickets)
          Row(
            children: [
              Expanded(
                child: StyledTextField(
                  paddingX: 15,
                  paddingY: 5,
                  textSize: 16,
                  controller: TextEditingController(),
                  label: 'Number of Tickets',
                  inputType: TextInputType.numberWithOptions(),
                ),
              ),
              SizedBox(width: 40),
              Expanded(
                child: StyledTextField(
                  paddingX: 15,
                  paddingY: 5,
                  textSize: 16,
                  controller: TextEditingController(),
                  label: 'Cost per Ticket',
                  trailingIcon: Icons.attach_money,
                  inputType: TextInputType.numberWithOptions(),
                ),
              ),
            ],
          )
    ],) ;
  }
  
}
