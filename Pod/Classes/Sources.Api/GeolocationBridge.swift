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
   Interface for Managing the Geolocation operations
   Auto-generated implementation of IGeolocation specification.
*/
public class GeolocationBridge : BaseSensorBridge, IGeolocation, APIBridge {

    /**
       API Delegate.
    */
    private var delegate : IGeolocation? = nil

    /**
       Constructor with delegate.

       @param delegate The delegate implementing platform specific functions.
    */
    public init(delegate : IGeolocation?) {
        self.delegate = delegate
    }
    /**
       Get the delegate implementation.
       @return IGeolocation delegate that manages platform specific functions..
    */
    public final func getDelegate() -> IGeolocation? {
        return self.delegate
    }
    /**
       Set the delegate implementation.

       @param delegate The delegate implementing platform specific functions.
    */
    public final func setDelegate(delegate : IGeolocation) {
        self.delegate = delegate;
    }

    /**
       Register a new listener that will receive geolocation events.

       @param listener to be registered.
       @since v2.0
    */
    public func addGeolocationListener(listener : IGeolocationListener ) {
        // Start logging elapsed time.
        let tIn : NSTimeInterval = NSDate.timeIntervalSinceReferenceDate()
        let logger : ILogging? = AppRegistryBridge.sharedInstance.getLoggingBridge()

        if (logger != nil) {
            logger!.log(ILoggingLogLevel.Debug, category: getAPIGroup()!.toString(), message: "GeolocationBridge executing addGeolocationListener...")
        }

        if (self.delegate != nil) {
            self.delegate!.addGeolocationListener(listener)
            if (logger != nil) {
                logger!.log(ILoggingLogLevel.Debug, category: getAPIGroup()!.toString(), message: "GeolocationBridge executed 'addGeolocationListener' in \(UInt(tIn.distanceTo(NSDate.timeIntervalSinceReferenceDate())*1000)) ms.")
             }
        } else {
            if (logger != nil) {
                logger!.log(ILoggingLogLevel.Error, category: getAPIGroup()!.toString(), message: "GeolocationBridge no delegate for 'addGeolocationListener'.")
            }
        }
        
    }

    /**
       De-registers an existing listener from receiving geolocation events.

       @param listener to be registered.
       @since v2.0
    */
    public func removeGeolocationListener(listener : IGeolocationListener ) {
        // Start logging elapsed time.
        let tIn : NSTimeInterval = NSDate.timeIntervalSinceReferenceDate()
        let logger : ILogging? = AppRegistryBridge.sharedInstance.getLoggingBridge()

        if (logger != nil) {
            logger!.log(ILoggingLogLevel.Debug, category: getAPIGroup()!.toString(), message: "GeolocationBridge executing removeGeolocationListener...")
        }

        if (self.delegate != nil) {
            self.delegate!.removeGeolocationListener(listener)
            if (logger != nil) {
                logger!.log(ILoggingLogLevel.Debug, category: getAPIGroup()!.toString(), message: "GeolocationBridge executed 'removeGeolocationListener' in \(UInt(tIn.distanceTo(NSDate.timeIntervalSinceReferenceDate())*1000)) ms.")
             }
        } else {
            if (logger != nil) {
                logger!.log(ILoggingLogLevel.Error, category: getAPIGroup()!.toString(), message: "GeolocationBridge no delegate for 'removeGeolocationListener'.")
            }
        }
        
    }

    /**
       Removed all existing listeners from receiving geolocation events.

       @since v2.0
    */
    public func removeGeolocationListeners() {
        // Start logging elapsed time.
        let tIn : NSTimeInterval = NSDate.timeIntervalSinceReferenceDate()
        let logger : ILogging? = AppRegistryBridge.sharedInstance.getLoggingBridge()

        if (logger != nil) {
            logger!.log(ILoggingLogLevel.Debug, category: getAPIGroup()!.toString(), message: "GeolocationBridge executing removeGeolocationListeners...")
        }

        if (self.delegate != nil) {
            self.delegate!.removeGeolocationListeners()
            if (logger != nil) {
                logger!.log(ILoggingLogLevel.Debug, category: getAPIGroup()!.toString(), message: "GeolocationBridge executed 'removeGeolocationListeners' in \(UInt(tIn.distanceTo(NSDate.timeIntervalSinceReferenceDate())*1000)) ms.")
             }
        } else {
            if (logger != nil) {
                logger!.log(ILoggingLogLevel.Error, category: getAPIGroup()!.toString(), message: "GeolocationBridge no delegate for 'removeGeolocationListeners'.")
            }
        }
        
    }

    /**
       Invokes the given method specified in the API request object.

       @param request APIRequest object containing method name and parameters.
       @return APIResponse with status code, message and JSON response or a JSON null string for void functions. Status code 200 is OK, all others are HTTP standard error conditions.
    */
    public override func invoke(request : APIRequest) -> APIResponse? {
        let response : APIResponse = APIResponse()
        var responseCode : Int32 = 200
        var responseMessage : String = "OK"
        let responseJSON : String? = "null"
        switch request.getMethodName()! {
            case "addGeolocationListener":
                let listener0 : IGeolocationListener? =  GeolocationListenerImpl(id: request.getAsyncId()!)
                self.addGeolocationListener(listener0!);
            case "removeGeolocationListener":
                let listener1 : IGeolocationListener? =  GeolocationListenerImpl(id: request.getAsyncId()!)
                self.removeGeolocationListener(listener1!);
            case "removeGeolocationListeners":
                self.removeGeolocationListeners();
            default:
                // 404 - response null.
                responseCode = 404
                responseMessage = "GeolocationBridge does not provide the function '\(request.getMethodName()!)' Please check your client-side API version; should be API version >= v2.2.15."
        }
        response.setResponse(responseJSON!)
        response.setStatusCode(responseCode)
        response.setStatusMessage(responseMessage)
        return response
    }
}
/**
------------------------------------| Engineered with ♥ in Barcelona, Catalonia |--------------------------------------
*/
