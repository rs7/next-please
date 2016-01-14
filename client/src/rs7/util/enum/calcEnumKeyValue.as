package rs7.util.enum
{
    public function calcEnumKeyValue(source:Array):String
    {
        if (source == null || source.length == 0)
        {
            return null;
        }
        
        if (source.length == 1)
        {
            return calcKeyValueForSingleData(source[0]);
        }
        
        return calcKeyValueForMultipleData(source);
    }
}

import rs7.util.enum.IEnum;

internal function calcKeyValueForMultipleData(source:Array):String
{
    return source.filter(
        function (sourceItem:*, ..._):String
        {
            return calcKeyValueForSingleData(sourceItem);
        }
    ).join(",");
}

internal function calcKeyValueForSingleData(source:*):String
{
    switch (true)
    {
        case source == null:
            return null;
        case source is String:
            return source;
        case source is Number:
        case source is Boolean:
            return String(source);
        case source is IEnum:
            return IEnum(source).key;
        case source is Object:
            return Object(source).toString();
        default:
            throw new Error("Invalid type of part of enum key");
    }
}
