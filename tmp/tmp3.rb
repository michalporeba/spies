# resonant frequency lift
def rfl(cycles: 100, first: 100, last: 200, amp: 0.2, spacing: 0.125, spacing_wobble: 0.0, monics: [0.0, 100.0, 200.0, 300.0, 400.0], resistance: 0.8, attack: 0.25, release: 2)
    return if cycles == 0
    
    amps = amp.kind_of?(Array) ? amp : [amp]
    
    step = (last-first).to_f/cycles
    base = first
    
    cycles.times do |i|
      panvalue = rrand(-0.25, 0.25)
      fq = base+choose(monics)
      play hz_to_midi(fq), attack: attack, release: release, amp: amps[0], pan: panvalue
      
      monics.each { |m|
        feedback = 1-((((fq / (m+first)) % 1)-0.5).abs()-0.5).abs() if m > 0
        if (feedback && feedback > resistance)
          play hz_to_midi(m), release: release*3, amp: amps[1]*feedback, attack: attack*3, pan: panvalue if amps.length > 1
          play hz_to_midi(m*2), release: release*3, amp: amps[2]*feedback, attack: attack*4, pan: panvalue if amps.length > 2
          play hz_to_midi(m*4), release: release*3, amp: amps[3]*feedback, attack: attack*5, pan: panvalue if amps.length > 3
          play hz_to_midi(m*8), release: release*3, amp: amps[4]*feedback, attack: attack*6, pan: panvalue if amps.length > 4
        end
      }
      
      base += step
      
      sleep spacing+rrand(0.0, spacing_wobble)
    end
  end
  
  def rfl2(cycles: 100, first: 100, last: 200, amp: 0.2, spacing: 0.125, spacing_wobble: 0.0, monics: [1.0, 0.95, 0.9, 0.85, 0.8], resistance: 0.8, attack: 0.25, release: 2)
    return if cycles == 0
    
    amps = amp.kind_of?(Array) ? amp : [amp]
    
    step = (last-first).to_f/cycles
    base = first
    
    cycles.times do |i|
      panvalue = rrand(-0.25, 0.25)
      fq = base*choose(monics)
      puts fq
      play hz_to_midi(fq), attack: attack, release: release, amp: amps[0], pan: panvalue
      
      monics.each { |m|
        feedback = 1-((((first*m / fq) % 1)-0.5).abs()-0.5).abs() if m > 0
        
        if (feedback && feedback > resistance)
          play hz_to_midi(first*m), release: release*3, amp: amps[1]*feedback, attack: attack*3, pan: panvalue if amps.length > 1
          play hz_to_midi(first*m*2), release: release*3, amp: amps[2]*feedback, attack: attack*4, pan: panvalue if amps.length > 2
          play hz_to_midi(first*m*3), release: release*3, amp: amps[3]*feedback, attack: attack*5, pan: panvalue if amps.length > 3
          play hz_to_midi(first*m*4), release: release*3, amp: amps[4]*feedback, attack: attack*6, pan: panvalue if amps.length > 4
        end
      }
      
      base += step
      
      sleep spacing+rrand(0.0, spacing_wobble)
    end
  end
  
  
  use_synth :dtri
  
  #rfl cycles: 20, first: 100, last: 100, amp: [0.1, 0.4, 0.3, 0.2], attack: 0.1, release: 0.3, spacing: 0.5, spacing_wobble: 1
  
  #with_fx :reverb, amp: 0.5 do
  rfl cycles: 50, first: 100, last: 100, amp: [0.3, 0.1, 0.1]
  rfl2 cycles: 50, first: 1000, last: 1500, amp: [0.1, 0.1]
  rfl2 cycles: 50, first: 150, last: 100 #, amp: [0.3, 0.1, 0.1]
  rfl2 cycles: 20, first: 100, last: 100 #, amp: [0.1, 0.4, 0.3, 0.2], attack: 0.1, release: 0.3, spacing: 0.5
  #end
  
  #rfl2 cycles: 50, first: 100, last: 1500, monics: [0.0, 80.0, 130.0, 190.0], amp: [0.1, 0.1]
  #rfl2 cycles: 50, first: 150, last: 100, amp: [0.3, 0.1, 0.1]
  #rfl2 cycles: 20, first: 100, last: 100, amp: [0.1, 0.4, 0.3, 0.2], attack: 0.1, release: 0.3, spacing: 0.5
  
  
  
  #base = 1500
  #max = 2000
  #monics = [0.0, 50.0, 70.0, 130.0, 190.0]
  #steps = (1..9)
  
  #use_debug false
  
  #live_loop :a do
  # use_synth :dtri
  
  # cycle = tick
  
  # puts cycle
  
  #  max = 500 if cycle == 120
  #  max = 2000 if cycle == 200
  
  #  base = 400 if cycle == 100
  #  base = 80 if cycle == 180
  #  base = 100 if cycle == 200
  
  #  base += choose(steps) if (base < max)
  #  base = 100 if (base >= max)
  
  # monics = [0.0, 80.0, 160.0, 240.0, 480.0] if cycle > 200
  # monics = [0.0, 100.0, 200.0, 300.0, 400.0] if cycle > 250
  
  #  with_fx :reverb do
  #    fq = base+choose(monics)
  #    play hz_to_midi(fq), release: 2, amp: 0.3, attack: 0.025
  
  #    monics.each { |x|
  
  # resonans = 1-((((fq / x) % 1)-0.5).abs()-0.5).abs() if x > 0
  #sensitivity = 1 - (cycle / 1000) if cycle < 250
  #sensitivity = 0.8
  #if (resonans && resonans > sensitivity)
  #  play hz_to_midi(x), release: 5, amp: 0.2*resonans, attack: 1
  #  play hz_to_midi(x*2), release: 4, amp: 0.05*resonans, attack: 2
  #  play hz_to_midi(x*4), release: 6, amp: 0.05*resonans, attack: 3
  #end
  #}
  #sleep rrand(0.125, 0.150)
  #end
  #end
  
  