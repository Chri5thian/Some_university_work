from mido import MidiFile
import pigpio
from numpy import interp
pi1 = pigpio.pi()


pi1.set_PWM_frequency(2, 8000)  # sets gpio2 at 8000Hz

while True:
    try:  # This filters out all non-note data
        for msg in MidiFile('song.mid').play():
            if msg.note in range(48, 73):
                notes = interp(msg.note, [48, 72], [14, 254])
                if(msg.type == 'note_on'):  # if it is Note On message
                    # start signal for note on
                    pi1.set_PWM_dutycycle(2, 1)  # sets dutycycle to 1/255
                    # filter the data by note number
                    print("ON", end=" ")
                    # sets dutycycle to msg.note/255 where msg.note is the midi number of the note.
                    pi1.set_PWM_dutycycle(2, notes)
                    print(msg.note)

                elif(msg.type == 'note_off'):  # if the message is not Note On (e.g. Note Off)
                    # start signal for note_off
                    pi1.set_PWM_dutycycle(2, 2)
                    print("OFF", end=" ")

                    pi1.set_PWM_dutycycle(2, notes)
                    print(msg.note)

                elif(msg.type == "control_change"):  # the 8 knobs of the midi controller
                    # Start signal for control
                    value = interp(msg.value, [0, 255], [14, 254])
                    if msg.control == 21:  # knob 1
                        pi1.set_PWM_dutycycle(2, 3)
                        pi1.set_PWM_dutycycle(2, value)
                        print("control: ", msg.control, end=" ")
                        print("MOD: ", msg.value)

                    elif msg.control == 22:  # knob 2
                        pi1.set_PWM_dutycycle(2, 4)
                        pi1.set_PWM_dutycycle(2, value)
                        print("control: ", msg.control, end=" ")
                        print("MOD: ", msg.value)

                    elif msg.control == 23:  # knob 3
                        pi1.set_PWM_dutycycle(2, 5)
                        pi1.set_PWM_dutycycle(2, value)
                        print("control: ", msg.control, end=" ")
                        print("MOD: ", msg.value)

                    elif msg.control == 24:  # knob 4
                        pi1.set_PWM_dutycycle(2, 6)
                        pi1.set_PWM_dutycycle(2, value)
                        print("control: ", msg.control, end=" ")
                        print("MOD: ", msg.value)

                    elif msg.control == 25:  # knob 5
                        pi1.set_PWM_dutycycle(2, 7)
                        pi1.set_PWM_dutycycle(2, value)
                        print("control: ", msg.control, end=" ")
                        print("MOD: ", msg.value)

                    elif msg.control == 26:  # knob 6
                        pi1.set_PWM_dutycycle(2, 8)
                        pi1.set_PWM_dutycycle(2, value)
                        print("control: ", msg.control, end=" ")
                        print("MOD: ", msg.value)

                    elif msg.control == 27:  # knob 7
                        pi1.set_PWM_dutycycle(2, 9)
                        pi1.set_PWM_dutycycle(2, value)
                        print("control: ", msg.control, end=" ")
                        print("MOD: ", msg.value)

                    elif msg.control == 28:  # knob 8
                        pi1.set_PWM_dutycycle(2, 10)
                        pi1.set_PWM_dutycycle(2, value)
                        print("control: ", msg.control, end=" ")
                        print("MOD: ", msg.value)

                    # left button of the controller. will be used for mux waveforms.
                    elif msg.control == 106:
                        pi1.set_PWM_dutycycle(2, 11)
                        pi1.set_PWM_dutycycle(2, value)
                        print("control: ", msg.control, end=" ")
                        print("MOD: ", msg.value)
                    elif msg.control == 107:  # right button of the controller
                        pi1.set_PWM_dutycycle(2, 12)
                        pi1.set_PWM_dutycycle(2, value)
                        print("control: ", msg.control, end=" ")
                        print("MOD: ", msg.value)

    except AttributeError as error:
        print("Error excepted")
        pass
