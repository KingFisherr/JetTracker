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
    }

    struct Departure: Codable{
        let airport: String!
        let timezone: String!
    }

    // Array to hold data
    @Published var Flights: [FlightsJSON] = []



    // create method to fetch data (GET REQUEST HTTP)

    func fetchFlights() {//async

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
                    print (self.Flights[0].departure)
                }
            } catch{
                print(String(describing: error))
            }
            
        }
        dataTask.resume()
    }
}
