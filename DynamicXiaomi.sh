#!/bin/bash

#Variables

PARTITIONS=("system.new.dat.br" "product")
payload_extractor="tools/update_payload_extractor/extract.py"
LOCALDIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
outdir="$LOCALDIR/cache"
tmpdir=$LOCALDIR/tmp"
brotli_exec="$tools/bin/brotli"
sdat2img="$tools/sdat2img.py"
simg2img="$tools/bin/simg2img"

###############WE ARE WONDERFUL########################


echo "Create tmp and out dir"
   mkdir -p "$tmpdir"
   mkdir -p "$outdir"
  
  
  
unzip *.zip -p -d $tmpdir &> /dev/null 
echo "Extractin the only required partitions....:}..."
echo "Converting Brotli... to system"
if [ $1 = "MIUI" ]; then 
      for partitons in ${PARTITIONS[@]}; do 
      unzip *.zip -p -d $tmpdir
      $brotli_exec -d "$tmpdir/system.new.dat.br"
      rm -f $tmpdir/system.new.dat.br
      cd $tmpdir
      pyhton3 $sdat2img system.new.dat system.transfer.list "system.img"
      rm -rf system.new.dat system.transfer.list 
      $simg2img system.img system.img.raw
      rm -f system.img
      mv system.img.raw system.img
      cd ..
      
echo "unzip the product partition......"
      if [ $1 = "MIUI" ]; then 
      for partitons in ${PARTITIONS[@]}; do
      $brotli_exec -d "$tmpdir/product.new.dat.br"
      rm -f $tmpdir/product.new.dat.br
      cd $tmpdir
      python3 $sdat2img product.new.dat product.transfer.list "product.img"
      $simg2img product.img product.img.raw
      rm -f product.img
      mv product.img.raw product.img
      
      
 echo "Making the dummy system image"
      dd if=/dev/zero of=final.img bs=4k count=1048576
      mkfs.ext4 final.img
      tune2fs -c0 -i0 final.img
      
 echo "Mounting up the files"
    sudo mkdir mtsystem && sudo mkdir mtproduct && sudo mkdir mtfinal
    sudo mount final.img mtfinal
    sudo mount system.img mtsystem
    sudo mount product.img mtproduct 
    sudo cp -v -r -p mtproduct/* mtfinal/system/product
    sudo umount product.img
    sudo umount system.img
    sudo umount final.img 
    cd ../../
    sudo rm -rf $tmpdir
    sudo cp $tmpdir/final.img $outdir
    sudo mv $outdir/final.img systemready.img
    echo "Please finish creating GSI using make.sh script"
