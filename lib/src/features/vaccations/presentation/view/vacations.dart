import 'package:crm_system/src/features/vaccations/model/vaccation_model.dart';
import 'package:crm_system/src/features/vaccations/presentation/widget/vacation_body.dart';
import 'package:crm_system/src/features/vaccations/presentation/widget/vacation_req_popup.dart';
import 'package:crm_system/src/utilities/colors.dart';
import 'package:crm_system/src/utilities/common_widget/custumScaffold.dart';
import 'package:crm_system/src/utilities/text_style.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class VacationsPage extends StatelessWidget {
  static const route = 'vacation-page';
  const VacationsPage({super.key});

  // Simulated data for demonstration
  List<Message> fetchData() {
    return [
      Message(
        userId: 1,
        vacationRequests: '10',
        sickLeaveRequests: '2',
        wfhRequests: '20',
        requestedby: [
          Requestedby(
            id: 1,
            email: 'evanyates@gmail.com',
            name: 'Evan Yates',
            phone: '123456789',
            userType: 1,
            tagLine: 'Employee',
            userImage: '',
            deletedAt: null,
            createdAt: DateTime.now(),
            updatedAt: DateTime.now(),
          )
        ],
      ),
      Message(
        userId: 2,
        vacationRequests: '15',
        sickLeaveRequests: '3',
        wfhRequests: '25',
        requestedby: [
          Requestedby(
            id: 2,
            email: 'janedoe@gmail.com',
            name: 'Jane Doe',
            phone: '987654321',
            userType: 1,
            tagLine: 'Manager',
            userImage: '',
            deletedAt: null,
            createdAt: DateTime.now(),
            updatedAt: DateTime.now(),
          )
        ],
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final messages = fetchData();

    return CustumScaffold(
      ontap: () {
        showDialog(
          context: context,
          builder: (context) =>  VacationRequest(),
        );
      },
      body: VStack(
        [ 
          'Vacations'.text
              .color(AppColors.black)
              .textStyle(AppTextStyle.boldText(size: 36))
              .make()
              .pSymmetric(h: 24),
          8.heightBox,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: VacationBody(messages: messages),
          )
        ],
      ),
    );
  }
}
