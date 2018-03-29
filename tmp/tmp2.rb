clicks = 'Z:\Muzyka\AudioArt\SonicPi\PoemSymphonique'

#use_random_seed 112  #for 150
use_random_seed 113  #for 600

define :playclicks do
  click = rrand_i(0,11)
  time = rrand(0.4, 1.25)
  location = rrand(-1, 1)
  
  in_thread do
    t = rrand_i(120,130) #150 seconds
    t = rrand_i(240,260) #300
    t = rrand_i(630,660) #600
    locations = (line location, -location, steps: t)
    r = rrand(0.75,1)
    
    t.times do
      sleep time
      sample clicks, click, pan: locations.tick , amp: time*2, rate: r
    end
  end
end

with_fx :reverb, mix: 0.5, room: 0.8 do
  100.times do
    playclicks
  end
end
