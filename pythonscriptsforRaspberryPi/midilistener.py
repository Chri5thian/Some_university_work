import mido

with mido.open_input('Launchkey Mini:Launchkey Mini MIDI 1 20:0') as port:
    for msg in port:
        print(msg)