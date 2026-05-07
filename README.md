# 🪵 Woodcraft — Business Management System

A full-stack web application for managing a woodcraft/carpentry business. Built with **HTML, CSS, JavaScript** (frontend) and **PHP + MySQL** (backend), it covers everything from orders and inventory to employee management and billing — all behind a secure login system.

---

## 📸 Features

| Module | Description |
|--------|-------------|
| **Dashboard** | Live stats — Total Orders, Revenue (Paid only), Pending Orders, Low Stock alerts |
| **Orders** | Create orders, auto-generate billing records, update status, delete orders |
| **Inventory** | Track raw materials, Low Stock badge alerts, add new materials |
| **Employees** | View staff cards, add new employees with roles and working hours |
| **Billing** | View invoices, update payment status (Paid / Unpaid / Partial) |
| **Reports** | Chart.js visualizations — Revenue Overview & Orders per Month |

---

## 🛠️ Tech Stack

- **Frontend:** HTML5, CSS3, JavaScript (Vanilla), Bootstrap 5, Chart.js, FontAwesome
- **Backend:** PHP 8+ (REST API)
- **Database:** MySQL (via PDO)
- **Local Server:** XAMPP / WAMP

---

## 🔐 Security

- Passwords hashed with `password_hash()` (bcrypt)
- All inputs protected with PDO prepared statements (no SQL injection)
- Session-based authentication with auth guards on all dashboard pages
- Unauthorized API calls return `401 Unauthorized`

---

## ⚙️ Prerequisites

Before running this project, make sure you have:

