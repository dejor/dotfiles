#!/usr/bin/env sh
while [[ $# -gt 0 ]]; do
  case $1 in
    -S|--stow)
      OPERTATION="--stow" # install / link
      shift
      ;;
    -D|--delete)
      OPERTATION="--delete"
      shift
      ;;
    -R|--restow)
      OPERTATION="--restow" # delete and stow
      shift
      ;;
    -*|--*)
      echo "Unknown option $1"
      exit 1
      ;;
    *)
      POSITIONAL_ARGS+=("$1") # save positional arg
      shift
      ;;
  esac
done

set -- "${POSITIONAL_ARGS[@]}" # restore positional parameters

[ -z $OPERTATION ] && echo true && OPERTATION="--stow" # set default operation (install / link)


if [ -z $POSITIONAL_ARGS ] || [ $POSITIONAL_ARGS == "all" ]
then
  [[ "${#POSITIONAL_ARGS[@]}" -ne "${POSITIONAL_ARGS}" ]] && echo "argument all is exclusive" && exit 1
  STOW_PACKAGES=$(ls -d  */)
else
  STOW_PACKAGES=${POSITIONAL_ARGS[@]}
fi

printf '%s\n' "${OPERTATION}: ${STOW_PACKAGES}" | paste -sd ' ' -

stow --target="$HOME" $OPERTATION $STOW_PACKAGES
