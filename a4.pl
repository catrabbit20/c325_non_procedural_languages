%Question 1:


 


count(N, M, X):-
    between(N, M, X).




fourSquares(N, [S1, S2, S3, S4]):-
    count(0, N, S1), 
    count(S1, N, S2), 
    count(S2, N, S3), 
    count(S3, N, S4), 
    N is ((S1 * S1) + (S2 * S2) + (S3 * S3) + (S4 * S4)).  



%invlogBN(N, B, X, Ans):-
%    Ans is (log(N, X) / log(B, X)).
%calcIndexPair(LengthFull, LengthElements, Index, Ans):-
%    Ans is (ceiling(logbN((G, 2, _)))      , G is LengthElements/LengthFull).

%qustion 2:







add_to_list([],[],_).

add_to_list([X | List], [X2 | List2], Value):-
    add_to_list(List, List2, Value),
    X2 is X + Value.
    

helpersum([F|L1], L2):-
    (add_to_list(L1, L2, F)).


cartsum([_|[]], []).

cartsum([F|L1], L2):-
    append(C, C2, L2) ,  helpersum([F|L1], C)            ,cartsum(L1, C2)  ,! .




calcpairs(L, Ans):-
     findall(L2, (length(L, N), between(0, N, L2)), Ans).






add_to_append([],[],_).

add_to_append([X | List], [X2 | List2], Element):-
    add_to_append(List, List2, Element),
    X2 = [Element,X].


helperappend([F|L1], L2):-
    (add_to_append(L1, L2, F)).


appendsum([_|[]], []).
%appendsum([_|[_]], []).



appendsum([F|L1], L2):-
    L1 \= [], append(C, C2, L2) ,  helperappend([F|L1], C)            ,appendsum(L1, C2)  ,! .







firstmatch(_,[],[]).


firstmatch(_,[_],[]).

firstmatch([F|_], [[F1,F2] |R], Answer):-
    Answer = [[F] ,[F1, F2]], F is F1 + F2, !;    
    firstmatch([F|_], R, Answer).
    
    


remove_elements([[Singleton], [D1,D2]], Slist, DlistElements,  NewSlist, NewDlistElements ):-
    select(Singleton,Slist,NewSlist), 
    %Select([D1,D2], Dlist, NewDlist), 
    select(D1,DlistElements, DLE1),
    select(D2,DLE1, NewDlistElements), !.









%onestep(Slist, Llist, NewSlist, NewLlist, X):-
%    appendsum(Llist, Dlist),
%    firstmatch(Slist, Dlist, X),
%    remove_elements(X, Slist, Llist, NewSlist, NewLlist).







%onestep1(Slist, Llist, NewSlist, NewLlist, Slist2, Llist2, NewSlist2, NewLlist2,  X):-
 %   appendsum(Llist, Dlist),
  %  firstmatch(Slist, Dlist, X),
   % remove_elements(X, Slist, Llist, NewSlist, NewLlist).
    %remove_elements(X, Slist2, Llist2, NewSlist2, NewLlist2).
    



%onestep1(Slist, [], NewSlist, NewLlist, Slist2, Llist2, NewSlist2, NewLlist2,  [[Singleton], [D1,D2]]):-



onestep1(Slist, Llist, NewSlist, NewLlist, Slist2, Llist2, NewSlist2, NewLlist2,  [[Singleton], [D1,D2]]):-
    appendsum(Llist, Dlist),
    firstmatch(Slist, Dlist, [[Singleton], [D1,D2]]),
    remove_elements([[Singleton], [D1,D2]], Slist, Llist, NewSlist, NewLlist),
    %remove_elements(X, Slist2, Llist2, NewSlist2, NewLlist2).
    select(Singleton, Slist2, NewSlist2),
    NewLlist2 = Llist2.
    %NewS

    

