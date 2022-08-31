import mido
from midi import MidiConnector
port = mido.open_input(
    'Launchkey Mini:Launchkey Mini MIDI 1 20:0')  # open USB port
conn = MidiConnector('/dev/serial0')

# code has not been efficiently written. might change it in the future.

while True:
    try:
        for msg in port.iter_pending():
            conn.write(msg)

    except AttributeError as error:
        print("Error excepted")
        pass
