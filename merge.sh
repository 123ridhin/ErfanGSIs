#!/bin/bash

LOCALDIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
cachedir="$LOCALDIR/cache"
tmpdir="$cachedir/tmp"
payload_extractor="tools/update_payload_extractor/extract.py"
PARTITIONS=("system" "product" "opproduct")

merge_partition () {
    echo "Merging $1 Partition"
    mkdir $cachedir/$1
    mount -o ro $cachedir/$1.img $cachedir/$1/
    cp -pvr $cachedir/$1/* $cachedir/system-new/$2 &> /dev/null
    umount $cachedir/$1
    rm -rf $cachedir/$1
}

#Extract OTA
mkdir -p "$tmpdir" "$cachedir"
unzip $2 -d $tmpdir &> /dev/null
echo "Extracting Required Partitions . . . . "
if [ $1 = "OxygenOS" ]; then
	for partition in ${PARTITIONS[@]}; do
 	    python $payload_extractor --partitions $partition --output_dir $tmpdir $tmpdir/payload.bin
 	    mv $tmpdir/$partition $cachedir/$partition.img 
	done
elif [ $1 = "Pixel" ]; then
	unzip $tmpdir/*/*.zip -d $tmpdir &> /dev/null
    simg2img $tmpdir/system.img $cachedir/system.img
	simg2img $tmpdir/product.img $cachedir/product.img
	simg2img $tmpdir/system_other.img $cachedir/system_other.img
 	if [ -f $tmpdir/system_ext.img ]; then
	    simg2img $tmpdir/system_ext.img $cachedir/system_ext.img
	fi
fi
rm -rf $tmpdir

#Make Dummy Image
echo "Creating Dummy System Image . . . . "
mkdir $cachedir/system-new
mkfs.ext2 $cachedir/system-new.img 4800M &>/dev/null
tune2fs -c0 -i0 $cachedir/system-new.img &>/dev/null
mount -o loop $cachedir/system-new.img $cachedir/system-new

#Merge
merge_partition system
rm -rf $cachedir/system-new/system/product
mkdir $cachedir/system-new/system/product
merge_partition product system/product
rm -rf $cachedir/system-new/product
ln -s /system/product/ $cachedir/system-new/product
if [[ $1 = "OxygenOS" ]]; then
    merge_partition opproduct oneplus
elif [[ $1 = "Pixel" ]]; then
    merge_partition system_other system
    if [[ -f $tmpdir/system_ext.img ]]; then
        rm -rf $cachedir/system-new/system/system_ext
        mkdir $cachedir/system-new/system/system_ext
        merge_partition product system/system_ext
        rm -rf $cachedir/system-new/system_ext
        ln -s /system/system_ext/ $cachedir/system-new/system_ext
    fi
fi
