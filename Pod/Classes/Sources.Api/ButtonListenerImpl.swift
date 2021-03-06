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
   Interface for Managing the button  operations
   Auto-generated implementation of IButtonListener specification.
*/
public class ButtonListenerImpl : BaseListenerImpl, IButtonListener {

    /**
       Constructor with listener id.

       @param id  The id of the listener.
    */
    public override init(id : Int64) {
        super.init(id: id);
    }

    /**
       No data received

       @param error occurred
       @since v2.0
    */
    public func onError(error : IButtonListenerError) { 
        let param0 : String = "Adaptive.IButtonListenerError.toObject(JSON.parse(\"{ \\\"value\\\": \\\"\(error.toString())\\\"}\"))"
        var listenerId : Int64 = -1
        if (getId() != nil) {
            listenerId = getId()!
        }
        AppRegistryBridge.sharedInstance.getPlatformContextWeb().executeJavaScript("Adaptive.handleButtonListenerError( \(listenerId), \(param0))")
    }

    /**
       Called on button pressed

       @param button pressed
       @since v2.0
    */
    public func onResult(button : Button) { 
        let param0 : String = "Adaptive.Button.toObject(JSON.parse(\"\(JSONUtil.escapeString(Button.Serializer.toJSON(button)))\"))"
        var listenerId : Int64 = -1
        if (getId() != nil) {
            listenerId = getId()!
        }
        AppRegistryBridge.sharedInstance.getPlatformContextWeb().executeJavaScript("Adaptive.handleButtonListenerResult( \(listenerId), \(param0))")
    }

    /**
       Data received with warning

       @param button  pressed
       @param warning happened
       @since v2.0
    */
    public func onWarning(button : Button, warning : IButtonListenerWarning) { 
        let param0 : String = "Adaptive.Button.toObject(JSON.parse(\"\(JSONUtil.escapeString(Button.Serializer.toJSON(button)))\"))"
        let param1 : String = "Adaptive.IButtonListenerWarning.toObject(JSON.parse(\"{ \\\"value\\\": \\\"\(warning.toString())\\\"}\"))"
        var listenerId : Int64 = -1
        if (getId() != nil) {
            listenerId = getId()!
        }
        AppRegistryBridge.sharedInstance.getPlatformContextWeb().executeJavaScript("Adaptive.handleButtonListenerWarning( \(listenerId), \(param0), \(param1))")
    }

}
/**
------------------------------------| Engineered with ♥ in Barcelona, Catalonia |--------------------------------------
*/
