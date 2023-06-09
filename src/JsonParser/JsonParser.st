USING Simatic.Ax.Json;
USING Simatic.Ax.Conversion;

NAMESPACE Simatic.Ax.Tiax

    FUNCTION_BLOCK JsonParser
        VAR_INPUT
            Execute : BOOL;
            JsonAsString : STRING; //comes from outside (e.g. '{"Name": "SIMATIC", "data": {"plc_type: 1518", "OPC_SERVER_ENABLED": 1}}')
        END_VAR
        VAR_OUTPUT
            Name : STRING;
            Plc_type : INT;
            Opc_server_enabled : BOOL;
        END_VAR
        VAR
            _init : BOOL;
            deserializer : Deserializer;
            buffer : ARRAY[0..200] OF CHAR;
            _executeOld : BOOL;
            len : DINT;
            keyArray: ARRAY [0..1] OF STRING;
            value: STRING;
            valueInt : INT;
            keyFound: BOOL;
        END_VAR
        VAR_TEMP
            
            executeRis : BOOL;
        END_VAR
        
        // Check the execute signal
        executeRis := Execute AND NOT (_executeOld);
        _executeOld := Execute;

        IF (executeRis) THEN

            // Convert String to "ArrayOfChar"
            len:= Strings.ToArray.OfCharCount(str := JsonAsString, arr := buffer);
            deserializer.buffer := REF(buffer);
            
            // Parse for String Name and expect the STRING value
            keyFound := deserializer.TryParse( 'Name', value);
            IF (keyFound) THEN 
                Name := value;
            ELSE
                Name := 'not found';
            END_IF;

            // Parse for nested key data.plc_type and expect the integer value
            keyArray[0] := 'data';
            keyArray[1] := 'plc_type';
            keyFound := deserializer.TryParse(keyArray, valueInt);
            IF (keyFound) THEN 
                Plc_type := valueInt;
            ELSE
                Plc_type := -1;
            END_IF;

            // Parse for nested key data.OPC_SERVER_ENABLED and expect the true or false
            keyArray[0] := 'data';
            keyArray[1] := 'OPC_SERVER_ENABLED';
            keyFound := deserializer.TryParse(keyArray, valueInt);
            IF (valueInt = 1) THEN 
                Opc_server_enabled := TRUE;
            ELSE
                Opc_server_enabled := FALSE;
            END_IF;

        END_IF;
    END_FUNCTION_BLOCK

END_NAMESPACE