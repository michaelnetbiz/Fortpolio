+++
date = "2017-02-18"
highlight = true
math = false
external_link = "http://chi.anthropology.msu.edu/2017/02/querying-the-collection-of-the-british-museum-for-propositional-objects/"
tags = ["chi", "sparql", "cidoc-crm", "ontologies"]
title = "Querying the Collection of the British Museum for Propositional Objects"
summary = ""
+++

As I mentioned last month, one of the ideas of the semantic web is to render data from specialized, disparate sources comparable, and this is achieved by developing specifications like CIDOC-CRM. One implementation of CIDOC-CRM is the [Erlangen CRM](http://erlangen-crm.org/). Heritage institutions like the British Museum use implementations like this to organize their collection. It is implemented in the Web Ontology Language (OWL) and can be browsed in an ontology explorer like [Protégé](http://protege.stanford.edu/) or by just reading the XML.

The CIDOC-CRM includes a class called [Conceptual Object](http://new.cidoc-crm.org/Entity/e28-conceptual-object/version-6.2). Conceptual Object is a subclass of [Man-Made Thing](http://new.cidoc-crm.org/entity/e71-man-made-thing/version-6.2) and a superclass of both [Propositional Object](http://new.cidoc-crm.org/Entity/e89-propositional-object/version-6.2) and [Symbolic Object](http://new.cidoc-crm.org/Entity/e90-symbolic-object/version-6.2). I’m particularly interested in exploring the Propositional Object class, which includes

> “immaterial items, including but not limited to stories, plots, procedural prescriptions, algorithms, laws of physics or images that are, or represent in some sense, sets of propositions about real or imaginary things and that are documented as single units or serve as topic of discourse” (CIDOC-CRM, n.d.).

According to the documentation, a set of exemplary instances of this class are the common plot points of Kurosawa’s The Seven Samurai and Sturges’ The Magnificent Seven. A query to a SPARQL endpoint in order to materialize that collection’s Propositional Objects might read as follows:

    # declare a prefix
    # this allows us to refer to objects in the schema directly rather than by 
      their full URI
    # e.g., in the query below, crm:E89_Propositional_Object rather than the full 
      URI http://erlangen-crm.org/current/E89_Propositional_Object
    PREFIX crm: <http://erlangen-crm.org/current/>

    # specify:
    # a) the variable that the server should return (?instance)
    # b) that the server should return unique instances only (with the DISTINCT 
      modifier)
    SELECT DISTINCT ?instance
    # specify the pattern for the server to try to match
    WHERE { 
    ?instance a crm:E89_Propositional_Object 
    }
    
    # state how the response should be ordered…
    ORDER BY ?instance
    
    # and the quantity of instances to limit the response to
    LIMIT 100
    
Applying this query to the British Museum’s SPARQL endpoint returns 100 instances of Propositional Object, including [Afghan Studies](http://collection.britishmuseum.org/id/bibliographic-series/Afghan-Studies), [Annual Reports](http://collection.britishmuseum.org/id/bibliographic-series/Annual-Reports), and [Annual Review of the Royal Inscriptions of Mesopotamia Project](http://collection.britishmuseum.org/id/bibliographic-series/Annual-Review-of-the-Royal-Inscriptions-of-Mesopotamia-Project).

Find the British Museum’s SPARQL endpoint and some helpful examples [here](http://collection.britishmuseum.org/sparql).

