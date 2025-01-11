#/bin/sh

installDirs=("OGJson" "OGCamel" "OGEDataServer" "OGEBookContacts" "OGEBook")

for d in ${installDirs[@]}
do
	printf "\nEntering directory $d…\n\n"
    cd $d
	./autogen.sh && ./configure
	make -j4
	sudo make install
	cd ..
done
