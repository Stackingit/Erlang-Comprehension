-module(rps).
-export( [ attack/1 ] ).

attack( Attack ) ->
    case lists:member( Attack, validAttacks() ) of
        false ->
            {reply,stop_cheating};
        true ->
            Random = random:uniform( length( validAttacks() ) ),
            SelectedAttack = lists:nth( Random, validAttacks() ),
            getWinner( {computer,SelectedAttack}, {player,Attack} )
    end.

getWinner( {computer,Attack}, {player,Attack} ) ->
    { result, tie, {{computer,Attack},{player,Attack}} };
getWinner( ComputerAttack, PlayerAttack ) ->
    { ComputerAttack, PlayerAttack }.

validAttacks()->
    [rock,paper,scissors].
