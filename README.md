
---

# Mikhmon PPPoE ROS.6

[![License](https://img.shields.io/github/license/heruhendri/mikhmon-pppoe-v6.svg)](LICENSE)
[![Stars](https://img.shields.io/github/stars/heruhendri/mikhmon-pppoe-v6.svg)](https://github.com/heruhendri/mikhmon-pppoe-v6/stargazers)
[![Forks](https://img.shields.io/github/forks/heruhendri/mikhmon-pppoe-v6.svg)](https://github.com/heruhendri/mikhmon-pppoe-v6/network/members)
![PHP](https://img.shields.io/badge/PHP-7.x-blue.svg)
![License](https://img.shields.io/badge/license-Personal%20Use%20Only-orange)
![Status](https://img.shields.io/badge/status-active-brightgreen)

## 🚀 Tentang Project

**Mikhmon PPPoE v6** adalah aplikasi berbasis PHP yang memudahkan monitoring dan manajemen user PPPoE pada Mikrotik. Dirancang untuk memudahkan pemilik jaringan hotspot dalam mengelola voucher, melihat statistik pengguna, serta mendapatkan laporan secara real-time.

## ✨ Fitur Unggulan

- Manajemen user PPPoE Mikrotik
- Pembuatan dan cetak voucher otomatis
- Monitoring penggunaan (statistik user, trafik, dsb)
- Laporan dan export data
- UI friendly & responsif
- Support multi-router

## 📸 Screenshot

> 

![Screenshot](https://github.com/heruhendri/Mikhmon-PPPoE-ROS.6/blob/master/mikhmon/ss.png?raw=true)

## ⚙️ Instalasi

**cara install Mikhmon di VPS Ubuntu** (misalnya Ubuntu 20.04 atau 22.04):

---

### ✅ **1. Update Sistem**

```bash
sudo apt update && sudo apt upgrade -y
```

---

### ✅ **2. Install Apache, PHP, dan Modul Pendukung**

```bash
sudo apt install apache2 php php-curl php-cli php-xml php-mbstring unzip git -y
```

---

### ✅ **3. Download Mikhmon**

Kita akan clone versi **Mikhmon-mod** (lebih stabil dan aktif di-maintain):

```bash
cd /var/www/
sudo git clone https://github.com/heruhendri/Mikhmon-PPPoE-Ros.6.git mikhmon
```

> Atau jika mau versi original:
>
> ```bash
> sudo git clone https://github.com/laksa19/mikhmon.git mikhmon
> ```

---

### ✅ **4. Ubah Hak Akses Folder**

```bash
sudo chown -R www-data:www-data /var/www/mikhmon
sudo chmod -R 755 /var/www/mikhmon
```

---

### ✅ **5. Konfigurasi Apache**

Buat virtual host:

```bash
sudo nano /etc/apache2/sites-available/mikhmon.conf
```

Isi dengan:

```apache
<VirtualHost *:80>
    ServerAdmin admin@yourdomain.com
    DocumentRoot /var/www/mikhmon
    ServerName yourdomain.com

    <Directory /var/www/mikhmon>
        Options Indexes FollowSymLinks
        AllowOverride All
        Require all granted
    </Directory>

    ErrorLog ${APACHE_LOG_DIR}/mikhmon_error.log
    CustomLog ${APACHE_LOG_DIR}/mikhmon_access.log combined
</VirtualHost>
```

> Ganti `yourdomain.com` dengan domain kamu, atau hapus `ServerName` jika hanya pakai IP VPS.

---

### ✅ **6. Aktifkan Site dan Restart Apache**

```bash
sudo a2ensite mikhmon
sudo a2enmod rewrite
sudo systemctl restart apache2
```

---

### ✅ **7. Akses Mikhmon**

Buka browser dan akses:

* Jika pakai domain: `http://yourdomain.com`
* Jika pakai IP VPS: `http://IP-VPS-ANDA`

---

### ✅ (Opsional) **Pasang SSL (HTTPS)**

Jika kamu menggunakan domain:

```bash
sudo apt install certbot python3-certbot-apache -y
sudo certbot --apache
```

---

### ✅ **8. Login Mikhmon**

Default login:

* **Username:** `admin`
* **Password:** `admin`

Langsung bisa mulai tambahkan Router Mikrotik kamu dari halaman dashboard.

---



1. **Clone repo ini:**
   ```bash
   git clone https://github.com/heruhendri/mikhmon-pppoe-v6.git
   ```
2. **Upload ke hosting/web server Anda (XAMPP, LAMPP, dsb)**
3. **Edit konfigurasi sesuai kebutuhan**
4. **Akses dari browser:**
   ```
   http://localhost/mikhmon-pppoe-v6/
   ```

## 📝 Penggunaan

- Login dengan akun yang sudah Anda buat.
- Tambahkan router Mikrotik.
- Generate voucher & lakukan monitoring user.

## 💡 Kontribusi

Kontribusi selalu terbuka! Silakan fork repo ini, buat perubahan, lalu kirimkan pull request.

## 📬 Kontak & Sosial Media

- [GitHub](https://github.com/heruhendri)
- [Email](mailto:heruu2004@gmail.com)

---

> _README ini terinspirasi dari tampilan profil [heruhendri](https://github.com/heruhendri)._
>  
> Jangan lupa kasih ⭐ kalau repo ini bermanfaat!

---
