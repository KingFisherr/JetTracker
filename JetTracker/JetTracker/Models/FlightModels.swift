//
//  FlightModels.swift
//  JetTracker
//
//  Created by Tahsin Provath on 9/24/22.
//

import Foundation

//// Swift models from JSON data, decodable because we need to decode data
//struct FlightData: Decodable{
//    var data: [Flights]
//}
//struct Flights: Decodable{
//    var flight_date: String
//    var flight_status: String
//    var departure: Departure
//}
//
//struct Departure: Decodable{
//    var airport: String
//    var timezone: String
//}

// Create class called flights which has methods and data structures we can use to fetch and store data for later use.


// API Key: cde5ef4127732deac540fab1f43d233c


// flights data: https://api.aviationstack.com/v1/flights?access_key=cde5ef4127732deac540fab1f43d233c

class Network: ObservableObject{
    // Swift models from JSON data, decodable because we need to decode data
    struct FlightData: Codable{
        var data: [FlightsJSON]!
    }
    
    struct FlightsJSON: Codable{
        var flight_date: String
        var flight_status: String
        var departure: Departure
        var arrival: Arrival
        var airline:Airline
        var flight: Flight
    }

    struct Departure: Codable{
        let airport: String?
        let timezone: String?
        let terminal: String?
        let gate: String?
        let scheduled: String?
        
    }
    
    struct Arrival:Codable{
        let airport:String?
        let timezone: String?
        let terminal: String?
        let gate: String?
        let scheduled: String?
    }
    
    struct Airline:Codable{
        let name: String?
    }
    
    struct Flight:Codable{
        let number: String?
    }

    // Array to hold data
    @Published var Flights: [FlightsJSON] = []

    // create method to fetch data (GET REQUEST HTTP)

    func fetchFlights(completed:@escaping ()-> ()) {//
        let urlString = "http://api.aviationstack.com/v1/flights?access_key=cde5ef4127732deac540fab1f43d233c"
        
        guard let url = URL(string: urlString) else{
            print ("Error: Could not create a URL from \(urlString)")
            return
        }

        let dataTask = URLSession.shared.dataTask(with: url) { (data, response, error) in

            if let response = response as? HTTPURLResponse, !(200...299).contains(response.statusCode) {
                print(response.statusCode)
            }

            if let error = error {
                print (error.localizedDescription)
            }

//            if let data = data,
//               let file = String(data: data, encoding: .utf8){
//                print (file)
//            }
            do {
                let decodedresponse = try JSONDecoder().decode(FlightData.self, from: data!)
                DispatchQueue.main.async {
                    self.Flights = decodedresponse.data
                    print (self.Flights[0].flight_date)
                    completed()
                }
            } catch{
                print(String(describing: error))
            }
            
        }
        dataTask.resume()
    }
}



//class ApiManager {
//
//    // Define the API endpoint URL
//    let apiUrl = "https://example.com/api/"
//
//    // Function to make a GET request to the API
//    func getRequest(completion: @escaping ([String: Any]?, Error?) -> Void) {
//
//        // Create the URL for the GET request
//        let url = URL(string: apiUrl)!
//
//        // Create a URLRequest with the GET HTTP method
//        var request = URLRequest(url: url)
//        request.httpMethod = "GET"
//
//        // Create a URLSession and data task
//        let session = URLSession.shared
//        let task = session.dataTask(with: request) { (data, response, error) in
//
//            // Handle any errors
//            if let error = error {
//                completion(nil, error)
//                return
//            }
//
//            // Parse the response data as a JSON dictionary
//            if let data = data {
//                do {
//                    let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
//                    completion(json, nil)
//                } catch {
//                    completion(nil, error)
//                }
//            }
//        }
//
//        // Start the data task
//        task.resume()
//    }
//
//    // Function to make a POST request to the API
//    func postRequest(data: [String: Any], completion: @escaping ([String: Any]?, Error?) -> Void) {
//
//        // Create the URL for the POST request
//        let url = URL(string: apiUrl)!
//
//        // Create a URLRequest with the POST HTTP method and JSON body
//        var request = URLRequest(url: url)
//        request.httpMethod = "POST"
//        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
//        let jsonData = try? JSONSerialization.data(withJSONObject: data)
//        request.httpBody = jsonData
//
//        // Create a URLSession and data task
//        let session = URLSession.shared
//        let task = session.dataTask(with: request) { (data, response, error) in
//
//            // Handle any errors
//            if let error = error {
//                completion(nil, error)
//                return
//            }
//
//            // Parse the response data as a JSON dictionary
//            if let data = data {
//                do {
//                    let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
//                    completion(json, nil)
//                } catch {
//                    completion(nil, error)
//                }
//            }
//        }
//
//        // Start the data task
//        task.resume()
//    }
//}