- [XAMPP](https://www.apachefriends.org/) or [WAMP](https://www.wampserver.com/) installed
- A modern web browser (Chrome, Firefox, Edge)
- PHP 8.0 or higher
- MySQL 5.7 or higher

---

## 🚀 Getting Started

### Step 1 — Copy Project to Server Root

Copy the entire project folder into your local server's web root:

| Server | Path |
|--------|------|
| XAMPP  | `C:\xampp\htdocs\Salman\` |
| WAMP   | `C:\wamp64\www\Salman\` |

### Step 2 — Start Your Local Server

Open **XAMPP Control Panel** (or WAMP) and start both services:
- ✅ **Apache**
- ✅ **MySQL**

### Step 3 — Import the Database

1. Open your browser and navigate to: `http://localhost/phpmyadmin`
2. Click **"New"** in the left sidebar
3. Create a database named exactly: `woodcraft_db`
4. Click the **"Import"** tab
5. Click **"Choose File"** → select `database.sql` from the project folder
6. Click **"Go"** at the bottom of the page

You should see a success message. The tables will be created and seeded with sample data.

### Step 4 — Configure Database Credentials (if needed)

Open `api/db.php` and update the credentials if your MySQL setup differs from the defaults:

```php
define('DB_USER', 'root');   // Your MySQL username (default: root)
define('DB_PASS', '');       // Your MySQL password (default: empty for XAMPP)
```

### Step 5 — Open the Application

Go to: **`http://localhost/Salman/login.html`**

#### First-Time Setup:
1. Click **"Create admin account"**
2. Register with your name, email, and password
3. You'll be redirected to the Login page
4. Log in with your credentials
5. You're now inside the Woodcraft dashboard 🎉

---

## 📁 Project Structure

```
Salman/
├── api/
│   ├── auth.php          # Register, login, logout, session check
│   ├── billing.php       # Billing CRUD API
│   ├── dashboard.php     # Dashboard stats API
│   ├── db.php            # PDO database connection + helpers
│   ├── employees.php     # Employees CRUD API
│   ├── inventory.php     # Inventory CRUD API
│   └── orders.php        # Orders CRUD API
├── css/
│   └── style.css         # Custom styles
├── js/
│   └── script.js         # All frontend logic
├── index.html            # Dashboard page
├── orders.html           # Orders management
├── inventory.html        # Inventory management
├── employees.html        # Employee management
├── billing.html          # Billing & invoices
├── reports.html          # Charts & reports
├── login.html            # Login page
├── register.html         # Admin registration
└── database.sql          # Database schema + seed data
```

---

## 💡 Business Logic

- **Adding an Order** → Automatically creates a linked billing record (status: Unpaid)
- **Material Deduction** → Select a material when adding an order to auto-reduce its stock quantity
- **Low Stock Alert** → Materials at or below their threshold get a red "Low Stock" badge
- **Revenue Calculation** → Dashboard shows only `Paid` billing amounts as revenue
- **Order Status Flow** → Pending → In Progress → Completed

---

## 🧯 Troubleshooting

| Problem | Solution |
|---------|----------|
| White page / 500 error | Make sure Apache & MySQL are running in XAMPP/WAMP |
| "Database connection failed" | Check `api/db.php` — credentials must match your MySQL setup |
| Redirected to login on every page | Access via `http://localhost/...` not `file:///...` — PHP sessions require a server |
| Table stays empty after actions | Open DevTools → Network tab → check the API response for error messages |
| phpMyAdmin not opening | Make sure port 80 isn't blocked by another app (e.g. Skype, IIS) |

---

## 📄 License

This project is for educational purposes.

---

> Built with ❤️ by Salman
# 🪵 Woodcraft — Business Management System

A full-stack web application for managing a woodcraft/carpentry business. Built with **HTML, CSS, JavaScript** (frontend) and **PHP + MySQL** (backend), it covers everything from orders and inventory to employee management and billing — all behind a secure login system.

---

## 📸 Features

| Module | Description |
|--------|-------------|
| **Dashboard** | Live stats — Total Orders, Revenue (Paid only), Pending Orders, Low Stock alerts |
| **Orders** | Create orders, auto-generate billing records, update status, delete orders |
| **Inventory** | Track raw materials, Low Stock badge alerts, add new materials |
| **Employees** | View staff cards, add new employees with roles and working hours |
| **Billing** | View invoices, update payment status (Paid / Unpaid / Partial) |
| **Reports** | Chart.js visualizations — Revenue Overview & Orders per Month |

---

## 🛠️ Tech Stack

- **Frontend:** HTML5, CSS3, JavaScript (Vanilla), Bootstrap 5, Chart.js, FontAwesome
- **Backend:** PHP 8+ (REST API)
- **Database:** MySQL (via PDO)
- **Local Server:** XAMPP / WAMP

---

## 🔐 Security

- Passwords hashed with `password_hash()` (bcrypt)
- All inputs protected with PDO prepared statements (no SQL injection)
- Session-based authentication with auth guards on all dashboard pages
- Unauthorized API calls return `401 Unauthorized`

---

## ⚙️ Prerequisites

Before running this project, make sure you have:

- [XAMPP](https://www.apachefriends.org/) or [WAMP](https://www.wampserver.com/) installed
- A modern web browser (Chrome, Firefox, Edge)
- PHP 8.0 or higher
- MySQL 5.7 or higher

---

## 🚀 Getting Started

### Step 1 — Copy Project to Server Root

Copy the entire project folder into your local server's web root:

| Server | Path |
|--------|------|
| XAMPP  | `C:\xampp\htdocs\Salman\` |
| WAMP   | `C:\wamp64\www\Salman\` |

### Step 2 — Start Your Local Server

Open **XAMPP Control Panel** (or WAMP) and start both services:
- ✅ **Apache**
- ✅ **MySQL**

### Step 3 — Import the Database

1. Open your browser and navigate to: `http://localhost/phpmyadmin`
2. Click **"New"** in the left sidebar
3. Create a database named exactly: `woodcraft_db`
4. Click the **"Import"** tab
5. Click **"Choose File"** → select `database.sql` from the project folder
6. Click **"Go"** at the bottom of the page

You should see a success message. The tables will be created and seeded with sample data.

### Step 4 — Configure Database Credentials (if needed)

Open `api/db.php` and update the credentials if your MySQL setup differs from the defaults:

```php
define('DB_USER', 'root');   // Your MySQL username (default: root)
define('DB_PASS', '');       // Your MySQL password (default: empty for XAMPP)
```

### Step 5 — Open the Application

Go to: **`http://localhost/Salman/login.html`**

#### First-Time Setup:
1. Click **"Create admin account"**
2. Register with your name, email, and password
3. You'll be redirected to the Login page
4. Log in with your credentials
5. You're now inside the Woodcraft dashboard 🎉

---

## 📁 Project Structure

```
Salman/
├── api/
│   ├── auth.php          # Register, login, logout, session check
│   ├── billing.php       # Billing CRUD API
│   ├── dashboard.php     # Dashboard stats API
│   ├── db.php            # PDO database connection + helpers
│   ├── employees.php     # Employees CRUD API
│   ├── inventory.php     # Inventory CRUD API
│   └── orders.php        # Orders CRUD API
├── css/
│   └── style.css         # Custom styles
├── js/
│   └── script.js         # All frontend logic
├── index.html            # Dashboard page
├── orders.html           # Orders management
├── inventory.html        # Inventory management
├── employees.html        # Employee management
├── billing.html          # Billing & invoices
├── reports.html          # Charts & reports
├── login.html            # Login page
├── register.html         # Admin registration
└── database.sql          # Database schema + seed data
```

---

## 💡 Business Logic

- **Adding an Order** → Automatically creates a linked billing record (status: Unpaid)
- **Material Deduction** → Select a material when adding an order to auto-reduce its stock quantity
- **Low Stock Alert** → Materials at or below their threshold get a red "Low Stock" badge
- **Revenue Calculation** → Dashboard shows only `Paid` billing amounts as revenue
- **Order Status Flow** → Pending → In Progress → Completed

---

## 🧯 Troubleshooting

| Problem | Solution |
|---------|----------|
| White page / 500 error | Make sure Apache & MySQL are running in XAMPP/WAMP |
| "Database connection failed" | Check `api/db.php` — credentials must match your MySQL setup |
| Redirected to login on every page | Access via `http://localhost/...` not `file:///...` — PHP sessions require a server |
| Table stays empty after actions | Open DevTools → Network tab → check the API response for error messages |
| phpMyAdmin not opening | Make sure port 80 isn't blocked by another app (e.g. Skype, IIS) |

---

## 📄 License

This project is for educational purposes.

---

> Built with ❤️ by Salman

