USING Simatic.Ax.Json;
USING Simatic.Ax.Json;
USING Simatic.Ax.StateFramework;

NAMESPACE Simatic.Ax.Tiax

    /// {"DeviceName": "Device1", "Parameter": {"IP": "192.168.0.1", "Timeout": 300, "AutoConnect": true}}
    FUNCTION_BLOCK JsonStructure
        VAR_INPUT
            Execute : BOOL;
            DeviceName : STRING;
            IP : STRING;
            Timeout : INT;
            AutoConnect : BOOL;
        END_VAR
        VAR_OUTPUT
            Result : ARRAY[1..200] OF CHAR;
        END_VAR
        VAR
            _init : BOOL;
            _doc : JsonDocument;
            _deviceName : JsonString;
            _obj : JsonObject;
            _ip : JsonString;
            _timeout : JsonInt;
            _autoConnect : JsonBoolean;
            _executeOld : BOOL;
        END_VAR
        VAR_TEMP
            executeRis : BOOL;
        END_VAR
        IF NOT _init THEN
            // Assign the result buffer
            _doc.buffer := REF(Result);
            // Assign the Element names
            _deviceName.Key := 'DeviceName';
            _ip.Key := 'IP';
            _timeout.Key := 'Timeout';
            _autoConnect.Key := 'AutoConnect';
            _obj.Key := 'Parameter';
            // Configure the Json-Object
            _obj.AddElement(_ip);
            _obj.AddElement(_timeout);
            _obj.AddElement(_autoConnect);
            _doc.AddElement(_deviceName);
            _doc.AddElement(_obj);
            _init := TRUE;
        END_IF;
        executeRis := Execute AND NOT (_executeOld);
        _executeOld := Execute;
        IF (executeRis) THEN
            _deviceName.Value := DeviceName;
            _ip.Value := IP;
            _timeout.Value := Timeout;
            _autoConnect.Value := AutoConnect;
            _doc.Serialize();
        END_IF;
    END_FUNCTION_BLOCK

END_NAMESPACE
