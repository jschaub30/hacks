set_prompt(){
    if [[ -n "${VIRTUAL_ENV}" ]]; then
        python_venv="(🐍 $(basename "${VIRTUAL_ENV}")) "
    elif [[ -n "${CONDA_DEFAULT_ENV}" ]]; then
        python_venv="(🐍 ${CONDA_DEFAULT_ENV}) "
    fi
    DATESTR=$(date +"%H:%M")

    if [[ "$(hostname -s)" == "APT"* ]]; then
        HOST_CHAR=""
    else
        HOST_CHAR=$(hostname -s)
    fi
    PS1="${bold_red}┌─${normal}[${yellow}${DATESTR}|${cyan}\u${normal}@${bold_white}${HOST_CHAR}${normal}]"
    PSCOL="${normal}"
    [[ "${python_venv}" == *"idc"* ]] && PSCOL="${bold_yellow}"
    [[ "${python_venv}" == *"ocr"* ]] && PSCOL="${bold_cyan}"
    [[ "${python_venv}" == *"cli"* ]] && PSCOL="${bold_orange}"
    PS1+=" ${PSCOL}${python_venv}"
    [ -n "$TXT_ENV" ] && PS1+="[${TXT_ENV}]"
    PS1+="\n${bold_red}└─▪${PSCOL}[\w]${normal} "
}
PROMPT_COMMAND='set_prompt'
