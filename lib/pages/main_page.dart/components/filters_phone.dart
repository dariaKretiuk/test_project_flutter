import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:test_project_flutter/global/cubits/user_cubit.dart';
import 'package:test_project_flutter/helpers/constans/app_theme.dart';
import 'package:test_project_flutter/helpers/constans/constans.dart';
import 'package:test_project_flutter/widgets/buttons/default_buttons_widget.dart';
import 'package:test_project_flutter/widgets/drop_down/drop_down_field.dart';
import 'package:test_project_flutter/widgets/text_field/search_text_field.dart';

class FiltersPhonesWidget extends StatefulWidget {
  const FiltersPhonesWidget({super.key});

  @override
  State<FiltersPhonesWidget> createState() => _FiltersPhonesWidgetState();
}

class _FiltersPhonesWidgetState extends State<FiltersPhonesWidget> {
  final TextEditingController _searchController = TextEditingController();
  bool isShowVerification = true;
  String selecteTypeMessage = 'SMS';

  @override
  Widget build(BuildContext context) {
    final theme = UIThemes.lightThemeData();
    final userState = UserCubit.watchState(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Container(
        decoration: BoxDecoration(
          color: theme.white,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: theme.pink),
          boxShadow: [
            BoxShadow(
              color: theme.pink,
              blurRadius: 20,
              offset: const Offset(0, 9),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 20, top: 20, right: 20, bottom: 10),
          child: Column(
            children: [
              SearchTextField(
                controller: _searchController,
                placeholder: 'Search...',
                onChange: (value) {},
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  DefaultButtonsWidget(
                    title: 'SMS',
                    backgroundColor: userState.typeMessage == TypeMessage.sms ? theme.lightBlue : theme.blue,
                    onPressed: () {
                      UserCubit.read(context).saveTypeMessage(TypeMessage.sms);
                    },
                    width: MediaQuery.of(context).size.width * 0.25,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  DefaultButtonsWidget(
                    title: 'MMS',
                    backgroundColor: userState.typeMessage == TypeMessage.mms ? theme.lightBlue : theme.blue,
                    onPressed: () {
                      UserCubit.read(context).saveTypeMessage(TypeMessage.mms);
                    },
                    width: MediaQuery.of(context).size.width * 0.25,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  DefaultButtonsWidget(
                    title: 'Voice',
                    backgroundColor: userState.typeMessage == TypeMessage.voice ? theme.lightBlue : theme.blue,
                    onPressed: () {
                      UserCubit.read(context).saveTypeMessage(TypeMessage.voice);
                    },
                    width: MediaQuery.of(context).size.width * 0.25,
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              DropDownField(
                placeholder: 'Choose variant type phone',
                items: groupTypePhoneNumber,
                selecteElement: userState.selecteTypePhone,
                onChange: (value, index) {
                  UserCubit.read(context).saveTypePhone(value);
                },
                isError: false,
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        isShowVerification = !isShowVerification;
                      });
                    },
                    child: SvgPicture.asset(
                      isShowVerification ? 'assets/icons/on_check.svg' : 'assets/icons/off_check.svg',
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Show numbers without verification',
                    style: theme.p1,
                    overflow: TextOverflow.clip,
                    maxLines: 2,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
