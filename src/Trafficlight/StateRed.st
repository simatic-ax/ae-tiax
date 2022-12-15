USING Simatic.Ax.StateFramework;

NAMESPACE Simatic.Ax.Tiax

    CLASS StateRed
        EXTENDS AbstractTrafficLightState // inherit from AbstractTrafficLightState
        VAR PUBLIC 
            rd : REF_TO BOOL;
        END_VAR
        METHOD PUBLIC OVERRIDE OnEntry
            activations := activations + 1;
            rd^ := TRUE;
        END_METHOD
        METHOD PUBLIC OVERRIDE Action
            count := count + 1;
        END_METHOD
        METHOD PUBLIC OVERRIDE OnExit
            rd^ := FALSE;
        END_METHOD
        METHOD PUBLIC OVERRIDE GetColor : Colors
            GetColor := Colors#Red;
        END_METHOD
    END_CLASS

END_NAMESPACE
