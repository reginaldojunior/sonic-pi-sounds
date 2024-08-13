# PROJECT SETTINGS

use_bpm 118

live_loop :met1 do
  sleep 1
end


# SEQUENCER SETTINGS

define :pattern do |pattern|
  return pattern.ring.tick == "x"
end


# LIVE MIXER (0 = mute, 1 = channel on)

kickon  = 1
hihaton = 1
rimon   = 1

chordon = 1
basson  = 1
bellon  = 1


# DRUMS

live_loop :kick, sync: :met1 do
  with_swing -0.08, 2 do
    sample :bd_tek, rate: 0.8, sustain: 0, release: 0.3, amp: 0.8 if pattern "x---x---x---x---" and kickon == 1
  end
  sleep 0.25
end

live_loop :kick_soft, sync: :met1 do
  with_swing -0.08, 2 do
    sample :bd_tek, rate: 0.7, sustain: 0, release: 0.2, amp: 0.2 if pattern "---------------x---------x------" and kickon == 1
  end
  sleep 0.25
end

live_loop :hh, sync: :met1 do
  with_swing -0.08, 2 do
    sample :drum_cymbal_closed, sustain: 0, release: 0.15, amp: 0.8, rate: 1.1 if pattern "--x---x---x---x-" and hihaton == 1
  end
  sleep 0.25
end

live_loop :hh_short, sync: :met1 do
  with_swing -0.08, 2 do
    sample :drum_cymbal_pedal, sustain: 0, release: 0.05, pan: -0.4, amp: 0.3, start: 0.1 if pattern "--xx--x--xx--x-x" and hihaton == 1
  end
  sleep 0.25
end

with_fx :reverb, damp: 1, mix: 0.3 do
  live_loop :rimshot, sync: :met1 do
    with_swing -0.08, 2 do
      sample :sn_generic, amp: 0.4, sustain: 0, release: 0.10 if pattern "----x-------x---" and rimon == 1
    end
    sleep 0.25
  end
end

live_loop :rimshot2, sync: :met1 do
  with_swing -0.08, 2 do
    sample :elec_filt_snare, sustain: 0, release: 0.10, pan: 0.4, rate: 0.5, amp: 0.2 if pattern "----x--x----x-------x--x-x--x---" and rimon == 1
  end
  sleep 0.25
end


# SIDECHAIN (chords, bass, melody)

