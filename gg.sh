#!/bin/bash

# Hata ayıklama modu açılıyor
set -x

# Root kontrolü
if [[ $EUID -ne 0 ]]; then
   echo "Bu script root kullanıcı yetkileriyle çalıştırılmalıdır. (sudo bash gg.sh)"
   exit 1
fi

# GIMP uygulaması kontrol ediliyor ve kaldırılıyor
echo "GIMP uygulaması kontrol ediliyor ve kaldırılıyor..."
if dpkg -l | grep -q "gimp"; then
    echo "APT ile kurulu GIMP bulundu. Kaldırılıyor..."
    apt-get remove --purge -y gimp gimp-data gimp-plugin-registry || { echo "GIMP kaldırılmadı!"; exit 1; }
else
    echo "APT ile kurulu GIMP bulunamadı."
fi

# Flatpak GIMP kontrolü
echo "Flatpak ile kurulu GIMP kontrol ediliyor..."
if flatpak list | grep -q "org.gimp.GIMP"; then
    echo "Flatpak ile kurulu GIMP bulundu. Ancak flatpak sürümü korunacak."
else
    echo "Flatpak ile kurulu GIMP bulunamadı. Devam ediyor..."
fi

# Depoları güncelleme
echo "Depolar güncelleniyor..."
apt-get update -y || { echo "Depolar güncellenemedi!"; exit 1; }

# Flatpak kurulumu kontrol ediliyor
echo "Flatpak kurulumu kontrol ediliyor ve kuruluyor..."
if ! command -v flatpak &> /dev/null; then
    echo "Flatpak kurulumu yapılıyor..."
    apt-get install -y flatpak || { echo "Flatpak kurulamadı!"; exit 1; }
else
    echo "Flatpak zaten kurulu."
fi

# GNOME Software Flatpak Plugin kurulumu
echo "GNOME Software Flatpak Plugin kontrol ediliyor ve kuruluyor..."
if ! dpkg -l | grep -q "gnome-software-plugin-flatpak"; then
    echo "GNOME Software Flatpak Plugin kurulumu yapılıyor..."
    apt-get install -y gnome-software-plugin-flatpak || { echo "GNOME Software Plugin kurulamadı!"; exit 1; }
else
    echo "GNOME Software Flatpak Plugin zaten kurulu."
fi

# Flathub deposu ekleniyor
echo "Flathub deposu ekleniyor..."
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

# GIMP kurulumu başlatılıyor
echo "Flatpak GIMP kurulumu başlıyor..."
flatpak install -y flathub org.gimp.GIMP || { echo "Flatpak GIMP kurulumu başarısız!"; exit 1; }

# GIMP eklentileri kuruluyor
echo "GIMP için gerekli eklentiler yükleniyor..."
flatpak install -y flathub org.gimp.GIMP.Plugin.Resynthesizer || { echo "Resynthesizer eklentisi yüklenemedi!"; exit 1; }
flatpak install -y flathub org.gimp.GIMP.Plugin.LiquidRescale || { echo "LiquidRescale eklentisi yüklenemedi!"; exit 1; }

echo "Tüm işlemler başarıyla tamamlandı!"

