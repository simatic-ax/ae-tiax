USING AxUnit.Assert;
USING Simatic.Ax.Tiax;
NAMESPACE Simatic.Ax.TrafficLight
    {TestFixture}
    CLASS TestStateYellow
        VAR PUBLIC
            state : StateYellow;            
            light : BOOL;
        END_VAR

        {Test}
        METHOD PUBLIC OnEntry_switch_on_yellow_light
            state.ye := REF(light);
            state.OnEntry();
            Equal(expected := TRUE, actual := light);
        END_METHOD

        {Test}
        METHOD PUBLIC OnEntry_counts_the_activations
            Equal(expected := 0, actual := state.GetActivations());
            THIS.OnEntry_switch_on_yellow_light();
            Equal(expected := 1, actual := state.GetActivations());
        END_METHOD
        
        {Test}
        METHOD PUBLIC Actions_counts_each_call
            Equal(expected := 0, actual := state.GetCalls());
            state.Action();
            Equal(expected := 1, actual := state.GetCalls());
            state.Action();
            Equal(expected := 2, actual := state.GetCalls());
        END_METHOD


        {Test}
        METHOD PUBLIC OnExit_switch_off_yellow_light
            // first switch on the light
            THIS.OnEntry_switch_on_yellow_light();
            // then Call the onExit method
            state.OnExit();
            Equal(expected := FALSE, actual := light);
        END_METHOD
        {Test}
        METHOD PUBLIC GetColor_returns_yellow
            Equal(expected := TRUE, actual := state.GetColor() = Colors#Yellow);
        END_METHOD

    END_CLASS    
END_NAMESPACE


