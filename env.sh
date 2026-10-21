export PROJ="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
export PIXI_HOME="$PROJ/.pixi-home"

export PIXI_CACHE_DIR="$PROJ/.cache/pixi"

export XDG_CACHE_HOME="$PROJ/.cache"

export XDG_CONFIG_HOME="$PROJ/.config"

export PATH="$PIXI_HOME/bin:$PROJ/localcolabfold/.pixi/envs/default/bin:$PATH"

