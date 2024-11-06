__tldr-replace-buffer() {
	local old=$1 new=$2 space=${2:+ }

	if [[ $CURSOR -le ${#old} ]]; then
		BUFFER="${new}${space}${BUFFER#$old }"
		CURSOR=${#new}
	else
		LBUFFER="${new}${space}${LBUFFER#$old }"
	fi
}

tldr-command-line() {
	# Si el buffer está vacío, obtenemos el último comando de la historia
	[[ -z $BUFFER ]] && LBUFFER="$(fc -ln -1)"

	# Guardamos el espacio al principio del buffer
	local WHITESPACE=""
	if [[ ${LBUFFER:0:1} = " " ]]; then
		WHITESPACE=" "
		LBUFFER="${LBUFFER:1}"
	fi

	# Si ya contiene "tldr", lo dejamos tal cual
	if [[ $BUFFER == tldr* ]]; then
		__tldr-replace-buffer "tldr" ""
	else
		# Si no, agregamos "tldr" al inicio del comando
		LBUFFER="tldr $LBUFFER"
	fi

	# Conservamos el espacio inicial
	LBUFFER="${WHITESPACE}${LBUFFER}"

	# Redisplay del buffer editado (compatibilidad con zsh-syntax-highlighting)
	zle && zle redisplay
}


zle -N tldr-command-line