with_fx :slicer, phase: 1, wave: 0, invert_wave: 1, mix: 0.9 do
  
  with_fx :level, amp: 0.15 do
    live_loop :housechords1, sync: :met1 do
      use_synth :mod_fm
      with_fx :pitch_shift, pitch: -3.9, reps: 2 do
        play chord(:a3, "m11"), pan: 1, decay: 4, sustain_level: 0, sustain: 0, release: 0.01, divisor: 1, mod_range: 0.2, mod_wave: 3 if chordon == 1
        play chord(:a3, "m11"), pan: -1, decay: 4, sustain_level: 0, sustain: 0, release: 0.01, divisor: 1, mod_range: 0.3, mod_wave: 3 if chordon == 1
        sleep 4
      end
      with_fx :pitch_shift, pitch: 7.1, reps: 4 do
        play chord(:f3, "m11"), pan: 1, decay: 2, sustain_level: 0, sustain: 0, release: 0.01, divisor: 1, mod_range: 0.3, mod_wave: 3 if chordon == 1
        play chord(:f3, "m11"), pan: -1, decay: 2, sustain_level: 0, sustain: 0, release: 0.01, divisor: 1, mod_range: 0.2, mod_wave: 3 if chordon == 1
        sleep 2
      end
      with_fx :pitch_shift, pitch: -1.9, reps: 2 do
        play chord(:f3, "m11"), pan: 1, decay: 4, sustain_level: 0, sustain: 0, release: 0.01, divisor: 1, mod_range: 0.2, mod_wave: 3 if chordon == 1
        play chord(:f3, "m11"), pan: -1, decay: 4, sustain_level: 0, sustain: 0, release: 0.01, divisor: 1, mod_range: 0.3, mod_wave: 3 if chordon == 1
        sleep 4
      end
      with_fx :pitch_shift, pitch: 5.1, reps: 4 do
        play chord(:f3, "m11"), pan: 1, decay: 2, sustain_level: 0, sustain: 0, release: 0.01, divisor: 1, mod_range: 0.3, mod_wave: 3 if chordon == 1
        play chord(:f3, "m11"), pan: -1, decay: 2, sustain_level: 0, sustain: 0, release: 0.01, divisor: 1, mod_range: 0.2, mod_wave: 3 if chordon == 1
        sleep 2
      end
    end
  end
  
  with_fx :ping_pong, phase: 0.75 do
    with_fx :level, amp: 0.2 do
      live_loop :housechords, sync: :met1 do
        use_synth :mod_fm
        2.times do
          play (chord_invert(chord :f3, "m11"), 2), pan: 1, decay: 4, sustain_level: 0, sustain: 0, release: 0.01, divisor: 1, mod_range: 0.2, mod_wave: 3 if chordon == 1
          play chord(:f3, "m11"), pan: -1, decay: 4, sustain_level: 0, sustain: 0, release: 0.01, divisor: 1, mod_range: 0.3, mod_wave: 3 if chordon == 1
          sleep 4
        end
        2.times do
          play (chord_invert(chord :c3, "m11"), 4), pan: 1, decay: 4, sustain_level: 0, sustain: 0, release: 0.01, divisor: 1, mod_range: 0.3, mod_wave: 3 if chordon == 1
          play (chord_invert(chord :c3, "m11"), 3), pan: -1, decay: 4, sustain_level: 0, sustain: 0, release: 0.01, divisor: 1, mod_range: 0.2, mod_wave: 3 if chordon == 1
          sleep 4
        end
        2.times do
          play chord(:Eb3, "m11"), pan: 1, decay: 4, sustain_level: 0, sustain: 0, release: 0.01, divisor: 1, mod_range: 0.2, mod_wave: 3 if chordon == 1
          play chord(:Eb3, "m11"), pan: -1, decay: 4, sustain_level: 0, sustain: 0, release: 0.01, divisor: 1, mod_range: 0.3, mod_wave: 3 if chordon == 1
          sleep 4
        end
        2.times do
          play (chord_invert(chord :Bb2, "m11"), 2), pan: 1, decay: 4, sustain_level: 0, sustain: 0, release: 0.01, divisor: 1, mod_range: 0.3, mod_wave: 3 if chordon == 1
          play (chord_invert(chord :Bb2, "m11"), 5), pan: -1, decay: 4, sustain_level: 0, sustain: 0, release: 0.01, divisor: 1, mod_range: 0.2, mod_wave: 3 if chordon == 1
          sleep 4
        end
      end
    end
  end
  
  with_fx :reverb, room: 1 do
    with_fx :ping_pong, phase: 0.75 do
      with_fx :lpf, cutoff: 130, pre_amp: 1.5 do
        live_loop :lilmelo, sync: :met1 do
          
          define :bellp do |n, m|
            
            sleep 2
            play n + 0.3 if bellon == 1
            sleep 0.1
            play n + 17 if bellon == 1
            sleep 0.4
            play n + 0.2 if bellon == 1
            sleep 0.1
            play n + 12 if bellon == 2
            sleep 0.9
            play m + 0.2 if bellon == 1
            play m + 24 if bellon == 1
            sleep 0.5
            
          end
          
          use_synth :kalimba
          
          bellp 70, 67
          bellp 65, 63
          bellp 67, 65
          bellp 70, 58
          bellp 68, 65
          bellp 63, 61
          bellp 60, 65
          bellp 72, 70
          
        end
      end
    end
  end
  
  live_loop :Bassline, sync: :met1 do
    
    define :basn do |n, r|
      play n, release: r, cutoff: rrand(55, 125) if basson == 1
      sleep r
    end
    
    use_synth :tri
    
    basn 29, 0.75
    basn 34, 0.75
    basn 36, 1
    basn 39, 1
    basn 41, 0.5
    
    basn 29, 0.75
    basn 34, 0.75
    basn 36, 1
    basn 41, 0.5
    basn 39, 0.5
    basn 34, 0.5
    
    basn 29+7, 0.75
    basn 34-5, 0.75
    basn 36-5, 1
    basn 39-5, 1
    basn 39, 0.5
    
    basn 29+7, 0.75
    basn 34+7, 0.75
    basn 36+7, 1
    basn 41-5, 0.5
    basn 39-5, 0.5
    basn 34-5, 0.5
    
    basn 29-2, 0.75
    basn 34-2, 0.75
    basn 36-2, 1
    basn 39-2, 1
    basn 41-2, 0.5
    
    basn 29-2, 0.75
    basn 34-2, 0.75
    basn 36-2, 1
    basn 41-2, 0.5
    basn 39-2, 0.5
    basn 34-2, 0.5
    
    basn 29+5, 0.75
    basn 34-7, 0.75
    basn 36-7, 1
    basn 39-7, 1
    basn 37, 0.5
    
    basn 29+5, 0.75
    basn 34+5, 0.75
    basn 36+5, 1
    basn 41-7, 0.5
    basn 39-7, 0.5
    basn 34-7, 0.5
    
  end
end

with_fx :reverb do
  live_loop :vinylNoise, sync: :met1 do
    sample :vinyl_hiss, amp: 0.15
    sleep sample_duration :vinyl_hiss
  end
end
