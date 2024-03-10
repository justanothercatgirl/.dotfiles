#!/bin/sh

function cp_into() {
	for i in $(cat ${0%/*}/tracked); do 
		mkdir -p .root/${i%/*}
		echo copying $i to .root/$i
		cp $i .root/${i};
	done
}

cp_into
