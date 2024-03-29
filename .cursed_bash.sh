
function tgtrans() {
	true #TODO
}

function tgsolid() {
	true #TODO
}

function cut_dots {
	read arg
	echo $arg | awk "{ if (length > $1) print substr(\$0,1,$(($1 - 2)))\"..$2\"; else if (length > 1) print \$0\"$2\"; else print; }"
}

function count_git_files_length {
	echo $( for i in `git ls-tree --full-tree -r --name-only HEAD`; do wc -l "$i"; done | sed -r 's/[^0-9]+/\+/g' | cat - <(echo 0) | tr -d '\n'; echo )  | bc
}

function swap() { mv "$1" "$1._tmp" && mv "$2" "$1" && mv "$1._tmp" "$2"; }

function kboff() { xinput float `xinput \
    | grep "AT Translated" \
    | sed -r 's/.+id=([0-9]+).+/\1/'`; }
function kbon() { xinput reattach `xinput \
    | grep "AT Translated" \
    | sed -r 's/.+id=([0-9]+).+/\1/'` \
    `xinput \
    | grep "Virtual core keyboard" \
    | sed -r 's/.+id=([0-9]+).+/\1/'` ; }

function fix-ntfs() { \ 
	sudo umount /dev/sda1 && \
	sudo ntfsfix /dev/sda1 &&\
	sudo mount /dev/sda1 /mnt/D ; }

function screenoff() { sudo vbetool dpms off; }
function screenon() { sudo vbetool dpms on; }


