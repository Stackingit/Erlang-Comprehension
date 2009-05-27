-module(rps).
-export( [ attack/1 ] ).

attack( Attack ) ->
    case lists:member( Attack, validAttacks() ) of
        false ->
            {reply,stop_cheating};
        true ->
            Random = random:uniform( length( validAttacks() ) ),
            SelectedAttack = lists:nth( Random, validAttacks() ),
            {{computer,SelectedAttack},{player,Attack}}
    end.

validAttacks()->
    [rock,paper,scissors].
    