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
   Represents a local or remote service response.

   @author Aryslan
   @since v2.0
   @version 1.0
*/
public class ServiceResponse : APIBean {

    /**
       Encoding of the binary payload - by default assumed to be UTF8.
    */
    var contentEncoding : IServiceContentEncoding?
    /**
       Response data content. The content should be in some well-known web format - in specific, binaries returned
should be encoded in base64.
    */
    var content : String?
    /**
       The length in bytes for the Content field.
    */
    var contentLength : Int32?
    /**
       The request/response content type (MIME TYPE).
    */
    var contentType : String?
    /**
       The serviceHeaders array (name,value pairs) to be included on the I/O service request.
    */
    var serviceHeaders : [ServiceHeader]?
    /**
       Information about the session.
    */
    var serviceSession : ServiceSession?
    /**
       HTTP Status code of the response. With this status code it is possible to perform some actions, redirects, authentication, etc.
    */
    var statusCode : Int32?

    /**
       Default constructor.

       @since v2.0
    */
    public override init() {
        super.init()
    }

    /**
       Constructor with fields

       @param content         Request/Response data content (plain text).
       @param contentType     The request/response content type (MIME TYPE).
       @param contentEncoding Encoding of the binary payload - by default assumed to be UTF8.
       @param contentLength   The length in bytes for the Content field.
       @param serviceHeaders  The serviceHeaders array (name,value pairs) to be included on the I/O service request.
       @param serviceSession  Information about the session
       @param statusCode      HTTP Status code of the response.
       @since v2.0
    */
    public init(content: String, contentType: String, contentEncoding: IServiceContentEncoding, contentLength: Int32, serviceHeaders: [ServiceHeader], serviceSession: ServiceSession, statusCode: Int32) {
        super.init()
        self.content = content
        self.contentType = contentType
        self.contentEncoding = contentEncoding
        self.contentLength = contentLength
        self.serviceHeaders = serviceHeaders
        self.serviceSession = serviceSession
        self.statusCode = statusCode
    }

    /**
       Returns the content encoding

       @return contentEncoding
       @since v2.0
    */
    public func getContentEncoding() -> IServiceContentEncoding? {
        return self.contentEncoding
    }

    /**
       Set the content encoding

       @param contentEncoding Encoding of the binary payload - by default assumed to be UTF8.
       @since v2.0
    */
    public func setContentEncoding(contentEncoding: IServiceContentEncoding) {
        self.contentEncoding = contentEncoding
    }

    /**
       Returns the content

       @return content
       @since v2.0
    */
    public func getContent() -> String? {
        return self.content
    }

    /**
       Set the content

       @param content Request/Response data content (plain text).
       @since v2.0
    */
    public func setContent(content: String) {
        self.content = content
    }

    /**
       Returns the content length

       @return contentLength
       @since v2.0
    */
    public func getContentLength() -> Int32? {
        return self.contentLength
    }

    /**
       Set the content length.

       @param contentLength The length in bytes for the Content field.
       @since v2.0
    */
    public func setContentLength(contentLength: Int32) {
        self.contentLength = contentLength
    }

    /**
       Returns the content type

       @return contentType
       @since v2.0
    */
    public func getContentType() -> String? {
        return self.contentType
    }

    /**
       Set the content type

       @param contentType The request/response content type (MIME TYPE).
       @since v2.0
    */
    public func setContentType(contentType: String) {
        self.contentType = contentType
    }

    /**
       Returns the array of ServiceHeader

       @return serviceHeaders
       @since v2.0
    */
    public func getServiceHeaders() -> [ServiceHeader]? {
        return self.serviceHeaders
    }

    /**
       Set the array of ServiceHeader

       @param serviceHeaders The serviceHeaders array (name,value pairs) to be included on the I/O service request.
       @since v2.0
    */
    public func setServiceHeaders(serviceHeaders: [ServiceHeader]) {
        self.serviceHeaders = serviceHeaders
    }

    /**
       Getter for service session

       @return The element service session
       @since v2.0
    */
    public func getServiceSession() -> ServiceSession? {
        return self.serviceSession
    }

    /**
       Setter for service session

       @param serviceSession The element service session
       @since v2.0
    */
    public func setServiceSession(serviceSession: ServiceSession) {
        self.serviceSession = serviceSession
    }

    /**
       Returns the status code of the response.

       @return HTTP status code
       @since v2.1.4
    */
    public func getStatusCode() -> Int32? {
        return self.statusCode
    }

