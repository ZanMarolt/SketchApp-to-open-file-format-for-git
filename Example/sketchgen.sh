#! bin/bash
prefix="sketch_"

case $1 in
	output)
		for folder in sketch_*; do
		    rm -rf "$folder"
		done

		for file in *.sketch; do
		    cp "$file" "`basename "$file" .sketch`.zip"
		done

		for file in *.zip; do
		    unzip "$file" -d "`basename "$prefix$file" .zip`"
		    rm -f "$file"
		done
		echo "Generated open file format folders"
		;;
	input)
  		for folder in sketch_*; do
  			cd "$folder"
  			zipname="${folder/$prefix/}"
  			zip -r ../"$zipname".zip *
		    cd ../
		done

		for file in *.zip; do
		    cp "$file" "`basename "$file" .zip`.sketch"
		    rm -f "$file"
		done
		echo "Generated sketch files from folders"
  		;;
	*)
  		echo $"Usage: $0 {output|input}"
  		;;
esac