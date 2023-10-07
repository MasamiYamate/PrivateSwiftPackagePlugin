out_put_file="Packaging/Packaging"
source_directory_path="Packaging/Sources/*"
sources=`find $source_directory_path -type f`

rm -rf $out_put_file

/usr/bin/xcrun -sdk macosx swiftc -o "${out_put_file}" $sources

