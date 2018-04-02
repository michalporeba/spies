class LaunchControlChannel
    def initialize
      @values = Array.new(5) { 0.0 }
    end
    
    def setvalue(controlIndex, value)
      @values[controlIndex] = (value > 1 ? value/127.0 : 0.0)
    end
    
    def getvalue(controlIndex)
      return @values[controlIndex]
    end
  end
  
  class LaunchControl
    def initialize
      @channels = Array.new(8) { LaunchControlChannel.new }
    end
    
    def setvalue(control, value)
      channelIndex = (control / 10)-1
      controlIndex = (control % 10)
      
      @channels[channelIndex].setvalue(controlIndex, value) if ((0..8) === channelIndex and (0..3) === controlIndex)
    end
    
    def getvalue(channel, control, min, max)
      value = 0.0
      case control
      when :v, :vol, :volume
        value = @channels[channel].getvalue(0)
      when :a, :p1
        value = @channels[channel].getvalue(1)
      when :b, :p2
        value = @channels[channel].getvalue(2)
      when :c, :p3
        value = @channels[channel].getvalue(3)
      end
      
      return min + (max-min) * value
    end
    
  end
  
  $launchControl = LaunchControl.new if !$launchControl
  
  live_loop :launchcontrolxl do
    use_real_time
    c, v = sync "/midi/launch_control_xl/0/5/control_change"
    puts c, v
    $launchControl.setvalue(c,v)
  end
  
  live_loop :out do
    speed = 1
    
    unless ($launchControl.nil?)
      r = 1.0+rrand(0.0, 1.0)*$launchControl.getvalue(0, :p3, 0.0, 0.2)
      volume = r*$launchControl.getvalue(0, :vol, 0.2, 1.0)
      speed = r*$launchControl.getvalue(0, :p1, 1.2, 0.075)
      note = r*$launchControl.getvalue(0, :p2, 40, 80)
      
      puts r
      
      play note, amp: volume
    end
    
    sleep speed + 0.1
  end
  