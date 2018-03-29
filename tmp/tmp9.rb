use_sample_pack 'Z:\Muzyka\AudioArt\SonicPi\YGasegDdu'

load_sample (:YGasegDdu)

use_bpm 106

play 60
sleep 1
play 60
sleep 1
play 60
sleep 1

sample :YGasegDdu, start: 0.8175, finish: 0.84, rate: 0.9
stop
live_loop :g1 do
  with_fx :reverb do |r|
    7.times do
      tick
      sample :YGasegDdu, start: 0.78, finish: 0.79,
        amp: (line 1.0, 0.2, steps: 6).look,
        rate: 1
      sleep 1
      control r, mix: (line 0.0, 1.0, steps: 6).look
    end
  end
  sleep 1.86
  sample :YGasegDdu, start: 0.8175, finish: 0.84, rate: 0.9
end

stop

live_loop :g2 do
  sync :g1
  sleep 5
  with_fx :reverb do |r|
    with_fx :wobble do |e|
      5.times do
        tick
        sample :YGasegDdu, start: 0.78, finish: 0.79,
          amp: (line 1.0, 0.3, steps: 5).look,
          rate: 0.75
        sleep 1
        control r, mix: (line 0.2, 0.8, steps: 5).look
      end
    end
  end
end



stop

sample :YGasegDdu, start: 0.78, finish: 0.86, amp: 1
sleep 9
sample :YGasegDdu, start: 0.1324, finish: 0.157, amp: 1

stop

with_fx :reverb, mix: 0.7 do
  
  live_loop :note1 do
    use_synth :hollow
    play choose([:D4,:E4]), attack: 6, release: 6
    sleep 8
  end
  
  live_loop :note2 do
    use_synth :blade
    play choose([:Fs4,:G4]), attack: 4, release: 5
    sleep 10
  end
  
  live_loop :note3 do
    use_synth :dsaw
    play choose([:A4, :Cs5]), attack: 5, release: 5
    sleep 11
  end
  
end

stop
live_loop :note1 do
  use_synth :blade
  n1 = (ring :e3, :e2, :b2, :b3)
  play n1.tick, attack: 2, release: 3, decay: 2
  sleep 5
end


live_loop :note2 do
  use_synth :blade
  n1 = (ring :e3, :e2, :b2, :b3)
  play n1.tick, attack: 2, release: 4, decay: 2
  sleep 6
end


live_loop :note3 do
  use_synth :hollow
  n1 = (ring :e2, :a2, :g2, :b3)
  play n1.tick, attack: 2, release: 9, decay: 2
  sleep 11
end
#


stop
live_loop :tyriyff do
  with_fx :reverb, mix: 0.05, phase: 0.337 do |x|
    #sleep 2.0/3
    s = sample :YGasegDdu, start: 0.132, finish: 0.157, amp: 1 #tyri yff, tyri yff, tyri dal
    control x, mix: (line 0.05, 0.95, steps: 6).tick
    sleep 3
  end
end