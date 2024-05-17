while read line; do
  pacman -Q "$line" || sudo pacman -S "$line"
done < list
