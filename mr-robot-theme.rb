
use_bpm 136

live_loop :theme do
  with_fx :reverb, room: 0.4 do
    with_fx :echo, phase: 0.25 do
      with_fx :ixi_techno, phase: 2, res: 0.1  do
        use_synth :subpulse
        play_chord [:g4 ], sustain: 1, pulse_width: 0.3
        sleep 8
        16.times do
          play_chord [:c4, :ab4], sustain: 1, pulse_width: 0.3
          sleep 1.5
          play [ :f4 ], sustain: 1, pulse_width: 0.3
          sleep 2
          sleep 0.5
          sleep 4
          play_chord [:c4, :e4], sustain: 1, pulse_width: 0.3
          sleep 8
          play_chord [:c4, :g4], sustain: 1, pulse_width: 0.3
          sleep 1.5
          play_chord [:eb4 ] ,sustain: 1, pulse_width: 0.3
          sleep 2
          sleep 0.5
          sleep 4
          play_chord [:e4, :g4], sustain: 1, pulse_width: 0.3
          sleep 8
        end
      end
    end
  end
end

#:bb2
amp_a = 0.6
max_amp_a = 1.0
beats = 64
inc_amp_a = max_amp_a / beats
live_loop :bass_line do
  with_fx :flanger, phase: 8 do
    with_fx :reverb, room: 1 do
      use_synth :growl
      sleep 32
      32.times do
        sleep 0.50
        6.times do
          play_chord [:c3 ], amp: amp_a
          #amp_a = amp_a + inc_amp_a
          sleep 0.25
          play_chord [:c3 ], amp: amp_a
          #amp_a = amp_a + inc_amp_a
          sleep 0.25
          play_chord [:c3 ], amp: amp_a
          #amp_a = amp_a + inc_amp_a
          sleep 0.50
        end
        play_chord [:c3 ], amp: amp_a
        #amp_a = amp_a + inc_amp_a
        sleep 0.5
        play_chord [:c3 ], amp: amp_a
        #amp_a = amp_a + inc_amp_a
        sleep 0.5
        play_chord [:c3 ], amp: amp_a
        #amp_a = amp_a + inc_amp_a
        sleep 0.5
        amp_a = amp_a + inc_amp_a
      end
    end
  end
end

live_loop :beats do
  sleep 64
  with_fx :reverb do
    48.times do
      sample :drum_heavy_kick, amp: 2.2
      sleep 1
      sample :drum_snare_soft, amp: 1.2
      sleep 0.5
      sample :drum_heavy_kick, amp: 2.2
      sleep 1
      sample :drum_snare_soft, amp: 1.2
      sleep 1.5
    end
  end
end

"""

live_loop :theme2wip do
  sleep 64
  use_synth :beep
  8.times do
    play_chord [:e4 ], sustain: 1.25
    sleep 1.25
    play_chord [:f4 ], sustain: 0.5
    sleep 0.75
    play_chord [:g4 ], sustain: 0.5
    sleep 0.75
    play_chord [:gb4 ], sustain: 0.5
    sleep 2.25
    play_chord [:e4 ], sustain: 0.5
    sleep 0.75
    play_chord [:f4 ], sustain: 0.5
    sleep 0.75
    play_chord [:e4 ], sustain: 0.5
    sleep 0.75
    sleep 1
  end
end
"""
