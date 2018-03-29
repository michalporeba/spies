# Welcome to Sonic Pi v2.10

use_sample_pack 'Z:\Muzyka\AudioArt\SonicPi\YGasegDdu'

load_sample (:YGasegDdu)

use_bpm 106
live_loop :r do
  sleep 0.9
  play :e2
  sleep 1.2
  play :e3
  sleep 1.1
  play :e5
end

live_loop :tyriyff do
  sync :r
  with_fx :reverb, mix: 0.05, phase: 0.337 do |x|
    #sleep 2.0/3
    s = sample :YGasegDdu, start: 0.132, finish: 0.157, amp: 1 #tyri yff, tyri yff, tyri dal
    control x, mix: (line 0.05, 0.95, steps: 6).tick
    sleep 3
  end
end

live_loop :miges do
  sync :r
  with_fx :reverb do
    sleep 1
    sample :YGasegDdu, start: 0.132, finish: 0.157, amp: 0.5, rate: 2
    sleep 5
  end
end

live_loop :rub do
  
  sync :r
  sleep 2.8
  sample :YGasegDdu, start: 0.132, finish: 0.157, amp: 1, rate: 0.75
  sleep 9
end

#sample :YGasegDdu, start: 0.13, finish: 0.2