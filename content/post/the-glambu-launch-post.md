+++
date = "2017-05-27"
highlight = true
math = false
external_link = "http://chi.anthropology.msu.edu/2017/05/the-glambu-launch-post/"
tags = ["provenance", "semantic-web", "chi-fellowship", "heritage"]
title = "The Glambu-Launch Post"
summary = ""
+++

Question: What is the sum of the [galleries, libraries, archives, and museums industry category](https://en.wikipedia.org/wiki/GLAM_(industry_sector))‘s acronym (GLAM) and the archaic word ambulator (Noun, “One that walks about” - [Lewis & Short, 1879](http://www.perseus.tufts.edu/hopper/text?doc=Perseus:text:1999.04.0059:entry=ambulator))?

Answer: Glambulator, the name of my CHI project. Glambulator has launched, and it’s available at [glambulator.matrix.msu.edu/](http://glambulator.matrix.msu.edu/).

{{%figure src="/img/2017-04-22/entity-graph-tab.png" title="Entity Graph Tab" %}}

Glambulator is about exploring the CIDOC Conceptual Reference Model (CIDOC-CRM) and phenomena that have been annotated by it. It’s inspired by other applications that afford interaction with RDF resources at the instance level (e.g., [LodLive](http://en.lodlive.it/)) and/or at higher levels of abstraction (e.g., [WebVOWL](http://vowl.visualdataweb.org/webvowl.html)).

Also – though it isn’t exactly obvious in any specific feature – Glambulator is inspired by firms that propose to bring supply-chain visibility to the [fine art trade](http://artchain.org/), to [commercial fishing](https://www.provenance.org/tracking_tuna_on_the_blockchain), or to [fashion](https://blog.chronicled.com/why-fashion-insiders-should-care-about-blockchain-81e29e214765) by committing transactions to a distributed transaction repository – a blockchain. Information standards like controlled vocabularies, reference models, and ontologies facilitate predicating objects of subjects, making statements about phenomena in some domain. One problem that immediately comes to mind, though, is how to verify any such proposition, especially where actors stand to gain from falsifying attributes. A certificate of authenticity, or some other kind of document issued by an authority serves to verify many statements that happen in everyday life. My state-issued driver’s license, for instance, can undergird my purchase of a six-pack, showing that I have the attribute is of drinking age. Multiple actors can be involved in bringing a heritage object from one point to another, and blockchain technology itself, rather than any third party, has been proposed as a way to verify attributions.

It’s possible to interact with three kinds of things in the Application: CIDOC-CRM resources, SPARQL queries, and instances returned by SPARQL queries.

{{%figure src="/img/2017-04-22/tabs.png" title="The tabs that contain Glambulator's main features" %}}

These three kinds of things correspond to the app’s three tabs: Reference Model, SPARQL Query Results, and Entity Graph.

In the Reference Model tab, which is activated by default, you can explore the classes that comprise the CIDOC-CRM and select any of these classes to query for instances of them.

{{%figure src="/img/2017-04-22/reference-model-list.png" title="Some Reference Model resources" %}}

Clicking on the plus icon at the right of a resource will ready the Application for querying the British Museum’s SPARQL endpoint for instances of the selected class. Upon setting the query in this way, a message at the bottom of the screen will provide the option of executing the query immediately, by clicking a button labeled EXECUTE. The Application starts up loaded with a query that returns instances of the CIDOC-CRM class called E8_Acquisition.

{{%figure src="/img/2017-04-22/app-bar.png" title="The Application's tool bar" %}}

The teal-colored bar fixed to the top of the Application provides buttons for toggling the menu drawer (left side, with the hamburger) and the SPARQL query drawer (right side, with the angle brackets).The menu drawer contains information about the project, a guide to the entity group colors, licensing information, and links to documentation, the source, and resources for further reading. The SPARQL query drawer provides a way to execute the current query (at this point the Application is limited to querying for instances of a CIDOC-CRM class). Execute the query by clicking on the paper airplane icon when the drawer is toggled.

If the executed SPARQL query is successful (notification of a failed query or a query with empty results would appear at the bottom of the screen), you’ll be presented with the results in the SPARQL Query Results tab. Selecting a result will send a request to the British Museum’s SPARQL endpoint for the selected item. The data returned are subsequently loaded into the force-directed graph simulation, visible in the Entity Graph tab.

{{%figure src="/img/2017-04-22/sparql-query-results.png" title="Items in the SPARQL Query Results tab" %}}

There are three basic components in the Entity Graph tab:
 1. The graph
 2. A set of what the [Material Design](https://material.io/) guidelines call a Chip, each of which represents a URI group that is present in the graph
 3. A Card for each entity that is selected (including the initial selection from the SPARQL Query Results tab).
 
The vertex that is twice the size of all other vertices represents the item previously selected in the SPARQL Query Results tab. This root vertex is the subject of all the statements (i.e., subject-predicate-object triples) represented in the graph. Every other vertex is connected to this root vertex as either a predicate or an object. A predicate will always mediate the connection between the subject and any object. Clicking on a vertex will query the British Museum SPARQL endpoint yet again, returning subject-predicate-object triples to which the clicked vertex connects as subject.

{{%figure src="/img/2017-04-22/entity-graph.png" title="The graph that represents entities and their relationships" %}}

{{%figure src="/img/2017-04-22/entity-group-chipset.png" title="Chips for each group of URIs in the Entity Graph" %}}

At the top of the tab, Chips indicate which namespaces are present in the graph.

{{%figure src="/img/2017-04-22/subject-card.png" title="Cards contain a table of a subject’s objects & predicates" %}}

Upon clicking a vertex and receiving a response, a Card will appear above the graph. This Card presents the predicates and objects in a tabular format.

At any point, open your browser’s console to take a look at the actions dispatching and updating state as you use the Application. Lastly, please feel free to contribute, open issues, etc. The README.md file in the [project repository](https://github.com/michaelnetbiz/glambulator) contains instructions on how to run the Application locally and develop features.