onestep1(Slist, Llist, NewSlist, NewLlist, Slist2, NewSlist2,  [[Singleton], [D1,D2]]):-
    appendsum(Llist, Dlist),
    firstmatch(Slist, Dlist, [[Singleton], [D1,D2]]),
    remove_elements([[Singleton], [D1,D2]], Slist, Llist, NewSlist, NewLlist),
    %remove_elements(X, Slist2, Llist2, NewSlist2, NewLlist2).
    select(Singleton, Slist2, NewSlist2).
    %NewLlist2 = Llist2.







%onestep1(Slist, Llist, NewSlist, NewLlist, Slist2, Llist2, NewSlist2, NewLlist2,  X):-
 %   appendsum(Llist2, Dlist2),
  %  firstmatch(Slist2, Dlist2, X),
    %remove_elements(X, Slist, Llist, NewSlist, NewLlist),
   % remove_elements(X, Slist2, Llist2, NewSlist2, NewLlist2).



%onestep2([F|Slist], [F2|Llist], NewSlist, NewLlist, Slist2, Llist2, NewSlist2, NewLlist2,  X):-
%    onestep1([F|Slist], [F2|Llist], NewSlist, NewLlist, Slist2, Llist2, NewSlist, NewLlist,  X)  ->
%    true;

%    NewSlist = Slist,
%    NewLlist = [F2|Llist],
%    NewSlist2 = Slist2,
%    NewLlist2 = Llist2.





onestep3([F|A], B, NewA, NewB, Abar, Bbar, NewAbar, NewBbar,  X):-
    onestep1([F|A], Bbar, NewA, NewBbar, Abar, B, NewAbar, NewB,   X)  ->
    %onestep1([F|A], Bbar, NewA, NewBbar, B, NewB,   X)  ->
    true;
    NewA = A,
    NewB = B,
    NewAbar = Abar,
    NewBbar = Bbar,
    X = [].



%     NewSlist = Slist,
 %   NewLlist = [F2|Llist],
  %  NewSlist2 = Slist2,
   % NewLlist2 = Llist2.









%choosestep([F1|List1], [F2|List2], NewList1, NewList2, Ans):-
%    F1 < F2 ->  onestep([F1|List1], [F2|List2], NewList1, NewList2, Ans) ;
%                onestep([F2|List2], [F1|List1], NewList2, NewList1, Ans).



   % reverse([[S],[D1,D2]], [[D1,D2],[S]]).



%choosestep1([], [F2|List2], NewList1, NewList2,  Abar, Bbar, NewAbar, NewBbar,    Ans):-
%    onestep3([F2|List2], [], NewList1, NewList2,  Abar, Bbar, NewAbar, NewBbar, Ans).


%choosestep1([F1|Llist1], [], NewList1, NewList2,  Abar, Bbar, NewAbar, NewBbar,    Ans):-
%   choosestep1([F1|Llist1], [], NewList1, NewList2,  Abar, Bbar, NewAbar, NewBbar,    Ans):-


choosestep1([F1|Llist1], [], NewList1, NewList2,  Abar, Bbar, NewAbar, NewBbar,    Ans):-
    onestep3([F1|Llist1], [], NewList1, NewList2,  Abar, Bbar, NewAbar, NewBbar,    Ans).


choosestep1([], [F2|List2], NewList1, NewList2,  Abar, Bbar, NewAbar, NewBbar,    Ans):-
    onestep3([F2|List2], [], NewList2, NewList1,  Bbar, Abar, NewBbar, NewAbar, Ans).


%onestep3([F|A], B, NewA, NewB, Abar, Bbar, NewAbar, NewBbar,  X):-

%choosestep1([], [F2|List2], NewList1, NewList2,  Abar, Bbar, NewAbar, NewBbar,    Ans):-
 %   onestep3([F2|List2], [], NewList1, NewList2,  Abar, Bbar, NewAbar, NewBbar, Ans).


