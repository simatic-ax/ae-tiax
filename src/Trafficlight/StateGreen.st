USING Simatic.Ax.StateFramework;

NAMESPACE Simatic.Ax.Tiax

    CLASS StateGreen
        EXTENDS State1Transition
        VAR
            count : LINT;
            activations : LINT;
        END_VAR
        VAR PUBLIC 
            gn : REF_TO BOOL;
        END_VAR
        METHOD PUBLIC OVERRIDE OnEntry
            activations := activations + 1;
            gn^ := TRUE;
        END_METHOD
        METHOD PUBLIC OVERRIDE Action
            count := count + 1;
        END_METHOD
        METHOD PUBLIC OVERRIDE OnExit
            gn^ := FALSE;
        END_METHOD
        METHOD PUBLIC GetColor : Colors
            GetColor := Colors#Green;
        END_METHOD
    END_CLASS

END_NAMESPACE
