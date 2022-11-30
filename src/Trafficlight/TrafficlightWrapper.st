USING Simatic.Ax.StateFramework;

NAMESPACE Simatic.Ax.Tiax

    FUNCTION_BLOCK TrafficlightWrapper
        VAR_OUTPUT
            activeStateId : INT;
            status : StateControllerStatus;
            rd : BOOL;
            ye : BOOL;
            gn : BOOL;
        END_VAR
        VAR
            _sc : StateController;
            _stateRed : StateRed;
            _stateRedTrans : Transition;
            _TimeoutGuard : TimeoutGuard;
            _stateRedYellow : StateRedYellow;
            _stateRedYellowTrans : Transition;
            _stateGreen : StateGreen;
            _stateGreenTrans : Transition;
            _stateYellow : StateYellow;
            _stateYellowTrans : Transition;
            init : BOOL;
        END_VAR

        IF NOT init THEN
            // Congfigure StateController
            _sc.InitialState := _stateRed;
            _TimeoutGuard.Timeout := T#1000ms;
            // Configure Red
            _stateRed.Transition1 := _stateRedTrans;
            _stateRed.StateID := 1;
            _stateRedTrans.NextState := _stateRedYellow;
            _stateRedTrans.Guard := _TimeoutGuard;
            _stateRed.rd := REF(rd);
            // Configure RedYellow
            _stateRedYellow.Transition1 := _stateRedYellowTrans;
            _stateRedYellow.StateID := 2;
            _stateRedYellowTrans.NextState := _stateGreen;
            _stateRedYellowTrans.Guard := _TimeoutGuard;
            _stateRedYellow.rd := REF(rd);
            _stateRedYellow.ye := REF(ye);
            // Configure Green
            _stateGreen.Transition1 := _stateGreenTrans;
            _stateGreen.StateID := 3;
            _stateGreenTrans.NextState := _stateYellow;
            _stateGreenTrans.Guard := _TimeoutGuard;
            _stateGreen.gn := REF(gn);
            // Configure Yellow
            _stateYellow.Transition1 := _stateYellowTrans;
            _stateYellow.StateID := 4;
            _stateYellowTrans.NextState := _stateRed;
            _stateYellowTrans.Guard := _TimeoutGuard;
            _stateYellow.ye := REF(ye);
            init := TRUE;
        END_IF;
        _sc.Execute();
        status := _sc.GetState();
    END_FUNCTION_BLOCK

END_NAMESPACE
