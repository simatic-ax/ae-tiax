USING Simatic.Ax.StateFramework;

NAMESPACE Simatic.Ax.Tiax

    // Abstract class 
    CLASS ABSTRACT AbstractTrafficLightState
        EXTENDS State1Transition // class from external AX package @simatic-ax/statemachine
        
        // private static
        VAR
            count : LINT;
            activations : LINT;
        END_VAR
        
        /// Public method to return the number of activations
        METHOD PUBLIC GetActivations : LINT;
            GetActivations := activations;
        END_METHOD
        
        /// Public method to return the number of calls
        METHOD PUBLIC GetCalls : LINT;
            GetCalls := count;
        END_METHOD

        /// public abstract method with return value which has to be implemented inthe concrete class
        METHOD PUBLIC ABSTRACT GetColor : Colors
        END_METHOD
    END_CLASS

END_NAMESPACE
