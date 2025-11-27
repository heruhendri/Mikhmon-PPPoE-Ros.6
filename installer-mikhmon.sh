#!/bin/bash

echo "==============================================="
echo "    Installer MIKHMON-AGENT for NATVPS"
echo "    NGINX + PHP + MULTI DOMAIN"
echo "    By Hendri / 2025"
echo "==============================================="
sleep 1

# ----------- INPUT DOMAIN  -----------------
read -rp "Masukkan domain/subdomain untuk agent (ex: agent.domain.com): " DOMAIN
read -rp "Masukkan folder instalasi (ex: agent1): " FOLDER

INSTALL_DIR="/var/www/$FOLDER"

echo "Domain: $DOMAIN"
echo "Folder: $INSTALL_DIR"
sleep 1

# ----------- UPDATE SYSTEM  -----------------
apt update && apt upgrade -y

# ----------- INSTALL DEPENDENCIES ----------
apt install -y nginx php php-fpm php-cli php-curl php-xml php-zip php-mbstring php-gd git unzip curl

# ----------- CLONE REPO --------------------
mkdir -p $INSTALL_DIR
git clone https://github.com/heruhendri/Mikhmon-PPPoE-Ros.6.git $INSTALL_DIR

# Set permission
chown -R www-data:www-data $INSTALL_DIR
chmod -R 755 $INSTALL_DIR

# ----------- MEMBUAT KONFIG NGINX ----------
NGINX_CONF="/etc/nginx/sites-available/$DOMAIN.conf"

cat > $NGINX_CONF <<EOF
server {
    listen 80;
    server_name $DOMAIN;

    root $INSTALL_DIR;
    index index.php index.html index.htm;

    location / {
        try_files \$uri \$uri/ /index.php?\$query_string;
    }

    location ~ \.php$ {
        include snippets/fastcgi-php.conf;
        fastcgi_pass unix:/var/run/php/php-fpm.sock;
    }

    location ~ /\.ht {
        deny all;
    }
}
EOF

ln -s $NGINX_CONF /etc/nginx/sites-enabled/

nginx -t && systemctl reload nginx

echo ""
echo "==============================================="
echo "    INSTALASI HTTPS (Certbot)?"
echo "==============================================="
read -rp "Ingin install HTTPS sekarang? (y/n): " SSL

if [[ "$SSL" == "y" ]]; then
    apt install -y certbot python3-certbot-nginx
    certbot --nginx -d $DOMAIN
fi

echo ""
echo "==============================================="
echo "  INSTALLER SELESAI!"
echo "==============================================="
echo "Akses: http://$DOMAIN"
echo "Folder: $INSTALL_DIR"
echo "==============================================="
echo ""

# ----------- HAPUS FILE INSTALLER ----------
SCRIPT_NAME=$(basename "$0")

echo "Menghapus file installer: $SCRIPT_NAME"
rm -f "$SCRIPT_NAME"

echo "Installer telah dihapus!"
