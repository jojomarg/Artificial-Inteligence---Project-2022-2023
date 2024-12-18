cell(1, black).
cell(2, white).
cell(3, black).
cell(4, empty).
cell(5, white).
cell(6, black).
cell(7, white).

make_line:- write('------------').

show_cell(N):- cell(N,Z), (Z==black, write('|b'); Z==white, write('|w'); Z==empty, write('|X')).


show_puzzle(N):- make_line, nl, show_cell(1), show_cell(2), show_cell(3), show_cell(4), show_cell(5), show_cell(6), show_cell(7), nl.

move_right_white:- cell(X,empty), X=<6, X1 is X+1, cell(X1,Z), Z==white, retract(cell(X,empty)), assert(cell(X,white)), retract(cell(X1,white)), assert(cell(X1,empty)).
