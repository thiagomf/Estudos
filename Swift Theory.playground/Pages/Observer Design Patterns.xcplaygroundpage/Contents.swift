import Foundation


//OBSERVER
/**
 Observer pattern in swift define a one-to-many relationship between objects.  When object's state changes,
 the dependents are automatically notified and changed.
 
 Pró: you can establish relations between objects at runtime
 Contra: Subscribers are notified in random order
 **/

protocol WeatherObserver: AnyObject {
    var country: String { get }
    func update(temp: Double, humidity: Double, pressure: Double)
}

class WeatherStation {
    var temperature: Double = 0.0
    var humidity: Double = 0.0
    var pressure: Double = 0.0
    var observers: [WeatherObserver] = []
    
    func registerObserver(_ observer: WeatherObserver) {
        observers.append(observer)
    }
    
    func removeObserver(_ observer: WeatherObserver) {
        if let index = observers.firstIndex(where: { $0 === observer }) {
            observers.remove(at: index)
        }
    }
    
    func notifyObserves(_ observer: WeatherObserver) {
        for obs in observers where obs === observer {
            obs.update(temp: temperature, humidity: humidity, pressure: pressure)
        }
    }
    
    func setMeasurements(_ observer: WeatherObserver ,temp: Double, humidity: Double, pressure: Double) {
        self.temperature = temp
        self.humidity = humidity
        self.pressure = pressure
        notifyObserves(observer)
    }
}

class WeatherApp: WeatherObserver {
    
    var country: String
    
    init(_ country: String) {
        self.country = country
    }
    
    func update(temp: Double, humidity: Double, pressure: Double) {
        print("WeatherAPpp: From : \(String(describing: country)) New weather data received: temp \(temp), humidity: \(humidity) pressure: \(pressure) \n")
    }
}

let weatherStation = WeatherStation()
let brazilWeatherApp = WeatherApp("Brazil")
let chileWeatherApp = WeatherApp("Chile")
let argentinaWeatherApp = WeatherApp("Argentina")

weatherStation.registerObserver(brazilWeatherApp)
weatherStation.registerObserver(chileWeatherApp)
weatherStation.registerObserver(argentinaWeatherApp)

weatherStation.setMeasurements(brazilWeatherApp ,temp: 2.0, humidity: 3.0, pressure: 5.0)

weatherStation.setMeasurements(chileWeatherApp ,temp: 4.0, humidity: 5.0, pressure: 6.0)

weatherStation.setMeasurements(argentinaWeatherApp ,temp: 4.0, humidity: 5.0, pressure: 6.0)

weatherStation.setMeasurements(chileWeatherApp ,temp: 10.0, humidity: 20.0, pressure: 7.0)

weatherStation.removeObserver(chileWeatherApp)

weatherStation.setMeasurements(brazilWeatherApp, temp: 7.5, humidity: 7, pressure: 2)

weatherStation.setMeasurements(chileWeatherApp, temp: 7.5, humidity: 7, pressure: 2)