    /**
       Sets the status code of the response

       @param statusCode HTTP status code
       @since v2.1.4
    */
    public func setStatusCode(statusCode: Int32) {
        self.statusCode = statusCode
    }


    /**
       JSON Serialization and deserialization support.
    */
    public struct Serializer {
        public static func fromJSON(json : String) -> ServiceResponse {
            let data:NSData = json.dataUsingEncoding(NSUTF8StringEncoding)!
            let dict = try? NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers) as! NSDictionary
            return fromDictionary(dict!)
        }

        static func fromDictionary(dict : NSDictionary) -> ServiceResponse {
            let resultObject : ServiceResponse = ServiceResponse()

            if let value : AnyObject = dict.objectForKey("content") {
                if "\(value)" as NSString != "<null>" {
                    resultObject.content = (value as! String)
                }
            }

            if let value : AnyObject = dict.objectForKey("contentEncoding") {
                if "\(value)" as NSString != "<null>" {
                    resultObject.contentEncoding = IServiceContentEncoding.toEnum(((value as! NSDictionary)["value"]) as? String)
                }
            }

            if let value : AnyObject = dict.objectForKey("contentLength") {
                if "\(value)" as NSString != "<null>" {
                    let numValue = value as! Int
                    resultObject.contentLength = Int32(numValue)
                }
            }

            if let value : AnyObject = dict.objectForKey("contentType") {
                if "\(value)" as NSString != "<null>" {
                    resultObject.contentType = (value as! String)
                }
            }

            if let value : AnyObject = dict.objectForKey("serviceHeaders") {
                if "\(value)" as NSString != "<null>" {
                    var serviceHeaders : [ServiceHeader] = [ServiceHeader]()
                    for (var i = 0;i < (value as! NSArray).count ; i++) {
                        serviceHeaders.append(ServiceHeader.Serializer.fromDictionary((value as! NSArray)[i] as! NSDictionary))
                    }
                    resultObject.serviceHeaders = serviceHeaders
                }
            }

            if let value : AnyObject = dict.objectForKey("serviceSession") {
                if "\(value)" as NSString != "<null>" {
                    resultObject.serviceSession = ServiceSession.Serializer.fromDictionary(value as! NSDictionary)
                }
            }

            if let value : AnyObject = dict.objectForKey("statusCode") {
                if "\(value)" as NSString != "<null>" {
                    let numValue = value as! Int
                    resultObject.statusCode = Int32(numValue)
                }
            }

            return resultObject
        }

        public static func toJSON(object: ServiceResponse) -> String {
            let jsonString : NSMutableString = NSMutableString()
            // Start Object to JSON
            jsonString.appendString("{ ")

            // Fields.
            object.content != nil ? jsonString.appendString("\"content\": \"\(JSONUtil.escapeString(object.content!))\", ") : jsonString.appendString("\"content\": null, ")
            object.contentEncoding != nil ? jsonString.appendString("\"contentEncoding\": { \"value\": \"\(object.contentEncoding!.toString())\"}, ") : jsonString.appendString("\"contentEncoding\": null, ")
            object.contentLength != nil ? jsonString.appendString("\"contentLength\": \(object.contentLength!), ") : jsonString.appendString("\"contentLength\": null, ")
            object.contentType != nil ? jsonString.appendString("\"contentType\": \"\(JSONUtil.escapeString(object.contentType!))\", ") : jsonString.appendString("\"contentType\": null, ")
            if (object.serviceHeaders != nil) {
                // Start array of objects.
                jsonString.appendString("\"serviceHeaders\": [")

                for var i = 0; i < object.serviceHeaders!.count; i++ {
                    jsonString.appendString(ServiceHeader.Serializer.toJSON(object.serviceHeaders![i]))
                    if (i < object.serviceHeaders!.count-1) {
                        jsonString.appendString(", ");
                    }
                }

                // End array of objects.
                jsonString.appendString("], ");
            } else {
                jsonString.appendString("\"serviceHeaders\": null, ")
            }
            object.serviceSession != nil ? jsonString.appendString("\"serviceSession\": \(ServiceSession.Serializer.toJSON(object.serviceSession!)), ") : jsonString.appendString("\"serviceSession\": null, ")
            object.statusCode != nil ? jsonString.appendString("\"statusCode\": \(object.statusCode!)") : jsonString.appendString("\"statusCode\": null")

            // End Object to JSON
            jsonString.appendString(" }")
            return jsonString as String
        }
    }
}

/**
------------------------------------| Engineered with ♥ in Barcelona, Catalonia |--------------------------------------
*/
