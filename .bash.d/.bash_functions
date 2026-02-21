# $1: Version; defaults to 6.7.3
# $2: Path to Qt; defaults to $HOME/Qt
function assistant {
  local version=${1:-6\.7\.3}
  local path=${2:-$HOME/Qt}
  nohup ${path%/}/$version/gcc_64/bin/assistant > /dev/null 2>&1 &
}

