USING Simatic.Ax.StateFramework;

NAMESPACE Simatic.Ax.Tiax

    CLASS StateGreen
        EXTENDS State1Transition // class from external AX package @simatic-ax/statemachine
        
        // private static
        VAR
            count : LINT;
            activations : LINT;
        END_VAR
        
        // public static
        VAR PUBLIC 
            gn : REF_TO BOOL;
        END_VAR
        
        // public method with non return value
        METHOD PUBLIC OVERRIDE OnEntry
            activations := activations + 1;
            gn^ := TRUE;
        END_METHOD

        // public method with non return value
        METHOD PUBLIC OVERRIDE Action
            count := count + 1;
        END_METHOD

        // public method with non return value
        METHOD PUBLIC OVERRIDE OnExit
            gn^ := FALSE;
        END_METHOD

        // public method with return value
        METHOD PUBLIC GetColor : Colors
            GetColor := Colors#Green;
        END_METHOD
    END_CLASS

END_NAMESPACE
