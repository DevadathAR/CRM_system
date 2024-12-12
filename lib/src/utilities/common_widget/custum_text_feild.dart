// import 'package:crm_system/src/utilities/provider/textfeild_provider.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:provider/provider.dart';
// import 'package:crm_system/src/utilities/colors.dart';
// import 'package:crm_system/src/utilities/text_style.dart';
// import 'package:velocity_x/velocity_x.dart';

// class TextInputField extends StatelessWidget {
//   final TextEditingController? controller;
//   final String? hintText;
//   final String? labelText;
//   final bool obscureText;
//   final TextInputType? keyboardType;
//   final ValueChanged<String>? onChanged;
//   final bool isDropDown;
//   final bool viewIcon;
//   final bool isSearch;
//   final bool isPrefix;
//   final bool isBorder;
//   final int maxlines;
//   final double height;
//   final String? iconName;
//   final String? viewprefix;
//   final List<String>? dropDownOptions;
//   final VoidCallback? ontap;

//   const TextInputField({
//     super.key,
//     this.controller,
//     this.hintText,
//     this.labelText,
//     this.obscureText = false,
//     this.viewIcon = false,
//     this.keyboardType,
//     this.iconName,
//     this.onChanged,
//     this.isDropDown = false,
//     this.dropDownOptions,
//     this.isSearch = false,
//     this.isPrefix = false,
//     this.isBorder = true,
//     this.viewprefix,
//     this.maxlines = 1,
//     this.height = 50,
//     this.ontap,
//   });

//   @override
//   Widget build(BuildContext context) {
//     final provider = Provider.of<FormStateNotifier>(context);

//     if (isDropDown) {
//       return SizedBox(
//         height: height,
//         child: DropdownButtonFormField<String>(
//           icon: Icon(
//             Icons.keyboard_arrow_down_rounded,
//             color: AppColors.textGrey1,
//           ),
//           decoration: InputDecoration(
//             prefixIcon: isPrefix
//                 ? Padding(
//                     padding: const EdgeInsets.all(12.0),
//                     child: SvgPicture.asset(
//                       viewprefix.toString(),
//                       colorFilter: ColorFilter.mode(
//                           AppColors.textGrey1, BlendMode.srcIn),
//                     ),
//                   )
//                 : null,
//             filled: true,
//             fillColor: AppColors.white,
//             labelText: labelText,
//             labelStyle:
//                 AppTextStyle.mediumText(size: 14, color: AppColors.textGrey1),
//             enabledBorder: isBorder
//                 ? OutlineInputBorder(
//                     borderRadius: const BorderRadius.all(Radius.circular(14)),
//                     borderSide: BorderSide(color: AppColors.borderGrey),
//                   )
//                 : InputBorder.none,
//             focusedBorder: isBorder
//                 ? OutlineInputBorder(
//                     borderRadius: const BorderRadius.all(Radius.circular(14)),
//                     borderSide: BorderSide(color: AppColors.borderGrey),
//                   )
//                 : InputBorder.none,
//             border: isBorder
//                 ? OutlineInputBorder(
//                     borderRadius: const BorderRadius.all(Radius.circular(14)),
//                     borderSide: BorderSide(color: AppColors.borderGrey),
//                   )
//                 : InputBorder.none,
//           ),
//           value: provider.selectedValue ?? dropDownOptions?.first,
//           onChanged: (value) {
//             provider.setSelectedValue(value);
//             if (onChanged != null && value != null) {
//               onChanged!(value);
//             }
//           },
//           items: dropDownOptions
//               ?.map((option) => DropdownMenuItem(
//                     value: option,
//                     child: Text(
//                       option,
//                       style: AppTextStyle.mediumText(
//                           size: 14, color: AppColors.textGrey1),
//                     ),
//                   ))
//               .toList(),
//         ),
//       );
//     } else {
//       return SizedBox(
//         height: height,
//         child: TextFormField(
//           maxLines: maxlines,
//           controller: controller,
//           obscureText: obscureText ? provider.isObscured : false,
//           keyboardType: keyboardType,
//           onChanged: onChanged,
//           decoration: InputDecoration(
//             labelText: labelText,
//             labelStyle:
//                 AppTextStyle.mediumText(size: 14, color: AppColors.textGrey1),
//             hintText: hintText,
//             hintStyle:
//                 AppTextStyle.regularText(size: 14, color: AppColors.textGrey1),
//             enabledBorder: OutlineInputBorder(
//               borderRadius: const BorderRadius.all(Radius.circular(14)),
//               borderSide: BorderSide(color: AppColors.borderGrey),
//             ),
//             border: OutlineInputBorder(
//                 borderRadius: const BorderRadius.all(Radius.circular(14)),
//                 borderSide: BorderSide(color: AppColors.borderGrey)),
//             prefixIcon: isSearch
//                 ? Padding(
//                     padding: const EdgeInsets.all(12.0),
//                     child: SvgPicture.asset(
//                       "assets/icons/search_icon.svg", // Replace with your path
//                       colorFilter: ColorFilter.mode(
//                           AppColors.textGrey1, BlendMode.srcIn),
//                     ),
//                   )
//                 : null,
//             suffixIcon: obscureText
//                 ? IconButton(
//                     icon: Icon(
//                       provider.isObscured
//                           ? Icons.visibility_off_outlined
//                           : Icons.visibility_outlined,
//                       color: AppColors.textGrey1,
//                     ),
//                     onPressed: provider.togglePasswordVisibility,
//                   )
//                 : viewIcon
//                     ? Padding(
//                         padding: const EdgeInsets.all(12.0),
//                         child: InkWell(
//                           onTap: ontap,
//                           child: SvgPicture.asset(
//                             iconName.toString(),
//                             colorFilter: ColorFilter.mode(
//                                 AppColors.textGrey1, BlendMode.srcIn),
//                           ),
//                         ),
//                       )
//                     : null,
//           ),
//         ),
//       );
//     }
//   }
// }

