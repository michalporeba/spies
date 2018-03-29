use_sample_pack 'Z:\Muzyka\AudioArt\SonicPi\YGasegDdu'

load_sample (:StoneIn)
use_bpm 106

live_loop :tyriyff do
  sync :b1
  with_fx :reverb, mix: 0.05, phase: 0.337 do |x|
    with_fx :bitcrusher, mix: 0.2 do
      sample :YGasegDdu, start: 0.132, finish: 0.154, amp: 0.45, #tyri yff, tyri yff, tyri dal
        pitch: 2
      
      sleep 0.5
      sample :Gajowy, start: 0.152, finish: 0.154, attack: 0.02, release: 0.05
      sleep 0.5
      sample :Gajowy, start: 0.152, finish: 0.1635, attack: 0.02, release: 0.05, amp: 0.5
      
      control x, mix: (line 0.95, 0.05, steps: 6).look
    end
  end
end

stop

play 60
sample :StoneIn, start: 0.02, finish: 0.08, amp: 0.6
sleep 3
sample :StoneIn, start: 0.08, finish: 0.1, amp: 0.6

