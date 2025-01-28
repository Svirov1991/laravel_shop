# Laravel Shop
## Installation Guide
### Docker
1) Clone the repository:
git clone https://github.com/Svirov1991/laravel_shop.git .

2) Build Docker containers:
sudo docker-compose up -d

3) Install dependencies:
Navigate to the project folder:
cd shop
Run the command:
composer install

4) Set up environment variables:
Rename .env.example to .env using the command:
mv .env.example .env

5) Link storage:
Inside the PHP container, navigate to /var/www/shop and run:
php artisan storage:link

Ready: localhost:8081
Admin panel: localhost:8081/admin ( default user login: admin@admin.com password: password )

### Virtual Hosting
1) Clone the repository in the prepared directory for the project (e.g., /var/www/site-name):
git clone https://github.com/Svirov1991/laravel_shop.git .

2) Install dependencies:
Navigate to the project folder:
cd shop
Run the command:
composer install

3) Set up the database:
Create a new database and import the file docker-entrypoint-initdb.d/example.sql.

4) Configure environment variables:
In the shop directory, rename .env.example to .env and update the database connection settings.

5) Link storage:
In the shop directory, run:
php artisan storage:link

6) Configure the domain:
Point your domain to the shop folder (e.g., /var/www/site-name/shop).

Ready: you-domain.com

Admin panel: you-domain.com/admin ( default user login: admin@admin.com password: password )

## Environment Variables
TELEGRAM_MAIN_BOT_TOKEN: The token for the main Telegram bot used on the website.

TELEGRAM_ORDERS_BOT_TOKEN: The token for the admin bot to receive notifications.

RECAPTCHA_SITE_KEY and RECAPTCHA_SECRET_KEY: Keys for Google reCAPTCHA v3.

NOVAPOSHTA_API_KEY: API key for Nova Poshta to update offices and search for settlements.

MAIL_*: Configure email sending settings.