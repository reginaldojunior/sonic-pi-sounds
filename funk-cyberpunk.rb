use_bpm 100  # Define o ritmo da música, comum no funk
use_synth :fm  # Define o sintetizador para um som mais eletrônico

live_loop :base_funk do
  sample :bd_808, amp: 2  # Batida grave do funk
  sleep 0.5
  sample :sn_dolf, rate: 0.5  # Snare mais lento, cria uma sensação de lofi
  sleep 0.5
end

live_loop :cyber_melody do
  use_synth :dsaw
  play :e2, release: 0.8, cutoff: rrand(70, 130)  # Baixo eletrônico que é comum no cyberpunk
  sleep 0.75
  play :e1, release: 0.6, cutoff: rrand(60, 120)
  sleep 0.75
end

live_loop :chords do
  use_synth :prophet
  play chord(:e3, :minor), release: 2, attack: 0.5, cutoff: 80  # Acordes atmosféricos no estilo lofi
  sleep 2
  play chord(:b2, :minor), release: 2, attack: 0.5, cutoff: 80
  sleep 2
end

live_loop :hi_hats do
  sample :drum_cymbal_closed, rate: 1.5, amp: 0.3, start: 0.1, finish: 0.5  # Hi-hats rápidos, comuns no funk
  sleep 0.25
end

live_loop :vocal_fx do
  sample :loop_mehackit1, rate: 0.8, start: 0.3, finish: 0.5, amp: 0.4  # Efeitos de voz para dar uma textura cyberpunk
  sleep 8
end

live_loop :atmosphere do
  with_fx :reverb, mix: 0.7, room: 0.8 do
    sample :ambi_haunted_hum, rate: 0.5, amp: 0.6, attack: 1, release: 2  # Sons de fundo para uma sensação mais imersiva
    sleep 16
  end
end

