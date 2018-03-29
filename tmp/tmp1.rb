scale_a = [60, 67, 68, 80]
scale_b = [60, 60, 61, 62, 63, 65, 68, 73, 81]

avolume = 0.1
bvolume = 0.2
mvolume = 1.0
speed = 1

live_loop :a do
  with_fx :echo do
    use_synth :beep
    play choose(chord(:e3, 'm7+5')), release: 3, cutoff: rrand(60,120), amp: avolume
    
    # use_synth choose([:chiplead, :chipbass, :hollow])
    # play choose(scale_a), release: 1, cutoff: rrand(60,120), amp: 0.2
    # play choose(scale_b), release: 1, cutoff: rrand(60,120), amp: 0.2
    sleep 0.125*speed
  end
end

live_loop :b do
  with_fx :reverb do
    play choose(chord(:e3, 'm7+5'))+0.24, release: 2, cutoff: rrand(60,120), amp: bvolume
    sleep 0.25* (1/speed)
  end
end

live_loop :m do
  with_fx :distortion do
    use_synth :fm
    play choose([:e2, :e4, :a3]), attack: 1, decay: 1, release: 10, amp: mvolume
    sleep 6.25
  end
end

live_loop :midi do
  use_real_time
  c, v = sync "/midi/mpkmini2/0/1/control_change"
  
  avolume = v/127.0 if c == 1
  bvolume = v/127.0 if c == 2
  mvolume = v/127.0 if c == 3
  
  speed = v/127.0+0.8 if c == 4
end
