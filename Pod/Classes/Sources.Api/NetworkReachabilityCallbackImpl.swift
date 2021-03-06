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
   Interface for Managing the Network reachability callback result
   Auto-generated implementation of INetworkReachabilityCallback specification.
*/
public class NetworkReachabilityCallbackImpl : BaseCallbackImpl, INetworkReachabilityCallback {

    /**
       Constructor with callback id.

       @param id  The id of the callback.
    */
    public override init(id : Int64) {
        super.init(id: id)
    }

    /**
       No data received - error condition, not authorized .

       @param error Error value
       @since v2.0
    */
    public func onError(error : INetworkReachabilityCallbackError) { 
        let param0 : String = "Adaptive.INetworkReachabilityCallbackError.toObject(JSON.parse(\"{ \\\"value\\\": \\\"\(error.toString())\\\"}\"))"
        var callbackId : Int64 = -1
        if (getId() != nil) {
            callbackId = getId()!
        }
        AppRegistryBridge.sharedInstance.getPlatformContextWeb().executeJavaScript("Adaptive.handleNetworkReachabilityCallbackError( \(callbackId), \(param0))")
    }

    /**
       Correct data received.

       @param reachable Indicates if the host is reachable
       @since v2.0
    */
    public func onResult(reachable : Bool) { 
        let param0 : String = "\(reachable)"
        var callbackId : Int64 = -1
        if (getId() != nil) {
            callbackId = getId()!
        }
        AppRegistryBridge.sharedInstance.getPlatformContextWeb().executeJavaScript("Adaptive.handleNetworkReachabilityCallbackResult( \(callbackId), \(param0))")
    }

    /**
       Data received with warning - ie Found entries with existing key and values have been overriden

       @param reachable Indicates if the host is reachable
       @param warning   Warning value
       @since v2.0
    */
    public func onWarning(reachable : Bool, warning : INetworkReachabilityCallbackWarning) { 
        let param0 : String = "\(reachable)"
        let param1 : String = "Adaptive.INetworkReachabilityCallbackWarning.toObject(JSON.parse(\"{ \\\"value\\\": \\\"\(warning.toString())\\\"}\"))"
        var callbackId : Int64 = -1
        if (getId() != nil) {
            callbackId = getId()!
        }
        AppRegistryBridge.sharedInstance.getPlatformContextWeb().executeJavaScript("Adaptive.handleNetworkReachabilityCallbackWarning( \(callbackId), \(param0), \(param1))")
    }

}
/**
------------------------------------| Engineered with ♥ in Barcelona, Catalonia |--------------------------------------
*/
