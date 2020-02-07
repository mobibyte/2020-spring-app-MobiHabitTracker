# mobi_habit_tracker

> We're still developing this repo! Remember to 'git pull' before the workshop starts for new updates.

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

# Flutter Workshop

1. Clean up main.dart
2. Setup Models, Views, Widgets folders
3. Create base Home() widget
	1. Link main.dart to Home
4. Home()
	1. Setup scaffold
	2. Setup Floating Action Button
	3. Make the body of scaffold a ListView with dummy text
5. Habit()
	1. Create basic model (just name)
	2. Export model via index.dart
6. Home()
	1. Create 3 dummy Habits
	2. Map through dummy habits to create simple Text widgets
	3. Populate list view with dummy text widgets
7. HabitView() widget
	1. Setup basic view to display habit (hardcode icon)
8. Home()
	1. Map the dummy habits into HabitView instead of Text
	2. Populate list view with HabitView widgets
9. HabitList() widget
	1. Duplicate map from Home
	2. Create ListView
10. Home()
	1. Change ListView to use HabitList()
11. HabitCreator() view
	1. Create init state with single Habit
	2. Create new scaffold with column as body
12. Home()
	1. Link HabitCreator to floating action button
13. HabitCreator()
	1. Implement Column’s children with blank setStates
14. Home()
	1. Create addHabit function
	2. Pass addHabit to HabitCreator
15. HabitCreator()
	1. Link addHabit
16. Shared Preferences
	1. Google it
	2. Install in pub spec
	3. create template setHabits function
	4. create template retrieveHabits function
	5. add initState
17. Diagram how json works on whiteboard
18. Habit()
	1. create toJson() function
	2. create fromJson() function
19. Home()
	1. Flesh out setHabits, retrieveHabits
	2. Call setHabits from addHabit function
20. Habit()
	1. Add Icon to model
21. HabitCreator()
	1. Make Icon selectable
22. Demonstrate how it doesn’t serialize properly
23. Habit()
	1. Create iconFromString and iconToString functions
24. Home()
	1. Fix retrieveHabit so it works with Icons
25. Test if habits are cached properly now after creating them
26. HabitView
	1. Wrap in dismissible
	2. Copy styling
27. Home()
	1. Create removeHabit function
	2. Pass as onDeleted to HabitList
28. HabitList()
	1. Pass onDeleted to HabitView
29. HabitView()
	1. call onDeleted in onDismissed
30. Home()
	1. Create completeHabit function
	2. Pass as onCompleted to HabitList
31. HabitList
	1. Pass onCompleted to HabitView
32. HabitView()
	1. Wrap container with GestureDetector
	2. call onCompleted in onLongPress if not completed already
33. Fully test!
#mobi/workshops