// // countryCode feild

// class CountryCodeField extends StatelessWidget {
//   final List<String> countryCodes;

//   const CountryCodeField({
//     super.key,
//     required this.countryCodes,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Consumer<FormStateNotifier>(
//       builder: (context, formState, _) {
//         return SizedBox(
//           height: 48,
//           child: DropdownButtonFormField<String>(
//             value: formState.selectedCode.isEmpty
//                 ? countryCodes.first
//                 : formState.selectedCode,
//             decoration: InputDecoration(
//               contentPadding: const EdgeInsets.only(left: 10),
//               enabledBorder: OutlineInputBorder(
//                 borderRadius: const BorderRadius.all(Radius.circular(14)),
//                 borderSide: BorderSide(color: AppColors.borderGrey),
//               ),
//               border: OutlineInputBorder(
//                   borderRadius: const BorderRadius.all(Radius.circular(14)),
//                   borderSide: BorderSide(color: AppColors.borderGrey)),
//               labelStyle:
//                   AppTextStyle.mediumText(size: 14, color: AppColors.textGrey1),
//             ),
//             items: countryCodes.map((code) {
//               return DropdownMenuItem<String>(
//                 value: code,
//                 child: Text(
//                   code,
//                   style:
//                       AppTextStyle.mediumText(size: 14, color: AppColors.black),
//                 ),
//               );
//             }).toList(),
//             onChanged: (value) {
//               if (value != null) {
//                 formState.selectedCode = value;
//               }
//             },
//           ),
//         );
//       },
//     );
//   }
// }

// // Phone Number feild
// class PhoneNumberField extends StatelessWidget {
//   final TextEditingController? controller;
//   final String? hintText;

//   const PhoneNumberField({
//     super.key,
//     this.controller,
//     this.hintText,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Consumer<FormStateNotifier>(
//       builder: (context, formState, _) {
//         return SizedBox(
//           height: 50,
//           child: TextFormField(
//             controller: controller,
//             keyboardType: TextInputType.phone,
//             onChanged: (value) {
//               formState.phoneNumber = value;
//             },
//             decoration: InputDecoration(
//               hintText: hintText ?? "Enter phone number",
//               hintStyle:
//                   AppTextStyle.mediumText(size: 14, color: AppColors.textGrey1),
//               enabledBorder: OutlineInputBorder(
//                 borderRadius: const BorderRadius.all(Radius.circular(14)),
//                 borderSide: BorderSide(color: AppColors.borderGrey),
//               ),
//             ),
//           ),
//         );
//       },
//     );
//   }
// }


// // OtP code code 


// class SMSCodeInput extends StatelessWidget {
//   final ValueChanged<String>? onCodeEntered;

//   const SMSCodeInput({Key? key, this.onCodeEntered}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Consumer<FormStateNotifier>(
//       builder: (context, provider, _) {
//         return Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: List.generate(4, (index) {
//             return Flexible(
//               child: TextField(
//                 controller: provider.controllers[index],
//                 focusNode: provider.focusNodes[index],
//                 keyboardType: TextInputType.number,
//                 textAlign: TextAlign.center,
//                 maxLength: 1,
//                 style: AppTextStyle.regularText(
//                   size: 14,
//                   color: AppColors.textGrey1,
//                 ),
//                 decoration: InputDecoration(
//                   counterText: '', // Hides the character counter
//                   enabledBorder: OutlineInputBorder(
//                     borderRadius: const BorderRadius.all(Radius.circular(14)),
//                     borderSide: BorderSide(color: AppColors.borderGrey),
//                   ),
//                   border: OutlineInputBorder(
//                     borderRadius: const BorderRadius.all(Radius.circular(14)),
//                     borderSide: BorderSide(color: AppColors.borderGrey),
//                   ),
//                 ),
//                 onChanged: (value) {
//                   if (value.isNotEmpty) {
//                     provider.nextField(context, index, value);
//                   } else {
//                     provider.previousField(context, index, value);
//                   }
//                   provider.onDigitChanged(onCodeEntered);
//                 },
//               ).pSymmetric(h: 4),
//             );
//           }),
//         );
//       },
//     );
//   }
// }
