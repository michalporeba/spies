# use_tuning :just, :e3

n = [:b2]
s = :beep

live_loop :player do
  with_fx :echo do
    with_fx :octaver, mix: 0.1 do
      use_synth s
      play choose(n), attack: 0.05, release: rrand(0.5, 3), cutoff: rrand(70,120), amp: 0.2
      
      sleep choose([0.2, 0.2, 0.2, 0.4, 0.8]) #rrand(0.25, 0.75)
    end
  end
end



live_loop :score do
  n = [:b2, :cs3, :e4, :fs4]
  sleep 4
  n = [:b1, :b2, :b3]
  sleep 1
  n = [:d2, :a2, :e3, :b3]
  sleep 4
  n = [:b1, :b2, :b3]
  sleep 1
  n = [:b2, :cs3, :e4, :fs4]
  sleep 4
  n = [:b1, :b2, :b3]
  sleep 1
  n = [:fs2, :cs3, :d3, :a3]
  sleep 2
  n = [:b1, :b2, :b3]
  sleep 1
  n = [:f2, :c3, :ds3, :as3]
  sleep 2
end

live_loop :sound do
  s = :beep
  sleep 3
  s = :blade
  sleep 1
  s = :beep
  sleep 2
  s = :dtri
  sleep 1
end