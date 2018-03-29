# Welcome to Sonic Pi v2.10

notes = scale :c, :aeolian, num_oct: 3
a = (ring :c4)
arhythm = (ring 1)


live_loop  :aswitch do
  a1 = (ring :c3, :g3, :c4, :d4)
  a2 = (ring :bf2, :a3)
  
  arhythm = (ring 1, 0.5, 0.5, 0.25, 0.25, 0.25, 0.25)
  
  if (dice(6) == 1)
    a = a2
  else
    a = a1
  end
  sleep 4
end

live_loop :b do
  sync :a
  use_synth :dsaw
  
  in_thread do
    5.times do
      play (ring :f5, :g5, :f6).choose, amp: 0.25
      sleep (ring 0.12, 0.15, 0.17, 0.25).choose
    end
  end
  
  sleep 5
end


with_fx :reverb, mix: 0.5 do
  live_loop :a do
    a.tick
    
    play a.look, mix: 0.2, amp: 1.5 if look % 4 < a.length
    sleep arhythm.look
    
  end
end




