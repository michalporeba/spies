notes = [:c2, :cs2]
rhythm = [0.2]
playerstop = false

use_synth :dsaw

live_loop :player do
  with_fx :reverb, amp: 0.5 do
    with_fx :echo, amp: 0.3, phase: 0.15 do
      
      play choose(notes), attack: 0.02, release: rrand(0.8, 2.2), cutoff: rrand(70, 120), amp: 0.1
      sleep choose(rhythm)
      
      stop if playerstop
    end
  end
end

sleep 10
notes = [:c2, :cs2, :f2]
rhythm = [0.2, 0.3]
sleep 6
notes = [:fs2, :d3, :ds3, :b3]
rhythm = [0.15, 0.2, 0.5]
sleep 4
notes = [:e2, :fs2, :b3]
rhythm = [0.2, 0.3, 0.7]
sleep 6
notes = [:c2, :bf2, :ef3, :d4]
rhythm = [0.2]
sleep 10
notes = [:c2, :cs3, :f4]
rhythm = [0.3]
sleep 4
notes = [:cs2, :c3, :cs4, :f4]
rhythm = [0.25]
sleep 3
notes = [:d2, :c4, :cs4, :f4]
rhythm = [0.2]
sleep 2
notes = [:d2, :fs4]
rhythm = [0.175]
sleep 5
notes = [:c2, :cs2]
rhythm = [0.15]
sleep 5

playerstop = true
