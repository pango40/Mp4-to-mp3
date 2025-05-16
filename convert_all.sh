#!/data/data/com.termux/files/usr/bin/bash

MP4_DIR="/sdcard/PANGO-MP4"

clear
echo -e "\e[1;35m"
echo "╔══════════════════════════════════╗"
echo "║      ★ Mr WEB - Audio Tools ★     ║"
echo "╚══════════════════════════════════╝"
echo -e "\e[1;36mPANGO MP4 to MP3 Batch Converter\e[0m"
echo -e "\e[1;33mLooking for .mp4 files in:\e[0m $MP4_DIR"
echo -e "\e[0;37mChannel: \e[4;34mhttps://t.me/Mr_WEBts\e[0m"

if [ ! -d "$MP4_DIR" ]; then
  echo -e "\n\e[1;31m[!] Directory not found: $MP4_DIR\e[0m"
  exit 1
fi

shopt -s nullglob
mp4_files=("$MP4_DIR"/*.mp4)

if [ ${#mp4_files[@]} -eq 0 ]; then
  echo -e "\n\e[1;31m[!] No .mp4 files found in $MP4_DIR\e[0m"
  exit 1
fi

echo -e "\n\e[1;34mFound ${#mp4_files[@]} video(s). Starting conversion...\e[0m"

for input_file in "${mp4_files[@]}"; do
  output_file="${input_file%.mp4}.mp3"
  echo -e "\n\e[1;32mConverting:\e[0m $(basename "$input_file")"
  ffmpeg -i "$input_file" -vn -ab 192k -ar 44100 -y "$output_file"
  echo -e "\e[1;32mSaved:\e[0m $(basename "$output_file")"
done

echo -e "\n\e[1;36mAll conversions done!\e[0m"
echo -e "\e[1;32mMP3 files saved in:\e[0m $MP4_DIR"
echo -e "\e[0;37mThanks for using Mr WEB Tools - Join us:\e[4;34m https://t.me/Mr_WEBts\e[0m"
