#! bash oh-my-bash.module

function _omb_theme_PROMPT_COMMAND() {
  # local arrow="${_omb_prompt_bold_blue} ♠${_omb_prompt_reset_color}"
  local arrow="${_omb_prompt_bold_green}  ${_omb_prompt_reset_color}"
  local base_directory="${_omb_prompt_bold_green}\w${_omb_prompt_reset_color}"
  local GIT_THEME_PROMPT_PREFIX="${_omb_prompt_bold_purple}  ${_omb_prompt_bold_yellow}"
  local SCM_THEME_PROMPT_SUFFIX="${_omb_prompt_bold_purple} ${_omb_prompt_reset_color}"
  local SCM_THEME_PROMPT_CLEAN="${_omb_prompt_bold_green} ✔${_omb_prompt_reset_color}"
  local SCM_THEME_PROMPT_DIRTY="${_omb_prompt_bold_red} ✘${_omb_prompt_reset_color}"

  PS1="${arrow} ${base_directory} "

  local python_venv
  _omb_prompt_get_python_venv
  PS1+=$python_venv

  local scm_info=$(scm_prompt_info)
  PS1+=${scm_info:+$scm_info }
  PS1+=$_omb_prompt_normal
}

_omb_util_add_prompt_command _omb_theme_PROMPT_COMMAND
