notes = [:e3]
amp_line = line 0.05, 0.3, steps: 7
a = 0.05
breaker = false

live_loop :structure do
  notes = [:e2, :d3]
  sleep 2
  notes = [:fs2, :d3, :b3]
  sleep 5
  notes = [:e2, :b2, :fs3]
  sleep 3
  notes = [:c2, :bf2, :ef3, :d4]
  sleep 2
    
  if look > 7
    stop
    breaker = true
  end
  
  a = amp_line.tick
end

live_loop :player1 do
  with_fx :echo, amp: 0.25 do
    play choose(notes), attack: 0.02, release: rrand(0.5, 1.5), cutoff: rrand(70, 120), amp: 0.1 + a
    sleep rrand(0.5, 1)
  end
  #stop if breaker = true
end

live_loop :player2 do
  with_fx :echo, amp: 0.25 do
    play choose(notes)+12, attack: 0.02, release: rrand(0.5, 1.5), cutoff: rrand(70, 120), amp: 0.1 + a
    sleep rrand(0.5, 1)
  end
  #stop if breaker = true
end

live_loop :player3 do
  with_fx :echo, amp: 0.25 do
    play choose(notes)+19, attack: 0.02, release: rrand(0.5, 1.5), cutoff: rrand(70, 120), amp: 0.1 + a
    sleep rrand(0.5, 1)
  end
  #stop if breaker = true
end
