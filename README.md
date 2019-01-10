# Parking [![Build Status](https://travis-ci.com/devpolish/parking.svg?branch=master)](https://travis-ci.com/devpolish/parking)

*"El parqueadero hipotético ParkingHRS, requiere un desarrollo tipo sistema de información donde pueda tener un control de la operación diaria de vehículos en el parqueadero, la idea esencial es tener servicios API REST (JSON) funcionales y documentados para poder suministrarlos al equipo Front End de la compañía."*

## Test's notes

In this example, the main requirement indicates that first of all you shouldn't implement a SQL model (Even when PostgreSQL) supports it.

The main reason why you shouldn’t do that is because of data type structure. Anyways, I could implement something such as ScyllaDB or MongoDB, but, I won't be able to implement due to I don’t have any paid-service.

There also are several errors in the test itself, whereby it specifics an entity called “Vehicle” and you’re not taking in consideration that a vehicle could be a bike too, even a Scooter!

So, let’s say you want to save a bike, most of them have a number identifier even vehicles such as Scooters, imagine a customer doesn’t have his vehicle’s number, that would be a tremendous problem! So, our Parking place put stickers with a special identifier number when they don’t have one, in this way we can associate a ticket with every single vehicle in our parking place.

We already have a Owner entity which has many vehicles, that’s great, but having duplicated vehicles for the same Owner could be a huge problem in the future, this way I made a ParkTime entity which handles every single code for each vehicle, this way I just have to make sure that the process follows the simple operation better known as I/O, I also reduced this operation to a Polynomial BigO where:

O(2^n) n stands for data collection size of ParkTime for each vehicle.

Regarding to  (A screen to show with current vehicles in our parking place) I though you meant a static file such as HTML, SLIM, HAML extension. If it is, that basically breaks all rules of this test, so, I decided to implement a functional end-point instead.

## Performance tips

[Keep your objects immutable](https://medium.com/@nardonykolyszyn/keep-your-objects-immutable-f8a1b757c911) 

[Ruby magic comment](https://medium.com/bit-concept/ruby-about-deep-symbolize-keys-and-frozen-string-literal-true-e773725549ad)

**Rubocop passed.**

## Entities

  * **Owner**
    * name (string)
    * document_type (integer: enum type)
    * document (integer)
  
  * **Vehicle**
    * owner_id (PK FK)
    * identifier (string)
    * kind (integer: enum type)
  
  * **ParkTime**
    * vehicle_id (PK FK)
    * code (string)
    * cost_per_min (float)
    
 ## Usage
 
 ### Owners
   - Create a new owner
   **POST /api/v1/owners/**
   ```json
        "owner": {
            "name": "Nardo Nykolyszyn",
            "document_type": "CE",
            "document": 4376453
        }
   ```
   
   Supported document types
   
   ```
        "CE", "CC", "NIT"
   ```
   
   ##### Responses
   
   **Success** Returns the object itself
   
   **Error**
   
   ```json
        { "error": "Owner is already created'" }
   ```
   
   - Add a vehicle to an existent owner
   
   **POST /api/v1/owners/:owner_document/vehicle**

   ```json
        "vehicle": {
            "identifier": "32498327432",
            "kind": "car"
        }
   ```
   Identifier can be any mix of letters or numbers, the following attributes are supported to **kind** attribute.
   ```ruby
        types = [:car, :truck, :bicycle, :motorcycle, :scooter]
   ```
   
   ##### Responses
   **Success** Returns the object itself  
   
   **Error**
    
```json
    { "error": "Vehicle is already created" }
```
