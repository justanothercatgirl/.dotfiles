# set environmental variables

function proxy-enable() {
	R_="http://127.0.0.1:2080"
	S_="https://127.0.0.1:2080"
	export HTTP_PROXY="${R_}"
	export FTP_PROXY="${R_}"
	export HTTPS_PROXY="${S_}"
	export http_proxy="${R_}"
	export ftp_proxy="${R_}"
	export https_proxy="${S_}"

	# set gsettings
	gsettings set org.gnome.system.proxy mode manual
	for i in http https ftp; do
		gsettings set org.gnome.system.proxy.$i host 127.0.0.1
		gsettings set org.gnome.system.proxy.$i port 2080
	done

	export PROXY_ON_JCG=true
	echo "proxy enabled"
}
alias proxy-on=proxy-enable

function proxy-disable() {
	unset HTTP_PROXY FTP_PROXY HTTPS_PROXY http_proxy ftp_proxy https_proxy
	export -n HTTP_PROXY FTP_PROXY HTTPS_PROXY http_proxy ftp_proxy https_proxy
	gsettings reset org.gnome.system.proxy mode

	unset PROXY_ON_JCG
	echo "proxy disabled"
}
alias proxy-off=proxy-disable

function proxy-toggle() {
	if [ -z $PROXY_ON_JCG ]; then
		proxy-enable
	else
		proxy-disable
	fi
}

