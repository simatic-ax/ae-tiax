USING Simatic.Ax.Tiax;
USING AxUnit;
USING Simatic.Ax.Conversion;

NAMESPACE MyTest

    {TestFixture}
    CLASS TestJsonStructure
        VAR
            o : JsonStructure;
            len : DINT;
            expString : STRING;
            cmpBuff : ARRAY[0..399] OF CHAR;
            isEqual : BOOL;
        END_VAR
        {Test}
        METHOD PUBLIC Excecute_of_the_wrapper_returns_the_Correct_JSON_String
            expString := '{"DeviceName": "Device1", "Parameter": {"IP": "192.168.0.1", "Timeout": 300, "AutoConnect": true}}';
            len := Strings.ToArray.OfCharCount(str := expString, arr := cmpBuff);
            
            o.DeviceName := 'Device1';
            o.IP := '192.168.0.1';
            o.Timeout := 300;
            o.AutoConnect := TRUE;
            o(Execute := TRUE);
            isEqual := Simatic.Ax.Helper.CompareArray(first := o.Result, scnd := cmpBuff, count := TO_INT(len));
            Assert.Equal(actual := isEqual, expected := TRUE);
        END_METHOD
    END_CLASS

END_NAMESPACE
