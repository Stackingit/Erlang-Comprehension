-module(rps).
-export( [ start/0, attack/1  ] ).

start()->
    register(rpsServer, spawn( fun()-> loop() end ) ).
 
loop()->
    receive
        { From, Attack } ->
            From ! attack( Attack ),
            loop()
    end.

attack( Attack ) ->
    case lists:member( Attack, validAttacks() ) of
        false ->
            {reply,stop_cheating};
        true ->
            Random = random:uniform( length( validAttacks() ) ),
            SelectedAttack = lists:nth( Random, validAttacks() ),
            getWinner( {computer,SelectedAttack}, {player,Attack} )
    end.

%% tie
getWinner( {computer,Attack}, {player,Attack} ) ->
    { result, tie, {{computer,Attack},{player,Attack}} };
%% Computer wins
getWinner( {computer, rock }, {player, scissors} ) ->
    {result, lose, { {computer,rock},{player,scissors}}};
getWinner( {computer, paper }, {player, rock} ) ->
    {result, lose, { {computer,paper},{player,rock}}};
getWinner( {computer, scissors }, {player, paper} ) ->
    {result, lose, { {computer,scissors},{player,paper}}};
%% Player wins
getWinner( ComputerAttack, PlayerAttack ) ->
    {result, win, { ComputerAttack, PlayerAttack } }.

validAttacks()->
    [rock,paper,scissors].
