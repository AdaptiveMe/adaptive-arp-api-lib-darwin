/**
--| ADAPTIVE RUNTIME PLATFORM |----------------------------------------------------------------------------------------

(C) Copyright 2013-2015 Carlos Lozano Diez t/a Adaptive.me <http://adaptive.me>.

Licensed under the Apache License, Version 2.0 (the "License"); you may not use this file except in compliance with the
License. You may obtain a copy of the License at http://www.apache.org/licenses/LICENSE-2.0 . Unless required by appli-
-cable law or agreed to in writing, software distributed under the License is distributed on an "AS IS" BASIS,  WITHOUT
WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.  See the  License  for the specific language governing
permissions and limitations under the License.

Original author:

    * Carlos Lozano Diez
            <http://github.com/carloslozano>
            <http://twitter.com/adaptivecoder>
            <mailto:carlos@adaptive.me>

Contributors:

    * Ferran Vila Conesa
             <http://github.com/fnva>
             <http://twitter.com/ferran_vila>
             <mailto:ferran.vila.conesa@gmail.com>

    * See source code files for contributors.

Release:

    * @version v2.2.15

-------------------------------------------| aut inveniam viam aut faciam |--------------------------------------------
*/

import Foundation

/**
   Structure representing the data of a http request or response header.

   @author Aryslan
   @since v2.0
   @version 1.0
*/
public class ServiceHeader : KeyValue {


    /**
       Default constructor.

       @since v2.0.6
    */
    public override init() {
        super.init()
    }

    /**
       Convenience constructor.

       @param keyName Name of the key.
       @param keyData Value of the key.
       @since v2.0.6
    */
    public override init(keyName: String, keyData: String) {
        super.init(keyName: keyName, keyData: keyData)
    }


    /**
       JSON Serialization and deserialization support.
    */
    public struct Serializer {
        public static func fromJSON(json : String) -> ServiceHeader {
            let data:NSData = json.dataUsingEncoding(NSUTF8StringEncoding)!
            let dict = try? NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers) as! NSDictionary
            return fromDictionary(dict!)
        }

        static func fromDictionary(dict : NSDictionary) -> ServiceHeader {
            let resultObject : ServiceHeader = ServiceHeader()

            if let value : AnyObject = dict.objectForKey("keyData") {
                if "\(value)" as NSString != "<null>" {
                    resultObject.keyData = (value as! String)
                }
            }

            if let value : AnyObject = dict.objectForKey("keyName") {
                if "\(value)" as NSString != "<null>" {
                    resultObject.keyName = (value as! String)
                }
            }

            return resultObject
        }

        public static func toJSON(object: ServiceHeader) -> String {
            let jsonString : NSMutableString = NSMutableString()
            // Start Object to JSON
            jsonString.appendString("{ ")

            // Fields.
            object.keyData != nil ? jsonString.appendString("\"keyData\": \"\(JSONUtil.escapeString(object.keyData!))\", ") : jsonString.appendString("\"keyData\": null, ")
            object.keyName != nil ? jsonString.appendString("\"keyName\": \"\(JSONUtil.escapeString(object.keyName!))\"") : jsonString.appendString("\"keyName\": null")

            // End Object to JSON
            jsonString.appendString(" }")
            return jsonString as String
        }
    }
}

/**
------------------------------------| Engineered with ♥ in Barcelona, Catalonia |--------------------------------------
*/
