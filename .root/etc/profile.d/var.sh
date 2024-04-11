
# editor
export SUDO_EDITOR=/usr/bin/nvim
export EDITOR=/usr/bin/nvim
export VISUAL=/usr/bin/nvim

# miscellaneous
export RUST_BACKTRACE=full
export CXX=/usr/bin/clang++

# if we are in tty, make bg white
# otherwise, black
if test -z $DISPLAY; then
	CUSTOM_BG_COL="107"
else
	CUSTOM_BG_COL="40"
fi

# ls colors
ARCC="01;31"
PICC="01;35"
MEDC="00;36"
TMPC="00;90"
CODC="01;$CUSTOM_BG_COL;33"
COFC="01;$CUSTOM_BG_COL;96"
DOCC="01;$CUSTOM_BG_COL;34"
COL_ARC="*.7z=$ARCC:*.ace=$ARCC:*.alz=$ARCC:*.apk=$ARCC:*.arc=$ARCC:*.arj=$ARCC:*.bz=$ARCC:*.bz2=$ARCC:*.cab=$ARCC:*.cpio=$ARCC:*.crate=$ARCC:*.deb=$ARCC:*.drpm=$ARCC:*.dwm=$ARCC:*.dz=$ARCC:*.ear=$ARCC:*.egg=$ARCC:*.esd=$ARCC:*.gz=$ARCC:*.jar=$ARCC:*.lha=$ARCC:*.lrz=$ARCC:*.lz=$ARCC:*.lz4=$ARCC:*.lzh=$ARCC:*.lzma=$ARCC:*.lzo=$ARCC:*.pyz=$ARCC:*.rar=$ARCC:*.rpm=$ARCC:*.rz=$ARCC:*.sar=$ARCC:*.swm=$ARCC:*.t7z=$ARCC:*.tar=$ARCC:*.taz=$ARCC:*.tbz=$ARCC:*.tbz2=$ARCC:*.tgz=$ARCC:*.tlz=$ARCC:*.txz=$ARCC:*.tz=$ARCC:*.tzo=$ARCC:*.tzst=$ARCC:*.udeb=$ARCC:*.war=$ARCC:*.whl=$ARCC:*.wim=$ARCC:*.xz=$ARCC:*.z=$ARCC:*.zip=$ARCC:*.zoo=$ARCC:*.zst=$ARCC"
COL_PIC="*.avif=$PICC:*.jpg=$PICC:*.jpeg=$PICC:*.mjpg=$PICC:*.mjpeg=$PICC:*.gif=$PICC:*.bmp=$PICC:*.pbm=$PICC:*.pgm=$PICC:*.ppm=$PICC:*.tga=$PICC:*.xbm=$PICC:*.xpm=$PICC:*.tif=$PICC:*.tiff=$PICC:*.png=$PICC:*.svg=$PICC:*.svgz=$PICC:*.mng=$PICC:*.pcx=$PICC:*.mov=$PICC:*.mpg=$PICC:*.mpeg=$PICC:*.m2v=$PICC:*.mkv=$PICC:*.webm=$PICC:*.webp=$PICC:*.ogm=$PICC:*.mp4=$PICC:*.m4v=$PICC:*.mp4v=$PICC:*.vob=$PICC:*.qt=$PICC:*.nuv=$PICC:*.wmv=$PICC:*.asf=$PICC:*.rm=$PICC:*.rmvb=$PICC:*.flc=$PICC:*.avi=$PICC:*.fli=$PICC:*.flv=$PICC:*.gl=$PICC:*.dl=$PICC:*.xcf=$PICC:*.xwd=$PICC:*.yuv=$PICC:*.cgm=$PICC:*.emf=$PICC:*.ogv=$PICC:*.ogx=$PICC"
COL_MED="*.aac=$MEDC:*.au=$MEDC:*.flac=$MEDC:*.m4a=$MEDC:*.mid=$MEDC:*.midi=$MEDC:*.mka=$MEDC:*.mp3=$MEDC:*.mpc=$MEDC:*.ogg=$MEDC:*.ra=$MEDC:*.wav=$MEDC:*.oga=$MEDC:*.opus=$MEDC:*.spx=$MEDC:*.xspf=$MEDC"
COL_TMP="*~=$TMPC:*#=$TMPC:*.bak=$TMPC:*.crdownload=$TMPC:*.dpkg-dist=$TMPC:*.dpkg-new=$TMPC:*.dpkg-old=$TMPC:*.dpkg-tmp=$TMPC:*.old=$TMPC:*.orig=$TMPC:*.part=$TMPC:*.rej=$TMPC:*.rpmnew=$TMPC:*.rpmorig=$TMPC:*.rpmsave=$TMPC:*.swp=$TMPC:*.tmp=$TMPC:*.ucf-dist=$TMPC:*.ucf-new=$TMPC:*.ucf-old=$TMPC"
COL_TPS="rs=0:di=01;34:ln=01;36:mh=0:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=41;36;01:mi=31;46;1:su=37;41:sg=30;43:ca=31:tw=94;40:ow=94:st=97;44:ex=01;32"
COL_COD="*.cpp=$CODC:*.hpp=$CODC:*.c=$CODC:*.h=$CODC:*.s=$CODC:*.inc=$CODC:*.c++=$CODC:*.h++=$CODC:*.rs=$CODC:*.py=$CODC:*.sh=$CODC:*.cs=$CODC:*.hs=$CODC:*.hs=$CODC:*.java=$CODC:*.lua=$CODC:*.pl=$CODC:*.rb=$CODC:*.yaml=$CODC:*.yml=$CODC:*.json=$CODC:*.xml=$CODC:*.html=$CODC:*.css=$CODC:*.js=$CODC:*.php=$CODC:*.toml=$CODC:*.ini=$CODC:*.md=$CODC"
COL_COF="*.cfg=$COFC:*.conf=$COFC:*config=$COFC:*.libconfig=$COFC;config*=$COFC"
COL_DOC="*.pdf=$DOCC:*.doc=$DOCC:*.docx=$DOCC:*.ppt=$DOCC:*.pptx=$DOCC:*.xls=$DOCC:*.xlsx=$DOCC:*.odt=$DOCC:*.ods=$DOCC:*.odp=$DOCC:*.txt=$DOCC"

export LS_COLORS="$COL_TPS:$COL_COD:$COL_ARC:$COL_PIC:$COL_MED:$COL_TMP:$COL_COF:$COL_DOC"
# rs	reset
# di	directory
# ln	symbolic link
# mh	multihard link
# pi	named pipe
# so	socker
# do	door
# bd	block device
# cd	character device
# or	orphaned symbolic link
# mi	nonexistend file pointed to by orphaced symbolic link
# su	setuid file
# sg	setgid file
# ca	file with special capabilities
# tw	dir writable to others, with sticky bit
# ow	dir writable to others, without sticky bit
# st	dir with sticky bit
# ex	executable


