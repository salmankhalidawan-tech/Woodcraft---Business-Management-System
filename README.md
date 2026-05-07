# Woodcraft - Setup Guide

## Prerequisites
- XAMPP or WAMP installed on your computer
- A web browser (Chrome, Firefox, Edge)

---

## Step 1: Copy Project to Server Root

Copy the entire `Usman` folder into your server's web root:

| Server | Web Root Path |
|--------|--------------|
| XAMPP  | `C:\xampp\htdocs\Usman\` |
| WAMP   | `C:\wamp64\www\Usman\` |

---

## Step 2: Start Services

Open **XAMPP Control Panel** (or WAMP) and start:
- ✅ **Apache**
- ✅ **MySQL**

---

## Step 3: Import the Database

1. Open your browser and go to: `http://localhost/phpmyadmin`
2. Click **"New"** in the left sidebar
3. Create a database named: `woodcraft_db`
4. Click the **"Import"** tab
5. Click **"Choose File"** → select `e:\Usman\database.sql`
6. Click **"Go"** (bottom of page)

You should see a success message. The tables will be created with sample data.

---

## Step 4: Configure Database Credentials

Open `api/db.php` and update these lines if needed:

```php
define('DB_USER', 'root');   // Your MySQL username (default: root)
define('DB_PASS', '');       // Your MySQL password (default: empty for XAMPP)
```

---

## Step 5: Open the Application

Go to: **`http://localhost/Usman/login.html`**

### First-Time Setup:
1. Click **"Create admin account"**
2. Register with your name, email, and password
3. You will be redirected to the Login page
4. Login with your credentials
5. You are now inside the Woodcraft dashboard!

---

## How Each Module Works

| Page | What It Does |
|------|-------------|
| **Dashboard** | Live counts of Total Orders, Revenue (Paid), Pending Orders, Low Stock alerts |
| **Orders** | Add orders (auto-creates billing record + deducts inventory), update status, delete |
| **Inventory** | View all materials with Low Stock badges, add new materials |
| **Employees** | View staff cards, add new employees |
| **Billing** | View invoices with totals, generate invoices, update payment status |
| **Reports** | Chart.js charts for revenue overview and orders per month |

---

## Security Features Implemented

- ✅ Passwords hashed with `password_hash()` (bcrypt)
- ✅ Passwords verified with `password_verify()`
- ✅ All dashboard pages protected by session auth guard
- ✅ All inputs sanitized with PDO prepared statements (no SQL injection)
- ✅ Sessions used for login state management
- ✅ Unauthorized API calls return `401 Unauthorized`

---

## Business Logic Rules

- **Adding an Order** → Automatically creates a linked billing record (status: Unpaid)
- **Material Deduction** → Select a material when adding an order to auto-reduce its stock
- **Low Stock** → Materials at or below their threshold get a red "Low Stock" badge
- **Revenue** → Dashboard shows only `Paid` billing amounts as revenue
- **Order Status** → Can be changed: Pending → In Progress → Completed

---

## Troubleshooting

| Problem | Solution |
|---------|---------|
| White page / 500 error | Make sure Apache & MySQL are running in XAMPP |
| "Database connection failed" | Check `api/db.php` credentials match your MySQL setup |
| Redirected to login on every page | Make sure you are accessing via `http://localhost/...` not `file:///...` (PHP sessions need a server) |
| Table stays empty | Open browser DevTools → Network tab → check API response for errors |
