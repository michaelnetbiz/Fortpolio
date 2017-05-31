+++
date = "2017-04-22"
highlight = true
math = false
external_link = "http://chi.anthropology.msu.edu/2017/04/visualizing-rdf-triples-in-an-engaging-way/"
tags = ["chi", "heritage", "rdf", "semantic-web"]
title = "Visualizing RDF Triples in an Engaging Way"
summary = ""
+++

The application that has taken shape since the beginning of the CHI fellowship executes queries against the British Museum’s (BM) SPARQL endpoint. The BM system returns results serialized as XML- or JSON-LD. The application updates its data store (Redux) and renders the collection of results as a simple list. This is straightforward enough. On the other hand, I’ve had to think a bit more about how to render single query results in response to user selection of any given list item.

The basic data structure in semantic web technologies is the Resource Description Framework (RDF) triple. The triple is itself a graph, expressing a subject and an object’s relationship through a predicate. The Rosetta Stone, for instance, [appears as a subject in ~180 statements](http://collection.britishmuseum.org/sparql?query=SELECT+*%0D%0AWHERE+%7B%0D%0A++++%3Chttp%3A%2F%2Fcollection.britishmuseum.org%2Fid%2Fobject%2FYCA62958%3E+%3Fp+%3Fo+.%0D%0A%7D+&_implicit=false&implicit=true&_equivalent=false&_form=%2Fsparql). Given the centrality of the RDF triple in semantic web systems, it’s no surprise that a common way to represent the resource interrelationships expressed in these triples is by showing networks of nodes and edges; subjects and objects as nodes, predicates as the edges connecting them. This seems the most intuitive way to render single BM collection objects.

RDF and the Resource Description Framework Schema (RDFS) are fundamental to the semantic web technology stack as it’s developed in the past two decades. RDFS extends the constructs defined in the RDF specification to enable kinds of expressions like generalization. While RDF does allow for classification (instance-class relationships) with the instanceOf property, the RDFS extends the framework to allow for the expression of constructs like generalization hierarchies, where a class relates to another class as its sub- or superclass, with the subClassOf and subPropertyOf properties. For an RDFS model (e.g., each version of [CIDOC-CRM](http://www.cidoc-crm.org/sites/default/files/cidoc_crm_v5.0.4_official_release.rdfs.xml)), implementation in the Web Ontology Language (OWL – another important technology in the semantic web stack) adds formal logic to the model and thus enables automated reasoning with it.

I’m working on using these technologies to enrich what are otherwise pretty boring network visualizations. The [lodlive.it](http://en.lodlive.it/?http://data.ontotext.com/resource/leaks/offshore-BVI) project is a good example of visualizing data structured as RDF triples in a compelling way.
