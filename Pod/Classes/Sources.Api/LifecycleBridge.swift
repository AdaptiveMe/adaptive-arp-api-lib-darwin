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
   Interface for Managing the Lifecycle listeners
   Auto-generated implementation of ILifecycle specification.
*/
public class LifecycleBridge : BaseApplicationBridge, ILifecycle, APIBridge {

    /**
       API Delegate.
    */
    private var delegate : ILifecycle? = nil

    /**
       Constructor with delegate.

       @param delegate The delegate implementing platform specific functions.
    */
    public init(delegate : ILifecycle?) {
        self.delegate = delegate
    }
    /**
       Get the delegate implementation.
       @return ILifecycle delegate that manages platform specific functions..
    */
    public final func getDelegate() -> ILifecycle? {
        return self.delegate
    }
    /**
       Set the delegate implementation.

       @param delegate The delegate implementing platform specific functions.
    */
    public final func setDelegate(delegate : ILifecycle) {
        self.delegate = delegate;
    }

    /**
       Add the listener for the lifecycle of the app

       @param listener Lifecycle listener
       @since v2.0
    */
    public func addLifecycleListener(listener : ILifecycleListener ) {
        // Start logging elapsed time.
        let tIn : NSTimeInterval = NSDate.timeIntervalSinceReferenceDate()
        let logger : ILogging? = AppRegistryBridge.sharedInstance.getLoggingBridge()

        if (logger != nil) {
            logger!.log(ILoggingLogLevel.Debug, category: getAPIGroup()!.toString(), message: "LifecycleBridge executing addLifecycleListener...")
        }

        if (self.delegate != nil) {
            self.delegate!.addLifecycleListener(listener)
            if (logger != nil) {
                logger!.log(ILoggingLogLevel.Debug, category: getAPIGroup()!.toString(), message: "LifecycleBridge executed 'addLifecycleListener' in \(UInt(tIn.distanceTo(NSDate.timeIntervalSinceReferenceDate())*1000)) ms.")
             }
        } else {
            if (logger != nil) {
                logger!.log(ILoggingLogLevel.Error, category: getAPIGroup()!.toString(), message: "LifecycleBridge no delegate for 'addLifecycleListener'.")
            }
        }
        
    }

    /**
       Whether the application is in background or not

       @return true if the application is in background;false otherwise
       @since v2.0
    */
    public func isBackground() -> Bool? {
        // Start logging elapsed time.
        let tIn : NSTimeInterval = NSDate.timeIntervalSinceReferenceDate()
        let logger : ILogging? = AppRegistryBridge.sharedInstance.getLoggingBridge()

        if (logger != nil) {
            logger!.log(ILoggingLogLevel.Debug, category: getAPIGroup()!.toString(), message: "LifecycleBridge executing isBackground...")
        }

        var result : Bool? = false
        if (self.delegate != nil) {
            result = self.delegate!.isBackground()
            if (logger != nil) {
                logger!.log(ILoggingLogLevel.Debug, category: getAPIGroup()!.toString(), message: "LifecycleBridge executed 'isBackground' in \(UInt(tIn.distanceTo(NSDate.timeIntervalSinceReferenceDate())*1000)) ms.")
             }
        } else {
            if (logger != nil) {
                logger!.log(ILoggingLogLevel.Error, category: getAPIGroup()!.toString(), message: "LifecycleBridge no delegate for 'isBackground'.")
            }
        }
        return result        
    }

    /**
       Un-registers an existing listener from receiving lifecycle events.

       @param listener Lifecycle listener
       @since v2.0
    */
    public func removeLifecycleListener(listener : ILifecycleListener ) {
        // Start logging elapsed time.
        let tIn : NSTimeInterval = NSDate.timeIntervalSinceReferenceDate()
        let logger : ILogging? = AppRegistryBridge.sharedInstance.getLoggingBridge()

        if (logger != nil) {
            logger!.log(ILoggingLogLevel.Debug, category: getAPIGroup()!.toString(), message: "LifecycleBridge executing removeLifecycleListener...")
        }

        if (self.delegate != nil) {
            self.delegate!.removeLifecycleListener(listener)
            if (logger != nil) {
                logger!.log(ILoggingLogLevel.Debug, category: getAPIGroup()!.toString(), message: "LifecycleBridge executed 'removeLifecycleListener' in \(UInt(tIn.distanceTo(NSDate.timeIntervalSinceReferenceDate())*1000)) ms.")
             }
        } else {
            if (logger != nil) {
                logger!.log(ILoggingLogLevel.Error, category: getAPIGroup()!.toString(), message: "LifecycleBridge no delegate for 'removeLifecycleListener'.")
            }
        }
        
    }

    /**
       Removes all existing listeners from receiving lifecycle events.

       @since v2.0
    */
    public func removeLifecycleListeners() {
        // Start logging elapsed time.
        let tIn : NSTimeInterval = NSDate.timeIntervalSinceReferenceDate()
        let logger : ILogging? = AppRegistryBridge.sharedInstance.getLoggingBridge()

        if (logger != nil) {
            logger!.log(ILoggingLogLevel.Debug, category: getAPIGroup()!.toString(), message: "LifecycleBridge executing removeLifecycleListeners...")
        }

        if (self.delegate != nil) {
            self.delegate!.removeLifecycleListeners()
            if (logger != nil) {
                logger!.log(ILoggingLogLevel.Debug, category: getAPIGroup()!.toString(), message: "LifecycleBridge executed 'removeLifecycleListeners' in \(UInt(tIn.distanceTo(NSDate.timeIntervalSinceReferenceDate())*1000)) ms.")
             }
        } else {
            if (logger != nil) {
                logger!.log(ILoggingLogLevel.Error, category: getAPIGroup()!.toString(), message: "LifecycleBridge no delegate for 'removeLifecycleListeners'.")
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
        var responseJSON : String? = "null"
        switch request.getMethodName()! {
            case "addLifecycleListener":
                let listener0 : ILifecycleListener? =  LifecycleListenerImpl(id: request.getAsyncId()!)
                self.addLifecycleListener(listener0!);
            case "isBackground":
                let response1 : Bool? = self.isBackground()
                if let response1 = response1 {
                    responseJSON = "\(response1)"
                 } else {
                    responseJSON = "false"
                 }
            case "removeLifecycleListener":
                let listener2 : ILifecycleListener? =  LifecycleListenerImpl(id: request.getAsyncId()!)
                self.removeLifecycleListener(listener2!);
            case "removeLifecycleListeners":
                self.removeLifecycleListeners();
            default:
                // 404 - response null.
                responseCode = 404
                responseMessage = "LifecycleBridge does not provide the function '\(request.getMethodName()!)' Please check your client-side API version; should be API version >= v2.2.15."
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
