%Dictionary to encode and decode the messages
change(hostages, friends).
change(weapon,mobile).
change(weapons,mobiles).
change(bomb,ipad).
change(bombs,ipads).
change(professor, jackson).
change(rio, rose).
change(tokyo, blake).
change(helsinki, helsi).
change(oslo, ola).
change(berlin, barbra).
change(moscow, margo).
change(nairobi, nelly).
change(mint, embassy).
change(find, check).
change(weaklinks, visa).
change(bullets, power_banks).
change(bullet,power_bank).
change(machinegun, iphonexmax).
change(machineguns,iphonexmax).
change(working, dreaming).
change(masterplan, trip).
change(robbery, game).
change(ak47, iphonexs).
change(car_bomb, macpro).
change(car_bombs, macpro).
change(time_bomb, ipadair).
change(handgrenade,ipod).
change(handgrenades,ipods).
change(kg,gb).
change(rdx,pendrive).
change(rob,attend).
change(royalmint,fifa).
change(knock_off,entertain).
change(cops,kids).
change(cop,kid).
change(loaded,spoiled).
change(load,spoil).
change(stuff,luxury).
change(bullets,power_banks).
change(daali, batteries).
change(shot,slapped).
change(daali,us_all).
change(S,S).

% Function to print the List
write_list([]).
write_list([H|T]):-
write(H),
write(' '),
write_list(T).

% Function to decrypt Daali's Hidden Message Based on Length of Message
dec_msg(3,mission_successful).
dec_msg(4,mission_suspended).
dec_msg(5,mission_aborted).
dec_msg(6,help_required).


% To find First Word of the message that mentions name of concerned Daali
dname([H|_],H).


% To find Second Word of the message that mentions Place of mission
place([_,_,H|T],H,T).


% To Decode Rest of Daali's Message Word by Word
decode(A):-
    change(B,A),
    write(B), write(' ').

% To Decode Rest of Daali's Message
rsn([]).
rsn([H|T]):-
    decode(H),
    rsn(T).

% To encode Msg Sent By The Professor
msg_from(professor):-
write('To '),
read(Q),
write('Send Message'),nl,
read(X),
atomic_list_concat(L,' ',X),
alter(L,V),nl,
write('-------------------------------------------'),nl,
write('| Encrypted Message Sent To  '),change(Q,A),write(A),nl,
write('-------------------------------------------'),nl,
write_list(V), nl,
write('----------------------'),nl,
write('From   '),change('professor',O),write(O),nl,
write('-----------------------'),nl.

% To decyrpt messages of Daali's
msg_from(A):-
    write('Send Message'),nl,
    read(X),
    atomic_list_concat(L,' ',X),
    length(L,Len),
    write('----------------------'),nl,
    write('Professor Recieves'),nl,
    write('----------------------'),nl,
    decode(A), write(' says '), dec_msg(Len,Y),write(Y),
    write(' at '), place(L,P,R),decode(P),
    write(' by '),dname(L,N),decode(N),
    write('!'),nl , write('Reason : '), rsn(R)  .

% To encrypt Professor's Message Word By Word
alter([],[]).
alter([H|T],[M|N]):-
change(H,M),
alter(T,N).

message():-
    write('From '),
    read(P), nl,
    msg_from(P).