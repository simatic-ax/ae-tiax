USING Simatic.Ax.StateFramework;

NAMESPACE Simatic.Ax.Tiax

    CLASS StateRedYellow
        EXTENDS State1Transition
        VAR PUBLIC 
            rd : REF_TO BOOL;
            ye : REF_TO BOOL;
        END_VAR
        VAR
            count : LINT;
            activations : LINT;
        END_VAR
        METHOD PUBLIC OVERRIDE OnEntry
            activations := activations + 1;
            rd^ := TRUE;
            ye^ := TRUE; 
        END_METHOD
        METHOD PUBLIC OVERRIDE Action
            count := count + 1;
        END_METHOD
        METHOD PUBLIC OVERRIDE OnExit
            rd^ := FALSE;
            ye^ := FALSE; 
        END_METHOD
        METHOD PUBLIC GetColor : Colors
            GetColor := Colors#Red_Yellow;
        END_METHOD
    END_CLASS

END_NAMESPACE
