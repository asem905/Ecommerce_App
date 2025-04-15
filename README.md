# **E-Commerce App - Flutter with PHP Backend**  

## **📱 Overview**  
A **full-stack e-commerce mobile application** built with **Flutter (Dart)** for the frontend and **PHP + MySQL** for the backend. The app includes essential e-commerce features like **product listing, search, cart management, favorites, user authentication, and order processing**, along with **localization (multi-language support)** and **state management using GetX**.  

---

## **✨ Features**  

### **🔐 User Authentication**  
- **Login & Registration** (JWT-based authentication)  
- **Password Recovery** (Email verification)  
- **Session Persistence** (Auto-login using SharedPreferences)  

### **🛒 Product Management**  
- **Product Listing** (Fetched from PHP API)  
- **Product Details** (Images, descriptions, pricing, reviews)  
- **Search Engine** (Real-time filtering by keywords)  
- **Categories & Filtering** (Sort by price, popularity, etc.)  

### **🛍️ Cart & Checkout**  
- **Add/Remove from Cart** (Persistent cart using SQL)  
- **Quantity Adjustment** (Increase/decrease items)  
- **Checkout Process** (Shipping details, payment methods)  
- **Order History** (Track past purchases)  

### **❤️ Favorites (Wishlist)**  
- **Save favorite products** (Stored in backend)  
- **Sync across devices** (User account-based)  

### **🌍 Localization (Multi-language Support)**  
- Supports **English & Arabic** (RTL layout switching)  
- Easy to add more languages using **JSON files**  

### **⚡ State Management (GetX)**  
- **Reactive state updates** (No `setState` needed)  
- **Dependency Injection** (Clean architecture)  
- **Route management** (Navigation without `context`)  

### **🔌 Backend (PHP + MySQL + Firebase)**  
- **RESTful API** (Handles all frontend requests)  
- **JWT Authentication** (Secure user sessions)  
- **SQL Database** (Stores users, products, orders)  
- **Image Upload/Retrieval** (Product images stored on server)
- **Push Notifications**

---

## **🛠️ Technical Implementation**  

### **📱 Frontend (Flutter)**  
- **UI/UX**: Clean, responsive design with **Material 3**  
- **HTTP Requests**: **Dio** for API calls  
- **State Management**: **GetX** (Controllers for cart, favorites, auth)  
- **Localization**: **GetX Internationalization**  
- **Storage**: **SharedPreferences** (Session persistence)  
- **Payment Integration**: **Stripe/PayPal (optional)**  

### **💻 Backend (PHP + MySQL)**  
- **API Endpoints**:  
  - `/auth/login` (User login)  
  - `/auth/register` (User registration)  
  - `/products` (Fetch all products)  
  - `/search?q=keyword` (Search products)  
  - `/cart/add` (Add to cart)  
  - `/wishlist/add` (Add to favorites)  
  - `/orders/create` (Place an order)  
- **Database Schema**:  
  - `users` (id, name, email, password, token)  
  - `products` (id, name, price, description, image_url)  
  - `cart` (user_id, product_id, quantity)  
  - `orders` (user_id, products, total_price, status)  

---

## **📸 Screenshots (Add Your Images Here)**  

### **Login & Registration**  
[![Login Screen](ADD_IMAGE_LINK)]  
[![Registration Screen](ADD_IMAGE_LINK)]  

### **Home & Product Listing**  
[![Home Screen](ADD_IMAGE_LINK)]  
[![Product Details](ADD_IMAGE_LINK)]  

### **Search & Filters**  
[![Search Functionality](ADD_IMAGE_LINK)]  
[![Category Filter](ADD_IMAGE_LINK)]  

### **Cart & Checkout**  
[![Cart Screen](ADD_IMAGE_LINK)]  
[![Checkout Process](ADD_IMAGE_LINK)]  

### **Favorites & Orders**  
[![Wishlist](ADD_IMAGE_LINK)]  
[![Order History](ADD_IMAGE_LINK)]  

---

## **🚀 How to Run the Project?**  

### **Frontend (Flutter)**  
1. Clone the repo  
2. Run `flutter pub get`  
3. Update API base URL in `lib/core/api_endpoints.dart`  
4. Run `flutter run`  

### **Backend (PHP)**  
1. Set up a **PHP server** (XAMPP/WAMP/LAMP)  
2. Import the **SQL database** (`ecommerce_db.sql`)  
3. Configure database credentials in `api/config.php`  
4. Access APIs via `http://localhost/api/`  

---

## **🔮 Future Improvements**  
- **Dark Mode** (Theme switching)  
- **Advanced Analytics** (User behavior tracking)  
- **Admin Dashboard** (Manage products/orders)  

---

## **📜 License**  
This project is open-source under the **MIT License**.  

---

### **💡 Need Help?**  
Feel free to **open an issue** or **contact me** at [asemosamyy@example.com].  

