function logLanguages {
	for lan in "${LANGUAGES[@]}"
	do
		echo "	· $lan"	2>&1
	done
}

while [[ $# -gt 0 ]]
do
key="$1"

case $key in
    -f|--file)
	if [ $# -lt 2 ] ; then
		echo "$key requires a filename as argument" 2>&1
		exit 1
	fi
    FILE="$2"
    shift # past argument
    shift # past value
    ;;
	-m|--main)
	if [ $# -lt 2 ] ; then
		echo "$key requires a main source file able to compile a program as argument" 2>&1
		exit 1
	fi
	if [ ! -f $2 ];then
		echo "$2: No such file or directory" 2>&1
		exit 1
	fi
    MAIN="$2"
    shift # past argument
    shift # past value
    ;;

    -l|--language)
	COMPILER="unknown"
	EXTENSION="unknown"
	if [ $# -lt 2 ] ; then
		echo "$key requires a language as argument" 2>&1
		echo 2>&1
		echo "available languages:" 2>&1
		logLanguages
		exit 1
	fi
	LANGUAGE=$2
	for i in "${!LANGUAGES[@]}";
	do
		if [[ "${LANGUAGES[$i]}" = $LANGUAGE ]]; then
			COMPILER=${COMPILERS[$i]}
			EXTENSION=${EXTENSIONS[$i]}
			break
		fi
	done
	if [ $COMPILER = "unknown" ] ; then
		echo "$LANGUAGE: Unknown language" 2>&1
		echo "available languages:" 2>&1
		logLanguages
		exit 1
	fi
    shift # past argument
    shift # past value
    ;;
    -h|--help)
		echo "Usage: $0 [-f/--filename suppressionsFileName] [-l/--language mainLanguage] [-m/--main mainFileName] [-h/--help]

[-l/--language] valid arguments:"
		logLanguages
		exit 0
    ;;
    *)    # unknown option
		echo "$1: Unknown option" 2>&1
		exit 1
    ;;
esac
done
