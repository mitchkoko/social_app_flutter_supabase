# Social Media App — Flutter + Supabase

> A social media app with authentication, posts, and profiles — powered by Flutter and Supabase as the backend.

![Screenshot](https://github.com/user-attachments/assets/e8810aef-7a68-46f6-a357-fa3718f5e882)

## Features

- Email authentication (login & register) via Supabase Auth
- Create and view posts
- User profiles
- Auth gate — automatic routing based on session state
- Navigation drawer

## Architecture

```
lib/
├── components/      # Shared UI components (drawer)
└── features/
    ├── auth/        # Auth service, login, register, auth gate
    ├── post/        # Post model & service
    └── profile/     # Profile page
```

## Tech Stack

- Flutter & Dart
- [Supabase](https://supabase.com) — auth, database, backend
- [supabase_flutter](https://pub.dev/packages/supabase_flutter) — Flutter SDK

## Getting Started

1. **Clone and install**
   ```bash
   git clone https://github.com/mitchkoko/social_app_flutter_supabase.git
   cd social_app_flutter_supabase
   flutter pub get
   ```

2. **Setup Supabase**
   - Create a project at [supabase.com](https://supabase.com)
   - Add your Supabase URL and anon key in `lib/keys.dart`

3. **Run**
   ```bash
   flutter run
   ```

## License

MIT License - see [LICENSE](LICENSE)

---

Created by [Mitch Koko](https://youtube.com/mitchkoko)
