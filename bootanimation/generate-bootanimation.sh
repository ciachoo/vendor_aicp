#!/bin/bash

WIDTH="$1"
HEIGHT="$2"
HALF_RES="$3"
OUT="$ANDROID_PRODUCT_OUT/obj/BOOTANIMATION"
RANDOM_BOOT=5 # $(shuf -i 0-5 -n 1)

if [ -z "$WIDTH" ]; then
    echo "Warning: bootanimation width not specified"
    WIDTH="1080"
fi

if [ -z "$HEIGHT" ]; then
    echo "Warning: bootanimation height not specified"
    HEIGHT="1080"
fi

if [ "$HEIGHT" -lt "$WIDTH" ]; then
    SIZE="$HEIGHT"
else
    SIZE="$WIDTH"
fi

if [ "$HALF_RES" != "false" ]; then
    IMAGESIZE=$(expr $SIZE / 2)
else
    IMAGESIZE="$SIZE"
fi

RESOLUTION=""$IMAGESIZE"x"$IMAGESIZE""

PART_NUMBER=$(tar -tf vendor/aicp/bootanimation/bootanimation$RANDOM_BOOT.tar | grep "^part[0-9]/$" | wc -l)

for part_cnt in `seq 1 $PART_NUMBER`
do
    mkdir -p $ANDROID_PRODUCT_OUT/obj/BOOTANIMATION/bootanimation/part$part_cnt
done
tar xfp "vendor/aicp/bootanimation/bootanimation$RANDOM_BOOT.tar" -C "$OUT/bootanimation/"
mogrify -resize $RESOLUTION -colors 250 "$OUT/bootanimation/"*"/"*".png"

# Create desc.txt
if [ ! -e "$OUT/bootanimation/desc.txt" ]; then
    echo "$SIZE" "$SIZE" 30 > "$OUT/bootanimation/desc.txt"
    cat "vendor/aicp/bootanimation/desc.txt" >> "$OUT/bootanimation/desc.txt"
fi

# Create bootanimation.zip
cd "$OUT/bootanimation"

zip -qr0 "$OUT/bootanimation.zip" .
