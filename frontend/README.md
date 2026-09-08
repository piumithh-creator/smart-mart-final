# SmartMart Frontend

A modern, responsive supermarket e-commerce frontend for the SmartMart Spring Boot backend.

## Features

### User Features
- **Authentication**: Login and register with JWT-based authentication
- **Product Browsing**: View products with search and category filters
- **Product Details**: View product details and customer reviews
- **Shopping Cart**: Add items to cart, update quantities, remove items
- **Checkout**: Complete purchases with address selection
- **Order History**: View and track past orders
- **Profile Management**: Update profile and manage addresses

### Admin Features
- **Dashboard**: View statistics and low-stock alerts
- **Product Management**: Create, read, update, delete products
- **Category Management**: Manage product categories
- **Supplier Management**: Manage suppliers
- **Customer Management**: View customer data
- **Order Management**: View and manage orders
- **Inventory Management**: Monitor stock levels

## Project Structure

```
frontend/
├── css/
│   └── style.css          # Main stylesheet
├── js/
│   ├── api.js             # REST API client
│   ├── auth.js            # Authentication module
│   ├── cart.js            # Cart management
│   ├── orders.js          # Order handling
│   ├── products.js        # Product listing
│   ├── checkout.js        # Checkout flow
│   └── admin.js           # Admin dashboard
├── admin/                 # Admin pages
│   ├── dashboard.html
│   ├── products.html
│   ├── categories.html
│   ├── suppliers.html
│   ├── customers.html
│   ├── orders.html
│   └── inventory.html
├── index.html             # Home page
├── login.html             # Login page
├── register.html          # Registration page
├── products.html          # Product listing
├── product-details.html   # Product details
├── cart.html              # Shopping cart
├── checkout.html          # Checkout
├── orders.html            # Order history
└── profile.html           # User profile
```

## API Endpoints

The frontend connects to the SmartMart backend API at `http://localhost:8080/api`:

### Public
- `GET /api/products` - List products
- `GET /api/products/{id}` - Get product details
- `GET /api/products/search?keyword=` - Search products
- `GET /api/categories` - List categories

### Auth (Public)
- `POST /api/auth/register` - Register user
- `POST /api/auth/login` - Login

### Protected (USER/ADMIN)
- `GET /api/cart` - Get cart
- `POST /api/cart/items` - Add to cart
- `GET /api/orders` - Get orders
- `POST /api/orders` - Place order
- `GET /api/customers/me` - Get profile
- `PATCH /api/customers/me` - Update profile

### Admin Only
- `GET /api/admin/dashboard` - Dashboard stats
- `GET /api/admin/inventory-summary` - Low stock
- `POST /api/products` - Create product
- `PUT /api/products/{id}` - Update product
- `DELETE /api/products/{id}` - Delete product

## Setup

1. Start the SmartMart backend on `http://localhost:8080`
2. Open `index.html` in a browser
3. Register a new account or login with credentials

## Default Admin Credentials

- Email: `admin@smartmart.com`
- Password: `Admin@1234`

## Default User Credentials

- Email: `user@smartmart.com`
- Password: `User@1234`

## Technology

- HTML5
- CSS3 (with custom variables and media queries)
- Vanilla JavaScript (ES6+)
- Font Awesome 6.4.0 (Icons)
- Bootstrap-inspired design system

## Browser Support

- Chrome (latest)
- Firefox (latest)
- Edge (latest)
- Safari (latest)

## Notes

- The frontend uses local storage to store JWT tokens
- All API requests include the `Authorization: Bearer <token>` header
- Admin pages check for `ROLE_ADMIN` role before displaying
- Cart functionality requires authentication