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
   Represents a specific application life-cycle stage.

   @author Francisco Javier Martin Bueno
   @since v2.0
   @version 1.0
*/
public class Lifecycle : APIBean {

    /**
       Represent the state of the app
<p>
Possible lifecycle States:
<p>
1. Starting    - Before starting.
2. Started     - Start concluded.
3. Running     - Accepts user interaction - running in foreground.
4. Pausing     - Before going to background.
4.1 PausedIdle - In background, no scheduled background activity (passive).
4.2 PausedRun  - In background, scheduled background activity (periodic network access, gps access, etc.)
5. Resuming    - Before going to foreground, followed by Running state.
6. Stopping    - Before stopping.
    */
    var state : LifecycleState?
    /**
       The timestamps in milliseconds when the event was fired.
    */
    var timestamp : Int64?

    /**
       Default constructor

       @since v2.0
    */
    public override init() {
        super.init()
    }

    /**
       Constructor used by the implementation

       @param state of the app
       @param timestamp Timestamp of the event
       @since v2.0
    */
    public init(state: LifecycleState, timestamp: Int64) {
        super.init()
        self.state = state
        self.timestamp = timestamp
    }

    /**
       Returns the state of the application

       @return state of the app
       @since v2.0
    */
    public func getState() -> LifecycleState? {
        return self.state
    }

    /**
       Set the State of the application

       @param state of the app
       @since v2.0
    */
    public func setState(state: LifecycleState) {
        self.state = state
    }

    /**
       Gets the timestamp in milliseconds of the event.

       @return Timestamp of the event.
       @since v2.2.1
    */
    public func getTimestamp() -> Int64? {
        return self.timestamp
    }

    /**
       Sets the timestamp in milliseconds of the event.

       @param timestamp Timestamp of the event.
       @since v2.2.1
    */
    public func setTimestamp(timestamp: Int64) {
        self.timestamp = timestamp
    }


    /**
       JSON Serialization and deserialization support.
    */
    public struct Serializer {
        public static func fromJSON(json : String) -> Lifecycle {
            let data:NSData = json.dataUsingEncoding(NSUTF8StringEncoding)!
            let dict = try? NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers) as! NSDictionary
            return fromDictionary(dict!)
        }

        static func fromDictionary(dict : NSDictionary) -> Lifecycle {
            let resultObject : Lifecycle = Lifecycle()

            if let value : AnyObject = dict.objectForKey("state") {
                if "\(value)" as NSString != "<null>" {
                    resultObject.state = LifecycleState.toEnum(((value as! NSDictionary)["value"]) as? String)
                }
            }

            if let value : AnyObject = dict.objectForKey("timestamp") {
                if "\(value)" as NSString != "<null>" {
                    let numValue = value as? NSNumber
                    resultObject.timestamp = numValue?.longLongValue
                }
            }

            return resultObject
        }

        public static func toJSON(object: Lifecycle) -> String {
            let jsonString : NSMutableString = NSMutableString()
            // Start Object to JSON
            jsonString.appendString("{ ")

            // Fields.
            object.state != nil ? jsonString.appendString("\"state\": { \"value\": \"\(object.state!.toString())\"}, ") : jsonString.appendString("\"state\": null, ")
            object.timestamp != nil ? jsonString.appendString("\"timestamp\": \(object.timestamp!)") : jsonString.appendString("\"timestamp\": null")

            // End Object to JSON
            jsonString.appendString(" }")
            return jsonString as String
        }
    }
}

/**
------------------------------------| Engineered with ♥ in Barcelona, Catalonia |--------------------------------------
*/
