notes = [:e3]

live_loop :structure do
  notes = [:e2, :d3]
  sleep 2
  notes = [:fs2, :d3, :b3]
  sleep 5
  notes = [:e2, :b2, :fs3]
  sleep 3
  notes = [:c2, :bf2, :ef3, :d4]
  sleep 2
end

live_loop :player1 do
  with_fx :echo, amp: 0.25 do
    play choose(notes), attack: 0.02, release: rrand(0.5, 1.5), cutoff: rrand(70, 120), amp: 0.1
    sleep rrand(0.1, 0.5)
  end
end

live_loop :player2 do
  with_fx :echo, amp: 0.25 do
    play choose(notes)+12, attack: 0.02, release: rrand(0.5, 1.5), cutoff: rrand(70, 120), amp: 0.1
    sleep rrand(0.1, 0.5)
  end
end

live_loop :player3 do
  with_fx :echo, amp: 0.25 do
    play choose(notes)+19, attack: 0.02, release: rrand(0.5, 1.5), cutoff: rrand(70, 120), amp: 0.1
    sleep rrand(0.1, 0.5)
  end
end
