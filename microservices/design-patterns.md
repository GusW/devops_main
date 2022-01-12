## Microservices Design Patterns (compilation)

---

1. `Database per Microservice`

   ![alt text](https://miro.medium.com/max/529/1*WWJQH50jxgrqh-ABFRQuzQ.jpeg "Database per Microservice")

   - In a monolithic architecture, a large, central database is used.
   - Better approach is to provide every Microservice its own Data store, so that there is no strong-coupling between services in the database layer.
   - **Pros**
     - Complete ownership of Data to a Service.
     - Loose coupling among teams developing the services.
   - **Cons**
     - Sharing data among services becomes challenging.
     - Giving application-wide ACID transactional guarantee becomes a lot harder.
     - Decomposing the Monolith database to smaller parts need careful design and is a challenging task.
   - **Use**
     - In large-scale enterprise applications.
     - When the team needs complete ownership of their Microservices for development scaling and development velocity.
   - **Do not use**
     - In small-scale applications.
     - If one team develops all the Microservices.
   - **Refs**
     - https://microservices.io/patterns/data/database-per-service.html
     - https://docs.microsoft.com/en-us/dotnet/architecture/cloud-native/distributed-data

2. `Event Sourcing`

   ![alt text](https://miro.medium.com/max/560/1*tRDaroNg_GnGdCZDFxLFKQ.jpeg "Event Sourcing")

   - For resilient, highly scalable, and fault-tolerant systems, microservices should communicate asynchronously by exchanging Events.
   - In traditional databases, the Business Entity with the current “state” is directly stored.
   - In Event Sourcing, any state-changing event or other significant events are stored instead of the entities. Modifications of a Business Entity is saved as a series of immutable events.
   - **Pros**
     - Provide atomicity to highly scalable systems.
     - Automatic history of the entities, including time travel functionality.
     - Loosely coupled and event-driven Microservices.
   - **Cons**
     - Reading entities from the Event store becomes challenging and usually need an additional data store (CQRS pattern).
     - The overall complexity of the system increases and usually need Domain-Driven Design.
     - The system needs to handle duplicate events (idempotent) or missing events.
     - Migrating the Schema of events becomes challenging.
   - **Use**
     - Highly scalable transactional systems with SQL Databases.
     - Transactional systems with NoSQL Databases.
     - Highly scalable and resilient Microservice Architecture.
     - Typical Message Driven or Event-Driven systems (e-commerce, booking, and reservation systems).
   - **Do not use**
     - Lowly scalable transactional systems with SQL Databases.
     - In simple Microservice Architecture where Microservices can exchange data synchronously (e.g., via API).
   - **Refs**
     - https://martinfowler.com/eaaDev/EventSourcing.html
     - https://docs.microsoft.com/en-us/azure/architecture/patterns/event-sourcing
     - https://microservices.io/patterns/data/event-sourcing.html

3. `Command Query Responsibility Segregation (CQRS)`

   - **Simple**: distinct entity or ORM models are used for Reading and Write

     ![alt text](https://miro.medium.com/max/273/1*l8GFDOUlyR_Km0dqg1VTgw.jpeg "CQRS simple")

   - **Advanced**: different data stores are used for reading and write operations. The advanced CQRS is used with Event Sourcing.

     - Data is copied from the Write store to the read store asynchronously.
     - Read Store lags the Write store and is Eventual Consistent.

     ![alt text](https://miro.medium.com/max/348/1*wCrXIQ7MD_20yKmZIBxHvQ.jpeg "CQRS")

   - **Pros**
     - Faster reading of data in Event-driven Microservices.
     - High availability of the data.
     - Read and write systems can scale independently.
   - **Cons**
     - Read data store is weakly consistent (eventual consistency).
     - The overall complexity of the system increases. Cargo culting CQRS can significantly jeopardize the complete project.
   - **Use**
     - In highly scalable Microservice Architecture where event sourcing is used.
     - In a complex domain model where reading data needs query into multiple Data Store.
     - In systems where read and write operations have a different load.
   - **Do not use**
     - When the volume of events is insignificant (taking the Event Store snapshot to compute the Entity state is a better choice).
     - In systems where read and write operations have a similar load.
   - **Refs**
     - https://martinfowler.com/bliki/CQRS.html
     - https://docs.microsoft.com/en-us/azure/architecture/patterns/cqrs
     - https://microservices.io/patterns/data/cqrs.html

4. `Saga`
   ![alt text](https://miro.medium.com/max/529/1*-Ro9jCnA7e0PnjnjEa0FWA.jpeg "Saga")

5. `Backends for Frontends (BFF)`
   ![alt text](https://miro.medium.com/max/529/1*FCZRcAuSLhrNOjcq1zYXDw.jpeg "BFF")

6. `API Gateway`
   ![alt text](https://miro.medium.com/max/560/1*e3p0KRmyiqgEx9kYH1e0Hg.jpeg "API Gateway")

7. `Strangler`
   ![alt text](https://miro.medium.com/max/560/1*4cO7G9QFc9OjQgmSTwQP1Q.jpeg "Strangler")

8. `Circuit Breaker`
   ![alt text](https://miro.medium.com/max/560/1*Olh9J1L3JSDi-PUa9CGa_A.jpeg "Circuit Breaker")

9. `Externalized Configuration`
   ![alt text]()

10. `Consumer-Driven Contract Testing`
    ![alt text]()
