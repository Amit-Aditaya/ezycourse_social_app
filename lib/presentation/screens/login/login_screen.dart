import 'package:ezy_course/core/theme/app_colors.dart';
import 'package:ezy_course/core/utils/constants/app_images.dart';
import 'package:ezy_course/core/utils/globals/globals.dart';
import 'package:ezy_course/presentation/screens/home/home_screen.dart';
import 'package:ezy_course/presentation/screens/login/state/bloc/login_bloc.dart';
import 'package:ezy_course/presentation/screens/login/state/bloc/login_event.dart';
import 'package:ezy_course/presentation/screens/login/state/bloc/login_state.dart';
import 'package:ezy_course/presentation/widgets/buttons/primary_button.dart';
import 'package:ezy_course/presentation/widgets/textfields/primary_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
            color: Color(AppColors.primaryColor),
            image: DecorationImage(
              image: AssetImage(AppImages.loginScreenCircles),
              repeat: ImageRepeat.repeat,
            )),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: .15.sh,
              ),
              Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(
                          width: 1,
                          color: const Color(AppColors.borderColor)
                              .withOpacity(.5))),
                  padding: const EdgeInsets.all(20),
                  child: const Image(image: AssetImage(AppImages.logo))),
              SizedBox(
                height: .15.sh,
              ),
              _bottomSheet(),
              Container(
                height: .15.sh,
                color: const Color(AppColors.primaryColorDark),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _bottomSheet() {
    return Container(
      decoration: BoxDecoration(
        //   color: Color(AppColors.primaryColorDark),
        boxShadow: [
          BoxShadow(
            color: const Color(AppColors.black).withOpacity(.5),
            blurRadius: 2,
            offset: const Offset(0, -5),
          ),
        ],
        gradient: const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(AppColors.primaryColor),
              Color(AppColors.primaryColorDark)
            ]),
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(40), topRight: Radius.circular(40)),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: .06.sw),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: .025.sh,
            ),
            Center(
              child: Text(
                'Sign In',
                style: TextStyle(
                  color: const Color(AppColors.white),
                  fontSize: 38.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            SizedBox(height: .01.sh),
            Text(
              'Email',
              style: TextStyle(
                color: const Color(AppColors.lightTextColor),
                fontSize: 17.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: .01.sh),

            PrimaryTextField(
              controller: _emailController,
            ),
            SizedBox(height: .025.sh),
            Text(
              'Password',
              style: TextStyle(
                color: const Color(AppColors.lightTextColor),
                fontSize: 17.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: .01.sh),
            PrimaryTextField(
              controller: _passwordController,
            ),
            SizedBox(height: .01.sh),

            Row(
              children: [
                Checkbox(
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  visualDensity: VisualDensity.compact,
                  side: const BorderSide(color: Colors.white),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                  ),
                  value: isChecked,
                  onChanged: (value) {
                    setState(() {
                      isChecked = value!;
                    });
                  },
                  fillColor: MaterialStateProperty.all(Colors.transparent),
                ),
                const Text(
                  'Remember me',
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
            const SizedBox(height: 24),

            // Login Button
            BlocConsumer<LoginBloc, LoginState>(
              listener: (context, state) {
                if (state is LoginSuccess) {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (_) => const HomeScreen()));

                  Globals.token = state.token;
                } else if (state is LoginError) {
                  ScaffoldMessenger.of(context)
                      .showSnackBar(SnackBar(content: Text(state.message)));
                }
              },
              builder: (context, state) {
                return PrimaryButton(
                    onTap: () {
                      BlocProvider.of<LoginBloc>(context).add(LoginSubmitted(
                          email: _emailController.text,
                          password: _passwordController.text));
                    },
                    title: 'Login');
              },
            )
          ],
        ),
      ),
    );
  }
}