%choosestep1([F1|Llist1], [], NewList1, NewList2,  Abar, Bbar, NewAbar, NewBbar,    Ans):-
%    onestep3([F2|List2], [], NewList2, NewList1,  Bbar, Abar, NewBbar, NewAbar, Ans1), reverse(Ans1, Ans).




%choosestep1([F1|List1], [F2|List2], NewList1, NewList2,  Abar, Bbar, NewAbar, NewBbar,    Ans ):-
 %   F1 < F2 ->  onestep3([F1|List1], [F2|List2], NewList1, NewList2,  Abar, Bbar, NewAbar, NewBbar, Ans) ;
  %              onestep3([F2|List2], [F1|List1], NewList2, NewList1,  Bbar, Abar, NewBbar, NewAbar, Ans1), reverse(Ans1, Ans).



choosestep1([F1|List1], [F2|List2], NewList1, NewList2,  Abar, Bbar, NewAbar, NewBbar,    Ans ):-
    F1 < F2, onestep3([F1|List1], [F2|List2], NewList1, NewList2,  Abar, Bbar, NewAbar, NewBbar, Ans) .


choosestep1([F1|List1], [F2|List2], NewList1, NewList2,  Abar, Bbar, NewAbar, NewBbar,    Ans ):-
    F1 >= F2, onestep3([F2|List2], [F1|List1], NewList2, NewList1,  Bbar, Abar, NewBbar, NewAbar, Ans1), reverse(Ans1,Ans).


    


topstep([],[],[],[],[]).




%topstep(A, B, Abar, Bbar, Ans                                                    ):-
    %choosestep1([F1|List1], [F2|List2], NewList1, NewList2,  Abar, Bbar, NewAbar, NewBbar,    Ans),

    %choosestep1(A, B, NewA, NewB,  Abar, Bbar, NewAbar, NewBbar,    CurrAns),
    %choosestep1(A, B, NewA, NewB,  Abar, Bbar, NewAbar, NewBbar,    CurrAns),
    %topstep(NewA, NewB, NewAbar,NewBbar, UpdatedAns),
    %Ans = [CurrAns|UpdatedAns].
    %append(CurrAns,UpdatedAns,Ans) , !.



topstep(A, B, Abar, Bbar, Ans ):-
    %choosestep1([F1|List1], [F2|List2], NewList1, NewList2,  Abar, Bbar, NewAbar, NewBbar,    Ans),

    %choosestep1(A, B, NewA, NewB,  Abar, Bbar, NewAbar, NewBbar,    CurrAns),
    choosestep1(A, B, NewA, NewB,  Abar, Bbar, NewAbar, NewBbar,    CurrAns),
    topstep(NewA, NewB, NewAbar,NewBbar, UpdatedAns),
    %Ans = [CurrAns|UpdatedAns].
    append(CurrAns,UpdatedAns,Ans) , !.


combpairs([],[]).

combpairs([F,S|R], OutL):-
    combpairs(R, CurList),
    append([[F,S]], CurList, OutL).



%disarm(A,B,S):-
 %   topstep(A,B,A,B,S).



disarm(Adivisions, Bdivisions, Solution):-
    msort(Adivisions, A), msort(Bdivisions, B),
    topstep(A,B,A,B, S),
    combpairs(S, Solution).





%onestep3([F|A], B, NewA, NewB, Abar, Bbar, NewAbar, NewBbar,  X):-




%choosestep1([F1|List1], [F2|List2], NewList1, NewList2, [F3|List3], [F4|List4], NewList3, NewList4,   Ans):-
%    F1 < F2 ->  onestep([F1|List1], [F2|List2], NewList1, NewList2, Ans);
%    F2 > F1 ->  onestep([F2|List2], [F1|List1], NewList2, NewList1, Ans);
%    [].

    
%choosestep1([1,12,15],[2,10,16],X,Y, [1,12,15],[2,10,16],Z,T, Ans).
