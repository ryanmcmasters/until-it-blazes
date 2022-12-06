#until it blazes
#eve beglarian

use_bpm 99
use_synth :sine
use_synth_defaults attack: 0, release: 0, sustain: 0.75

#color = [0,64,0,64,0,64,0,64,0,64,0,64,0,64,0,0]
#color = [72, 71, 69, 67, 64]
color = [72,0,71,0,69,0,67,66,64,0]

$t = color.size

a = 1
b = 0.3*a
$d = 0

amp = Array.new(5,b)
amp.insert(0,a)
r = 2

live_loop :until_it do
  with_fx :distortion, distort: $d do
    i = 0
    $t.times do |i|
      amp2 = amp.tick
      with_fx :echo, phase: 0.75 do
        play [color[i]], pan: rrand(-1,0), amp: amp2
      end
      with_fx :echo, phase: 0.5 do
        play [color[i]], pan: rrand(0,1), amp: amp2
      end
      sleep 0.5/r
    end
  end
end

100.times do
  d=0
  $d = $d + 0.01
  sleep 0.01
end