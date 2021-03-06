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
   Structure representing the website data elements of a contact.

   @author Francisco Javier Martin Bueno
   @since v2.0
   @version 1.0
*/
public class ContactWebsite : APIBean {

    /**
       The url of the website
    */
    var url : String?

    /**
       Default constructor

       @since v2.0
    */
    public override init() {
        super.init()
    }

    /**
       Constructor used by the implementation

       @param url Url of the website
       @since v2.0
    */
    public init(url: String) {
        super.init()
        self.url = url
    }

    /**
       Returns the url of the website

       @return website url
       @since v2.0
    */
    public func getUrl() -> String? {
        return self.url
    }

    /**
       Set the url of the website

       @param url Url of the website
       @since v2.0
    */
    public func setUrl(url: String) {
        self.url = url
    }


    /**
       JSON Serialization and deserialization support.
    */
    public struct Serializer {
        public static func fromJSON(json : String) -> ContactWebsite {
            let data:NSData = json.dataUsingEncoding(NSUTF8StringEncoding)!
            let dict = try? NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers) as! NSDictionary
            return fromDictionary(dict!)
        }

        static func fromDictionary(dict : NSDictionary) -> ContactWebsite {
            let resultObject : ContactWebsite = ContactWebsite()

            if let value : AnyObject = dict.objectForKey("url") {
                if "\(value)" as NSString != "<null>" {
                    resultObject.url = (value as! String)
                }
            }

            return resultObject
        }

        public static func toJSON(object: ContactWebsite) -> String {
            let jsonString : NSMutableString = NSMutableString()
            // Start Object to JSON
            jsonString.appendString("{ ")

            // Fields.
            object.url != nil ? jsonString.appendString("\"url\": \"\(JSONUtil.escapeString(object.url!))\"") : jsonString.appendString("\"url\": null")

            // End Object to JSON
            jsonString.appendString(" }")
            return jsonString as String
        }
    }
}

/**
------------------------------------| Engineered with ♥ in Barcelona, Catalonia |--------------------------------------
*/
