-module(rps).
-export( [ attack/1 ] ).

attack( Attack ) ->
    case lists:member( Attack, validAttacks() ) of
        false ->
            {reply,stop_cheating};
        true ->
            Random = random:uniform( length( validAttacks() ) ),
            SelectedAttack = lists:nth( Random, validAttacks() ),
            getWinner( {someLameExperiment,4,"hello"},{computer,SelectedAttack, player,Attack} )
    end.

getWinner( ComputerAttack, PlayerAttack ) ->
    { ComputerAttack, PlayerAttack }.

validAttacks()->
    [rock,paper,scissors].
