use_bpm 90
use_synth :blade

# Bassline
live_loop :bass do
  use_synth :fm
  play :e2, release: 0.5, cutoff: 80
  sleep 0.5
  play :e1, release: 0.5, cutoff: 80
  sleep 0.5
end

# Drums
live_loop :drums do
  sample :bd_haus, amp: 2, cutoff: 100
  sleep 0.5
  sample :elec_snare, amp: 0.7
  sleep 0.5
end

# High-pitched electronic lead
live_loop :lead do
  use_synth :prophet
  play :e4, release: 0.25, cutoff: 100, amp: 0.6
  sleep 0.5
  play :e3, release: 0.25, cutoff: 100, amp: 0.6
  sleep 0.5
  play :g4, release: 0.25, cutoff: 100, amp: 0.6
  sleep 0.5
  play :e3, release: 0.25, cutoff: 100, amp: 0.6
  sleep 0.5
end

# Ambient noise
live_loop :noise do
  with_fx :reverb, mix: 0.6, room: 1 do
    sample :ambi_haunted_hum, amp: 0.5, rate: 0.5
    sleep 8
  end
end

