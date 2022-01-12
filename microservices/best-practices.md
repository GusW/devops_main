## Microservices Best Practices (compilation)

---

1. `Domain Driven Design`
   - The software development team should work in close co-operation with the Business department or Domain Experts.
   - The Architects/Developers and Domain Experts should first make the Strategic Design: Finding the Bounded Context and related Core Domain and Ubiquitous Language, Subdomains, Context Maps.
   - The Architects/Developers should then make the Tactical Design to decompose the Core Domain into fine-grained Building blocks: Entity, Value Object, Aggregate, Aggregate Root.
   - Books
     - “Domain Driven Design: Tackling Complexity in the Heart of Software” - _Eric Evans_
     - "Implementing Domain Driven Design" - _Vaughn Vernon_
2. `Database per Microservice`
   - Sharing the database among microservices will lead to strong coupling among them which is exactly the opposite of the goal of Microservices Architecture.
   - Even a small change in a database will need synchronization among teams.
   - Managing Transaction and Locking of a Database in one service is challenging enough. But managing Transaction/Locking among multiple distributed Microservices is a daunting task.
   - **Cons**: if every Microservice has own database/private tables, then exchanging data between Microservices opens the pandora’s box of challenges
3. `Microfrontends`
   - Frontend Monolith is as bad as Backend Monolith.
   - When the Frontend needs to be modernized due to changes in Browser, then it requires a Big Bang modernization.
4. `Continuous Delivery`
   - Each Microservice can be deployed independently.
   - To take full advantage of this Microservice feature, one needs CI/CD and DevOps.
   - CI/CD is listed as one of the three prerequisites to use Microservice Architecture by Martin Fowler (https://martinfowler.com/bliki/MicroservicePrerequisites.html)
5. `Observability`
   - With one Monolith, it is much simpler to monitor the application.
   - Having many microservices run on containers, observability of the whole system became very crucial and complicated.
     - `ELK/Splunk` => Logging.
     - `Prometheus/App Dynamics` => Monitoring.
     - `Zipkin/Jaeger` => Often one API request to a microservice leads to several cascaded calls to other microservices. To analyze the latency of a Microservice system, it is necessary to measure the latency of each individual Microservice.
6. `Unified Tech Stack`
   - Take the programming language and framework best suitable for that microservice.
   - Using different programming languages/frameworks without any solid reason can lead to too many programming languages and frameworks without any real benefit.
7. `Asynchronous Communication`
   - The easiest and most common way to communicate between Microservices is via Synchronous REST API which is pragmatic but a short term solution: **latencies added up**
   - Synchronous Microservices lead to failure cascading i.e. Failure in one Service can lead to failure in other services.
   - Synchronous Communication between Microservices also leads to tight coupling between Microservices.
   - Asynchronous communication between Microservices
     - Message Queue => `Kafka`
     - Asynchronous REST => `ATOM or CQRS`
8. `Microservice First`
   - Modules inside Monolith are tightly coupled which will make it difficult to transform it into Microservices.
   - Once an application is in production, it will be much more difficult to transform it into Microservices without breaking the application down.
9. `Infrastructure over Libraries`
   - Instead of investing heavily in a language-specific library (e.g. **Java based Netflix OSS**), it is wiser to use frameworks (e.g. **Service Meshes, API gateway**).
10. `Organizational Considerations`
    - The Software Architecture of a company is limited by Organizational Structure (**Conway’s Law**- https://en.wikipedia.org/wiki/Melvin_Conway)
    - If an organization plans to develop Microservice Architecture, then it should make the team size accordingly (two “American” Pizza team: 7±2 person)
    - The team should be cross-functional and ideally will have Frontend/Backend Developer, Ops Engineering and Tester.
