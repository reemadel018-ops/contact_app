# 📇 Contact App

## 📖 About the App

**Contact App** is a mobile application built with Flutter that helps users manage their contacts quickly and easily. Users can add a contact with a profile photo, name, email and phone number, see all their contacts in a clean two-column grid, and delete any contact with a single tap.

The app focuses on a smooth and friendly experience: a branded splash screen, a Lottie animation when the list is empty, a bottom sheet with a live preview for adding contacts, and form validation that keeps the data clean. It was developed as part of the **Route Mobile Diploma** 🎓.

---

## 🎬 Demo

> 📹 **[Watch the demo video](https://www.loom.com/share/d9472708c37e4aa4ab3289b224418708)**

---

## ✨ Features

| | Feature | Description |
|---|---|---|
| 🚀 | **Native Splash Screen** | Branded entry with the Route logo, built with `flutter_native_splash`. |
| 🫥 | **Empty State** | A Lottie animation with a friendly "There is No Contacts Added Here" message. |
| ➕ | **Add Contact** | A bottom sheet with a gallery image picker, three input fields and a live preview. |
| ✅ | **Form Validation** | Every field is validated before saving. |
| 🧱 | **Contacts Grid** | Two-column grid with image, name, email, phone and a **Delete** button on every card. |
| 🗑️ | **Delete Last Contact** | A floating button that only appears when the list is not empty. |
| 🔒 | **6 Contacts Limit** | The add button disappears at 6 contacts and comes back after deleting one. |

---

## 🛡️ Validation Rules

| Field | Rule |
|-------|------|
| 👤 **Name** | Must not be empty |
| 📧 **Email** | Must not be empty and must be a valid email format |
| 📞 **Phone** | Must not be empty, 10 to 15 digits, optional leading `+` |

---

## 🎨 Design System

| Color | Hex | Usage |
|-------|-----|-------|
| 🔵 **Dark Blue** | `#29384D` | Backgrounds |
| ⚪ **White** | `#FFFFFF` | Text and icons on red |
| 🩵 **Light Blue** | `#E2F4F6` | Image placeholder |
| 🟡 **Gold** | `#FFF1D4` | Cards, borders and buttons |
| 🔴 **Red** | `#F93E3E` | Delete actions |

---

## 🧰 Tech Stack

- 💙 **Flutter & Dart**
- 🧠 **State management:** `StatefulWidget` with `setState`
- 📦 **Packages:**

| Package | Purpose |
|---------|---------|
| [`lottie`](https://pub.dev/packages/lottie) | 🎞️ Animations |
| [`image_picker`](https://pub.dev/packages/image_picker) | 🖼️ Pick photos from the gallery |
| [`flutter_native_splash`](https://pub.dev/packages/flutter_native_splash) | 💦 Native splash screen |

> ⚠️ Contacts are stored **in memory only**, so they are cleared when the app is closed.

---

## 🗂️ Project Structure

```
lib/
├── main.dart
├── core/
│   ├── routes/
│   │   └── app_routes.dart
│   ├── theme/
│   │   └── app_color.dart
│   └── utils/
│       └── validators.dart
├── models/
│   └── contact_model.dart
├── screens/
│   └── home/
│       ├── home_screen.dart
│       └── widgets/
│           ├── add_contact_sheet.dart
│           ├── contact_card.dart
│           ├── contact_info_row.dart
│           ├── contact_preview_header.dart
│           ├── contacts_grid.dart
│           ├── empty_state.dart
│           ├── home_fabs.dart
│           └── preview_line.dart
└── widgets/
    └── custom_text_field.dart

assets/
├── images/
└── lottie/
```

---

## 🚀 Getting Started

### ✅ Prerequisites

- [Flutter SDK](https://docs.flutter.dev/get-started/install)
- An Android emulator, iOS simulator or a physical device

### ▶️ Run the app

```bash
# 1. Clone the repository
git clone <repository-url>
cd contact_app

# 2. Install dependencies
flutter pub get

# 3. Generate the native splash screen
dart run flutter_native_splash:create

# 4. Run the app
flutter run
```

---

## 👩‍💻 Author

Built with 💙 by a Flutter developer as part of the **Route Mobile Diploma**.
