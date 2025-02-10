// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// // Filter State
// class FilterState {
//   final Set<String> readingLevels;
//   final Set<String> languages;
//   final Set<String> categories;

//   FilterState({
//     required this.readingLevels,
//     required this.languages,
//     required this.categories,
//   });
// }

// // Filter Cubit
// class FilterCubit extends Cubit<FilterState> {
//   FilterCubit()
//       : super(FilterState(
//           readingLevels: {},
//           languages: {},
//           categories: {},
//         ));

//   void toggleReadingLevel(String level) {
//     final updatedLevels = Set<String>.from(state.readingLevels);
//     updatedLevels.contains(level)
//         ? updatedLevels.remove(level)
//         : updatedLevels.add(level);
//     emit(FilterState(
//       readingLevels: updatedLevels,
//       languages: state.languages,
//       categories: state.categories,
//     ));
//   }

//   void toggleLanguage(String lang) {
//     final updatedLanguages = Set<String>.from(state.languages);
//     updatedLanguages.contains(lang)
//         ? updatedLanguages.remove(lang)
//         : updatedLanguages.add(lang);
//     emit(FilterState(
//       readingLevels: state.readingLevels,
//       languages: updatedLanguages,
//       categories: state.categories,
//     ));
//   }

//   void toggleCategory(String category) {
//     final updatedCategories = Set<String>.from(state.categories);
//     updatedCategories.contains(category)
//         ? updatedCategories.remove(category)
//         : updatedCategories.add(category);
//     emit(FilterState(
//       readingLevels: state.readingLevels,
//       languages: state.languages,
//       categories: updatedCategories,
//     ));
//   }

//   void clearFilters() {
//     emit(FilterState(readingLevels: {}, languages: {}, categories: {}));
//   }
// }

// // BottomSheet UI
// void showFilterBottomSheet(BuildContext context) {
//   showModalBottomSheet(
//     context: context,
//     isScrollControlled: true,
//     builder: (_) => BlocProvider(
//       create: (_) => FilterCubit(),
//       child: FilterBottomSheetContent(),
//     ),
//   );
// }

// class FilterBottomSheetContent extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(16.0),
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           _buildFilterSection(
//             context,
//             title: "Reading Level",
//             options: ["Beginner", "Intermediate", "Advanced"],
//             onSelected: (value) =>
//                 {}, //context.read<FilterCubit>().toggleReadingLevel(value),
//           ),
//           _buildFilterSection(
//             context,
//             title: "Language",
//             options: ["English", "Spanish", "French"],
//             onSelected: (value) =>
//                 {}, //context.read<FilterCubit>().toggleLanguage(value),
//           ),
//           _buildFilterSection(
//             context,
//             title: "Category",
//             options: ["Fiction", "Science", "History"],
//             onSelected: (value) =>
//                 {}, //context.read<FilterCubit>().toggleCategory(value),
//           ),
//           const SizedBox(height: 16),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               TextButton(
//                 onPressed: () =>
//                     {}, //context.read<FilterCubit>().clearFilters(),
//                 child: const Text("Clear"),
//               ),
//               ElevatedButton(
//                 onPressed: () => Navigator.pop(context),
//                 child: const Text("Apply"),
//               ),
//             ],
//           )
//         ],
//       ),
//     );
//   }

//   Widget _buildFilterSection(
//     BuildContext context, {
//     required String title,
//     required List<String> options,
//     required Function(String) onSelected,
//   }) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(title,
//             style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
//         Wrap(
//           children: options
//               .map((option) => FilterChip(
//                     label: Text(option),
//                     selected: false, // context
//                     // .watch<FilterCubit>()
//                     // .state
//                     // .readingLevels
//                     // .contains(option),
//                     onSelected: (selected) => onSelected(option),
//                   ))
//               .toList(),
//         ),
//         const SizedBox(height: 16),
//       ],
//     );
//   }
// }
