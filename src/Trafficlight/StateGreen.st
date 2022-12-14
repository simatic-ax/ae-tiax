USING Simatic.Ax.StateFramework;

NAMESPACE Simatic.Ax.Tiax

    CLASS StateGreen
        EXTENDS AbstractTrafficLightState // inherit from AbstractTrafficLightState
        
        // public static
        VAR PUBLIC 
            gn : REF_TO BOOL; //Reference
        END_VAR
        
        // public method with non return value
        METHOD PUBLIC OVERRIDE OnEntry
            activations := activations + 1;
            gn^ := TRUE; // dereference
        END_METHOD

        // public method with non return value
        METHOD PUBLIC OVERRIDE Action
            count := count + 1;
        END_METHOD

        // public method with non return value
        METHOD PUBLIC OVERRIDE OnExit
            gn^ := FALSE; // dereference
        END_METHOD

        // public method with return value
        METHOD PUBLIC OVERRIDE GetColor : Colors
            GetColor := Colors#Green; // set return value to enum value green
        END_METHOD
    END_CLASS

END_NAMESPACE
