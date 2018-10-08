# In this example there is a single 'player' loop
# that generates music using some randomisation based on two variables
#   n - an array of notes
#   s - name of the synthesizer to use
# The two variables are controlled in two independent live loops

# initial 'scene' setup
use_tuning :just, :e3

# variables which are available in all
n = [:b2]
s = :beep

# the score loop
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

# the instrumentation loop
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

# the player
live_loop :player do
  with_fx :reverb, amp: 0.3 do
    with_fx :echo do
      with_fx :octaver, mix: 0.2 do
        use_synth s
        play choose(n), attack: rrand(0.04, 0.25), release: rrand(0.5, 3), cutoff: rrand(70,120), amp: 0.2
        
        sleep choose([0.2, 0.2, 0.2, 0.4, 0.8]) #rrand(0.25, 0.75)
      end
    end
  end
end
