#!/bin/sh
# Magic to make unquoted variables behave differently
# because dash's parser is ever so slightly faster with unquoted vars
set -f
IFS=

frac_scale=100000
pi=314159
sine_iters=5  # Tuned to be "just accurate enough"
sine() {
    # Designed to be used without a subshell
    acc=0 fact=1 xpow=$1 i=0
    while [ $((i < sine_iters)) = 1 ]; do
        : $((acc += xpow / fact)) \
          $((i += 1)) \
          $((fact *= -2*i * (2*i + 1))) \
          $((xpow = xpow * $1 / frac_scale * $1 / frac_scale))
    done
    sine=$acc
}

wave_str='***** +++ '
wave_pos=0

while true; do
    sine $wave_pos
    spaces=$((20 * (frac_scale + sine) / frac_scale))
    printf '\n%*s%s' $spaces '' $wave_str

    wave_str_end=${wave_str#?}
    wave_str=$wave_str_end${wave_str%"$wave_str_end"}

    : $((wave_pos = (wave_pos + frac_scale/10))) \
      $((wave_pos -= wave_pos > pi ? pi*2 : 0))
    sleep 0.025
done