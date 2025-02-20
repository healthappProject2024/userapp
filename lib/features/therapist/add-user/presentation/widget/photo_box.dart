// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:userapp/features/therapist/add-user/presentation/cubit/pickimag_cubit.dart';
// import 'package:userapp/utils/const/app_colors.dart/my_colors.dart';

// class PhotoBox extends StatelessWidget {
//   const PhotoBox({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<PickimagCubit, PickimagState>(
//       builder: (context, state) {
//         if (state is ImagePicked) {
//           return Container(
//             height: 125.h,
//             width: 100.w,
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(10.0),
//             ),
//             child: Image.file(
//               File(state.imagePath.path),
//               fit: BoxFit.cover,
//             ),
//           );
//         } else if (state is ImageNotPickedState) {
//           return GestureDetector(
//             onTap: () => context.read<PickimagCubit>().pickImage(),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               mainAxisSize: MainAxisSize.min,
//               spacing: 10.h,
//               children: [
//                 _imageBox(context),
//                 Text(
//                   state.message,
//                   style: TextStyle(
//                     color: MyColors.errorColor,
//                   ),
//                 ),
//               ],
//             ),
//           );
//         }
//         return GestureDetector(
//           onTap: () => context.read<PickimagCubit>().pickImage(),
//           child: _imageBox(context),
//         );
//       },
//     );
//   }

//   Widget _imageBox(
//     BuildContext ctx,
//   ) {
//     return Container(
//       height: 125.h,
//       width: 100.w,
//       decoration: BoxDecoration(
//         color: Theme.of(ctx).indicatorColor,
//         borderRadius: BorderRadius.circular(10.0),
//       ),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Icon(
//             Icons.add,
//             color: MyColors.greenColor,
//           ),
//           const SizedBox(height: 8.0),
//           Text(
//             "Add Image",
//             style: TextStyle(color: MyColors.greenColor),
//           ),
//         ],
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:userapp/utils/const/app_colors.dart/my_colors.dart';

class PhotoBox extends StatelessWidget {
  final bool isImagePicked;
  final Widget? child;
  final Function()? onTap;
  const PhotoBox({
    super.key,
    this.isImagePicked = false,
    this.child,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 125.h,
        width: 100.w,
        decoration: BoxDecoration(
          color: Theme.of(context).indicatorColor,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: !isImagePicked
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.add,
                    color: MyColors.greenColor,
                  ),
                  const SizedBox(height: 8.0),
                  Text(
                    "Add Image",
                    style: TextStyle(color: MyColors.greenColor),
                  ),
                ],
              )
            : child,
      ),
    );
  }
}
