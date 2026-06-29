#!/bin/bash

# ============================================
# Setup Laravel 13 + Inertia.js + Vue + Tailwind CSS
# ============================================

PROJECT_NAME="laravel13_inertia_vue_tailwind"

# 1. Install Laravel 13 via Composer
echo "🚀 Menginstall Laravel 13..."
composer create-project laravel/laravel:^13.0 "$PROJECT_NAME"

cd "$PROJECT_NAME" || exit

# 2. Install Laravel Breeze (Inertia + Vue)
echo "🎨 Menginstall Laravel Breeze dengan Inertia + Vue..."
composer require laravel/breeze --dev

php artisan breeze:install vue --dark

# 3. Install Node.js dependencies
echo "📦 Menginstall dependencies Node.js..."
npm install

# 4. Generate application key
echo "⚙️ Setup environment..."
cp .env.example .env
php artisan key:generate

# 5. Build frontend assets
echo "⚡ Compile assets..."
npm run build

# 6. Database migration (Opsional)
# Uncomment jika ingin langsung migrate
# php artisan migrate

echo ""
echo "============================================"
echo "✅ Setup Laravel 13 selesai!"
echo "============================================"
echo ""
echo "Menjalankan development server:"
echo "  cd $PROJECT_NAME"
echo "  php artisan serve"
echo ""
echo "Menjalankan Vite:"
echo "  npm run dev"
echo ""
echo "Aplikasi dapat diakses di:"
echo "  http://localhost:8000"