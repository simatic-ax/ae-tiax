USING Simatic.Ax.StateFramework;

NAMESPACE Simatic.Ax.Tiax
    // Wrapper for TIA Portal usage
    FUNCTION_BLOCK TrafficlightWrapper
        VAR_OUTPUT
            activeStateId : INT;
            status : StateControllerStatus;
            rd : BOOL;
            ye : BOOL;
            gn : BOOL;
        END_VAR
        VAR
            _sc : StateController; // class instance
            _stateRed : StateRed; // class instance
            _stateRedTrans : Transition; // class instance
            _TimeoutGuard : TimeoutGuard; // class instance
            _stateRedYellow : StateRedYellow; // class instance
            _stateRedYellowTrans : Transition; // class instance
            _stateGreen : StateGreen; // class instance
            _stateGreenTrans : Transition; // class instance
            _stateYellow : StateYellow; // class instance
            _stateYellowTrans : Transition; // class instance
            init : BOOL;
        END_VAR

        IF NOT init THEN
            // Congfigure StateController
            _sc.InitialState := _stateRed; // Start to build state chain
            _TimeoutGuard.Timeout := T#1000ms;
            // Configure Red
            _stateRed.Transition1 := _stateRedTrans; // Continue to build state chain
            _stateRed.StateID := 1;
            _stateRedTrans.NextState := _stateRedYellow; // Continue to build state chain
            _stateRedTrans.Guard := _TimeoutGuard;
            _stateRed.rd := REF(rd); // Get reference to class Instance
            // Configure RedYellow
            _stateRedYellow.Transition1 := _stateRedYellowTrans; // Continue to build state chain
            _stateRedYellow.StateID := 2;
            _stateRedYellowTrans.NextState := _stateGreen; // Continue to build state chain
            _stateRedYellowTrans.Guard := _TimeoutGuard;
            _stateRedYellow.rd := REF(rd);
            _stateRedYellow.ye := REF(ye);
            // Configure Green
            _stateGreen.Transition1 := _stateGreenTrans; // Continue to build state chain
            _stateGreen.StateID := 3;
            _stateGreenTrans.NextState := _stateYellow; // Continue to build state chain
            _stateGreenTrans.Guard := _TimeoutGuard;
            _stateGreen.gn := REF(gn);
            // Configure Yellow
            _stateYellow.Transition1 := _stateYellowTrans; // Continue to build state chain
            _stateYellow.StateID := 4;
            _stateYellowTrans.NextState := _stateRed; // close state chain
            _stateYellowTrans.Guard := _TimeoutGuard;
            _stateYellow.ye := REF(ye);
            init := TRUE;
        END_IF;
        _sc.Execute();
        status := _sc.GetState();
    END_FUNCTION_BLOCK

END_NAMESPACE
