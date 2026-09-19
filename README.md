# Tasker — Tasks for Today Management System

[![Framework](https://img.shields.io/badge/Framework-CodeIgniter%204-EF4444?style=flat-square&logo=codeigniter&logoColor=white)](https://codeigniter.com/)
[![PHP](https://img.shields.io/badge/PHP-8.2%2B-777BB4?style=flat-square&logo=php&logoColor=white)](https://www.php.net/)
[![Database](https://img.shields.io/badge/Database-MySQL-4479A1?style=flat-square&logo=mysql&logoColor=white)](https://www.mysql.com/)
[![License](https://img.shields.io/badge/License-MIT-blue?style=flat-square)](LICENSE)

**Tasker** is a lightweight, full-stack personal task management web application built with **CodeIgniter 4** and **MySQL**. Developed as part of **IT0049 (Technical Summative Assessment 1 — TSA1)**, it demonstrates MVC design architecture, database integration via models, dynamic view rendering, and responsive styling.

---

## Features

- **Today's Tasks Dashboard (`/`)**: Dynamically fetches and displays tasks scheduled specifically for the current date (`task_date = CURDATE()`), giving users an immediate overview of their daily agenda.
- **Complete Tasks Directory (`/tasks`)**: Lists all tasks chronologically across past, present, and future dates with their completion statuses (`pending` or `completed`).
- **User Profile (`/profile`)**: Displays user account details (User ID, username, full name, email, and member registration date) pulled directly from the database.
- **About Page (`/about`)**: Application background and developer credits.
- **Responsive Interface**: Custom styling with clean typography and layout adaptable to desktop and mobile displays.

---

## Technology Stack

| Layer | Technology | Description |
| :--- | :--- | :--- |
| **Backend** | [CodeIgniter 4](https://codeigniter.com/) (PHP 8.2+) | Lightweight MVC framework with active record query builder |
| **Database** | MySQL / MariaDB | Relational database management |
| **Frontend** | HTML5, CSS3, JavaScript | Custom responsive layout and styling (`public/style.css`) |
| **Tooling** | Composer, Spark CLI, Git | Dependency management, development server, and version control |

---

## Project Structure

```text
Tasker/
├── app/
│   ├── Config/              # App, Database, Routes, and Session configuration
│   ├── Controllers/         # Application controllers
│   │   ├── About.php        # About page controller
│   │   ├── BaseController.php
│   │   ├── Profile.php      # User profile controller (queries UserModel)
│   │   ├── Tasks.php        # All tasks controller (queries TaskModel)
│   │   └── Welcome.php      # Dashboard controller (today's tasks)
│   ├── Models/              # Data models interacting with MySQL
│   │   ├── TaskModel.php    # Tasks database interaction
│   │   └── UserModel.php    # Users database interaction
│   └── Views/               # UI presentation layer
│       ├── about.php        # About view
│       ├── profile.php      # Profile view
│       ├── tasks.php        # All tasks view
│       └── welcome.php      # Welcome / Today's tasks view
├── public/                  # Web server document root
│   ├── index.php            # Front controller
│   ├── style.css            # Stylesheet
│   └── .htaccess            # Apache rewrite rules
├── writable/                # Cache, logs, and session storage
├── env.example              # Template for environment configuration
├── env.infinityfree         # Pre-configured template for shared hosting
├── tasker.sql               # Database schema and seed data
└── index.php                # Root entry point redirect for shared hosting
```

---

## Database Schema

The database consists of two primary tables (`tasker.sql`):

### 1. `users` Table
Stores registered user credentials and profile details:
| Column | Type | Attributes | Description |
| :--- | :--- | :--- | :--- |
| `id` | `INT` | Primary Key, Auto Increment | Unique user identifier |
| `username` | `VARCHAR(50)` | Unique, Not Null | Account username |
| `full_name` | `VARCHAR(100)` | Not Null | Full legal or display name |
| `email` | `VARCHAR(100)` | Not Null | User contact email |
| `created_at` | `DATETIME` | Not Null | Registration timestamp |

### 2. `tasks` Table
Stores task items and deadlines:
| Column | Type | Attributes | Description |
| :--- | :--- | :--- | :--- |
| `id` | `INT` | Primary Key, Auto Increment | Unique task identifier |
| `title` | `VARCHAR(150)` | Not Null | Task title / description |
| `status` | `VARCHAR(20)` | Default `'pending'` | Current status (`pending` / `completed`) |
| `task_date` | `DATE` | Not Null | Scheduled execution date |
| `created_at` | `DATETIME` | Not Null | Creation timestamp |

---

## Installation & Setup

### Prerequisites
- **PHP 8.2** or higher (with `intl`, `mbstring`, and `mysqli` extensions enabled)
- **MySQL** or **MariaDB** (via XAMPP, MAMP, or standalone)
- **Composer** (optional for dependency updates)

### Local Setup (XAMPP)

1. **Clone the repository**:
   ```bash
   git clone https://github.com/aniciete/tsa1tasker.git Tasker
   cd Tasker
   ```

2. **Configure Environment Variables**:
   Copy the example environment configuration:
   ```bash
   cp env.example .env
   ```
   Open `.env` and verify your local settings:
   ```ini
   CI_ENVIRONMENT = development

   app.baseURL = 'http://localhost/Tasker/public/'

   database.default.hostname = 127.0.0.1
   database.default.database = tasker
   database.default.username = root
   database.default.password = 
   database.default.DBDriver = MySQLi
   database.default.port = 3306
   ```

3. **Import Database Schema & Data**:
   - Open **phpMyAdmin** (`http://localhost/phpmyadmin/`).
   - Create a database named `tasker`.
   - Import [`tasker.sql`](tasker.sql) into the `tasker` database.

4. **Run the Application**:
   - If using XAMPP Apache, place the directory inside `htdocs` and visit:
     ```text
     http://localhost/Tasker/public/
     ```
   - Alternatively, start the built-in development server using Spark:
     ```bash
     php spark serve
     ```
     Access the application at `http://localhost:8080`.

---

## Routes Reference

| Route | Controller & Method | Description |
| :--- | :--- | :--- |
| `/` | `App\Controllers\Welcome::index` | Dashboard showing today's tasks |
| `/tasks` | `App\Controllers\Tasks::index` | Complete list of all recorded tasks |
| `/profile` | `App\Controllers\Profile::index` | Current user profile information |
| `/about` | `App\Controllers\About::index` | Application description and credits |

---

## Deployment (Shared Hosting / InfinityFree)

When deploying to shared hosting platforms such as InfinityFree:
1. **Import Database**: In phpMyAdmin on your hosting account, select your assigned database (e.g. `if0_xxxx_tasker`) and import [`tasker.sql`](tasker.sql).
2. **Environment File**: Rename `env.infinityfree` to `.env` in the server root and update your database hostname (`sqlXXX.infinityfree.com`), username, and vPanel password.
3. **Writable Directory**: Ensure `writable/` contains `cache/`, `logs/`, and `session/` directories with `755` permissions.
4. **Clean URLs**: The root `index.php` and `.htaccess` automatically forward domain root visitors to the `public/` front controller.

---

## Author

- **Charles Lawrence Aniciete**
- Course: IT0049 — Technical Summative Assessment 1 (TSA1)
- GitHub: [@aniciete](https://github.com/aniciete)

---

## License

This project is licensed under the [MIT License](LICENSE).
