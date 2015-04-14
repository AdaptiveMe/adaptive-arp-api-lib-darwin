/**
Top documentation
*/

import Foundation

/**
Structure representing a native response to the HTML5
*/
public class APIBean : NSObject {
    
    /// Field Description
    private var field:String? = nil
    
    /// Field Description
    public var field2:String? = nil
    
    /**-----------------------------------------------------------------------------
    * @name Accessing the Shared Brew Instance
    * -----------------------------------------------------------------------------
    */
    
    /// Field Description
    public var field3:String? = nil
    
    /// Field Description
    public var field4:String? = nil
    
    
    /**
    Default Constructor
    */
    public override init() {
        super.init()
    }
    
    /**
    Method description
    
    :param: param1 Parameter 1 description
    :param: param2 Parameter 2 description
    
    :returns: Returns the sum of two values
    */
    public func method(param1:String, param2:String) -> String{
        
        return param1 + param2
    }
    
    /**-----------------------------------------------------------------------------
    * @name Accessing the Shared Brew Instance
    * -----------------------------------------------------------------------------
    */
    
    /**
    Method description
    
    :param: param1 Parameter 1 description
    :param: param2 Parameter 2 description
    
    :returns: Returns the sum of two values
    */
    public func method3(param1:String, param2:String) -> String{
        
        return param1 + param2
    }
    
    /**
    Method description
    
    :param: param1 Parameter 1 description
    :param: param2 Parameter 2 description
    
    :returns: Returns the sum of two values
    */
    private func method2(param1:String, param2:String) -> String{
        
        return param1 + param2
    }
    
    /**
    *  Struct description
    */
    public struct Serializer {
        
        /**
        Internal method description
        
        :param: json Json field
        
        :returns: Returns Json parameter
        */
        public static func fromJSON(json : String) -> APIBean {
            var data:NSData = json.dataUsingEncoding(NSUTF8StringEncoding)!
            var jsonError: NSError?
            let dict = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers, error: &jsonError) as! NSDictionary
            return fromDictionary(dict)
        }
        
        /**
        adas
        
        :param: dict asdasd
        
        :returns: sadfdfs
        */
        static func fromDictionary(dict : NSDictionary) -> APIBean {
            var resultObject : APIBean = APIBean()
            
            return resultObject
        }
        
        static func toJSON(object: APIBean) -> String {
            var jsonString : NSMutableString = NSMutableString()
            // Start Object to JSON
            jsonString.appendString("{ ")
            
            // End Object to JSON
            jsonString.appendString(" }")
            return jsonString as String
        }
    }
}

/**
------------------------------------| Engineered with ♥ in Barcelona, Catalonia |--------------------------------------
*/
