library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
package notes_freq_counts is

	--Octave1
	constant C1 : integer := 2986;	 -- frequency:	32 Hz
	constant Cs1 : integer := 2818;	 -- frequency:	34 Hz
	constant D1 : integer := 2660;	 -- frequency:	36 Hz
	constant Ds1 : integer := 2511;	 -- frequency:	38 Hz
	constant E1 : integer := 2370;	 -- frequency:	41 Hz
	constant F1 : integer := 2237;	 -- frequency:	43 Hz
	constant Fs1 : integer := 2111;	 -- frequency:	46 Hz
	constant G1 : integer := 1993;	 -- frequency:	48 Hz
	constant Gs1 : integer := 1881;	 -- frequency:	51 Hz
	constant A1 : integer := 1775;	 -- frequency:	55 Hz
	constant As1 : integer := 1675;	 -- frequency:	58 Hz
	constant B1 : integer := 1581;	 -- frequency:	61 Hz

	--Octave2
	constant C2 : integer := 1493;	 -- frequency:	65 Hz
	constant Cs2 : integer := 1409;	 -- frequency:	69 Hz
	constant D2 : integer := 1330;	 -- frequency:	73 Hz
	constant Ds2 : integer := 1255;	 -- frequency:	77 Hz
	constant E2 : integer := 1185;	 -- frequency:	82 Hz
	constant F2 : integer := 1118;	 -- frequency:	87 Hz
	constant Fs2 : integer := 1055;	 -- frequency:	92 Hz
	constant G2 : integer := 996;	 -- frequency:	97 Hz
	constant Gs2 : integer := 940;	 -- frequency:	103 Hz
	constant A2 : integer := 887;	 -- frequency:	110 Hz
	constant As2 : integer := 837;	 -- frequency:	116 Hz
	constant B2 : integer := 790;	 -- frequency:	123 Hz

	--Octave3
	constant C3 : integer := 746;	 -- frequency:	130 Hz
	constant Cs3 : integer := 704;	 -- frequency:	138 Hz
	constant D3 : integer := 665;	 -- frequency:	146 Hz
	constant Ds3 : integer := 627;	 -- frequency:	155 Hz
	constant E3 : integer := 592;	 -- frequency:	164 Hz
	constant F3 : integer := 559;	 -- frequency:	174 Hz
	constant Fs3 : integer := 527;	 -- frequency:	184 Hz
	constant G3 : integer := 498;	 -- frequency:	195 Hz
	constant Gs3 : integer := 470;	 -- frequency:	207 Hz
	constant A3 : integer := 443;	 -- frequency:	220 Hz
	constant As3 : integer := 418;	 -- frequency:	233 Hz
	constant B3 : integer := 395;	 -- frequency:	246 Hz

	--Octave4
	constant C4 : integer := 373;	 -- frequency:	261 Hz
	constant Cs4 : integer := 352;	 -- frequency:	277 Hz
	constant D4 : integer := 332;	 -- frequency:	293 Hz
	constant Ds4 : integer := 313;	 -- frequency:	311 Hz
	constant E4 : integer := 296;	 -- frequency:	329 Hz
	constant F4 : integer := 279;	 -- frequency:	349 Hz
	constant Fs4 : integer := 263;	 -- frequency:	369 Hz
	constant G4 : integer := 249;	 -- frequency:	391 Hz
	constant Gs4 : integer := 235;	 -- frequency:	415 Hz
	constant A4 : integer := 221;	 -- frequency:	440 Hz
	constant As4 : integer := 209;	 -- frequency:	466 Hz
	constant B4 : integer := 197;	 -- frequency:	493 Hz

	--Octave5
	constant C5 : integer := 186;	 -- frequency:	523 Hz
	constant Cs5 : integer := 176;	 -- frequency:	554 Hz
	constant D5 : integer := 166;	 -- frequency:	587 Hz
	constant Ds5 : integer := 156;	 -- frequency:	622 Hz
	constant E5 : integer := 148;	 -- frequency:	659 Hz
	constant F5 : integer := 139;	 -- frequency:	698 Hz
	constant Fs5 : integer := 131;	 -- frequency:	739 Hz
	constant G5 : integer := 124;	 -- frequency:	783 Hz
	constant Gs5 : integer := 117;	 -- frequency:	830 Hz
	constant A5 : integer := 110;	 -- frequency:	880 Hz
	constant As5 : integer := 104;	 -- frequency:	932 Hz
	constant B5 : integer := 98;	 -- frequency:	987 Hz

	--Octave6
	constant C6 : integer := 93;	 -- frequency:	1046 Hz
	constant Cs6 : integer := 88;	 -- frequency:	1108 Hz
	constant D6 : integer := 83;	 -- frequency:	1174 Hz
	constant Ds6 : integer := 78;	 -- frequency:	1244 Hz
	constant E6 : integer := 74;	 -- frequency:	1318 Hz
	constant F6 : integer := 69;	 -- frequency:	1396 Hz
	constant Fs6 : integer := 65;	 -- frequency:	1479 Hz
	constant G6 : integer := 62;	 -- frequency:	1567 Hz
	constant Gs6 : integer := 58;	 -- frequency:	1661 Hz
	constant A6 : integer := 55;	 -- frequency:	1760 Hz
	constant As6 : integer := 52;	 -- frequency:	1864 Hz
	constant B6 : integer := 49;	 -- frequency:	1975 Hz

	--Octave7
	constant C7 : integer := 46;	 -- frequency:	2093 Hz
	constant Cs7 : integer := 44;	 -- frequency:	2217 Hz
	constant D7 : integer := 41;	 -- frequency:	2349 Hz
	constant Ds7 : integer := 39;	 -- frequency:	2489 Hz
	constant E7 : integer := 37;	 -- frequency:	2637 Hz
	constant F7 : integer := 34;	 -- frequency:	2793 Hz
	constant Fs7 : integer := 32;	 -- frequency:	2959 Hz
	constant G7 : integer := 31;	 -- frequency:	3135 Hz
	constant Gs7 : integer := 29;	 -- frequency:	3322 Hz
	constant A7 : integer := 27;	 -- frequency:	3520 Hz
	constant As7 : integer := 26;	 -- frequency:	3729 Hz
	constant B7 : integer := 24;	 -- frequency:	3951 Hz

	--Octave8
	constant C8 : integer := 23;	 -- frequency:	4186 Hz
	constant Cs8 : integer := 22;	 -- frequency:	4434 Hz
	constant D8 : integer := 20;	 -- frequency:	4698 Hz
	constant Ds8 : integer := 19;	 -- frequency:	4978 Hz
	constant E8 : integer := 18;	 -- frequency:	5274 Hz
	constant F8 : integer := 17;	 -- frequency:	5587 Hz
	constant Fs8 : integer := 16;	 -- frequency:	5919 Hz
	constant G8 : integer := 15;	 -- frequency:	6271 Hz
	constant Gs8 : integer := 14;	 -- frequency:	6644 Hz
	constant A8 : integer := 13;	 -- frequency:	7040 Hz
	constant As8 : integer := 13;	 -- frequency:	7458 Hz
	constant B8 : integer := 12;	 -- frequency:	7902 Hz

end notes_freq_counts;
package body notes_freq_counts is
end notes_freq_counts;
