require print && require printf && return 1

# rfc2396 url encoding (by Bart Schaefer)
function @urlencode() {
  setopt localoptions extendedglob
  input=( ${(s::)1} )
  print ${(j::)input/(#b)([^A-Za-z0-9_.--version\'\(\)-])/%$(([##16]#match))}
}

# http://unix.stackexchange.com/questions/269077/tput-setaf-color-table-how-to-determine-color-codes
function @fromhex(){
  hex=${1#"#"}
  r=$(printf '0x%0.2s' "$hex")
  g=$(printf '0x%0.2s' ${hex#??})
  b=$(printf '0x%0.2s' ${hex#????})
  printf '%03d\n' "$(( (r<75?0:(r-35)/40)*6*6 +
                     (g<75?0:(g-35)/40)*6   +
                     (b<75?0:(b-35)/40)     + 16 ))"
}

function @tohex(){
  dec=$(($1%256))   ### input must be a number in range 0-255.
  if [ "$dec" -lt "16" ]; then
    bas=$(( dec%16 ))
    mul=128
    [ "$bas" -eq "7" ] && mul=192
    [ "$bas" -eq "8" ] && bas=7
    [ "$bas" -gt "8" ] && mul=255
    a="$((  (bas&1)    *mul ))"
    b="$(( ((bas&2)>>1)*mul ))"
    c="$(( ((bas&4)>>2)*mul ))"
    printf 'dec= %3s basic= #%02x%02x%02x\n' "$dec" "$a" "$b" "$c"
  elif [ "$dec" -gt 15 ] && [ "$dec" -lt 232 ]; then
    b=$(( (dec-16)%6  )); b=$(( b==0?0: b*40 + 55 ))
    g=$(( (dec-16)/6%6)); g=$(( g==0?0: g*40 + 55 ))
    r=$(( (dec-16)/36 )); r=$(( r==0?0: r*40 + 55 ))
    printf 'dec= %3s color= #%02x%02x%02x\n' "$dec" "$r" "$g" "$b"
  else
    gray=$(( (dec-232)*10+8 ))
    printf 'dec= %3s  gray= #%02x%02x%02x\n' "$dec" "$gray" "$gray" "$gray"
  fi
}