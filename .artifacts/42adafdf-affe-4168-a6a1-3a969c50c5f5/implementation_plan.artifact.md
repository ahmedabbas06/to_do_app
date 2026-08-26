# Theme Fix Implementation Plan

The goal is to fix the theme switching issue by ensuring that the same `ThemeController` instance is used throughout the application, specifically focusing on passing the existing controller instead of creating new instances.

## User Review Required

> [!IMPORTANT]
> I will be modifying `lib/screens/home_screen.dart` even though it wasn't in the primary list, because it is the source of the navigation to `SettingScreen`. Without fixing the navigation in `HomeScreen`, the changes in `SettingScreen` will not work as it will continue to receive a new/incorrect `ThemeController`.

## Proposed Changes

### [Screens]

#### [MODIFY] [setting_screen.dart](file:///E:/Study/course%20Flutter%20Eraasoft/to_do_app/lib/screens/setting_screens/setting_screen.dart)
- Update `Navigator` calls for `ProfileScreen` and `ThemeScreen` to use `widget.theme` instead of `ThemeController()`.

#### [MODIFY] [home_screen.dart](file:///E:/Study/course%20Flutter%20Eraasoft/to_do_app/lib/screens/home_screen.dart)
- Update `Navigator` calls for `DoneTasks` and `SettingScreen` to use `widget.theme` instead of `ThemeController()`.

## Verification Plan

### Automated Tests
- Not applicable (no existing tests, user requested to stay within current style).

### Manual Verification
1. Open the app.
2. Go to **Settings** -> **Theme**.
3. Select **Dark Theme**.
4. Click **Save Editing**.
5. Verify that the entire app switches to Dark Mode immediately.
6. Repeat for **Light Theme**.
7. Check **Profile** and **Done Tasks** to ensure they still work and use the correct theme if applicable.
