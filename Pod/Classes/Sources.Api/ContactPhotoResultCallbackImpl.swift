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
   Interface for Managing the Contact operations
   Auto-generated implementation of IContactPhotoResultCallback specification.
*/
public class ContactPhotoResultCallbackImpl : BaseCallbackImpl, IContactPhotoResultCallback {

    /**
       Constructor with callback id.

       @param id  The id of the callback.
    */
    public override init(id : Int64) {
        super.init(id: id)
    }

    /**
       This method is called on Error

       @param error returned by the platform
       @since v2.0
    */
    public func onError(error : IContactPhotoResultCallbackError) { 
        let param0 : String = "Adaptive.IContactPhotoResultCallbackError.toObject(JSON.parse(\"{ \\\"value\\\": \\\"\(error.toString())\\\"}\"))"
        var callbackId : Int64 = -1
        if (getId() != nil) {
            callbackId = getId()!
        }
        AppRegistryBridge.sharedInstance.getPlatformContextWeb().executeJavaScript("Adaptive.handleContactPhotoResultCallbackError( \(callbackId), \(param0))")
    }

    /**
       This method is called on Result

       @param contactPhoto returned by the platform
       @since v2.0
    */
    public func onResult(contactPhoto : [UInt8]) { 
        let param0Array : NSMutableString = NSMutableString()
        param0Array.appendString("[")
        for (index,obj) in contactPhoto.enumerate() {
            param0Array.appendString("\(obj.value)")
            if index < contactPhoto.count-1 {
                param0Array.appendString(", ")
            }
        }
        param0Array.appendString("]")
        let param0 : String = param0Array as String
        var callbackId : Int64 = -1
        if (getId() != nil) {
            callbackId = getId()!
        }
        AppRegistryBridge.sharedInstance.getPlatformContextWeb().executeJavaScript("Adaptive.handleContactPhotoResultCallbackResult( \(callbackId), \(param0))")
    }

    /**
       This method is called on Warning

       @param contactPhoto returned by the platform
       @param warning      returned by the platform
       @since v2.0
    */
    public func onWarning(contactPhoto : [UInt8], warning : IContactPhotoResultCallbackWarning) { 
        let param0Array : NSMutableString = NSMutableString()
        param0Array.appendString("[")
        for (index,obj) in contactPhoto.enumerate() {
            param0Array.appendString("\(obj.value)")
            if index < contactPhoto.count-1 {
                param0Array.appendString(", ")
            }
        }
        param0Array.appendString("]")
        let param0 : String = param0Array as String
        let param1 : String = "Adaptive.IContactPhotoResultCallbackWarning.toObject(JSON.parse(\"{ \\\"value\\\": \\\"\(warning.toString())\\\"}\"))"
        var callbackId : Int64 = -1
        if (getId() != nil) {
            callbackId = getId()!
        }
        AppRegistryBridge.sharedInstance.getPlatformContextWeb().executeJavaScript("Adaptive.handleContactPhotoResultCallbackWarning( \(callbackId), \(param0), \(param1))")
    }

}
/**
------------------------------------| Engineered with ♥ in Barcelona, Catalonia |--------------------------------------
*/
