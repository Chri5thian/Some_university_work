from mido import MidiFile
from midi import MidiConnector

conn = MidiConnector('/dev/serial0')

while True:
    try: #This filters out all non-note data
        for msg in MidiFile('song.mid').play():
            conn.write(msg)

    except AttributeError as error:
        print("Error excepted")
        pass